@implementation HFPowerStateControlItem

uint64_t __38__HFPowerStateControlItem_na_identity__block_invoke_4(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "auxiliaryTargetValueTuples");
}

uint64_t __121__HFPowerStateControlItem_initWithValueSource_auxiliaryTargetValueTuples_additionalCharacteristicOptions_displayResults___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "characteristicType");
}

void __38__HFPowerStateControlItem_na_identity__block_invoke_2(uint64_t a1)
{
  uint64_t v1;
  void *v2;
  _QWORD v3[5];

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __38__HFPowerStateControlItem_na_identity__block_invoke_3;
  v3[3] = &__block_descriptor_40_e17___NAIdentity_8__0l;
  v3[4] = *(_QWORD *)(a1 + 32);
  __38__HFPowerStateControlItem_na_identity__block_invoke_3((uint64_t)v3);
  v1 = objc_claimAutoreleasedReturnValue();
  v2 = (void *)qword_1F03ED268;
  qword_1F03ED268 = v1;

}

id __38__HFPowerStateControlItem_na_identity__block_invoke_3(uint64_t a1)
{
  void *v1;
  void *v2;
  void *v3;
  id v4;
  void *v5;
  objc_super v7;

  v1 = (void *)MEMORY[0x1E0D519C8];
  v7.receiver = *(id *)(a1 + 32);
  v7.super_class = (Class)&OBJC_METACLASS___HFPowerStateControlItem;
  objc_msgSendSuper2(&v7, sel_na_identity);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "builderWithIdentity:", v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  v4 = (id)objc_msgSend(v3, "appendCharacteristic:withRole:comparatorBlock:hashBlock:", &__block_literal_global_127, 3, 0, &__block_literal_global_129);
  objc_msgSend(v3, "build");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

+ (id)na_identity
{
  _QWORD v3[5];

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __38__HFPowerStateControlItem_na_identity__block_invoke;
  v3[3] = &__block_descriptor_40_e5__8__0l;
  v3[4] = a1;
  __38__HFPowerStateControlItem_na_identity__block_invoke((uint64_t)v3);
  return (id)objc_claimAutoreleasedReturnValue();
}

id __38__HFPowerStateControlItem_na_identity__block_invoke(uint64_t a1)
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __38__HFPowerStateControlItem_na_identity__block_invoke_2;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = *(_QWORD *)(a1 + 32);
  if (qword_1F03ED260 != -1)
    dispatch_once(&qword_1F03ED260, block);
  return (id)qword_1F03ED268;
}

- (BOOL)supportsItemRepresentingServices:(id)a3
{
  _QWORD v4[5];

  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __60__HFPowerStateControlItem_supportsItemRepresentingServices___block_invoke;
  v4[3] = &unk_1EA7283A0;
  v4[4] = self;
  return objc_msgSend(a3, "na_any:", v4);
}

- (id)readValueAndPopulateStandardResults
{
  void *v2;
  void *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)HFPowerStateControlItem;
  -[HFControlItem readValueAndPopulateStandardResults](&v5, sel_readValueAndPopulateStandardResults);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "flatMap:", &__block_literal_global_105);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

BOOL __121__HFPowerStateControlItem_initWithValueSource_auxiliaryTargetValueTuples_additionalCharacteristicOptions_displayResults___block_invoke_2(uint64_t a1, uint64_t a2)
{
  void *v2;
  _BOOL8 v3;

  objc_msgSend(*(id *)(a1 + 32), "allCharacteristicsForCharacteristicType:", a2);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "count") != 0;

  return v3;
}

+ (Class)valueClass
{
  return (Class)objc_opt_class();
}

uint64_t __38__HFPowerStateControlItem_na_identity__block_invoke_5(uint64_t a1, void *a2)
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

- (HFPowerStateControlItem)initWithValueSource:(id)a3 displayResults:(id)a4
{
  void *v6;
  id v7;
  id v8;
  void *v9;
  HFPowerStateControlItem *v10;

  v6 = (void *)MEMORY[0x1E0C99E60];
  v7 = a4;
  v8 = a3;
  objc_msgSend(v6, "set");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = -[HFPowerStateControlItem initWithValueSource:auxiliaryTargetValueTuples:displayResults:](self, "initWithValueSource:auxiliaryTargetValueTuples:displayResults:", v8, v9, v7);

  return v10;
}

- (id)valueForCharacteristicValues:(id)a3
{
  id v3;
  void *v4;
  id v5;
  void *v6;
  id v7;
  _QWORD v9[4];
  id v10;

  v3 = a3;
  objc_msgSend((id)objc_opt_class(), "_powerStateTargetValues");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __56__HFPowerStateControlItem_valueForCharacteristicValues___block_invoke;
  v9[3] = &unk_1EA728378;
  v10 = v3;
  v5 = v3;
  if (objc_msgSend(v4, "na_any:", v9))
    v6 = &unk_1EA7CB848;
  else
    v6 = &unk_1EA7CB818;
  v7 = v6;

  return v7;
}

- (id)copyWithCharacteristicOptions:(id)a3 valueSource:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;

  v5 = a4;
  v6 = objc_alloc((Class)objc_opt_class());
  -[HFPowerStateControlItem auxiliaryTargetValueTuples](self, "auxiliaryTargetValueTuples");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[HFControlItem displayResults](self, "displayResults");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)objc_msgSend(v6, "initWithValueSource:auxiliaryTargetValueTuples:displayResults:", v5, v7, v8);

  objc_msgSend(v9, "copyLatestResultsFromItem:", self);
  return v9;
}

- (NSSet)auxiliaryTargetValueTuples
{
  return self->_auxiliaryTargetValueTuples;
}

- (HFPowerStateControlItem)initWithValueSource:(id)a3 auxiliaryTargetValueTuples:(id)a4 displayResults:(id)a5
{
  id v8;
  id v9;
  id v10;
  HFControlItemCharacteristicOptions *v11;
  HFPowerStateControlItem *v12;

  v8 = a5;
  v9 = a4;
  v10 = a3;
  v11 = objc_alloc_init(HFControlItemCharacteristicOptions);
  v12 = -[HFPowerStateControlItem initWithValueSource:auxiliaryTargetValueTuples:additionalCharacteristicOptions:displayResults:](self, "initWithValueSource:auxiliaryTargetValueTuples:additionalCharacteristicOptions:displayResults:", v10, v9, v11, v8);

  return v12;
}

- (HFPowerStateControlItem)initWithValueSource:(id)a3 auxiliaryTargetValueTuples:(id)a4 additionalCharacteristicOptions:(id)a5 displayResults:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  NSSet *v15;
  NSSet *allTargetValues;
  void *v17;
  id v18;
  void *v19;
  HFControlItemCharacteristicOptions *v20;
  void *v21;
  HFControlItemCharacteristicOptions *v22;
  void *v23;
  HFPowerStateControlItem *v24;
  objc_super v26;
  _QWORD v27[4];
  id v28;
  void *v29;
  _QWORD v30[2];

  v30[1] = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a4;
  v12 = a6;
  v13 = a5;
  objc_msgSend((id)objc_opt_class(), "_powerStateTargetValues");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setByAddingObjectsFromSet:", v11);
  v15 = (NSSet *)objc_claimAutoreleasedReturnValue();
  allTargetValues = self->_allTargetValues;
  self->_allTargetValues = v15;

  -[NSSet na_map:](self->_allTargetValues, "na_map:", &__block_literal_global_92);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v27[0] = MEMORY[0x1E0C809B0];
  v27[1] = 3221225472;
  v27[2] = __121__HFPowerStateControlItem_initWithValueSource_auxiliaryTargetValueTuples_additionalCharacteristicOptions_displayResults___block_invoke_2;
  v27[3] = &unk_1EA726EA8;
  v18 = v10;
  v28 = v18;
  objc_msgSend(v17, "na_filter:", v27);
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  v20 = [HFControlItemCharacteristicOptions alloc];
  v29 = &unk_1EA7CB830;
  v30[0] = v19;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v30, &v29, 1);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = -[HFControlItemCharacteristicOptions initWithCharacteristicTypesByUsage:](v20, "initWithCharacteristicTypesByUsage:", v21);

  -[HFControlItemCharacteristicOptions optionsByAddingCharacteristicOptions:](v22, "optionsByAddingCharacteristicOptions:", v13);
  v23 = (void *)objc_claimAutoreleasedReturnValue();

  v26.receiver = self;
  v26.super_class = (Class)HFPowerStateControlItem;
  v24 = -[HFPrimaryStateControlItem initWithValueSource:characteristicOptions:displayResults:](&v26, sel_initWithValueSource_characteristicOptions_displayResults_, v18, v23, v12);

  if (v24)
    objc_storeStrong((id *)&v24->_auxiliaryTargetValueTuples, a4);

  return v24;
}

+ (id)_powerStateTargetValues
{
  if (qword_1F03ED250 != -1)
    dispatch_once(&qword_1F03ED250, &__block_literal_global_119);
  return (id)qword_1F03ED258;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_allTargetValues, 0);
  objc_storeStrong((id *)&self->_auxiliaryTargetValueTuples, 0);
}

- (BOOL)canCopyWithCharacteristicOptions:(id)a3
{
  return 1;
}

uint64_t __60__HFPowerStateControlItem_supportsItemRepresentingServices___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t i;
  void *v7;
  void *v8;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v2 = a2;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  objc_msgSend((id)objc_opt_class(), "_powerStateTargetValues", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v4)
  {
    v5 = *(_QWORD *)v11;
    while (2)
    {
      for (i = 0; i != v4; ++i)
      {
        if (*(_QWORD *)v11 != v5)
          objc_enumerationMutation(v3);
        objc_msgSend(*(id *)(*((_QWORD *)&v10 + 1) + 8 * i), "characteristicType");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v2, "hf_characteristicOfType:", v7);
        v8 = (void *)objc_claimAutoreleasedReturnValue();

        if (v8)
        {
          v4 = 1;
          goto LABEL_11;
        }
      }
      v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
      if (v4)
        continue;
      break;
    }
  }
LABEL_11:

  return v4;
}

BOOL __56__HFPowerStateControlItem_valueForCharacteristicValues___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  uint64_t v9;

  v3 = a2;
  objc_opt_class();
  v4 = *(void **)(a1 + 32);
  objc_msgSend(v3, "characteristicType");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v7 = v6;
  else
    v7 = 0;
  v8 = v7;

  v9 = objc_msgSend(v3, "primaryStateForTargetValue:", v8);
  return v9 == 2;
}

id __62__HFPowerStateControlItem_readValueAndPopulateStandardResults__block_invoke(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;

  v2 = a2;
  objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("suspendedState"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "unsignedIntegerValue");

  objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("value"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {

LABEL_5:
    objc_msgSend(MEMORY[0x1E0D519C0], "futureWithResult:", v2);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_6;
  }
  if (!objc_msgSend(MEMORY[0x1E0CBA1A8], "hf_isSuspendedStateSupported:", v4))
    goto LABEL_5;
  v6 = (void *)objc_msgSend(v2, "mutableCopy");
  objc_msgSend(v6, "setObject:forKeyedSubscript:", &unk_1EA7CB818, CFSTR("value"));
  objc_msgSend(MEMORY[0x1E0D519C0], "futureWithResult:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_6:
  return v7;
}

void __50__HFPowerStateControlItem__powerStateTargetValues__block_invoke_2()
{
  void *v0;
  HFPowerStateTargetValueTuple *v1;
  HFPowerStateTargetValueTuple *v2;
  HFPowerStateTargetValueTuple *v3;
  uint64_t v4;
  void *v5;
  HFPowerStateTargetValueTuple *v6;

  v0 = (void *)MEMORY[0x1E0C99E60];
  v1 = [HFPowerStateTargetValueTuple alloc];
  v6 = -[HFPowerStateTargetValueTuple initWithCharacteristicType:onTargetValue:offTargetValue:](v1, "initWithCharacteristicType:onTargetValue:offTargetValue:", *MEMORY[0x1E0CB89C8], &unk_1EA7CB860, &unk_1EA7CB878);
  v2 = [HFPowerStateTargetValueTuple alloc];
  v3 = -[HFPowerStateTargetValueTuple initWithCharacteristicType:onTargetValue:offTargetValue:](v2, "initWithCharacteristicType:onTargetValue:offTargetValue:", *MEMORY[0x1E0CB8790], &unk_1EA7CB860, &unk_1EA7CB878);
  objc_msgSend(v0, "setWithObjects:", v6, v3, 0);
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = (void *)qword_1F03ED258;
  qword_1F03ED258 = v4;

}

- (HFPowerStateControlItem)initWithValueSource:(id)a3 characteristicTypes:(id)a4 displayResults:(id)a5
{
  void *v7;
  void *v8;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler", a3, a4, a5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_initWithValueSource_displayResults_);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HFPowerStateControlItem.m"), 123, CFSTR("%s is unavailable; use %@ instead"),
    "-[HFPowerStateControlItem initWithValueSource:characteristicTypes:displayResults:]",
    v8);

  return 0;
}

- (id)writePrimaryState:(int64_t)a3
{
  void *v4;
  void *v5;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[HFPrimaryStateControlItem writeValue:](self, "writeValue:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)toggleValue
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  _QWORD v11[5];

  +[HFHomeKitDispatcher sharedDispatcher](HFHomeKitDispatcher, "sharedDispatcher");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "homeManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "hasOptedToHH2");
  v5 = (void *)objc_opt_new();

  -[HFControlItem valueSource](self, "valueSource");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "beginTransactionWithReason:readPolicy:logger:", CFSTR("HFPowerStateControlItem-Toggle"), v5, 0);

  -[HFPowerStateControlItem readValueAndPopulateStandardResults](self, "readValueAndPopulateStandardResults");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __38__HFPowerStateControlItem_toggleValue__block_invoke;
  v11[3] = &unk_1EA728350;
  v11[4] = self;
  objc_msgSend(v7, "flatMap:", v11);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  -[HFControlItem valueSource](self, "valueSource");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "commitTransactionWithReason:", CFSTR("HFPowerStateControlItem-Toggle"));

  return v8;
}

id __38__HFPowerStateControlItem_toggleValue__block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;

  objc_msgSend(a2, "objectForKeyedSubscript:", CFSTR("value"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    v5 = objc_msgSend(v3, "integerValue");
    if (v5 == 2)
      v6 = 1;
    else
      v6 = 2 * (v5 == 1);
    objc_msgSend(*(id *)(a1 + 32), "writePrimaryState:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v8 = (void *)MEMORY[0x1E0D519C0];
    objc_msgSend(MEMORY[0x1E0CB35C8], "hf_errorWithCode:", 35);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "futureWithError:", v9);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v7;
}

- (id)characteristicValuesForValue:(id)a3
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  id v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  v6 = v4;
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v7 = v6;
  else
    v7 = 0;
  v8 = v7;

  v9 = objc_msgSend(v8, "integerValue");
  v22 = 0u;
  v23 = 0u;
  v20 = 0u;
  v21 = 0u;
  -[HFPowerStateControlItem allTargetValues](self, "allTargetValues", 0);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
  if (v11)
  {
    v12 = v11;
    v13 = *(_QWORD *)v21;
    do
    {
      for (i = 0; i != v12; ++i)
      {
        if (*(_QWORD *)v21 != v13)
          objc_enumerationMutation(v10);
        v15 = *(void **)(*((_QWORD *)&v20 + 1) + 8 * i);
        objc_msgSend(v15, "targetValueForPrimaryState:", v9);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        if (v16)
        {
          objc_msgSend(v15, "characteristicType");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v5, "setObject:forKeyedSubscript:", v16, v17);

        }
      }
      v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
    }
    while (v12);
  }

  -[HFControlItem normalizedCharacteristicValuesForValues:](self, "normalizedCharacteristicValuesForValues:", v5);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  return v18;
}

- (NSSet)allTargetValues
{
  return (NSSet *)objc_getProperty(self, a2, 104, 1);
}

@end
