@implementation HFSimpleAggregatedCharacteristicValueSource

uint64_t __58__HFSimpleAggregatedCharacteristicValueSource_na_identity__block_invoke_5(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "characteristics");
}

uint64_t __58__HFSimpleAggregatedCharacteristicValueSource_na_identity__block_invoke_4(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "valueSource");
}

uint64_t __108__HFSimpleAggregatedCharacteristicValueSource_initWithValueSource_characteristics_primaryServiceDescriptor___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "characteristicType");
}

uint64_t __62__HFSimpleAggregatedCharacteristicValueSource_characteristics__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "allObjects");
}

uint64_t __87__HFSimpleAggregatedCharacteristicValueSource_HFLightProfileValueSource__lightProfiles__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "hf_lightProfiles");
}

uint64_t __58__HFSimpleAggregatedCharacteristicValueSource_allServices__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "service");
}

uint64_t __100__HFSimpleAggregatedCharacteristicValueSource_HFLightProfileValueSource__isNaturalLightingSupported__block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "isNaturalLightingSupportedForProfile:", a2);
}

void __58__HFSimpleAggregatedCharacteristicValueSource_na_identity__block_invoke_2()
{
  void *v0;
  id v1;
  id v2;
  uint64_t v3;
  void *v4;

  objc_msgSend(MEMORY[0x1E0D519C8], "builder");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v1 = (id)objc_msgSend(v0, "appendCharacteristic:", &__block_literal_global_28);
  v2 = (id)objc_msgSend(v0, "appendCharacteristic:", &__block_literal_global_29);
  objc_msgSend(v0, "build");
  v3 = objc_claimAutoreleasedReturnValue();

  v4 = (void *)qword_1ED378BD0;
  qword_1ED378BD0 = v3;

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

+ (NAIdentity)na_identity
{
  if (_MergedGlobals_208 != -1)
    dispatch_once(&_MergedGlobals_208, &__block_literal_global_23);
  return (NAIdentity *)(id)qword_1ED378BD0;
}

id __80__HFSimpleAggregatedCharacteristicValueSource_readValuesForCharacteristicTypes___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  id v3;
  void *v4;
  void *v5;

  v2 = *(void **)(a1 + 32);
  v3 = a2;
  objc_msgSend(v2, "characteristicsByType");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)metadataForCharacteristicType:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;

  v4 = a3;
  -[HFSimpleAggregatedCharacteristicValueSource characteristicsByType](self, "characteristicsByType");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  +[HFCharacteristicBatchReadResponse aggregatedMetadataForCharacteristics:](HFCharacteristicBatchReadResponse, "aggregatedMetadataForCharacteristics:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (id)allCharacteristicsForCharacteristicType:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  -[HFSimpleAggregatedCharacteristicValueSource characteristicsByType](self, "characteristicsByType");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (NSDictionary)characteristicsByType
{
  return self->_characteristicsByType;
}

- (id)readValuesForCharacteristicTypes:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  _QWORD v8[5];

  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __80__HFSimpleAggregatedCharacteristicValueSource_readValuesForCharacteristicTypes___block_invoke;
  v8[3] = &unk_1EA726AB8;
  v8[4] = self;
  objc_msgSend(a3, "na_flatMap:", v8);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[HFSimpleAggregatedCharacteristicValueSource valueSource](self, "valueSource");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "readValuesForCharacteristics:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (BOOL)isNaturalLightingSupported
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  id v8;
  int v9;
  void *v10;
  void *v11;
  void *v12;
  _QWORD v14[4];
  id v15;

  -[HFSimpleAggregatedCharacteristicValueSource lightProfiles](self, "lightProfiles");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[HFSimpleAggregatedCharacteristicValueSource valueSource](self, "valueSource");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = &unk_1F0405EE0;
  if (objc_msgSend(v4, "conformsToProtocol:", v5))
    v6 = v4;
  else
    v6 = 0;
  v7 = v6;

  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __100__HFSimpleAggregatedCharacteristicValueSource_HFLightProfileValueSource__isNaturalLightingSupported__block_invoke;
  v14[3] = &unk_1EA729110;
  v8 = v7;
  v15 = v8;
  v9 = objc_msgSend(v3, "na_all:", v14);
  if (!+[HFUtilities isRunningInStoreDemoMode](HFUtilities, "isRunningInStoreDemoMode")
    && !+[HFUtilities isPressDemoModeEnabled](HFUtilities, "isPressDemoModeEnabled"))
  {
    -[HFSimpleAggregatedCharacteristicValueSource allServices](self, "allServices");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "anyObject");
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v11, "home");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v9 &= objc_msgSend(v12, "hf_enabledResidentsSupportsNaturalLight");

  }
  return v9;
}

- (HFCharacteristicValueSource)valueSource
{
  return self->_valueSource;
}

- (NSSet)lightProfiles
{
  void *v2;
  void *v3;

  -[HFSimpleAggregatedCharacteristicValueSource allServices](self, "allServices");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "na_flatMap:", &__block_literal_global_21);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSSet *)v3;
}

- (NSSet)allServices
{
  NSSet *allServices;
  void *v4;
  NSSet *v5;
  NSSet *v6;

  allServices = self->_allServices;
  if (!allServices)
  {
    -[HFSimpleAggregatedCharacteristicValueSource characteristics](self, "characteristics");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "na_map:", &__block_literal_global_12);
    v5 = (NSSet *)objc_claimAutoreleasedReturnValue();
    v6 = self->_allServices;
    self->_allServices = v5;

    allServices = self->_allServices;
  }
  return allServices;
}

- (NSSet)characteristics
{
  NSSet *characteristics;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  NSSet *v8;
  NSSet *v9;

  characteristics = self->_characteristics;
  if (!characteristics)
  {
    v4 = (void *)MEMORY[0x1E0C99E60];
    -[HFSimpleAggregatedCharacteristicValueSource characteristicsByType](self, "characteristicsByType");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "allValues");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "na_flatMap:", &__block_literal_global_14);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setWithArray:", v7);
    v8 = (NSSet *)objc_claimAutoreleasedReturnValue();
    v9 = self->_characteristics;
    self->_characteristics = v8;

    characteristics = self->_characteristics;
  }
  return characteristics;
}

uint64_t __98__HFSimpleAggregatedCharacteristicValueSource_HFLightProfileValueSource__isNaturalLightingEnabled__block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "isNaturalLightingEnabledForProfile:", a2);
}

- (HFSimpleAggregatedCharacteristicValueSource)initWithValueSource:(id)a3 characteristics:(id)a4 primaryServiceDescriptor:(id)a5
{
  id v9;
  id v10;
  id v11;
  HFSimpleAggregatedCharacteristicValueSource *v12;
  HFSimpleAggregatedCharacteristicValueSource *v13;
  uint64_t v14;
  NSDictionary *characteristicsByType;
  objc_super v17;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  if (!v9)
    NSLog(CFSTR("Value source cannot be nil"));
  v17.receiver = self;
  v17.super_class = (Class)HFSimpleAggregatedCharacteristicValueSource;
  v12 = -[HFSimpleAggregatedCharacteristicValueSource init](&v17, sel_init);
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_valueSource, a3);
    objc_storeStrong((id *)&v13->_primaryServiceDescriptor, a5);
    objc_msgSend(v10, "na_dictionaryByBucketingObjectsUsingKeyGenerator:", &__block_literal_global_10);
    v14 = objc_claimAutoreleasedReturnValue();
    characteristicsByType = v13->_characteristicsByType;
    v13->_characteristicsByType = (NSDictionary *)v14;

  }
  return v13;
}

id __101__HFSimpleAggregatedCharacteristicValueSource_initWithValueSource_services_primaryServiceDescriptor___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)MEMORY[0x1E0C99E60];
  objc_msgSend(a2, "characteristics");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setWithArray:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_characteristicsByType, 0);
  objc_storeStrong((id *)&self->_valueSource, 0);
  objc_storeStrong((id *)&self->_primaryServiceDescriptor, 0);
  objc_storeStrong((id *)&self->_characteristics, 0);
  objc_storeStrong((id *)&self->_allServices, 0);
}

- (HFServiceDescriptor)primaryServiceDescriptor
{
  return self->_primaryServiceDescriptor;
}

- (BOOL)isNaturalLightingEnabled
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  id v8;
  char v9;
  _QWORD v11[4];
  id v12;

  -[HFSimpleAggregatedCharacteristicValueSource lightProfiles](self, "lightProfiles");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[HFSimpleAggregatedCharacteristicValueSource valueSource](self, "valueSource");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = &unk_1F0405EE0;
  if (objc_msgSend(v4, "conformsToProtocol:", v5))
    v6 = v4;
  else
    v6 = 0;
  v7 = v6;

  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __98__HFSimpleAggregatedCharacteristicValueSource_HFLightProfileValueSource__isNaturalLightingEnabled__block_invoke;
  v11[3] = &unk_1EA729110;
  v12 = v7;
  v8 = v7;
  v9 = objc_msgSend(v3, "na_all:", v11);

  return v9;
}

- (HFSimpleAggregatedCharacteristicValueSource)initWithValueSource:(id)a3 services:(id)a4 primaryServiceDescriptor:(id)a5
{
  id v9;
  id v10;
  id v11;
  void *v12;
  HFSimpleAggregatedCharacteristicValueSource *v13;

  v9 = a4;
  v10 = a5;
  v11 = a3;
  objc_msgSend(v9, "na_flatMap:", &__block_literal_global_2);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = -[HFSimpleAggregatedCharacteristicValueSource initWithValueSource:characteristics:primaryServiceDescriptor:](self, "initWithValueSource:characteristics:primaryServiceDescriptor:", v11, v12, v10);

  if (v13)
    objc_storeStrong((id *)&v13->_allServices, a4);

  return v13;
}

- (HFSimpleAggregatedCharacteristicValueSource)init
{
  void *v4;
  void *v5;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_initWithValueSource_characteristics_primaryServiceDescriptor_);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HFAggregatedCharacteristicValueSource.m"), 29, CFSTR("%s is unavailable; use %@ instead"),
    "-[HFSimpleAggregatedCharacteristicValueSource init]",
    v5);

  return 0;
}

- (id)copyWithZone:(_NSZone *)a3
{
  void *v4;
  id v5;

  -[HFSimpleAggregatedCharacteristicValueSource valueSource](self, "valueSource", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[HFSimpleAggregatedCharacteristicValueSource copyWithValueSource:](self, "copyWithValueSource:", v4);

  return v5;
}

- (id)copyWithValueSource:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  int v11;
  const char *v12;
  __int16 v13;
  uint64_t v14;
  __int16 v15;
  id v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  HFLogForCategory(0x36uLL);
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v11 = 136315650;
    v12 = "-[HFSimpleAggregatedCharacteristicValueSource copyWithValueSource:]";
    v13 = 2048;
    v14 = 63;
    v15 = 2112;
    v16 = v4;
    _os_log_impl(&dword_1DD34E000, v5, OS_LOG_TYPE_DEFAULT, "%s (Line: %ld) Copying with valueSource %@.", (uint8_t *)&v11, 0x20u);
  }

  v6 = objc_alloc((Class)objc_opt_class());
  -[HFSimpleAggregatedCharacteristicValueSource characteristics](self, "characteristics");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[HFSimpleAggregatedCharacteristicValueSource primaryServiceDescriptor](self, "primaryServiceDescriptor");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)objc_msgSend(v6, "initWithValueSource:characteristics:primaryServiceDescriptor:", v4, v7, v8);

  return v9;
}

- (id)readValuesForServiceStateRecipe:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  int v15;
  const char *v16;
  __int16 v17;
  uint64_t v18;
  __int16 v19;
  HFSimpleAggregatedCharacteristicValueSource *v20;
  __int16 v21;
  void *v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  HFLogForCategory(0x36uLL);
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    -[HFSimpleAggregatedCharacteristicValueSource valueSource](self, "valueSource");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = 136315906;
    v16 = "-[HFSimpleAggregatedCharacteristicValueSource readValuesForServiceStateRecipe:]";
    v17 = 2048;
    v18 = 90;
    v19 = 2112;
    v20 = self;
    v21 = 2112;
    v22 = v6;
    _os_log_impl(&dword_1DD34E000, v5, OS_LOG_TYPE_DEFAULT, "%s (Line: %ld) valueSource for %@ = %@", (uint8_t *)&v15, 0x2Au);

  }
  -[HFSimpleAggregatedCharacteristicValueSource allServices](self, "allServices");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "matchResultForServices:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  -[HFSimpleAggregatedCharacteristicValueSource valueSource](self, "valueSource");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "allCharacteristics");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[HFSimpleAggregatedCharacteristicValueSource characteristics](self, "characteristics");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "na_setByIntersectingWithSet:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "readValuesForCharacteristics:", v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return v13;
}

- (id)writeValuesForCharacteristicRecipes:(id)a3
{
  id v4;
  HFCharacteristicValueSet *v5;
  HFCharacteristicValueSet *v6;
  void *v7;
  void *v8;
  uint64_t v10;
  uint64_t v11;
  void (*v12)(uint64_t, void *, void *);
  void *v13;
  HFSimpleAggregatedCharacteristicValueSource *v14;
  HFCharacteristicValueSet *v15;

  v4 = a3;
  v5 = objc_alloc_init(HFCharacteristicValueSet);
  v10 = MEMORY[0x1E0C809B0];
  v11 = 3221225472;
  v12 = __83__HFSimpleAggregatedCharacteristicValueSource_writeValuesForCharacteristicRecipes___block_invoke;
  v13 = &unk_1EA726AE0;
  v14 = self;
  v15 = v5;
  v6 = v5;
  objc_msgSend(v4, "enumerateKeysAndObjectsUsingBlock:", &v10);

  -[HFSimpleAggregatedCharacteristicValueSource valueSource](self, "valueSource", v10, v11, v12, v13, v14);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "writeValuesForCharacteristics:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

void __83__HFSimpleAggregatedCharacteristicValueSource_writeValuesForCharacteristicRecipes___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  objc_msgSend(*(id *)(a1 + 32), "allServices");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "matchResultForServices:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "allCharacteristics");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "characteristics");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "na_setByIntersectingWithSet:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  v19 = 0u;
  v20 = 0u;
  v17 = 0u;
  v18 = 0u;
  v12 = v11;
  v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  if (v13)
  {
    v14 = v13;
    v15 = *(_QWORD *)v18;
    do
    {
      v16 = 0;
      do
      {
        if (*(_QWORD *)v18 != v15)
          objc_enumerationMutation(v12);
        objc_msgSend(*(id *)(a1 + 40), "setValue:forCharacteristic:", v6, *(_QWORD *)(*((_QWORD *)&v17 + 1) + 8 * v16++), (_QWORD)v17);
      }
      while (v14 != v16);
      v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    }
    while (v14);
  }

}

- (id)writeValuesForCharacteristicTypes:(id)a3
{
  id v4;
  HFCharacteristicValueSet *v5;
  HFCharacteristicValueSet *v6;
  void *v7;
  void *v8;
  uint64_t v10;
  uint64_t v11;
  void (*v12)(uint64_t, void *, void *);
  void *v13;
  HFSimpleAggregatedCharacteristicValueSource *v14;
  HFCharacteristicValueSet *v15;

  v4 = a3;
  v5 = objc_alloc_init(HFCharacteristicValueSet);
  v10 = MEMORY[0x1E0C809B0];
  v11 = 3221225472;
  v12 = __81__HFSimpleAggregatedCharacteristicValueSource_writeValuesForCharacteristicTypes___block_invoke;
  v13 = &unk_1EA726B08;
  v14 = self;
  v15 = v5;
  v6 = v5;
  objc_msgSend(v4, "enumerateKeysAndObjectsUsingBlock:", &v10);

  -[HFSimpleAggregatedCharacteristicValueSource valueSource](self, "valueSource", v10, v11, v12, v13, v14);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "writeValuesForCharacteristics:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

void __81__HFSimpleAggregatedCharacteristicValueSource_writeValuesForCharacteristicTypes___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  objc_msgSend(*(id *)(a1 + 32), "characteristicsByType", 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectForKeyedSubscript:", v5);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v14;
    do
    {
      v12 = 0;
      do
      {
        if (*(_QWORD *)v14 != v11)
          objc_enumerationMutation(v8);
        objc_msgSend(*(id *)(a1 + 40), "setValue:forCharacteristic:", v6, *(_QWORD *)(*((_QWORD *)&v13 + 1) + 8 * v12++));
      }
      while (v10 != v12);
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v10);
  }

}

- (void)beginTransactionWithReason:(id)a3 readPolicy:(id)a4 logger:(id)a5
{
  id v8;
  id v9;
  id v10;
  id v11;

  v8 = a5;
  v9 = a4;
  v10 = a3;
  -[HFSimpleAggregatedCharacteristicValueSource valueSource](self, "valueSource");
  v11 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "beginTransactionWithReason:readPolicy:logger:", v10, v9, v8);

}

- (void)commitTransactionWithReason:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[HFSimpleAggregatedCharacteristicValueSource valueSource](self, "valueSource");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "commitTransactionWithReason:", v4);

}

- (id)writeNaturalLightEnabledState:(BOOL)a3
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  uint64_t v15;
  uint64_t v16;
  id (*v17)(uint64_t, void *);
  void *v18;
  id v19;
  BOOL v20;

  -[HFSimpleAggregatedCharacteristicValueSource lightProfiles](self, "lightProfiles");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[HFSimpleAggregatedCharacteristicValueSource valueSource](self, "valueSource");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = &unk_1F0405EE0;
  if (objc_msgSend(v6, "conformsToProtocol:", v7))
    v8 = v6;
  else
    v8 = 0;
  v9 = v8;

  objc_msgSend(v5, "allObjects");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = MEMORY[0x1E0C809B0];
  v16 = 3221225472;
  v17 = __104__HFSimpleAggregatedCharacteristicValueSource_HFLightProfileValueSource__writeNaturalLightEnabledState___block_invoke;
  v18 = &unk_1EA729160;
  v19 = v9;
  v20 = a3;
  v11 = v9;
  objc_msgSend(v10, "na_map:", &v15);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0D519C0], "chainFutures:", v12, v15, v16, v17, v18);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return v13;
}

id __104__HFSimpleAggregatedCharacteristicValueSource_HFLightProfileValueSource__writeNaturalLightEnabledState___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  id v6;
  void *v7;
  _QWORD v9[4];
  id v10;
  id v11;
  char v12;

  v3 = a2;
  v4 = (void *)MEMORY[0x1E0D519C0];
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __104__HFSimpleAggregatedCharacteristicValueSource_HFLightProfileValueSource__writeNaturalLightEnabledState___block_invoke_2;
  v9[3] = &unk_1EA729138;
  v5 = *(id *)(a1 + 32);
  v12 = *(_BYTE *)(a1 + 40);
  v10 = v5;
  v11 = v3;
  v6 = v3;
  objc_msgSend(v4, "futureWithBlock:", v9);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

void __104__HFSimpleAggregatedCharacteristicValueSource_HFLightProfileValueSource__writeNaturalLightEnabledState___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  id v6;
  _QWORD v7[4];
  id v8;

  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "writeNaturalLightEnabledState:forProfile:", *(unsigned __int8 *)(a1 + 48), *(_QWORD *)(a1 + 40));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __104__HFSimpleAggregatedCharacteristicValueSource_HFLightProfileValueSource__writeNaturalLightEnabledState___block_invoke_3;
  v7[3] = &unk_1EA728EC8;
  v8 = v3;
  v5 = v3;
  v6 = (id)objc_msgSend(v4, "addCompletionBlock:", v7);

}

uint64_t __104__HFSimpleAggregatedCharacteristicValueSource_HFLightProfileValueSource__writeNaturalLightEnabledState___block_invoke_3(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return objc_msgSend(*(id *)(a1 + 32), "finishWithResult:error:", a2, a3);
}

- (void)fetchNaturalLightColorTemperatureForBrightness:(int64_t)a3 completion:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  id v11;

  v6 = a4;
  -[HFSimpleAggregatedCharacteristicValueSource lightProfiles](self, "lightProfiles");
  v11 = (id)objc_claimAutoreleasedReturnValue();
  -[HFSimpleAggregatedCharacteristicValueSource valueSource](self, "valueSource");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v7, "conformsToProtocol:", &unk_1F0405EE0))
    v8 = v7;
  else
    v8 = 0;
  v9 = v8;

  objc_msgSend(v11, "anyObject");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "fetchNaturalLightColorTemperatureForBrightness:lightProfile:completion:", a3, v10, v6);

}

@end
