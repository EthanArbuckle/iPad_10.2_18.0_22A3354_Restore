@implementation HFAssociatedServiceTypeFactory

+ (id)associatedServiceTypesSetFor:(id)a3
{
  uint64_t v3;
  id v4;
  void *v5;

  v3 = qword_1ED378DA0;
  v4 = a3;
  if (v3 != -1)
    dispatch_once(&qword_1ED378DA0, &__block_literal_global_23);
  objc_msgSend((id)_MergedGlobals_220, "objectForKeyedSubscript:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

void __63__HFAssociatedServiceTypeFactory_associatedServiceTypesSetFor___block_invoke()
{
  void *v0;
  uint64_t v1;
  void *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  _QWORD v14[3];
  _QWORD v15[3];
  _QWORD v16[4];
  _QWORD v17[3];

  v17[2] = *MEMORY[0x1E0C80C00];
  v0 = (void *)MEMORY[0x1E0C99E60];
  v1 = *MEMORY[0x1E0CB9A10];
  v17[0] = *MEMORY[0x1E0CB9A70];
  v17[1] = v1;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v17, 2);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "setWithArray:", v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  v4 = (void *)MEMORY[0x1E0C99E60];
  v5 = *MEMORY[0x1E0CB9B28];
  v16[0] = *MEMORY[0x1E0CB9A00];
  v16[1] = v5;
  v6 = *MEMORY[0x1E0CB9A28];
  v16[2] = *MEMORY[0x1E0CB9B30];
  v16[3] = v6;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v16, 4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setWithArray:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v14[0] = *MEMORY[0x1E0CB9AA0];
  objc_msgSend(v3, "setByAddingObject:");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v15[0] = v9;
  v14[1] = *MEMORY[0x1E0CB9AD8];
  objc_msgSend(v3, "setByAddingObject:");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v15[1] = v10;
  v14[2] = *MEMORY[0x1E0CB99F0];
  objc_msgSend(v8, "setByAddingObject:");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v15[2] = v11;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v15, v14, 3);
  v12 = objc_claimAutoreleasedReturnValue();
  v13 = (void *)_MergedGlobals_220;
  _MergedGlobals_220 = v12;

}

+ (id)associatedServiceTypesArrayFor:(id)a3
{
  void *v3;
  void *v4;
  void *v5;

  objc_msgSend(a1, "associatedServiceTypesSetFor:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "allObjects");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "sortedArrayUsingComparator:", &__block_literal_global_4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

uint64_t __65__HFAssociatedServiceTypeFactory_associatedServiceTypesArrayFor___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  void *v4;
  id v5;
  void *v6;
  void *v7;
  uint64_t v8;

  v4 = (void *)MEMORY[0x1E0CBA7E0];
  v5 = a3;
  objc_msgSend(v4, "hf_userFriendlyLocalizedCapitalizedDescription:", a2);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CBA7E0], "hf_userFriendlyLocalizedCapitalizedDescription:", v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = objc_msgSend(v6, "localizedStandardCompare:", v7);
  return v8;
}

@end
