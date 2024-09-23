@implementation HFControlItem

uint64_t __28__HFControlItem_na_identity__block_invoke_4(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "characteristicOptions");
}

uint64_t __28__HFControlItem_na_identity__block_invoke_5(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "displayResults");
}

uint64_t __28__HFControlItem_na_identity__block_invoke_7(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "valueSource");
}

uint64_t __75__HFControlItem__standardResultsForResultValue_characteristicValuesByType___block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "requiresDeviceUnlock");
}

void __28__HFControlItem_na_identity__block_invoke_2()
{
  void *v0;
  void *v1;
  void *v2;
  id v3;
  uint64_t v4;
  void *v5;

  objc_msgSend(MEMORY[0x1E0D519C8], "builder");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "appendCharacteristic:", &__block_literal_global_121);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "appendCharacteristic:withRole:comparatorBlock:hashBlock:", &__block_literal_global_123, 3, 0, &__block_literal_global_125_0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (id)objc_msgSend(v2, "appendCharacteristic:", &__block_literal_global_127_0);

  objc_msgSend(v0, "build");
  v4 = objc_claimAutoreleasedReturnValue();

  v5 = (void *)qword_1ED378708;
  qword_1ED378708 = v4;

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
  if (qword_1ED378700 != -1)
    dispatch_once(&qword_1ED378700, &__block_literal_global_116);
  return (NAIdentity *)(id)qword_1ED378708;
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

- (id)valueForCharacteristicType:(id)a3 inBatchReadResponse:(id)a4
{
  id v6;
  id v7;
  void *v8;
  HFServiceStateCharacteristicRecipe *v9;
  void *v10;
  void *v11;

  v6 = a4;
  v7 = a3;
  -[HFControlItem servicePredicateForCharacteristicType:withUsage:](self, "servicePredicateForCharacteristicType:withUsage:", v7, 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = -[HFServiceStateCharacteristicRecipe initWithCharacteristicType:servicePredicate:required:]([HFServiceStateCharacteristicRecipe alloc], "initWithCharacteristicType:servicePredicate:required:", v7, v8, 1);

  objc_msgSend(v6, "responseForCharacteristicRecipe:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v10, "value");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

- (id)servicePredicateForCharacteristicType:(id)a3 withUsage:(unint64_t)a4
{
  return +[HFServiceTreeTypePredicate anyServiceTypePredicate](HFServiceTreeTypePredicate, "anyServiceTypePredicate", a3, a4);
}

uint64_t __28__HFControlItem_na_identity__block_invoke_6(uint64_t a1, void *a2)
{
  id v2;
  uint64_t v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;

  v2 = a2;
  v3 = objc_opt_class();
  v4 = v2;
  if (!v4)
    goto LABEL_7;
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v5 = v4;
  else
    v5 = 0;
  v6 = v4;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "id  _Nullable NAAssertCast(Class  _Nonnull __unsafe_unretained, id  _Nonnull __strong)");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "handleFailureInFunction:file:lineNumber:description:", v8, CFSTR("NSObject+NAAdditions.h"), 54, CFSTR("Expected class of %@ but was %@"), v3, objc_opt_class());

LABEL_7:
    v6 = 0;
  }

  v9 = objc_msgSend(v6, "computeHashFromContents");
  return v9;
}

- (BOOL)supportsItemRepresentingServices:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  char v8;
  _QWORD v10[4];
  id v11;

  v4 = a3;
  -[HFControlItem characteristicOptions](self, "characteristicOptions");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "allRequiredCharacteristicTypes");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __50__HFControlItem_supportsItemRepresentingServices___block_invoke;
  v10[3] = &unk_1EA726EA8;
  v11 = v4;
  v7 = v4;
  v8 = objc_msgSend(v6, "na_all:", v10);

  return v8;
}

- (id)_subclass_updateWithOptions:(id)a3
{
  void *v4;
  int v5;
  void *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;

  objc_msgSend(a3, "objectForKeyedSubscript:", HFItemUpdateOptionDisableOptionalData);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "BOOLValue");

  if (v5)
  {
    v6 = (void *)MEMORY[0x1E0D519C0];
    -[HFControlItem displayResults](self, "displayResults");
    v7 = objc_claimAutoreleasedReturnValue();
    v8 = (void *)v7;
    if (v7)
      v9 = v7;
    else
      v9 = MEMORY[0x1E0C9AA70];
    +[HFItemUpdateOutcome outcomeWithResults:](HFItemUpdateOutcome, "outcomeWithResults:", v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "futureWithResult:", v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    -[HFControlItem readValueAndPopulateStandardResults](self, "readValueAndPopulateStandardResults");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "flatMap:", &__block_literal_global_57);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v11;
}

- (id)_descriptionWithCharacteristicOptions:(BOOL)a3 includeResults:(BOOL)a4
{
  _BOOL4 v4;
  _BOOL4 v5;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  id v11;
  void *v12;

  v4 = a4;
  v5 = a3;
  objc_msgSend(MEMORY[0x1E0D519B8], "builderWithObject:", self);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    -[HFControlItem characteristicOptions](self, "characteristicOptions");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = (id)objc_msgSend(v7, "appendObject:withName:", v8, CFSTR("characteristics"));

  }
  if (v4)
  {
    -[HFItem latestResults](self, "latestResults");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = (id)objc_msgSend(v7, "appendObject:withName:", v10, CFSTR("latestResults"));

  }
  objc_msgSend(v7, "build");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

- (NSString)description
{
  return (NSString *)-[HFControlItem _descriptionWithCharacteristicOptions:includeResults:](self, "_descriptionWithCharacteristicOptions:includeResults:", 0, 0);
}

id __45__HFControlItem__subclass_updateWithOptions___block_invoke(uint64_t a1, uint64_t a2)
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)MEMORY[0x1E0D519C0];
  +[HFItemUpdateOutcome outcomeWithResults:](HFItemUpdateOutcome, "outcomeWithResults:", a2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "futureWithResult:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)readValueAndPopulateStandardResults
{
  NSObject *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  _QWORD v13[4];
  id v14;
  id location;
  uint8_t buf[4];
  HFControlItem *v17;
  __int16 v18;
  id v19;
  __int16 v20;
  void *v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  objc_initWeak(&location, self);
  HFLogForCategory(0);
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    NSStringFromSelector(a2);
    v5 = (id)objc_claimAutoreleasedReturnValue();
    -[HFControlItem valueSource](self, "valueSource");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412802;
    v17 = self;
    v18 = 2112;
    v19 = v5;
    v20 = 2112;
    v21 = v6;
    _os_log_impl(&dword_1DD34E000, v4, OS_LOG_TYPE_DEFAULT, "%@:%@ valueSource = %@", buf, 0x20u);

  }
  -[HFControlItem valueSource](self, "valueSource");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[HFControlItem characteristicOptions](self, "characteristicOptions");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "allCharacteristicTypes");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "readValuesForCharacteristicTypes:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __52__HFControlItem_readValueAndPopulateStandardResults__block_invoke;
  v13[3] = &unk_1EA72DAB8;
  objc_copyWeak(&v14, &location);
  objc_msgSend(v10, "flatMap:", v13);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_destroyWeak(&v14);

  objc_destroyWeak(&location);
  return v11;
}

id __75__HFControlItem__standardResultsForResultValue_characteristicValuesByType___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  id v3;
  void *v4;
  void *v5;

  v2 = *(void **)(a1 + 32);
  v3 = a2;
  objc_msgSend(v2, "valueSource");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "allCharacteristicsForCharacteristicType:", v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)normalizedValueForCharacteristicValue:(id)a3 ofType:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;

  v6 = a4;
  v7 = a3;
  -[HFControlItem valueSource](self, "valueSource");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "metadataForCharacteristicType:", v6);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "hf_normalizedValueForValue:", v7);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (HFAggregatedCharacteristicValueSource)valueSource
{
  return self->_valueSource;
}

- (id)resultsForBatchReadResponse:(id)a3
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  unint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t i;
  void *v19;
  uint64_t v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  _QWORD v31[5];
  id v32;
  _BYTE v33[128];
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[HFControlItem characteristicValuesByTypeForBatchReadResponse:](self, "characteristicValuesByTypeForBatchReadResponse:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v31[0] = MEMORY[0x1E0C809B0];
  v31[1] = 3221225472;
  v31[2] = __45__HFControlItem_resultsForBatchReadResponse___block_invoke;
  v31[3] = &unk_1EA72DAE0;
  v31[4] = self;
  v6 = v5;
  v32 = v6;
  __45__HFControlItem_resultsForBatchReadResponse___block_invoke((uint64_t)v31);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    objc_msgSend((id)objc_opt_class(), "valueClass");
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      v8 = objc_msgSend((id)objc_opt_class(), "valueClass");
      NSLog(CFSTR("Value %@ is not compatible with %@'s expected value type, %@"), v7, self, v8);
    }
  }
  -[HFControlItem _standardResultsForResultValue:characteristicValuesByType:](self, "_standardResultsForResultValue:characteristicValuesByType:", v7, v6);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)objc_msgSend(v9, "mutableCopy");

  v11 = -[HFControlItem _accessorySuspendedState](self, "_accessorySuspendedState");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setObject:forKeyedSubscript:", v12, CFSTR("suspendedState"));

  v29 = 0u;
  v30 = 0u;
  v27 = 0u;
  v28 = 0u;
  -[HFControlItem characteristicOptions](self, "characteristicOptions");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "allRequiredCharacteristicTypes");
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v27, v33, 16);
  if (v15)
  {
    v16 = v15;
    v17 = *(_QWORD *)v28;
    while (2)
    {
      for (i = 0; i != v16; ++i)
      {
        if (*(_QWORD *)v28 != v17)
          objc_enumerationMutation(v14);
        objc_msgSend(v4, "responseForCharacteristicType:", *(_QWORD *)(*((_QWORD *)&v27 + 1) + 8 * i));
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "error");
        v20 = objc_claimAutoreleasedReturnValue();
        if (v20)
        {
          v21 = (void *)v20;
          objc_msgSend(v19, "readTraits");
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v4, "contextProvider");
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          +[HFCharacteristicValueDisplayError errorWithUnderlyingError:readTraits:contextProvider:](HFCharacteristicValueDisplayError, "errorWithUnderlyingError:readTraits:contextProvider:", v21, v22, v23);
          v24 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v10, "na_safeSetObject:forKey:", v24, CFSTR("underlyingError"));
          goto LABEL_14;
        }

      }
      v16 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v27, v33, 16);
      if (v16)
        continue;
      break;
    }
  }
LABEL_14:

  v25 = (void *)objc_msgSend(v10, "copy");
  return v25;
}

id __45__HFControlItem_resultsForBatchReadResponse___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  int v7;
  void *v8;

  objc_msgSend(*(id *)(a1 + 32), "characteristicOptions");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "allRequiredCharacteristicTypes");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)MEMORY[0x1E0C99E60];
  objc_msgSend(*(id *)(a1 + 40), "allKeys");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setWithArray:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v3, "isSubsetOfSet:", v6);

  if (v7)
  {
    objc_msgSend(*(id *)(a1 + 32), "valueForCharacteristicValues:", *(_QWORD *)(a1 + 40));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v8 = 0;
  }
  return v8;
}

- (id)characteristicValuesByTypeForBatchReadResponse:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  __int128 v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  uint64_t v12;
  void *v13;
  NSObject *v14;
  void *v15;
  void *v16;
  int v17;
  void *v18;
  void *v19;
  __int128 v21;
  id obj;
  id v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  uint8_t buf[4];
  void *v29;
  __int16 v30;
  void *v31;
  _BYTE v32[128];
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v23 = (id)objc_claimAutoreleasedReturnValue();
  v24 = 0u;
  v25 = 0u;
  v26 = 0u;
  v27 = 0u;
  -[HFControlItem characteristicOptions](self, "characteristicOptions");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "allCharacteristicTypes");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  obj = v6;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v24, v32, 16);
  if (v7)
  {
    v9 = v7;
    v10 = *(_QWORD *)v25;
    *(_QWORD *)&v8 = 138412546;
    v21 = v8;
    do
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v25 != v10)
          objc_enumerationMutation(obj);
        v12 = *(_QWORD *)(*((_QWORD *)&v24 + 1) + 8 * i);
        -[HFControlItem valueForCharacteristicType:inBatchReadResponse:](self, "valueForCharacteristicType:inBatchReadResponse:", v12, v4, v21);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        if (v13)
        {
          -[HFControlItem normalizedValueForCharacteristicValue:ofType:](self, "normalizedValueForCharacteristicValue:ofType:", v13, v12);
          v14 = objc_claimAutoreleasedReturnValue();
          objc_msgSend(v23, "setObject:forKeyedSubscript:", v14, v12);
        }
        else
        {
          -[HFControlItem characteristicOptions](self, "characteristicOptions");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v15, "allRequiredCharacteristicTypes");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          v17 = objc_msgSend(v16, "containsObject:", v12);

          if (!v17)
            goto LABEL_12;
          HFLogForCategory(0x29uLL);
          v14 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
          {
            objc_msgSend(MEMORY[0x1E0CBA458], "localizedDescriptionForCharacteristicType:", v12);
            v18 = (void *)objc_claimAutoreleasedReturnValue();
            -[HFControlItem _descriptionWithCharacteristicOptions:includeResults:](self, "_descriptionWithCharacteristicOptions:includeResults:", 1, 0);
            v19 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = v21;
            v29 = v18;
            v30 = 2112;
            v31 = v19;
            _os_log_error_impl(&dword_1DD34E000, v14, OS_LOG_TYPE_ERROR, "Missing value for characteristic type %@ for control item %@", buf, 0x16u);

          }
        }

LABEL_12:
      }
      v9 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v24, v32, 16);
    }
    while (v9);
  }

  return v23;
}

- (id)_standardResultsForResultValue:(id)a3 characteristicValuesByType:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
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
  void *v25;
  void *v26;
  _QWORD v28[5];

  v6 = a3;
  v7 = a4;
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[HFControlItem displayResults](self, "displayResults");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    -[HFControlItem displayResults](self, "displayResults");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "addEntriesFromDictionary:", v10);

  }
  if (v6)
    objc_msgSend(v8, "setObject:forKeyedSubscript:", v6, CFSTR("value"));
  if (v7)
    objc_msgSend(v8, "setObject:forKeyedSubscript:", v7, CFSTR("characteristicValuesByType"));
  -[HFControlItem characteristicOptions](self, "characteristicOptions");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "allCharacteristicTypes");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v28[0] = MEMORY[0x1E0C809B0];
  v28[1] = 3221225472;
  v28[2] = __75__HFControlItem__standardResultsForResultValue_characteristicValuesByType___block_invoke;
  v28[3] = &unk_1EA726AB8;
  v28[4] = self;
  objc_msgSend(v12, "na_map:", v28);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "na_setByFlattening");
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "setObject:forKeyedSubscript:", v14, CFSTR("dependentHomeKitObjects"));
  -[HFControlItem characteristicOptions](self, "characteristicOptions");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "allCharacteristicTypes");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setObject:forKeyedSubscript:", v16, CFSTR("characteristicTypes"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", objc_msgSend(v14, "na_any:", &__block_literal_global_47_2));
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setObject:forKeyedSubscript:", v17, CFSTR("actionRequiresDeviceUnlock"));

  -[HFControlItem characteristicOptions](self, "characteristicOptions");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "characteristicTypesForUsage:", 0);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "allObjects");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "firstObject");
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  -[HFControlItem valueSource](self, "valueSource");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "allServices");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "anyObject");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "hf_effectiveServiceType");
  v25 = (void *)objc_claimAutoreleasedReturnValue();

  +[HFDecorationIconFactory iconDescriptorForCharacteristicType:effectiveServiceType:primaryState:](HFDecorationIconFactory, "iconDescriptorForCharacteristicType:effectiveServiceType:primaryState:", v21, v25, -[HFControlItem _primaryStateForValue:](self, "_primaryStateForValue:", v6));
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setObject:forKeyedSubscript:", v26, CFSTR("decorationIconDescriptor"));

  return v8;
}

- (HFControlItemCharacteristicOptions)characteristicOptions
{
  return self->_characteristicOptions;
}

- (NSDictionary)displayResults
{
  return self->_displayResults;
}

- (int64_t)_primaryStateForValue:(id)a3
{
  id v4;
  void *v5;
  id v6;
  double v7;
  uint64_t v8;
  int64_t v9;

  v4 = a3;
  v5 = v4;
  if (v4)
  {
    v6 = v4;
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(v6, "doubleValue");
      v8 = 2;
      if (fabs(v7) < 2.22044605e-16)
        v8 = 1;
      if (v7 > 0.0)
        v9 = v8;
      else
        v9 = 1;
    }
    else
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        if (objc_msgSend(v6, "integerValue"))
          v9 = 1;
        else
          v9 = 2;
      }
      else if (-[HFControlItem conformsToProtocol:](self, "conformsToProtocol:", &unk_1F03FD2C0))
      {
        v9 = objc_msgSend(v6, "integerValue");
      }
      else
      {
        v9 = 1;
      }
    }

  }
  else
  {
    v9 = 1;
  }

  return v9;
}

- (unint64_t)_accessorySuspendedState
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  unint64_t v9;
  _QWORD v11[2];

  v11[1] = *MEMORY[0x1E0C80C00];
  -[HFControlItem valueSource](self, "valueSource");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "allServices");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "na_map:", &__block_literal_global_105_0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3928], "sortDescriptorWithKey:ascending:", CFSTR("self"), 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = v5;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v11, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "sortedArrayUsingDescriptors:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "lastObject");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "unsignedIntegerValue");

  return v9;
}

- (id)metadataForCharacteristicType:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  -[HFControlItem valueSource](self, "valueSource");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "metadataForCharacteristicType:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_displayResults, 0);
  objc_storeStrong((id *)&self->_characteristicOptions, 0);
  objc_storeStrong((id *)&self->_valueSource, 0);
}

- (id)copyWithValueSource:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  -[HFControlItem characteristicOptions](self, "characteristicOptions");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[HFControlItem copyWithCharacteristicOptions:valueSource:](self, "copyWithCharacteristicOptions:valueSource:", v5, v4);

  return v6;
}

- (HFControlItem)initWithValueSource:(id)a3 characteristicOptions:(id)a4 displayResults:(id)a5
{
  id v9;
  id v10;
  id v11;
  HFControlItem *v12;
  HFControlItem *v13;
  uint64_t v14;
  NSDictionary *displayResults;
  objc_super v17;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v17.receiver = self;
  v17.super_class = (Class)HFControlItem;
  v12 = -[HFControlItem init](&v17, sel_init);
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_valueSource, a3);
    objc_storeStrong((id *)&v13->_characteristicOptions, a4);
    v14 = objc_msgSend(v11, "copy");
    displayResults = v13->_displayResults;
    v13->_displayResults = (NSDictionary *)v14;

  }
  return v13;
}

uint64_t __50__HFControlItem_supportsItemRepresentingServices___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  uint64_t v6;
  _QWORD v8[4];
  id v9;

  v3 = a2;
  v4 = *(void **)(a1 + 32);
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __50__HFControlItem_supportsItemRepresentingServices___block_invoke_2;
  v8[3] = &unk_1EA7283A0;
  v9 = v3;
  v5 = v3;
  v6 = objc_msgSend(v4, "na_any:", v8);

  return v6;
}

BOOL __50__HFControlItem_supportsItemRepresentingServices___block_invoke_2(uint64_t a1, void *a2)
{
  void *v2;
  _BOOL8 v3;

  objc_msgSend(a2, "hf_characteristicOfType:", *(_QWORD *)(a1 + 32));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2 != 0;

  return v3;
}

id __41__HFControlItem__accessorySuspendedState__block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend(a2, "accessory");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "numberWithUnsignedInteger:", objc_msgSend(v3, "suspendedState"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

id __52__HFControlItem_readValueAndPopulateStandardResults__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id WeakRetained;
  void *v5;
  void *v6;
  void *v7;

  v3 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v5 = WeakRetained;
  if (WeakRetained)
  {
    objc_msgSend(WeakRetained, "resultsForBatchReadResponse:", v3);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0D519C0], "futureWithResult:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    objc_msgSend(MEMORY[0x1E0D519C0], "futureWithResult:", MEMORY[0x1E0C9AA70]);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v7;
}

+ (Class)valueClass
{
  void *v4;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("HFControlItem.m"), 46, CFSTR("%s is an abstract method that must be overriden by subclass %@"), "+[HFControlItem valueClass]", objc_opt_class());

  return 0;
}

- (HFControlItem)initWithValueSource:(id)a3 characteristicTypes:(id)a4 displayResults:(id)a5
{
  id v8;
  id v9;
  id v10;
  HFControlItemCharacteristicOptions *v11;
  void *v12;
  HFControlItemCharacteristicOptions *v13;
  HFControlItem *v14;
  void *v16;
  _QWORD v17[2];

  v17[1] = *MEMORY[0x1E0C80C00];
  v8 = a5;
  v9 = a4;
  v10 = a3;
  v11 = [HFControlItemCharacteristicOptions alloc];
  v16 = &unk_1EA7CBE60;
  v17[0] = v9;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v17, &v16, 1);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  v13 = -[HFControlItemCharacteristicOptions initWithCharacteristicTypesByUsage:](v11, "initWithCharacteristicTypesByUsage:", v12);
  v14 = -[HFControlItem initWithValueSource:characteristicOptions:displayResults:](self, "initWithValueSource:characteristicOptions:displayResults:", v10, v13, v8);

  return v14;
}

- (HFControlItem)init
{
  void *v4;
  void *v5;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_initWithValueSource_characteristicOptions_displayResults_);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HFControlItem.m"), 69, CFSTR("%s is unavailable; use %@ instead"),
    "-[HFControlItem init]",
    v5);

  return 0;
}

- (id)copyWithZone:(_NSZone *)a3
{
  void *v4;
  id v5;

  -[HFControlItem valueSource](self, "valueSource", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[HFControlItem copyWithValueSource:](self, "copyWithValueSource:", v4);

  return v5;
}

- (BOOL)canCopyWithCharacteristicOptions:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  char v9;

  v4 = a3;
  objc_msgSend(v4, "characteristicTypesForUsage:", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "count"))
  {
    objc_msgSend(v4, "allRequiredCharacteristicTypes");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[HFControlItem characteristicOptions](self, "characteristicOptions");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "allRequiredCharacteristicTypes");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v6, "isSubsetOfSet:", v8);

  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (id)copyWithCharacteristicOptions:(id)a3 valueSource:(id)a4
{
  id v6;
  id v7;
  id v8;
  void *v9;
  void *v10;

  v6 = a4;
  v7 = a3;
  v8 = objc_alloc((Class)objc_opt_class());
  -[HFControlItem displayResults](self, "displayResults");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)objc_msgSend(v8, "initWithValueSource:characteristicOptions:displayResults:", v6, v7, v9);

  objc_msgSend(v10, "copyLatestResultsFromItem:", self);
  return v10;
}

- (NSSet)characteristicTypes
{
  void *v2;
  void *v3;

  -[HFControlItem characteristicOptions](self, "characteristicOptions");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "characteristicTypesForUsage:", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSSet *)v3;
}

- (id)writeValue:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  _QWORD v12[5];
  id v13;

  v4 = a3;
  if (v4)
  {
    objc_msgSend((id)objc_opt_class(), "valueClass");
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      v5 = objc_msgSend((id)objc_opt_class(), "valueClass");
      NSLog(CFSTR("Value %@ is not compatible with %@'s expected value type, %@"), v4, self, v5);
    }
  }
  -[HFControlItem characteristicValuesForValue:](self, "characteristicValuesForValue:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v6, "count"))
  {
    v7 = (void *)objc_opt_new();
    v12[0] = MEMORY[0x1E0C809B0];
    v12[1] = 3221225472;
    v12[2] = __28__HFControlItem_writeValue___block_invoke;
    v12[3] = &unk_1EA726B08;
    v12[4] = self;
    v13 = v7;
    v8 = v7;
    objc_msgSend(v6, "enumerateKeysAndObjectsUsingBlock:", v12);
    -[HFControlItem valueSource](self, "valueSource");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "writeValuesForCharacteristicRecipes:", v8);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    objc_msgSend(MEMORY[0x1E0D519C0], "futureWithNoResult");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v10;
}

void __28__HFControlItem_writeValue___block_invoke(uint64_t a1, void *a2, void *a3)
{
  void *v5;
  id v6;
  id v7;
  HFServiceStateCharacteristicRecipe *v8;
  id v9;

  v5 = *(void **)(a1 + 32);
  v6 = a3;
  v7 = a2;
  objc_msgSend(v5, "servicePredicateForCharacteristicType:withUsage:", v7, 1);
  v9 = (id)objc_claimAutoreleasedReturnValue();
  v8 = -[HFServiceStateCharacteristicRecipe initWithCharacteristicType:servicePredicate:required:]([HFServiceStateCharacteristicRecipe alloc], "initWithCharacteristicType:servicePredicate:required:", v7, v9, 1);

  objc_msgSend(*(id *)(a1 + 40), "setObject:forKeyedSubscript:", v6, v8);
}

- (id)_tintColor
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;

  if (qword_1ED3786F8 != -1)
    dispatch_once(&qword_1ED3786F8, &__block_literal_global_99_0);
  -[HFControlItem valueSource](self, "valueSource");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "primaryServiceDescriptor");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "serviceType");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if ((objc_msgSend(v5, "isEqualToString:", *MEMORY[0x1E0CB9AA0]) & 1) != 0
    || objc_msgSend(v5, "isEqualToString:", *MEMORY[0x1E0CB9AD8]))
  {
    -[HFControlItem valueSource](self, "valueSource");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "allServices");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "anyObject");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "hf_effectiveServiceType");
    v9 = objc_claimAutoreleasedReturnValue();

    v5 = (void *)v9;
  }
  objc_msgSend((id)_MergedGlobals_5_0, "objectForKeyedSubscript:", v5);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v10;
  if (v10)
  {
    v12 = v10;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CEA478], "systemYellowColor");
    v12 = (id)objc_claimAutoreleasedReturnValue();
  }
  v13 = v12;

  return v13;
}

void __27__HFControlItem__tintColor__block_invoke()
{
  void *v0;
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
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
  _QWORD v23[21];
  _QWORD v24[23];

  v24[21] = *MEMORY[0x1E0C80C00];
  v23[0] = *MEMORY[0x1E0CB9A70];
  objc_msgSend(MEMORY[0x1E0CEA478], "systemYellowColor");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v24[0] = v22;
  v23[1] = *MEMORY[0x1E0CB9AA0];
  objc_msgSend(MEMORY[0x1E0CEA478], "systemYellowColor");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v24[1] = v21;
  v23[2] = *MEMORY[0x1E0CB9AD8];
  objc_msgSend(MEMORY[0x1E0CEA478], "systemYellowColor");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v24[2] = v20;
  v23[3] = *MEMORY[0x1E0CB99A8];
  objc_msgSend(MEMORY[0x1E0CEA478], "systemCyanColor");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v24[3] = v19;
  v23[4] = *MEMORY[0x1E0CB9A10];
  objc_msgSend(MEMORY[0x1E0CEA478], "systemCyanColor");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v24[4] = v18;
  v23[5] = *MEMORY[0x1E0CB9A30];
  objc_msgSend(MEMORY[0x1E0CEA478], "systemCyanColor");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v24[5] = v17;
  v23[6] = *MEMORY[0x1E0CB9A38];
  objc_msgSend(MEMORY[0x1E0CEA478], "systemCyanColor");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v24[6] = v16;
  v23[7] = *MEMORY[0x1E0CB9B00];
  objc_msgSend(MEMORY[0x1E0CEA478], "systemCyanColor");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v24[7] = v15;
  v23[8] = *MEMORY[0x1E0CB9B10];
  objc_msgSend(MEMORY[0x1E0CEA478], "systemCyanColor");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v24[8] = v14;
  v23[9] = *MEMORY[0x1E0CB9B30];
  objc_msgSend(MEMORY[0x1E0CEA478], "systemCyanColor");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v24[9] = v13;
  v23[10] = *MEMORY[0x1E0CB9A00];
  objc_msgSend(MEMORY[0x1E0CEA478], "systemMintColor");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v24[10] = v12;
  v23[11] = *MEMORY[0x1E0CB9A28];
  objc_msgSend(MEMORY[0x1E0CEA478], "systemMintColor");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v24[11] = v0;
  v23[12] = *MEMORY[0x1E0CB9A80];
  objc_msgSend(MEMORY[0x1E0CEA478], "systemMintColor");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v24[12] = v1;
  v23[13] = *MEMORY[0x1E0CB9A78];
  objc_msgSend(MEMORY[0x1E0CEA478], "systemMintColor");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v24[13] = v2;
  v23[14] = *MEMORY[0x1E0CB9AA8];
  objc_msgSend(MEMORY[0x1E0CEA478], "systemMintColor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v24[14] = v3;
  v23[15] = *MEMORY[0x1E0CB9B28];
  objc_msgSend(MEMORY[0x1E0CEA478], "systemMintColor");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v24[15] = v4;
  v23[16] = *MEMORY[0x1E0CB9A18];
  objc_msgSend(MEMORY[0x1E0CEA478], "systemBlueColor");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v24[16] = v5;
  v23[17] = *MEMORY[0x1E0CB9A50];
  objc_msgSend(MEMORY[0x1E0CEA478], "systemBlueColor");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v24[17] = v6;
  v23[18] = *MEMORY[0x1E0CB9B08];
  objc_msgSend(MEMORY[0x1E0CEA478], "systemBlueColor");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v24[18] = v7;
  v23[19] = *MEMORY[0x1E0CB9A48];
  objc_msgSend(MEMORY[0x1E0CEA478], "systemTealColor");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v24[19] = v8;
  v23[20] = *MEMORY[0x1E0CB9AF0];
  objc_msgSend(MEMORY[0x1E0CEA478], "systemTealColor");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v24[20] = v9;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v24, v23, 21);
  v10 = objc_claimAutoreleasedReturnValue();
  v11 = (void *)_MergedGlobals_5_0;
  _MergedGlobals_5_0 = v10;

}

- (id)valueForCharacteristicValues:(id)a3
{
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;

  v5 = (void *)MEMORY[0x1E0CB3488];
  v6 = a3;
  objc_msgSend(v5, "currentHandler");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HFControlItem.m"), 318, CFSTR("%s is an abstract method that must be overriden by subclass %@"), "-[HFControlItem valueForCharacteristicValues:]", objc_opt_class());

  objc_msgSend(v6, "allValues");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "firstObject");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (id)characteristicValuesForValue:(id)a3
{
  void *v5;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HFControlItem.m"), 324, CFSTR("%s is an abstract method that must be overriden by subclass %@"), "-[HFControlItem characteristicValuesForValue:]", objc_opt_class());

  return (id)MEMORY[0x1E0C9AA70];
}

- (id)normalizedValueForValue:(id)a3
{
  void *v4;
  void *v5;

  -[HFControlItem characteristicValuesForValue:](self, "characteristicValuesForValue:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[HFControlItem valueForCharacteristicValues:](self, "valueForCharacteristicValues:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (int64_t)sortPriority
{
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  int64_t v7;
  uint64_t i;
  uint64_t v9;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  -[HFControlItem characteristicOptions](self, "characteristicOptions", 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "allCharacteristicTypes");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v12;
    v7 = -1000;
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v12 != v6)
          objc_enumerationMutation(v3);
        v9 = objc_msgSend(MEMORY[0x1E0CBA458], "hf_sortPriorityForCharacteristicType:", *(_QWORD *)(*((_QWORD *)&v11 + 1) + 8 * i));
        if (v7 <= v9)
          v7 = v9;
      }
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v5);
  }
  else
  {
    v7 = -1000;
  }

  return v7;
}

- (id)normalizedCharacteristicValuesForValues:(id)a3
{
  _QWORD v4[5];

  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __57__HFControlItem_normalizedCharacteristicValuesForValues___block_invoke;
  v4[3] = &unk_1EA72DB48;
  v4[4] = self;
  objc_msgSend(a3, "na_dictionaryByMappingValues:", v4);
  return (id)objc_claimAutoreleasedReturnValue();
}

uint64_t __57__HFControlItem_normalizedCharacteristicValuesForValues___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return objc_msgSend(*(id *)(a1 + 32), "normalizedValueForCharacteristicValue:ofType:", a3, a2);
}

- (NSString)debugDescription
{
  return (NSString *)-[HFControlItem _descriptionWithCharacteristicOptions:includeResults:](self, "_descriptionWithCharacteristicOptions:includeResults:", 1, 1);
}

@end
