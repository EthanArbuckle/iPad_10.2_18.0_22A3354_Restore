@implementation HFControlPanelItem

- (HFControlPanelItem)initWithControlItems:(id)a3 displayResults:(id)a4
{
  id v6;
  id v7;
  HFControlPanelItem *v8;
  void *v9;
  uint64_t v10;
  NSString *uniqueIdentifier;
  uint64_t v12;
  void *v13;
  void *v14;
  uint64_t v15;
  NSSet *controlItems;
  void *v17;
  uint64_t v18;
  NSDictionary *controlItemsByUUID;
  void *v20;
  HFControlPanelItem *v21;
  uint64_t v22;
  NSDictionary *UUIDsByControlItemPointer;
  _QWORD v25[4];
  HFControlPanelItem *v26;
  objc_super v27;

  v6 = a3;
  v7 = a4;
  v27.receiver = self;
  v27.super_class = (Class)HFControlPanelItem;
  v8 = -[HFControlPanelItem init](&v27, sel_init);
  if (v8)
  {
    objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "UUIDString");
    v10 = objc_claimAutoreleasedReturnValue();
    uniqueIdentifier = v8->_uniqueIdentifier;
    v8->_uniqueIdentifier = (NSString *)v10;

    v12 = objc_msgSend(v7, "copy");
    v13 = (void *)v12;
    if (v12)
      v14 = (void *)v12;
    else
      v14 = (void *)MEMORY[0x1E0C9AA70];
    objc_storeStrong((id *)&v8->_displayResults, v14);

    v15 = objc_msgSend(v6, "copy");
    controlItems = v8->_controlItems;
    v8->_controlItems = (NSSet *)v15;

    objc_msgSend(v6, "allObjects");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "na_dictionaryWithKeyGenerator:", &__block_literal_global_92);
    v18 = objc_claimAutoreleasedReturnValue();
    controlItemsByUUID = v8->_controlItemsByUUID;
    v8->_controlItemsByUUID = (NSDictionary *)v18;

    -[NSDictionary allKeys](v8->_controlItemsByUUID, "allKeys");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v25[0] = MEMORY[0x1E0C809B0];
    v25[1] = 3221225472;
    v25[2] = __58__HFControlPanelItem_initWithControlItems_displayResults___block_invoke_2;
    v25[3] = &unk_1EA7327D0;
    v21 = v8;
    v26 = v21;
    objc_msgSend(v20, "na_dictionaryWithKeyGenerator:", v25);
    v22 = objc_claimAutoreleasedReturnValue();
    UUIDsByControlItemPointer = v21->_UUIDsByControlItemPointer;
    v21->_UUIDsByControlItemPointer = (NSDictionary *)v22;

  }
  return v8;
}

id __58__HFControlPanelItem_initWithControlItems_displayResults___block_invoke()
{
  void *v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "UUIDString");
  v1 = (void *)objc_claimAutoreleasedReturnValue();

  return v1;
}

id __58__HFControlPanelItem_initWithControlItems_displayResults___block_invoke_2(uint64_t a1, uint64_t a2)
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)MEMORY[0x1E0CB3B18];
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 80), "objectForKeyedSubscript:", a2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "valueWithPointer:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (HFControlPanelItem)init
{
  void *v4;
  void *v5;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_initWithControlItems_displayResults_);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HFControlPanelItem.m"), 48, CFSTR("%s is unavailable; use %@ instead"),
    "-[HFControlPanelItem init]",
    v5);

  return 0;
}

- (id)identifierForControlItem:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;

  v4 = a3;
  -[HFControlPanelItem UUIDsByControlItemPointer](self, "UUIDsByControlItemPointer");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithPointer:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "objectForKeyedSubscript:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (id)controlItemForIdentifier:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  -[HFControlPanelItem controlItemsByUUID](self, "controlItemsByUUID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)_subclass_updateWithOptions:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  -[HFControlPanelItem displayResults](self, "displayResults", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (!v4)
    v4 = (void *)MEMORY[0x1E0C9AA70];
  v6 = (void *)objc_msgSend(v4, "mutableCopy");

  -[HFControlPanelItem controlItems](self, "controlItems");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setObject:forKeyedSubscript:", v7, CFSTR("childItems"));

  v8 = (void *)MEMORY[0x1E0D519C0];
  +[HFItemUpdateOutcome outcomeWithResults:](HFItemUpdateOutcome, "outcomeWithResults:", v6);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "futureWithResult:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

+ (NAIdentity)na_identity
{
  if (qword_1ED378698 != -1)
    dispatch_once(&qword_1ED378698, &__block_literal_global_12_5);
  return (NAIdentity *)(id)_MergedGlobals_1_0;
}

void __33__HFControlPanelItem_na_identity__block_invoke()
{
  id v0;
  id v1;
  uint64_t v2;
  void *v3;
  id v4;

  objc_msgSend(MEMORY[0x1E0D519C8], "builder");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  v0 = (id)objc_msgSend(v4, "appendCharacteristic:withRole:comparatorBlock:hashBlock:", &__block_literal_global_15_3, 3, 0, &__block_literal_global_17_5);
  v1 = (id)objc_msgSend(v4, "appendCharacteristic:withRole:comparatorBlock:hashBlock:", &__block_literal_global_20_4, 3, 0, &__block_literal_global_21_5);
  objc_msgSend(v4, "build");
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = (void *)_MergedGlobals_1_0;
  _MergedGlobals_1_0 = v2;

}

uint64_t __33__HFControlPanelItem_na_identity__block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "controlItems");
}

uint64_t __33__HFControlPanelItem_na_identity__block_invoke_3(uint64_t a1, void *a2)
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

uint64_t __33__HFControlPanelItem_na_identity__block_invoke_4(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "displayResults");
}

uint64_t __33__HFControlPanelItem_na_identity__block_invoke_5(uint64_t a1, void *a2)
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

- (int64_t)sortPriority
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  int64_t v6;
  uint64_t i;
  uint64_t v8;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  -[HFControlPanelItem controlItems](self, "controlItems", 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v11;
    v6 = -1000;
    do
    {
      for (i = 0; i != v4; ++i)
      {
        if (*(_QWORD *)v11 != v5)
          objc_enumerationMutation(v2);
        v8 = objc_msgSend(*(id *)(*((_QWORD *)&v10 + 1) + 8 * i), "sortPriority");
        if (v6 <= v8)
          v6 = v8;
      }
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v4);
  }
  else
  {
    v6 = -1000;
  }

  return v6;
}

- (NSString)uniqueIdentifier
{
  return self->_uniqueIdentifier;
}

- (NSSet)controlItems
{
  return self->_controlItems;
}

- (NSDictionary)displayResults
{
  return self->_displayResults;
}

- (NSDictionary)controlItemsByUUID
{
  return self->_controlItemsByUUID;
}

- (NSDictionary)UUIDsByControlItemPointer
{
  return self->_UUIDsByControlItemPointer;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_UUIDsByControlItemPointer, 0);
  objc_storeStrong((id *)&self->_controlItemsByUUID, 0);
  objc_storeStrong((id *)&self->_displayResults, 0);
  objc_storeStrong((id *)&self->_controlItems, 0);
  objc_storeStrong((id *)&self->_uniqueIdentifier, 0);
}

+ (id)_controlPanelItemRules
{
  if (qword_1ED379838 != -1)
    dispatch_once(&qword_1ED379838, &__block_literal_global_148);
  return (id)_MergedGlobals_283;
}

void __56__HFControlPanelItem_Generating___controlPanelItemRules__block_invoke()
{
  HFControlPanelItemSingleControlRule *v0;
  HFControlPanelItemSingleControlRule *v1;
  HFControlPanelItemSingleControlRule *v2;
  HFControlPanelItemSingleControlRule *v3;
  HFControlPanelItemSingleControlRule *v4;
  HFControlPanelItemSingleControlRule *v5;
  HFControlPanelItemSingleControlRule *v6;
  HFControlPanelItemSingleControlRule *v7;
  HFControlPanelItemSingleControlRule *v8;
  HFControlPanelItemSingleControlRule *v9;
  uint64_t v10;
  void *v11;
  HFControlPanelItemSingleControlRule *v12;
  _QWORD v13[12];

  v13[11] = *MEMORY[0x1E0C80C00];
  v12 = -[HFControlPanelItemSingleControlRule initWithFilter:displayResultsGenerator:]([HFControlPanelItemSingleControlRule alloc], "initWithFilter:displayResultsGenerator:", &__block_literal_global_64_1, &__block_literal_global_68_2);
  v13[0] = v12;
  v0 = -[HFControlPanelItemSingleControlRule initWithFilter:displayResultsGenerator:]([HFControlPanelItemSingleControlRule alloc], "initWithFilter:displayResultsGenerator:", &__block_literal_global_72_2, &__block_literal_global_73_2);
  v13[1] = v0;
  v1 = -[HFControlPanelItemSingleControlRule initWithFilter:displayResultsGenerator:]([HFControlPanelItemSingleControlRule alloc], "initWithFilter:displayResultsGenerator:", &__block_literal_global_76_1, &__block_literal_global_77_0);
  v13[2] = v1;
  v2 = -[HFControlPanelItemSingleControlRule initWithFilter:displayResultsGenerator:]([HFControlPanelItemSingleControlRule alloc], "initWithFilter:displayResultsGenerator:", &__block_literal_global_80_0, &__block_literal_global_81_1);
  v13[3] = v2;
  v3 = -[HFControlPanelItemSingleControlRule initWithFilter:displayResultsGenerator:]([HFControlPanelItemSingleControlRule alloc], "initWithFilter:displayResultsGenerator:", &__block_literal_global_84_1, &__block_literal_global_86_0);
  v13[4] = v3;
  v4 = -[HFControlPanelItemSingleControlRule initWithFilter:displayResultsGenerator:]([HFControlPanelItemSingleControlRule alloc], "initWithFilter:displayResultsGenerator:", &__block_literal_global_89_0, &__block_literal_global_91_1);
  v13[5] = v4;
  v5 = -[HFControlPanelItemSingleControlRule initWithFilter:displayResultsGenerator:]([HFControlPanelItemSingleControlRule alloc], "initWithFilter:displayResultsGenerator:", &__block_literal_global_94_2, &__block_literal_global_95_1);
  v13[6] = v5;
  v6 = -[HFControlPanelItemSingleControlRule initWithFilter:displayResultsGenerator:]([HFControlPanelItemSingleControlRule alloc], "initWithFilter:displayResultsGenerator:", &__block_literal_global_98, &__block_literal_global_99_2);
  v13[7] = v6;
  v7 = -[HFControlPanelItemSingleControlRule initWithFilter:displayResultsGenerator:]([HFControlPanelItemSingleControlRule alloc], "initWithFilter:displayResultsGenerator:", &__block_literal_global_102_1, &__block_literal_global_103_3);
  v13[8] = v7;
  v8 = -[HFControlPanelItemSingleControlRule initWithFilter:displayResultsGenerator:]([HFControlPanelItemSingleControlRule alloc], "initWithFilter:displayResultsGenerator:", &__block_literal_global_106_3, &__block_literal_global_107);
  v13[9] = v8;
  v9 = -[HFControlPanelItemSingleControlRule initWithFilter:displayResultsGenerator:]([HFControlPanelItemSingleControlRule alloc], "initWithFilter:displayResultsGenerator:", &__block_literal_global_117_0, &__block_literal_global_118_0);
  v13[10] = v9;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v13, 11);
  v10 = objc_claimAutoreleasedReturnValue();
  v11 = (void *)_MergedGlobals_283;
  _MergedGlobals_283 = v10;

}

uint64_t __56__HFControlPanelItem_Generating___controlPanelItemRules__block_invoke_2(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  uint64_t v4;

  objc_msgSend(a2, "characteristicOptions");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", &unk_1EA7CC7A8);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "containsObject:", *MEMORY[0x1E0CB8AF8]);

  return v4;
}

id __56__HFControlPanelItem_Generating___controlPanelItemRules__block_invoke_66()
{
  void *v0;
  void *v1;
  const __CFString *v3;
  _QWORD v4[2];

  v4[1] = *MEMORY[0x1E0C80C00];
  v3 = CFSTR("title");
  _HFLocalizedStringWithDefaultValue(CFSTR("HFServiceThermostatHumidityTitle"), CFSTR("HFServiceThermostatHumidityTitle"), 1);
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v4[0] = v0;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v4, &v3, 1);
  v1 = (void *)objc_claimAutoreleasedReturnValue();

  return v1;
}

uint64_t __56__HFControlPanelItem_Generating___controlPanelItemRules__block_invoke_2_71(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  uint64_t v4;

  objc_msgSend(a2, "characteristicOptions");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", &unk_1EA7CC7A8);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "containsObject:", *MEMORY[0x1E0CB8B20]);

  return v4;
}

id __56__HFControlPanelItem_Generating___controlPanelItemRules__block_invoke_3()
{
  void *v0;
  void *v1;
  const __CFString *v3;
  _QWORD v4[2];

  v4[1] = *MEMORY[0x1E0C80C00];
  v3 = CFSTR("title");
  _HFLocalizedStringWithDefaultValue(CFSTR("HFServiceThermostatDisplayUnitsTitle"), CFSTR("HFServiceThermostatDisplayUnitsTitle"), 1);
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v4[0] = v0;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v4, &v3, 1);
  v1 = (void *)objc_claimAutoreleasedReturnValue();

  return v1;
}

uint64_t __56__HFControlPanelItem_Generating___controlPanelItemRules__block_invoke_4(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  uint64_t v4;

  objc_msgSend(a2, "characteristicOptions");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", &unk_1EA7CC7A8);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "containsObject:", *MEMORY[0x1E0CB8AC8]);

  return v4;
}

id __56__HFControlPanelItem_Generating___controlPanelItemRules__block_invoke_5()
{
  void *v0;
  void *v1;
  const __CFString *v3;
  _QWORD v4[2];

  v4[1] = *MEMORY[0x1E0C80C00];
  v3 = CFSTR("title");
  _HFLocalizedStringWithDefaultValue(CFSTR("HFCharacteristicGroupTitleHorizontalTilt"), CFSTR("HFCharacteristicGroupTitleHorizontalTilt"), 1);
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v4[0] = v0;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v4, &v3, 1);
  v1 = (void *)objc_claimAutoreleasedReturnValue();

  return v1;
}

uint64_t __56__HFControlPanelItem_Generating___controlPanelItemRules__block_invoke_6(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  uint64_t v4;

  objc_msgSend(a2, "characteristicOptions");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", &unk_1EA7CC7A8);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "containsObject:", *MEMORY[0x1E0CB8B10]);

  return v4;
}

id __56__HFControlPanelItem_Generating___controlPanelItemRules__block_invoke_7()
{
  void *v0;
  void *v1;
  const __CFString *v3;
  _QWORD v4[2];

  v4[1] = *MEMORY[0x1E0C80C00];
  v3 = CFSTR("title");
  _HFLocalizedStringWithDefaultValue(CFSTR("HFCharacteristicGroupTitleVerticalTilt"), CFSTR("HFCharacteristicGroupTitleVerticalTilt"), 1);
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v4[0] = v0;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v4, &v3, 1);
  v1 = (void *)objc_claimAutoreleasedReturnValue();

  return v1;
}

uint64_t __56__HFControlPanelItem_Generating___controlPanelItemRules__block_invoke_8(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  void *v4;
  uint64_t v5;

  v2 = a2;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v2, "characteristicOptions");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "objectForKeyedSubscript:", &unk_1EA7CC7A8);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "containsObject:", *MEMORY[0x1E0CB8AB0]);

  }
  else
  {
    v5 = 0;
  }

  return v5;
}

id __56__HFControlPanelItem_Generating___controlPanelItemRules__block_invoke_9()
{
  void *v0;
  void *v1;
  const __CFString *v3;
  _QWORD v4[2];

  v4[1] = *MEMORY[0x1E0C80C00];
  v3 = CFSTR("title");
  _HFLocalizedStringWithDefaultValue(CFSTR("HFCharacteristicGroupTitleFanMode"), CFSTR("HFCharacteristicGroupTitleFanMode"), 1);
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v4[0] = v0;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v4, &v3, 1);
  v1 = (void *)objc_claimAutoreleasedReturnValue();

  return v1;
}

uint64_t __56__HFControlPanelItem_Generating___controlPanelItemRules__block_invoke_10(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  void *v4;
  uint64_t v5;

  v2 = a2;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v2, "characteristicOptions");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "objectForKeyedSubscript:", &unk_1EA7CC7A8);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "containsObject:", *MEMORY[0x1E0CB89F0]);

  }
  else
  {
    v5 = 0;
  }

  return v5;
}

id __56__HFControlPanelItem_Generating___controlPanelItemRules__block_invoke_11()
{
  void *v0;
  void *v1;
  const __CFString *v3;
  _QWORD v4[2];

  v4[1] = *MEMORY[0x1E0C80C00];
  v3 = CFSTR("title");
  _HFLocalizedStringWithDefaultValue(CFSTR("HFCharacteristicGroupTitleFanSpeed"), CFSTR("HFCharacteristicGroupTitleFanSpeed"), 1);
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v4[0] = v0;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v4, &v3, 1);
  v1 = (void *)objc_claimAutoreleasedReturnValue();

  return v1;
}

uint64_t __56__HFControlPanelItem_Generating___controlPanelItemRules__block_invoke_12(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  uint64_t v4;

  objc_msgSend(a2, "characteristicOptions");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", &unk_1EA7CC7A8);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "containsObject:", *MEMORY[0x1E0CB8A98]);

  return v4;
}

id __56__HFControlPanelItem_Generating___controlPanelItemRules__block_invoke_13()
{
  void *v0;
  void *v1;
  const __CFString *v3;
  _QWORD v4[2];

  v4[1] = *MEMORY[0x1E0C80C00];
  v3 = CFSTR("title");
  _HFLocalizedStringWithDefaultValue(CFSTR("HFCharacteristicGroupTitleSwingMode"), CFSTR("HFCharacteristicGroupTitleSwingMode"), 1);
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v4[0] = v0;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v4, &v3, 1);
  v1 = (void *)objc_claimAutoreleasedReturnValue();

  return v1;
}

uint64_t __56__HFControlPanelItem_Generating___controlPanelItemRules__block_invoke_14(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  uint64_t v4;

  objc_msgSend(a2, "characteristicOptions");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", &unk_1EA7CC7A8);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "containsObject:", *MEMORY[0x1E0CB8940]);

  return v4;
}

id __56__HFControlPanelItem_Generating___controlPanelItemRules__block_invoke_15()
{
  void *v0;
  void *v1;
  const __CFString *v3;
  _QWORD v4[2];

  v4[1] = *MEMORY[0x1E0C80C00];
  v3 = CFSTR("title");
  _HFLocalizedStringWithDefaultValue(CFSTR("HFCharacteristicGroupTitleLockPhysicalControls"), CFSTR("HFCharacteristicGroupTitleLockPhysicalControls"), 1);
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v4[0] = v0;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v4, &v3, 1);
  v1 = (void *)objc_claimAutoreleasedReturnValue();

  return v1;
}

uint64_t __56__HFControlPanelItem_Generating___controlPanelItemRules__block_invoke_16(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  uint64_t v4;

  objc_msgSend(a2, "characteristicOptions");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", &unk_1EA7CC7A8);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "containsObject:", *MEMORY[0x1E0CB8AA0]);

  return v4;
}

id __56__HFControlPanelItem_Generating___controlPanelItemRules__block_invoke_17()
{
  void *v0;
  void *v1;
  const __CFString *v3;
  _QWORD v4[2];

  v4[1] = *MEMORY[0x1E0C80C00];
  v3 = CFSTR("title");
  _HFLocalizedStringWithDefaultValue(CFSTR("HFCharacteristicGroupTitleAirPurifierState"), CFSTR("HFCharacteristicGroupTitleAirPurifierState"), 1);
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v4[0] = v0;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v4, &v3, 1);
  v1 = (void *)objc_claimAutoreleasedReturnValue();

  return v1;
}

uint64_t __56__HFControlPanelItem_Generating___controlPanelItemRules__block_invoke_18(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  uint64_t v4;

  objc_msgSend(a2, "characteristicOptions");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", &unk_1EA7CC7A8);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "containsObject:", *MEMORY[0x1E0CB8918]);

  return v4;
}

id __56__HFControlPanelItem_Generating___controlPanelItemRules__block_invoke_19(uint64_t a1, void *a2)
{
  void *v2;
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  __CFString *v8;
  void *v9;

  v2 = (void *)MEMORY[0x1E0C99E08];
  v3 = a2;
  objc_msgSend(v2, "dictionaryWithCapacity:", 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "valueSource");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "primaryServiceDescriptor");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "serviceSubtype");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if ((objc_msgSend(v7, "isEqualToString:", *MEMORY[0x1E0CB9978]) & 1) != 0)
  {
    v8 = CFSTR("HFCharacteristicGroupTitleIsConfiguredIrrigation");
LABEL_9:
    _HFLocalizedStringWithDefaultValue(v8, v8, 1);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKeyedSubscript:", v9, CFSTR("title"));

    goto LABEL_10;
  }
  if ((objc_msgSend(v7, "isEqualToString:", *MEMORY[0x1E0CB9980]) & 1) != 0)
  {
    v8 = CFSTR("HFCharacteristicGroupTitleIsConfiguredShowerHead");
    goto LABEL_9;
  }
  if ((objc_msgSend(v7, "isEqualToString:", *MEMORY[0x1E0CB9990]) & 1) != 0)
  {
    v8 = CFSTR("HFCharacteristicGroupTitleIsConfiguredFaucet");
    goto LABEL_9;
  }
  if (objc_msgSend(v7, "isEqualToString:", *MEMORY[0x1E0CB9970]))
  {
    v8 = CFSTR("HFCharacteristicGroupTitleIsConfiguredGeneric");
    goto LABEL_9;
  }
LABEL_10:

  return v4;
}

uint64_t __56__HFControlPanelItem_Generating___controlPanelItemRules__block_invoke_20(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  uint64_t v4;

  objc_msgSend(a2, "characteristicOptions");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", &unk_1EA7CC7A8);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "containsObject:", *MEMORY[0x1E0CB8A28]);

  return v4;
}

id __56__HFControlPanelItem_Generating___controlPanelItemRules__block_invoke_21()
{
  void *v0;
  void *v1;
  const __CFString *v3;
  _QWORD v4[2];

  v4[1] = *MEMORY[0x1E0C80C00];
  v3 = CFSTR("title");
  _HFLocalizedStringWithDefaultValue(CFSTR("HFCharacteristicGroupTitleSetDuration"), CFSTR("HFCharacteristicGroupTitleSetDuration"), 1);
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v4[0] = v0;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v4, &v3, 1);
  v1 = (void *)objc_claimAutoreleasedReturnValue();

  return v1;
}

+ (id)standardControlPanelItemsForControlItems:(id)a3
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a3, "na_filter:", &__block_literal_global_122_2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E20], "set");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v3, "mutableCopy");
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  objc_msgSend((id)objc_opt_class(), "_controlPanelItemRules", 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v17;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v17 != v9)
          objc_enumerationMutation(v6);
        v11 = 0;
        v12 = *(void **)(*((_QWORD *)&v16 + 1) + 8 * v10);
        do
        {
          v13 = v11;
          objc_msgSend(v12, "controlPanelItemForControlItems:", v5);
          v11 = (void *)objc_claimAutoreleasedReturnValue();

          if (!v11)
            break;
          objc_msgSend(v4, "addObject:", v11);
          objc_msgSend(v11, "controlItems");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v5, "minusSet:", v14);

        }
        while (objc_msgSend(v5, "count"));

        ++v10;
      }
      while (v10 != v8);
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    }
    while (v8);
  }

  return v4;
}

BOOL __75__HFControlPanelItem_Generating__standardControlPanelItemsForControlItems___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  _BOOL8 v4;

  objc_msgSend(a2, "latestResults");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("controlItemPurpose"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
    v4 = (objc_msgSend(v3, "integerValue") & 6) == 0;
  else
    v4 = 1;

  return v4;
}

@end
