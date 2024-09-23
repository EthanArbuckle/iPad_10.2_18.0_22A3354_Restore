@implementation HFOverrideCharacteristicValueSource

uint64_t __50__HFOverrideCharacteristicValueSource_na_identity__block_invoke_5(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "overrideValueProvider");
}

uint64_t __50__HFOverrideCharacteristicValueSource_na_identity__block_invoke_4(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "originalValueSource");
}

void __50__HFOverrideCharacteristicValueSource_na_identity__block_invoke_2()
{
  void *v0;
  id v1;
  id v2;
  uint64_t v3;
  void *v4;

  objc_msgSend(MEMORY[0x1E0D519C8], "builder");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v1 = (id)objc_msgSend(v0, "appendCharacteristic:", &__block_literal_global_15_13);
  v2 = (id)objc_msgSend(v0, "appendCharacteristic:", &__block_literal_global_16_7);
  objc_msgSend(v0, "build");
  v3 = objc_claimAutoreleasedReturnValue();

  v4 = (void *)qword_1ED379AD8;
  qword_1ED379AD8 = v3;

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
  if (_MergedGlobals_298 != -1)
    dispatch_once(&_MergedGlobals_298, &__block_literal_global_10_11);
  return (NAIdentity *)(id)qword_1ED379AD8;
}

id __68__HFOverrideCharacteristicValueSource_readValuesForCharacteristics___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  id WeakRetained;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  HFCharacteristicReadResponse *v14;
  void *v15;
  HFCharacteristicReadResponse *v16;
  HFCharacteristicBatchReadResponse *v17;
  void *v18;
  HFCharacteristicBatchReadResponse *v19;
  void *v20;
  void *v22;
  id obj;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  _BYTE v28[128];
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v22 = v3;
  objc_msgSend(v3, "allReadResponses");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v5, "mutableCopy");

  v26 = 0u;
  v27 = 0u;
  v24 = 0u;
  v25 = 0u;
  obj = *(id *)(a1 + 32);
  v7 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v25;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v25 != v9)
          objc_enumerationMutation(obj);
        v11 = *(_QWORD *)(*((_QWORD *)&v24 + 1) + 8 * v10);
        objc_msgSend(WeakRetained, "overrideValueProvider");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "valueSource:overrideValueForCharacteristic:", WeakRetained, v11);
        v13 = (void *)objc_claimAutoreleasedReturnValue();

        v14 = [HFCharacteristicReadResponse alloc];
        objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", CFSTR("ValueOverridden"));
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v16 = -[HFCharacteristicReadResponse initWithCharacteristic:readTraits:value:error:](v14, "initWithCharacteristic:readTraits:value:error:", v11, v15, v13, 0);
        objc_msgSend(v6, "addObject:", v16);

        ++v10;
      }
      while (v8 != v10);
      v8 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
    }
    while (v8);
  }

  v17 = [HFCharacteristicBatchReadResponse alloc];
  objc_msgSend(v22, "contextProvider");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = -[HFCharacteristicBatchReadResponse initWithReadResponses:contextProvider:](v17, "initWithReadResponses:contextProvider:", v6, v18);

  objc_msgSend(MEMORY[0x1E0D519C0], "futureWithResult:", v19);
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  return v20;
}

- (id)readValuesForCharacteristics:(id)a3
{
  uint64_t v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  _QWORD v13[4];
  id v14;
  id v15;
  id location;
  _QWORD v17[5];

  v4 = MEMORY[0x1E0C809B0];
  v17[0] = MEMORY[0x1E0C809B0];
  v17[1] = 3221225472;
  v17[2] = __68__HFOverrideCharacteristicValueSource_readValuesForCharacteristics___block_invoke;
  v17[3] = &unk_1EA72BB50;
  v17[4] = self;
  v5 = a3;
  objc_msgSend(v5, "na_filter:", v17);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "na_setByRemovingObjectsFromSet:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_initWeak(&location, self);
  -[HFOverrideCharacteristicValueSource originalValueSource](self, "originalValueSource");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "readValuesForCharacteristics:", v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = v4;
  v13[1] = 3221225472;
  v13[2] = __68__HFOverrideCharacteristicValueSource_readValuesForCharacteristics___block_invoke_2;
  v13[3] = &unk_1EA72BA38;
  objc_copyWeak(&v15, &location);
  v10 = v6;
  v14 = v10;
  objc_msgSend(v9, "flatMap:", v13);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_destroyWeak(&v15);
  objc_destroyWeak(&location);

  return v11;
}

- (BOOL)isNaturalLightingSupportedForProfile:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  char v8;

  v4 = a3;
  -[HFOverrideCharacteristicValueSource originalValueSource](self, "originalValueSource");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "conformsToProtocol:", &unk_1F0405EE0))
    v6 = v5;
  else
    v6 = 0;
  v7 = v6;

  v8 = objc_msgSend(v7, "isNaturalLightingSupportedForProfile:", v4);
  return v8;
}

- (id)cachedErrorForWriteToCharacteristic:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  char v8;

  v4 = a3;
  -[HFOverrideCharacteristicValueSource overrideValueProvider](self, "overrideValueProvider");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v5, "valueSource:shouldOverrideValueForCharacteristic:", self, v4) & 1) != 0)
  {
    v6 = 0;
  }
  else
  {
    -[HFOverrideCharacteristicValueSource originalValueSource](self, "originalValueSource");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_opt_respondsToSelector();

    if ((v8 & 1) == 0)
    {
      v6 = 0;
      goto LABEL_7;
    }
    -[HFOverrideCharacteristicValueSource originalValueSource](self, "originalValueSource");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "cachedErrorForWriteToCharacteristic:", v4);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }

LABEL_7:
  return v6;
}

- (HFCharacteristicValueSource)originalValueSource
{
  return self->_originalValueSource;
}

uint64_t __68__HFOverrideCharacteristicValueSource_readValuesForCharacteristics___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
  void *v5;
  uint64_t v6;

  v3 = *(void **)(a1 + 32);
  v4 = a2;
  objc_msgSend(v3, "overrideValueProvider");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "valueSource:shouldOverrideValueForCharacteristic:", *(_QWORD *)(a1 + 32), v4);

  return v6;
}

- (HFOverrideCharacteristicValueProvider)overrideValueProvider
{
  return (HFOverrideCharacteristicValueProvider *)objc_loadWeakRetained((id *)&self->_overrideValueProvider);
}

- (HFOverrideCharacteristicValueSource)initWithOriginalValueSource:(id)a3 overrideValueProvider:(id)a4
{
  id v7;
  id v8;
  HFOverrideCharacteristicValueSource *v9;
  HFOverrideCharacteristicValueSource *v10;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)HFOverrideCharacteristicValueSource;
  v9 = -[HFOverrideCharacteristicValueSource init](&v12, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_originalValueSource, a3);
    objc_storeWeak((id *)&v10->_overrideValueProvider, v8);
  }

  return v10;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_overrideValueProvider);
  objc_storeStrong((id *)&self->_originalValueSource, 0);
}

- (BOOL)isNaturalLightingEnabledForProfile:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  char v8;

  v4 = a3;
  -[HFOverrideCharacteristicValueSource originalValueSource](self, "originalValueSource");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "conformsToProtocol:", &unk_1F0405EE0))
    v6 = v5;
  else
    v6 = 0;
  v7 = v6;

  v8 = objc_msgSend(v7, "isNaturalLightingEnabledForProfile:", v4);
  return v8;
}

- (id)writeNaturalLightEnabledState:(BOOL)a3 forProfile:(id)a4
{
  _BOOL8 v4;
  id v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;

  v4 = a3;
  v6 = a4;
  -[HFOverrideCharacteristicValueSource originalValueSource](self, "originalValueSource");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v7, "conformsToProtocol:", &unk_1F0405EE0))
    v8 = v7;
  else
    v8 = 0;
  v9 = v8;

  objc_msgSend(v9, "writeNaturalLightEnabledState:forProfile:", v4, v6);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (void)fetchNaturalLightColorTemperatureForBrightness:(int64_t)a3 lightProfile:(id)a4 completion:(id)a5
{
  id v8;
  void *v9;
  void *v10;
  id v11;
  id v12;

  v8 = a5;
  v12 = a4;
  -[HFOverrideCharacteristicValueSource originalValueSource](self, "originalValueSource");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v9, "conformsToProtocol:", &unk_1F0405EE0))
    v10 = v9;
  else
    v10 = 0;
  v11 = v10;

  objc_msgSend(v11, "fetchNaturalLightColorTemperatureForBrightness:lightProfile:completion:", a3, v12, v8);
}

- (id)readValuesForCharacteristicTypes:(id)a3 inServices:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  _QWORD v12[4];
  id v13;

  v6 = a3;
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __83__HFOverrideCharacteristicValueSource_readValuesForCharacteristicTypes_inServices___block_invoke;
  v12[3] = &unk_1EA72DFA0;
  v13 = v6;
  v7 = v6;
  objc_msgSend(a4, "na_map:", v12);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "na_setByFlattening");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  -[HFOverrideCharacteristicValueSource readValuesForCharacteristics:](self, "readValuesForCharacteristics:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

id __83__HFOverrideCharacteristicValueSource_readValuesForCharacteristicTypes_inServices___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  _QWORD v8[4];
  id v9;

  v3 = (void *)MEMORY[0x1E0C99E60];
  objc_msgSend(a2, "characteristics");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setWithArray:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __83__HFOverrideCharacteristicValueSource_readValuesForCharacteristicTypes_inServices___block_invoke_2;
  v8[3] = &unk_1EA72BB50;
  v9 = *(id *)(a1 + 32);
  objc_msgSend(v5, "na_filter:", v8);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

uint64_t __83__HFOverrideCharacteristicValueSource_readValuesForCharacteristicTypes_inServices___block_invoke_2(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  uint64_t v4;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(a2, "characteristicType");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v2, "containsObject:", v3);

  return v4;
}

- (id)writeValuesForCharacteristics:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  -[HFOverrideCharacteristicValueSource originalValueSource](self, "originalValueSource");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "writeValuesForCharacteristics:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)cachedValueForCharacteristic:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  -[HFOverrideCharacteristicValueSource originalValueSource](self, "originalValueSource");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "cachedValueForCharacteristic:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (HFCharacteristicOperationContextProviding)contextProvider
{
  void *v3;
  char v4;
  void *v5;
  void *v6;

  -[HFOverrideCharacteristicValueSource originalValueSource](self, "originalValueSource");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_opt_respondsToSelector();

  if ((v4 & 1) != 0)
  {
    -[HFOverrideCharacteristicValueSource originalValueSource](self, "originalValueSource");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "contextProvider");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v6 = 0;
  }
  return (HFCharacteristicOperationContextProviding *)v6;
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
  -[HFOverrideCharacteristicValueSource originalValueSource](self, "originalValueSource");
  v11 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "beginTransactionWithReason:readPolicy:logger:", v10, v9, v8);

}

- (void)commitTransactionWithReason:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[HFOverrideCharacteristicValueSource originalValueSource](self, "originalValueSource");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "commitTransactionWithReason:", v4);

}

- (void)setOverrideValueProvider:(id)a3
{
  objc_storeWeak((id *)&self->_overrideValueProvider, a3);
}

@end
