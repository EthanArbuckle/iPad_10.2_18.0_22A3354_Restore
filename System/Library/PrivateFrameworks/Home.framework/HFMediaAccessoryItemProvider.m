@implementation HFMediaAccessoryItemProvider

- (HFMediaAccessoryItemProvider)init
{
  void *v4;
  void *v5;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_initWithHome_);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HFMediaAccessoryItemProvider.m"), 50, CFSTR("%s is unavailable; use %@ instead"),
    "-[HFMediaAccessoryItemProvider init]",
    v5);

  return 0;
}

- (HFMediaAccessoryItemProvider)initWithHome:(id)a3 includeSiriEndPointProfiles:(BOOL)a4
{
  HFMediaAccessoryItemProvider *result;

  result = -[HFMediaAccessoryItemProvider initWithHome:](self, "initWithHome:", a3, a4);
  if (result)
    result->_includeSiriEndPointProfiles = 1;
  return result;
}

- (HFMediaAccessoryItemProvider)initWithHome:(id)a3 includeContainedProfiles:(BOOL)a4
{
  HFMediaAccessoryItemProvider *result;

  result = -[HFMediaAccessoryItemProvider initWithHome:includeMediaSystems:](self, "initWithHome:includeMediaSystems:", a3, 0);
  if (result)
    result->_includeContainedProfiles = 1;
  return result;
}

- (HFMediaAccessoryItemProvider)initWithHome:(id)a3
{
  id v4;
  HFMediaAccessoryItemProvider *v5;

  v4 = a3;
  v5 = -[HFMediaAccessoryItemProvider initWithHome:includeMediaSystems:](self, "initWithHome:includeMediaSystems:", v4, (HFPreferencesBooleanValueForKey(CFSTR("EnableMediaSystems")) & 0xFFFFFFFFFFFFFFFDLL) == 0);

  return v5;
}

- (HFMediaAccessoryItemProvider)initWithHome:(id)a3 includeMediaSystems:(BOOL)a4
{
  id v7;
  HFMediaAccessoryItemProvider *v8;
  HFMediaAccessoryItemProvider *v9;
  void *v10;
  objc_super v12;

  v7 = a3;
  v12.receiver = self;
  v12.super_class = (Class)HFMediaAccessoryItemProvider;
  v8 = -[HFItemProvider init](&v12, sel_init);
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_home, a3);
    v9->_includeMediaSystems = a4;
    v10 = (void *)objc_opt_new();
    -[HFMediaAccessoryItemProvider setMediaAccessoryItems:](v9, "setMediaAccessoryItems:", v10);

  }
  return v9;
}

- (id)copyWithZone:(_NSZone *)a3
{
  void *v4;
  void *v5;
  void *v6;

  v4 = (void *)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3);
  -[HFMediaAccessoryItemProvider home](self, "home");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v4, "initWithHome:", v5);

  return v6;
}

- (HFCharacteristicValueSource)valueSource
{
  void *v3;
  void *v4;
  void *v5;

  -[HFMediaAccessoryItemProvider overrideValueSource](self, "overrideValueSource");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[HFMediaAccessoryItemProvider overrideValueSource](self, "overrideValueSource");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    -[HFMediaAccessoryItemProvider home](self, "home");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "hf_characteristicValueManager");
    v4 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return (HFCharacteristicValueSource *)v4;
}

- (id)reloadItems
{
  uint64_t v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  uint64_t v11;
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
  void *v23;
  void *v24;
  _QWORD v26[4];
  id v27;
  _QWORD v28[4];
  id v29;
  _QWORD aBlock[4];
  id v31;
  id location;

  objc_initWeak(&location, self);
  v3 = MEMORY[0x1E0C809B0];
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __43__HFMediaAccessoryItemProvider_reloadItems__block_invoke;
  aBlock[3] = &unk_1EA72A340;
  objc_copyWeak(&v31, &location);
  v4 = _Block_copy(aBlock);
  v5 = objc_alloc(MEMORY[0x1E0C99E20]);
  -[HFMediaAccessoryItemProvider home](self, "home");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "hf_allUniqueMediaProfileContainers");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (id)objc_msgSend(v5, "initWithArray:", v7);

  if (!-[HFMediaAccessoryItemProvider includeMediaSystems](self, "includeMediaSystems"))
  {
    -[HFMediaAccessoryItemProvider home](self, "home");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "mediaSystems");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "count");

    if (v11)
    {
      objc_msgSend(v8, "na_filter:", &__block_literal_global_103);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = (void *)objc_msgSend(v12, "mutableCopy");

      v14 = (void *)MEMORY[0x1E0C99E20];
      -[HFMediaAccessoryItemProvider home](self, "home");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "hf_allUniqueMediaProfileContainers");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "setWithArray:", v16);
      v17 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v17, "minusSet:", v13);
      v28[0] = v3;
      v28[1] = 3221225472;
      v28[2] = __43__HFMediaAccessoryItemProvider_reloadItems__block_invoke_3;
      v28[3] = &unk_1EA733C80;
      v8 = v13;
      v29 = v8;
      objc_msgSend(v17, "na_each:", v28);

    }
  }
  if (-[HFMediaAccessoryItemProvider includeSiriEndPointProfiles](self, "includeSiriEndPointProfiles"))
  {
    -[HFMediaAccessoryItemProvider _siriEndpoints](self, "_siriEndpoints");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = (void *)objc_msgSend(v18, "mutableCopy");

    objc_msgSend(v19, "minusSet:", v8);
    objc_msgSend(v19, "allObjects");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "addObjectsFromArray:", v20);

  }
  objc_msgSend(v8, "allObjects");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  -[HFMediaAccessoryItemProvider filter](self, "filter");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  -[HFItemProvider reloadItemsWithHomeKitObjects:filter:itemMap:](self, "reloadItemsWithHomeKitObjects:filter:itemMap:", v21, v22, v4);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v26[0] = v3;
  v26[1] = 3221225472;
  v26[2] = __43__HFMediaAccessoryItemProvider_reloadItems__block_invoke_4;
  v26[3] = &unk_1EA726E30;
  objc_copyWeak(&v27, &location);
  objc_msgSend(v23, "flatMap:", v26);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_destroyWeak(&v27);

  objc_destroyWeak(&v31);
  objc_destroyWeak(&location);
  return v24;
}

HFMediaAccessoryItem *__43__HFMediaAccessoryItemProvider_reloadItems__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id WeakRetained;
  id v5;
  void *v6;
  id v7;
  HFMediaAccessoryItem *v8;
  void *v9;
  HFMediaAccessoryItem *v10;
  HFMediaAccessoryItem *v11;
  HFMediaAccessoryItem *v12;
  HFMediaAccessoryItem *v13;
  void *v14;
  void *v15;

  v3 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v5 = v3;
  if (objc_msgSend(v5, "conformsToProtocol:", &unk_1F0449888))
    v6 = v5;
  else
    v6 = 0;
  v7 = v6;

  if (v7)
  {
    v8 = [HFMediaAccessoryItem alloc];
    objc_msgSend(WeakRetained, "valueSource");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = -[HFMediaAccessoryItem initWithValueSource:mediaProfileContainer:](v8, "initWithValueSource:mediaProfileContainer:", v9, v7);

  }
  else
  {
    NSLog(CFSTR("mediaProfileContainer is nil because we got the homeKitObject = %@"), v5);
    v10 = 0;
  }
  v11 = v10;
  if (-[HFMediaAccessoryItem conformsToProtocol:](v11, "conformsToProtocol:", &unk_1F0413A30))
    v12 = v11;
  else
    v12 = 0;
  v13 = v12;

  if (v13)
  {
    if (-[HFMediaAccessoryItem isSiriEndpointAccessory](v13, "isSiriEndpointAccessory"))
    {
      -[HFMediaAccessoryItem commonSettingsManager](v13, "commonSettingsManager");
      v14 = (void *)objc_claimAutoreleasedReturnValue();

      if (v14)
      {
        -[HFMediaAccessoryItem commonSettingsManager](v13, "commonSettingsManager");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "addObserver:", WeakRetained);

      }
    }
  }

  return v11;
}

BOOL __43__HFMediaAccessoryItemProvider_reloadItems__block_invoke_2(uint64_t a1, void *a2)
{
  id v2;
  id v3;
  void *v4;
  id v5;

  v2 = a2;
  objc_opt_class();
  v3 = v2;
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v4 = v3;
  else
    v4 = 0;
  v5 = v4;

  return v5 == 0;
}

void __43__HFMediaAccessoryItemProvider_reloadItems__block_invoke_3(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  v3 = a2;
  objc_opt_class();
  v9 = v3;
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v4 = v9;
  else
    v4 = 0;
  v5 = v4;

  v6 = *(void **)(a1 + 32);
  objc_msgSend(v5, "mediaProfiles");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "allObjects");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "addObjectsFromArray:", v8);

}

id __43__HFMediaAccessoryItemProvider_reloadItems__block_invoke_4(uint64_t a1, void *a2)
{
  id *v2;
  id v3;
  id WeakRetained;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  v2 = (id *)(a1 + 32);
  v3 = a2;
  WeakRetained = objc_loadWeakRetained(v2);
  objc_msgSend(WeakRetained, "mediaAccessoryItems");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addedItems");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "unionSet:", v6);

  objc_msgSend(WeakRetained, "mediaAccessoryItems");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removedItems");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "minusSet:", v8);

  objc_msgSend(MEMORY[0x1E0D519C0], "futureWithResult:", v3);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (id)items
{
  void *v2;
  void *v3;

  -[HFMediaAccessoryItemProvider mediaAccessoryItems](self, "mediaAccessoryItems");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)objc_msgSend(v2, "copy");

  return v3;
}

- (id)invalidationReasons
{
  void *v2;
  void *v3;
  void *v4;
  objc_super v6;
  _QWORD v7[4];

  v7[3] = *MEMORY[0x1E0C80C00];
  v6.receiver = self;
  v6.super_class = (Class)HFMediaAccessoryItemProvider;
  -[HFItemProvider invalidationReasons](&v6, sel_invalidationReasons);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = CFSTR("accessory");
  v7[1] = CFSTR("softwareUpdate");
  v7[2] = CFSTR("mediaSystem");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v7, 3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setByAddingObjectsFromArray:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (void)mediaProfileContainer:(id)a3 didUpdateSettingKeypath:(id)a4 value:(id)a5
{
  id v7;
  id v8;
  NSObject *v9;
  id v10;
  int v11;
  id v12;
  __int16 v13;
  id v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v7 = a4;
  v8 = a5;
  HFLogForCategory(0x25uLL);
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    v11 = 138412546;
    v12 = v7;
    v13 = 2112;
    v14 = v8;
    _os_log_impl(&dword_1DD34E000, v9, OS_LOG_TYPE_DEFAULT, "Received update for setting keypath %@ value = %@", (uint8_t *)&v11, 0x16u);
  }

  v10 = -[HFMediaAccessoryItemProvider reloadItems](self, "reloadItems");
}

- (id)_siriEndpoints
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  -[HFMediaAccessoryItemProvider home](self, "home");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "accessories");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "na_map:", &__block_literal_global_282);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0C99E60], "setWithArray:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

id __46__HFMediaAccessoryItemProvider__siriEndpoints__block_invoke(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  void *v4;

  v2 = a2;
  objc_msgSend(v2, "hf_siriEndpointProfile");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    objc_msgSend(v2, "mediaProfile");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (id)filter
{
  return self->_filter;
}

- (void)setFilter:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (BOOL)includeMediaSystems
{
  return self->_includeMediaSystems;
}

- (HMHome)home
{
  return self->_home;
}

- (NSMutableSet)mediaAccessoryItems
{
  return self->_mediaAccessoryItems;
}

- (void)setMediaAccessoryItems:(id)a3
{
  objc_storeStrong((id *)&self->_mediaAccessoryItems, a3);
}

- (HFCharacteristicValueSource)overrideValueSource
{
  return self->_overrideValueSource;
}

- (void)setOverrideValueSource:(id)a3
{
  objc_storeStrong((id *)&self->_overrideValueSource, a3);
}

- (BOOL)includeSiriEndPointProfiles
{
  return self->_includeSiriEndPointProfiles;
}

- (void)setIncludeSiriEndPointProfiles:(BOOL)a3
{
  self->_includeSiriEndPointProfiles = a3;
}

- (BOOL)includeContainedProfiles
{
  return self->_includeContainedProfiles;
}

- (void)setIncludeContainedProfiles:(BOOL)a3
{
  self->_includeContainedProfiles = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_overrideValueSource, 0);
  objc_storeStrong((id *)&self->_mediaAccessoryItems, 0);
  objc_storeStrong((id *)&self->_home, 0);
  objc_storeStrong(&self->_filter, 0);
}

@end
