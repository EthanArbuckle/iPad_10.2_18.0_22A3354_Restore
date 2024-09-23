@implementation HFMediaControlItem

+ (Class)valueClass
{
  return (Class)objc_opt_class();
}

- (HFMediaControlItem)initWithValueSource:(id)a3 mediaProfileContainer:(id)a4 mediaAccessoryItemType:(int64_t)a5 displayResults:(id)a6
{
  id v11;
  id v12;
  id v13;
  void *v14;
  HFSimpleAggregatedCharacteristicValueSource *v15;
  void *v16;
  void *v17;
  HFSimpleAggregatedCharacteristicValueSource *v18;
  HFControlItemCharacteristicOptions *v19;
  HFMediaControlItem *v20;
  void *v22;
  void *v23;
  objc_super v25;

  v11 = a3;
  v12 = a4;
  v13 = a6;
  if (!v11)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HFMediaControlItem.m"), 87, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("valueSource"));

  }
  objc_msgSend(v12, "hf_home");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v14)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HFMediaControlItem.m"), 90, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("home != nil"));

  }
  v15 = [HFSimpleAggregatedCharacteristicValueSource alloc];
  objc_msgSend(v14, "hf_characteristicValueManager");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E60], "set");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = -[HFSimpleAggregatedCharacteristicValueSource initWithValueSource:characteristics:primaryServiceDescriptor:](v15, "initWithValueSource:characteristics:primaryServiceDescriptor:", v16, v17, 0);

  v19 = objc_alloc_init(HFControlItemCharacteristicOptions);
  v25.receiver = self;
  v25.super_class = (Class)HFMediaControlItem;
  v20 = -[HFControlItem initWithValueSource:characteristicOptions:displayResults:](&v25, sel_initWithValueSource_characteristicOptions_displayResults_, v18, v19, v13);

  if (v20)
  {
    objc_storeStrong((id *)&v20->_mediaValueSource, a3);
    objc_storeStrong((id *)&v20->_mediaProfileContainer, a4);
    v20->_mediaAccessoryItemType = a5;
  }

  return v20;
}

- (HFMediaControlItem)initWithValueSource:(id)a3 characteristicOptions:(id)a4 displayResults:(id)a5
{
  void *v7;
  void *v8;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler", a3, a4, a5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_initWithValueSource_displayResults_);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HFMediaControlItem.m"), 109, CFSTR("%s is unavailable; use %@ instead"),
    "-[HFMediaControlItem initWithValueSource:characteristicOptions:displayResults:]",
    v8);

  return 0;
}

- (HFMediaControlItem)initWithMediaRoutingIdentifier:(id)a3 deviceName:(id)a4 mediaAccessoryItemType:(int64_t)a5
{
  id v8;
  id v9;
  HFSimpleAggregatedCharacteristicValueSource *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  HFSimpleAggregatedCharacteristicValueSource *v15;
  HFControlItemCharacteristicOptions *v16;
  HFMediaControlItem *v17;
  objc_super v20;

  v8 = a3;
  v9 = a4;
  v10 = [HFSimpleAggregatedCharacteristicValueSource alloc];
  +[HFHomeKitDispatcher sharedDispatcher](HFHomeKitDispatcher, "sharedDispatcher");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "home");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "hf_characteristicValueManager");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E60], "set");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = -[HFSimpleAggregatedCharacteristicValueSource initWithValueSource:characteristics:primaryServiceDescriptor:](v10, "initWithValueSource:characteristics:primaryServiceDescriptor:", v13, v14, 0);

  v16 = objc_alloc_init(HFControlItemCharacteristicOptions);
  v20.receiver = self;
  v20.super_class = (Class)HFMediaControlItem;
  v17 = -[HFControlItem initWithValueSource:characteristicOptions:displayResults:](&v20, sel_initWithValueSource_characteristicOptions_displayResults_, v15, v16, 0);

  if (v17)
  {
    objc_storeStrong((id *)&v17->_mediaRoutingIdentifier, a3);
    objc_storeStrong((id *)&v17->_deviceName, a4);
    v17->_mediaAccessoryItemType = a5;
  }

  return v17;
}

- (id)copyWithCharacteristicOptions:(id)a3 valueSource:(id)a4
{
  uint64_t v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  int64_t v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;

  -[HFMediaControlItem mediaValueSource](self, "mediaValueSource", a3, a4);
  v5 = objc_claimAutoreleasedReturnValue();
  if (v5
    && (v6 = (void *)v5,
        -[HFMediaControlItem mediaProfileContainer](self, "mediaProfileContainer"),
        v7 = (void *)objc_claimAutoreleasedReturnValue(),
        v7,
        v6,
        v7))
  {
    v8 = objc_alloc((Class)objc_opt_class());
    -[HFMediaControlItem mediaValueSource](self, "mediaValueSource");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[HFMediaControlItem mediaProfileContainer](self, "mediaProfileContainer");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = -[HFMediaControlItem mediaAccessoryItemType](self, "mediaAccessoryItemType");
    -[HFControlItem displayResults](self, "displayResults");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = (void *)objc_msgSend(v8, "initWithValueSource:mediaProfileContainer:mediaAccessoryItemType:displayResults:", v9, v10, v11, v12);

  }
  else
  {
    -[HFMediaControlItem mediaRoutingIdentifier](self, "mediaRoutingIdentifier");
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v14)
    {
      v13 = 0;
      goto LABEL_8;
    }
    v15 = objc_alloc((Class)objc_opt_class());
    -[HFMediaControlItem mediaRoutingIdentifier](self, "mediaRoutingIdentifier");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[HFMediaControlItem deviceName](self, "deviceName");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = (void *)objc_msgSend(v15, "initWithMediaRoutingIdentifier:deviceName:mediaAccessoryItemType:", v9, v10, -[HFMediaControlItem mediaAccessoryItemType](self, "mediaAccessoryItemType"));
  }

LABEL_8:
  -[HFMediaControlItem mediaActionSetting](self, "mediaActionSetting");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setMediaActionSetting:", v16);

  objc_msgSend(v13, "copyLatestResultsFromItem:", self);
  return v13;
}

- (id)readValueAndPopulateStandardResults
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  id v26;
  void *v27;
  _QWORD v29[4];
  id v30;
  objc_super v31;

  v31.receiver = self;
  v31.super_class = (Class)HFMediaControlItem;
  -[HFControlItem readValueAndPopulateStandardResults](&v31, sel_readValueAndPopulateStandardResults);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[HFMediaControlItem mediaValueSource](self, "mediaValueSource");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[HFMediaControlItem mediaProfileContainer](self, "mediaProfileContainer");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "hf_mediaRouteIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v4, "lastPlaybackStateForProfileForRouteID:", v6);

  -[HFMediaControlItem mediaActionSetting](self, "mediaActionSetting");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "updatePlaybackState:", v7);

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v9;
  if (v7 == 2)
    goto LABEL_8;
  if (v7 == 1)
  {
    v15 = &unk_1EA7CC1F0;
    goto LABEL_10;
  }
  if (v7)
  {
LABEL_8:
    v15 = &unk_1EA7CC1D8;
LABEL_10:
    objc_msgSend(v9, "setObject:forKeyedSubscript:", v15, CFSTR("value"));
    goto LABEL_11;
  }
  v11 = (void *)MEMORY[0x1E0CB37E8];
  -[HFMediaControlItem mediaActionSetting](self, "mediaActionSetting");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (v12)
    v13 = 2;
  else
    v13 = 1;
  objc_msgSend(v11, "numberWithInteger:", v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setObject:forKeyedSubscript:", v14, CFSTR("value"));

LABEL_11:
  objc_msgSend(v10, "setObject:forKeyedSubscript:", &unk_1EA7CC208, CFSTR("controlItemPurpose"));
  -[HFMediaControlItem mediaProfileContainer](self, "mediaProfileContainer");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "hf_mediaRouteIdentifier");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setObject:forKeyedSubscript:", v17, CFSTR("HFMediaControlItemRouteIdentifierKey"));

  -[HFMediaControlItem mediaProfileContainer](self, "mediaProfileContainer");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "hf_dependentHomeKitObjectsForDownstreamItems");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = (void *)objc_msgSend(v19, "copy");
  objc_msgSend(v10, "setObject:forKeyedSubscript:", v20, CFSTR("dependentHomeKitObjects"));

  -[HFMediaControlItem mediaProfileContainer](self, "mediaProfileContainer");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "hf_serviceNameComponents");
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  if (v22)
  {
    objc_msgSend(v10, "setObject:forKeyedSubscript:", v22, CFSTR("serviceNameComponents"));
    objc_msgSend(v22, "composedString");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    if (v23)
      objc_msgSend(v10, "setObject:forKeyedSubscript:", v23, CFSTR("title"));

  }
  -[HFMediaControlItem mediaProfileContainer](self, "mediaProfileContainer");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "hf_categoryCapitalizedLocalizedDescription");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setObject:forKeyedSubscript:", v25, CFSTR("HFMediaControlItemCategoryLocalizedDescriptionKey"));

  v29[0] = MEMORY[0x1E0C809B0];
  v29[1] = 3221225472;
  v29[2] = __57__HFMediaControlItem_readValueAndPopulateStandardResults__block_invoke;
  v29[3] = &unk_1EA728350;
  v30 = v10;
  v26 = v10;
  objc_msgSend(v3, "flatMap:", v29);
  v27 = (void *)objc_claimAutoreleasedReturnValue();

  return v27;
}

id __57__HFMediaControlItem_readValueAndPopulateStandardResults__block_invoke(uint64_t a1, uint64_t a2)
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

- (id)characteristicValuesForValue:(id)a3
{
  return (id)objc_msgSend(MEMORY[0x1E0C99D80], "dictionary", a3);
}

- (id)valueForCharacteristicValues:(id)a3
{
  return &unk_1EA7CC220;
}

- (id)normalizedValueForValue:(id)a3
{
  return a3;
}

- (id)writeValue:(id)a3
{
  id v4;
  id v5;
  void *v6;
  id v7;
  uint64_t v8;
  void *v9;
  int64_t v10;
  int64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;

  v4 = a3;
  objc_opt_class();
  v5 = v4;
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v6 = v5;
  else
    v6 = 0;
  v7 = v6;

  v8 = objc_msgSend(v7, "integerValue");
  -[HFMediaControlItem mediaActionSetting](self, "mediaActionSetting");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (v9)
    v10 = -[HFMediaControlItem toggledSceneStateFromPrimaryState:](self, "toggledSceneStateFromPrimaryState:", v8);
  else
    v10 = -[HFMediaControlItem mapToHMMediaPlaybackState:](self, "mapToHMMediaPlaybackState:", v8);
  v11 = v10;

  -[HFMediaControlItem mediaValueSource](self, "mediaValueSource");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[HFMediaControlItem mediaActionSetting](self, "mediaActionSetting");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "playbackArchive");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[HFMediaControlItem mediaProfileContainer](self, "mediaProfileContainer");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "hf_mediaRouteIdentifier");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "writePlaybackState:playbackArchive:forRouteID:", v11, v14, v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "flatMap:", &__block_literal_global_82);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  return v18;
}

uint64_t __33__HFMediaControlItem_writeValue___block_invoke()
{
  return objc_msgSend(MEMORY[0x1E0D519C0], "futureWithNoResult");
}

- (int64_t)toggledSceneStateFromPrimaryState:(int64_t)a3
{
  void *v4;
  int64_t v5;

  if ((unint64_t)a3 < 2)
    return 2;
  if (a3 != 2)
    return 0;
  -[HFMediaControlItem mediaActionSetting](self, "mediaActionSetting");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "originalHMNonPausePlaybackState");

  return v5;
}

- (int64_t)mapToHMMediaPlaybackState:(int64_t)a3
{
  if ((unint64_t)a3 >= 2)
    return 1;
  else
    return 2;
}

- (id)writePrimaryState:(int64_t)a3
{
  void *v4;
  void *v5;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[HFMediaControlItem writeValue:](self, "writeValue:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)toggleValue
{
  void *v3;
  void *v4;
  _QWORD v6[4];
  id v7;
  id location;

  objc_initWeak(&location, self);
  -[HFMediaControlItem readValueAndPopulateStandardResults](self, "readValueAndPopulateStandardResults");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __33__HFMediaControlItem_toggleValue__block_invoke;
  v6[3] = &unk_1EA731B28;
  objc_copyWeak(&v7, &location);
  objc_msgSend(v3, "flatMap:", v6);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_destroyWeak(&v7);

  objc_destroyWeak(&location);
  return v4;
}

id __33__HFMediaControlItem_toggleValue__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  id v6;
  uint64_t v7;
  id WeakRetained;
  void *v9;
  uint64_t v10;
  void *v11;

  v3 = a2;
  objc_opt_class();
  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("value"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if ((objc_opt_isKindOfClass() & 1) != 0)
    v5 = v4;
  else
    v5 = 0;
  v6 = v5;
  v7 = objc_msgSend(v6, "integerValue");

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v9 = WeakRetained;
  if (v7 == 2)
    v10 = 1;
  else
    v10 = 2 * (v7 == 1);
  objc_msgSend(WeakRetained, "writePrimaryState:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

- (int64_t)sortPriority
{
  return 1000;
}

- (HFMediaValueSource)mediaValueSource
{
  return self->_mediaValueSource;
}

- (HFMediaProfileContainer)mediaProfileContainer
{
  return self->_mediaProfileContainer;
}

- (int64_t)mediaAccessoryItemType
{
  return self->_mediaAccessoryItemType;
}

- (HFMediaActionSetting)mediaActionSetting
{
  return self->_mediaActionSetting;
}

- (void)setMediaActionSetting:(id)a3
{
  objc_storeStrong((id *)&self->_mediaActionSetting, a3);
}

- (NSString)mediaRoutingIdentifier
{
  return self->_mediaRoutingIdentifier;
}

- (void)setMediaRoutingIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 112);
}

- (NSString)deviceName
{
  return self->_deviceName;
}

- (void)setDeviceName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 120);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_deviceName, 0);
  objc_storeStrong((id *)&self->_mediaRoutingIdentifier, 0);
  objc_storeStrong((id *)&self->_mediaActionSetting, 0);
  objc_storeStrong((id *)&self->_mediaProfileContainer, 0);
  objc_storeStrong((id *)&self->_mediaValueSource, 0);
}

@end
