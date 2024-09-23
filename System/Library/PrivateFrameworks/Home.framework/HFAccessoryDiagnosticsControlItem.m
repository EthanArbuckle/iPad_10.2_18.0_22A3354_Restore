@implementation HFAccessoryDiagnosticsControlItem

- (HFAccessoryDiagnosticsControlItem)initWithValueSource:(id)a3 displayResults:(id)a4
{
  uint64_t v6;
  uint64_t v7;
  void *v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  HFControlItemCharacteristicOptions *v13;
  void *v14;
  HFControlItemCharacteristicOptions *v15;
  HFAccessoryDiagnosticsControlItem *v16;
  objc_super v18;
  _QWORD v19[2];
  _QWORD v20[3];

  v20[2] = *MEMORY[0x1E0C80C00];
  v6 = *MEMORY[0x1E0CB8A80];
  v7 = *MEMORY[0x1E0CB8A18];
  v8 = (void *)MEMORY[0x1E0C99E60];
  v9 = a4;
  v10 = a3;
  objc_msgSend(v8, "setWithObject:", v6);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", v7);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = [HFControlItemCharacteristicOptions alloc];
  v19[0] = &unk_1EA7CBBC0;
  v19[1] = &unk_1EA7CBBD8;
  v20[0] = v12;
  v20[1] = v11;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v20, v19, 2);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = -[HFControlItemCharacteristicOptions initWithCharacteristicTypesByUsage:](v13, "initWithCharacteristicTypesByUsage:", v14);

  v18.receiver = self;
  v18.super_class = (Class)HFAccessoryDiagnosticsControlItem;
  v16 = -[HFControlItem initWithValueSource:characteristicOptions:displayResults:](&v18, sel_initWithValueSource_characteristicOptions_displayResults_, v10, v15, v9);

  return v16;
}

- (id)copyWithCharacteristicOptions:(id)a3 valueSource:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;

  v6 = a4;
  if (-[HFControlItem canCopyWithCharacteristicOptions:](self, "canCopyWithCharacteristicOptions:", a3))
  {
    v7 = objc_alloc((Class)objc_opt_class());
    -[HFControlItem displayResults](self, "displayResults");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = (void *)objc_msgSend(v7, "initWithValueSource:displayResults:", v6, v8);

    objc_msgSend(v9, "copyLatestResultsFromItem:", self);
  }
  else
  {
    v9 = 0;
  }

  return v9;
}

+ (Class)valueClass
{
  return (Class)objc_opt_class();
}

- (id)valueForCharacteristicValues:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  v4 = a3;
  -[HFItem latestResults](self, "latestResults");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("characteristicValuesByType"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (!v6)
    v6 = (void *)MEMORY[0x1E0C9AA70];
  v8 = (void *)objc_msgSend(v6, "mutableCopy");

  objc_msgSend(v8, "addEntriesFromDictionary:", v4);
  objc_msgSend(v4, "objectForKeyedSubscript:", *MEMORY[0x1E0CB8A18]);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (id)characteristicValuesForValue:(id)a3
{
  id v4;
  uint64_t v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v14;
  _QWORD v15[2];

  v15[1] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = objc_opt_class();
  v6 = v4;
  if (!v6)
    goto LABEL_7;
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v7 = v6;
  else
    v7 = 0;
  v8 = v6;
  if (!v7)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "id  _Nullable NAAssertCast(Class  _Nonnull __unsafe_unretained, id  _Nonnull __strong)");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "handleFailureInFunction:file:lineNumber:description:", v10, CFSTR("NSObject+NAAdditions.h"), 54, CFSTR("Expected class of %@ but was %@"), v5, objc_opt_class());

LABEL_7:
    v8 = 0;
  }

  v14 = *MEMORY[0x1E0CB8A18];
  v15[0] = v8;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v15, &v14, 1);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[HFControlItem normalizedCharacteristicValuesForValues:](self, "normalizedCharacteristicValuesForValues:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

- (id)resultsForBatchReadResponse:(id)a3
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)HFAccessoryDiagnosticsControlItem;
  -[HFControlItem resultsForBatchReadResponse:](&v8, sel_resultsForBatchReadResponse_, a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(v3, "mutableCopy");

  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("characteristicValuesByType"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", *MEMORY[0x1E0CB8A80]);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
    objc_msgSend(v4, "setObject:forKeyedSubscript:", v6, CFSTR("secondaryValue"));

  return v4;
}

@end
