@implementation CNUnifiedContacts

void __95__CNUnifiedContacts_unifySingleValuesProperties_ofContacts_intoContact_availableKeyDescriptor___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  v3 = *(void **)(a1 + 32);
  objc_msgSend(a2, "key");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKeyedSubscript:", v4);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v5 = v9;
  if (v9)
  {
    objc_msgSend(*(id *)(a1 + 56), "firstNonNilValueForProperty:inContacts:", v9, *(_QWORD *)(a1 + 40));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (v6)
    {
      v7 = *(void **)(a1 + 48);
      objc_msgSend(v9, "key");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "setValue:forKey:", v6, v8);

    }
    v5 = v9;
  }

}

+ (id)firstNonNilValueForProperty:(id)a3 inContacts:(id)a4
{
  id v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  int v13;
  uint64_t v14;
  void *v15;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v6 = a4;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v18;
    while (2)
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v18 != v9)
          objc_enumerationMutation(v6);
        v11 = *(void **)(*((_QWORD *)&v17 + 1) + 8 * v10);
        objc_msgSend(v5, "key", (_QWORD)v17);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = objc_msgSend(v11, "isKeyAvailable:", v12);

        if (v13)
        {
          objc_msgSend(v5, "CNValueForContact:", v11);
          v14 = objc_claimAutoreleasedReturnValue();
          if (v14)
          {
            v15 = (void *)v14;
            goto LABEL_12;
          }
        }
        ++v10;
      }
      while (v8 != v10);
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
      if (v8)
        continue;
      break;
    }
  }
  v15 = 0;
LABEL_12:

  return v15;
}

uint64_t __96__CNUnifiedContacts_indexesOfLabeledValuesUnifiableWithLabelValuePair_inMultiValue_forProperty___block_invoke(uint64_t a1, void *a2)
{
  return canUnifyLabeledValuePairs(*(void **)(a1 + 32), a2, *(void **)(a1 + 40));
}

void __64__CNUnifiedContacts_unifyMultiValue_intoMultiValue_forProperty___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  void *v5;
  int v6;
  void *v7;
  int v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  int v13;
  void *v14;
  uint64_t v15;
  id v16;
  uint64_t v17;
  void *v18;
  void *v19;
  id v20;
  _QWORD v21[4];
  id v22;
  id v23;
  _QWORD v24[4];
  id v25;

  v20 = a2;
  objc_msgSend(v20, "labelValuePair");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(*(id *)(a1 + 56), "shouldIncludeLabeledValue:fromSource:inDestination:forProperty:", v5, *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
  v7 = v20;
  if (v6)
  {
    v8 = objc_msgSend(*(id *)(a1 + 56), "shouldLabeledValue:replaceInferiorValueInMultiValue:forProperty:", v5, *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
    v10 = *(_QWORD *)(a1 + 32);
    v9 = *(_QWORD *)(a1 + 40);
    v12 = *(_QWORD *)(a1 + 48);
    v11 = *(void **)(a1 + 56);
    if (v8)
    {
      objc_msgSend(v11, "replaceInferiorValueInMultiValue:withEntryAtIndex:fromMultiValue:forProperty:", v9, a3, v10, v12);
      goto LABEL_10;
    }
    v13 = objc_msgSend(v11, "doesMultiValue:needLabeledValue:fromMultiValue:forProperty:", v9, v5, v10, v12);
    v7 = v20;
    if (v13)
    {
      objc_msgSend(*(id *)(a1 + 40), "addObject:", v20);
      goto LABEL_10;
    }
  }
  v14 = *(void **)(a1 + 40);
  v15 = MEMORY[0x1E0C809B0];
  v24[0] = MEMORY[0x1E0C809B0];
  v24[1] = 3221225472;
  v24[2] = __64__CNUnifiedContacts_unifyMultiValue_intoMultiValue_forProperty___block_invoke_2;
  v24[3] = &unk_1E29F9058;
  v16 = v7;
  v25 = v16;
  v17 = objc_msgSend(v14, "indexOfObjectPassingTest:", v24);
  if (v17 != 0x7FFFFFFFFFFFFFFFLL)
    goto LABEL_8;
  v18 = *(void **)(a1 + 40);
  v21[0] = v15;
  v21[1] = 3221225472;
  v21[2] = __64__CNUnifiedContacts_unifyMultiValue_intoMultiValue_forProperty___block_invoke_3;
  v21[3] = &unk_1E29F9080;
  v22 = v16;
  v23 = *(id *)(a1 + 48);
  v17 = objc_msgSend(v18, "indexOfObjectPassingTest:", v21);

  if (v17 != 0x7FFFFFFFFFFFFFFFLL)
  {
LABEL_8:
    objc_msgSend(*(id *)(a1 + 40), "objectAtIndex:", v17);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 56), "addLinkedLabeledValue:toLabeledValue:forProperty:", v16, v19, *(_QWORD *)(a1 + 48));

  }
LABEL_10:

}

+ (BOOL)shouldLabeledValue:(id)a3 replaceInferiorValueInMultiValue:(id)a4 forProperty:(id)a5
{
  void *v5;
  BOOL v6;

  objc_msgSend(a1, "indexesOfValuesInferiorTo:inMultiValue:forProperty:", a3, a4, a5);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "count") != 0;

  return v6;
}

+ (id)indexesOfValuesInferiorTo:(id)a3 inMultiValue:(id)a4 forProperty:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  id v12;
  id v13;
  id v14;
  void *v15;
  _QWORD v17[4];
  id v18;
  id v19;
  id v20;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  objc_msgSend(a1, "indexesOfLabeledValuesUnifiableWithLabelValuePair:inMultiValue:forProperty:", v8, v9, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v17[0] = MEMORY[0x1E0C809B0];
  v17[1] = 3221225472;
  v17[2] = __72__CNUnifiedContacts_indexesOfValuesInferiorTo_inMultiValue_forProperty___block_invoke;
  v17[3] = &unk_1E29F90D0;
  v18 = v9;
  v19 = v10;
  v20 = v8;
  v12 = v8;
  v13 = v10;
  v14 = v9;
  objc_msgSend(v11, "indexesPassingTest:", v17);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  return v15;
}

+ (BOOL)doesMultiValue:(id)a3 needLabeledValue:(id)a4 fromMultiValue:(id)a5 forProperty:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  void *v15;
  unint64_t v16;
  unint64_t v17;

  v10 = a6;
  v11 = a5;
  v12 = a4;
  v13 = a3;
  objc_msgSend(v12, "value");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "label");
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  v16 = objc_msgSend(a1, "countOfLabelsUnifiableWithLabel:valuesUnifiableWithValue:inMultiValue:forProperty:", v15, v14, v11, v10);
  v17 = objc_msgSend(a1, "countOfLabelsUnifiableWithLabel:valuesUnifiableWithValue:inMultiValue:forProperty:", v15, v14, v13, v10);

  return v17 < v16;
}

+ (unint64_t)countOfLabelsUnifiableWithLabel:(id)a3 valuesUnifiableWithValue:(id)a4 inMultiValue:(id)a5 forProperty:(id)a6
{
  id v10;
  id v11;
  void *v12;
  void *v13;
  unint64_t v14;

  v10 = a6;
  v11 = a5;
  +[CNLabelValuePair labeledValueWithLabel:value:](CNLabelValuePair, "labeledValueWithLabel:value:", a3, a4);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "indexesOfLabeledValuesUnifiableWithLabelValuePair:inMultiValue:forProperty:", v12, v11, v10);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  v14 = objc_msgSend(v13, "count");
  return v14;
}

+ (id)indexesOfLabeledValuesUnifiableWithLabelValuePair:(id)a3 inMultiValue:(id)a4 forProperty:(id)a5
{
  id v7;
  id v8;
  id v9;
  id v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v16;
  uint64_t v17;
  uint64_t (*v18)(uint64_t, void *);
  void *v19;
  id v20;
  id v21;

  v7 = a3;
  v8 = a5;
  v16 = MEMORY[0x1E0C809B0];
  v17 = 3221225472;
  v18 = __96__CNUnifiedContacts_indexesOfLabeledValuesUnifiableWithLabelValuePair_inMultiValue_forProperty___block_invoke;
  v19 = &unk_1E29F8F68;
  v20 = v7;
  v21 = v8;
  v9 = v8;
  v10 = v7;
  v11 = a4;
  objc_msgSend(v11, "_cn_filter:", &v16);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E60], "setWithArray:", v12, v16, v17, v18, v19);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "_cn_indicesForObjects:", v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  return v14;
}

+ (void)addLinkedLabeledValue:(id)a3 toLabeledValue:(id)a4 forProperty:(id)a5
{
  id v7;
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  NSObject *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  v9 = a5;
  if (v7 != v8)
  {
    objc_msgSend(v8, "linkedIdentifiers");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = (void *)objc_msgSend(v10, "mutableCopy");

    if (!v11)
    {
      objc_msgSend(MEMORY[0x1E0C99E20], "set");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(v7, "identifier");
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    if (v12)
    {
      objc_msgSend(v7, "identifier");
      v13 = objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "addObject:", v13);
    }
    else
    {
      v13 = os_log_create("com.apple.contacts", "91450879");
      if (os_log_type_enabled(v13, OS_LOG_TYPE_FAULT))
        +[CNUnifiedContacts addLinkedLabeledValue:toLabeledValue:forProperty:].cold.1((uint64_t)v7, (uint64_t)v9, v13);
    }

    v21 = 0u;
    v22 = 0u;
    v19 = 0u;
    v20 = 0u;
    objc_msgSend(v7, "linkedIdentifiers", 0);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
    if (v15)
    {
      v16 = v15;
      v17 = *(_QWORD *)v20;
      do
      {
        v18 = 0;
        do
        {
          if (*(_QWORD *)v20 != v17)
            objc_enumerationMutation(v14);
          objc_msgSend(v11, "addObject:", *(_QWORD *)(*((_QWORD *)&v19 + 1) + 8 * v18++));
        }
        while (v16 != v18);
        v16 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
      }
      while (v16);
    }

    objc_msgSend(v7, "setLinkedIdentifiers:", 0);
    objc_msgSend(v8, "setLinkedIdentifiers:", v11);

  }
}

+ (BOOL)shouldIncludeLabeledValue:(id)a3 fromSource:(id)a4 inDestination:(id)a5 forProperty:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  void *v15;
  unint64_t v16;
  unint64_t v17;

  v10 = a6;
  v11 = a5;
  v12 = a4;
  v13 = a3;
  objc_msgSend(v13, "value");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "label");
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  v16 = +[CNUnifiedContacts countOfLabel:value:inMultiValue:forProperty:]((uint64_t)a1, v15, v14, v12, v10);
  v17 = objc_msgSend(a1, "countOfLabelIncludingEquivalents:value:inMultiValue:forProperty:", v15, v14, v11, v10);

  return v17 < v16;
}

void __65__CNUnifiedContacts_countOfLabel_value_inMultiValue_forProperty___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3;
  void *v4;
  uint64_t v5;
  void *v6;
  int v7;
  int v8;
  _QWORD *v9;

  v9 = a2;
  v3 = v9[1];
  v4 = *(void **)(v3 + 8);
  v5 = *(_QWORD *)(v3 + 16);
  v6 = *(void **)(a1 + 32);
  if (v4 == v6
    || (objc_msgSend(v6, "isEqualToString:", &stru_1E29FF900) & 1) != 0
    || (objc_msgSend(v4, "isEqualToString:", &stru_1E29FF900) & 1) != 0)
  {
    v7 = 0;
  }
  else
  {
    v7 = objc_msgSend(v4, "isEqual:", *(_QWORD *)(a1 + 32)) ^ 1;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    v8 = objc_msgSend(*(id *)(a1 + 40), "isLikePhoneNumberForSamePerson:", v5);
  else
    v8 = objc_msgSend(MEMORY[0x1E0D13A40], "isObject:equalToOther:", *(_QWORD *)(a1 + 40), v5);
  if (((v7 | v8 ^ 1) & 1) == 0)
    ++*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24);

}

+ (unint64_t)countOfLabelIncludingEquivalents:(id)a3 value:(id)a4 inMultiValue:(id)a5 forProperty:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  unint64_t v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _BYTE v25[128];
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  v14 = +[CNUnifiedContacts countOfLabel:value:inMultiValue:forProperty:]((uint64_t)a1, v10, v11, v12, v13);
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  objc_msgSend(v13, "unifiableLabelsForLabel:", v10, 0);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
  if (v16)
  {
    v17 = v16;
    v18 = *(_QWORD *)v22;
    do
    {
      v19 = 0;
      do
      {
        if (*(_QWORD *)v22 != v18)
          objc_enumerationMutation(v15);
        v14 += +[CNUnifiedContacts countOfLabel:value:inMultiValue:forProperty:]((uint64_t)a1, *(void **)(*((_QWORD *)&v21 + 1) + 8 * v19++), v11, v12, v13);
      }
      while (v17 != v19);
      v17 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
    }
    while (v17);
  }

  return v14;
}

+ (uint64_t)countOfLabel:(void *)a3 value:(void *)a4 inMultiValue:(void *)a5 forProperty:
{
  id v8;
  id v9;
  id v10;
  id v11;
  id v12;
  id v13;
  uint64_t v14;
  _QWORD v16[4];
  id v17;
  id v18;
  uint64_t *v19;
  uint64_t v20;
  uint64_t *v21;
  uint64_t v22;
  uint64_t v23;

  v8 = a2;
  v9 = a3;
  v10 = a4;
  v11 = a5;
  objc_opt_self();
  v20 = 0;
  v21 = &v20;
  v22 = 0x2020000000;
  v23 = 0;
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __65__CNUnifiedContacts_countOfLabel_value_inMultiValue_forProperty___block_invoke;
  v16[3] = &unk_1E29F9120;
  v12 = v8;
  v17 = v12;
  v13 = v9;
  v18 = v13;
  v19 = &v20;
  objc_msgSend(v10, "enumerateObjectsUsingBlock:", v16);
  v14 = v21[3];

  _Block_object_dispose(&v20, 8);
  return v14;
}

uint64_t __64__CNUnifiedContacts_unifyMultiValue_intoMultiValue_forProperty___block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "isEqualIgnoringIdentifiers:", *(_QWORD *)(a1 + 32));
}

uint64_t __58__CNUnifiedContacts_makeNonNameSingleValuePropertiesByKey__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "key");
}

+ (id)unifyMultivalues:(void *)a3 forProperty:(void *)a4 options:
{
  id v6;
  id v7;
  id v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  void *v14;
  int v15;
  void *v16;
  id v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  _QWORD aBlock[5];
  _BYTE v28[128];
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v6 = a2;
  v7 = a3;
  v8 = a4;
  v9 = (void *)objc_opt_self();
  objc_msgSend(v6, "_cn_filter:", *MEMORY[0x1E0D13800]);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v10, "count"))
  {
    v12 = (void *)MEMORY[0x1E0C9AA60];
    goto LABEL_17;
  }
  if (objc_msgSend(v10, "count") == 1)
  {
    objc_msgSend(v10, "firstObject");
    v11 = objc_claimAutoreleasedReturnValue();
LABEL_4:
    v12 = (void *)v11;
    goto LABEL_17;
  }
  v13 = objc_msgSend(v8, "labeledValueUnificationThreshold");
  if (v13 != 0x7FFFFFFFFFFFFFFFLL)
  {
    aBlock[0] = MEMORY[0x1E0C809B0];
    aBlock[1] = 3221225472;
    aBlock[2] = __58__CNUnifiedContacts_unifyMultivalues_forProperty_options___block_invoke;
    aBlock[3] = &__block_descriptor_40_e17_B16__0__NSArray_8l;
    aBlock[4] = v13;
    v14 = _Block_copy(aBlock);
    v15 = objc_msgSend(v10, "_cn_any:", v14);

    if (v15)
    {
      objc_msgSend(v10, "_cn_flatten");
      v11 = objc_claimAutoreleasedReturnValue();
      goto LABEL_4;
    }
  }
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = 0u;
  v24 = 0u;
  v25 = 0u;
  v26 = 0u;
  v17 = v10;
  v18 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v23, v28, 16);
  if (v18)
  {
    v19 = v18;
    v20 = *(_QWORD *)v24;
    do
    {
      v21 = 0;
      do
      {
        if (*(_QWORD *)v24 != v20)
          objc_enumerationMutation(v17);
        objc_msgSend(v9, "unifyMultiValue:intoMultiValue:forProperty:", *(_QWORD *)(*((_QWORD *)&v23 + 1) + 8 * v21++), v16, v7, (_QWORD)v23);
      }
      while (v19 != v21);
      v19 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v23, v28, 16);
    }
    while (v19);
  }

  v12 = (void *)objc_msgSend(v16, "copy");
LABEL_17:

  return v12;
}

+ (void)unifyMultiValue:(id)a3 intoMultiValue:(id)a4 forProperty:(id)a5
{
  id v8;
  id v9;
  id v10;
  id v11;
  id v12;
  id v13;
  _QWORD v14[4];
  id v15;
  id v16;
  id v17;
  id v18;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __64__CNUnifiedContacts_unifyMultiValue_intoMultiValue_forProperty___block_invoke;
  v14[3] = &unk_1E29F90A8;
  v15 = v8;
  v16 = v9;
  v17 = v10;
  v18 = a1;
  v11 = v10;
  v12 = v9;
  v13 = v8;
  objc_msgSend(v13, "enumerateObjectsUsingBlock:", v14);

}

uint64_t __72__CNUnifiedContacts_indexesOfValuesInferiorTo_inMultiValue_forProperty___block_invoke(uint64_t a1, uint64_t a2)
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;

  objc_msgSend(*(id *)(a1 + 32), "objectAtIndex:", a2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "value");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v5 = *(void **)(a1 + 40);
  objc_msgSend(*(id *)(a1 + 48), "value");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v5, "isValue:preferredToUnifiedValue:", v6, v4);

  return v7;
}

uint64_t __64__CNUnifiedContacts_unifyMultiValue_intoMultiValue_forProperty___block_invoke_3(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  uint64_t v5;

  objc_msgSend(a2, "labelValuePair");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "labelValuePair");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = canUnifyLabeledValuePairs(v3, v4, *(void **)(a1 + 40));

  return v5;
}

void __54__CNUnifiedContacts_nonNameSingleValuePropertiesByKey__block_invoke(uint64_t a1)
{
  uint64_t v1;
  void *v2;
  id v3;

  objc_msgSend(*(id *)(a1 + 32), "makeNonNameSingleValuePropertiesByKey");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  v1 = objc_msgSend(v3, "copy");
  v2 = (void *)nonNameSingleValuePropertiesByKey_cn_once_object_4;
  nonNameSingleValuePropertiesByKey_cn_once_object_4 = v1;

}

uint64_t __53__CNUnifiedContacts_indexOfPreferredContactForImage___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  uint64_t v3;

  v2 = a2;
  if (objc_msgSend(v2, "isKeyAvailable:", CFSTR("preferredForImage")))
    v3 = objc_msgSend(v2, "isPreferredForImage");
  else
    v3 = 0;

  return v3;
}

uint64_t __50__CNUnifiedContacts_wallpaperValuePropertiesByKey__block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "key");
}

void __50__CNUnifiedContacts_wallpaperValuePropertiesByKey__block_invoke()
{
  void *v0;
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  _QWORD v7[4];

  v7[3] = *MEMORY[0x1E0C80C00];
  +[CN wallpaperDescription](CN, "wallpaperDescription");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  +[CN wallpaperMetadataDescription](CN, "wallpaperMetadataDescription", v0);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v7[1] = v1;
  +[CN watchWallpaperImageDataDescription](CN, "watchWallpaperImageDataDescription");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v7[2] = v2;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v7, 3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "_cn_indexBy:", &__block_literal_global_42);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "copy");
  v6 = (void *)wallpaperValuePropertiesByKey_cn_once_object_1;
  wallpaperValuePropertiesByKey_cn_once_object_1 = v5;

}

void __47__CNUnifiedContacts_wallpaperValuePropertyKeys__block_invoke(uint64_t a1)
{
  void *v1;
  uint64_t v2;
  void *v3;
  id v4;

  objc_msgSend(*(id *)(a1 + 32), "wallpaperValuePropertiesByKey");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "allKeys");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  +[CNContactKeyVector keyVectorWithKeys:](CNContactKeyVector, "keyVectorWithKeys:", v1);
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = (void *)wallpaperValuePropertyKeys_cn_once_object_3;
  wallpaperValuePropertyKeys_cn_once_object_3 = v2;

}

uint64_t __46__CNUnifiedContacts_imageValuePropertiesByKey__block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "key");
}

void __46__CNUnifiedContacts_imageValuePropertiesByKey__block_invoke()
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
  _QWORD v12[9];

  v12[8] = *MEMORY[0x1E0C80C00];
  +[CN imageDataDescription](CN, "imageDataDescription");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = v0;
  +[CN cropRectDescription](CN, "cropRectDescription");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v12[1] = v1;
  +[CN thumbnailImageDataDescription](CN, "thumbnailImageDataDescription");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v12[2] = v2;
  +[CN preferredLikenessSourceDescription](CN, "preferredLikenessSourceDescription");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v12[3] = v3;
  +[CN preferredApplePersonaIdentifierDescription](CN, "preferredApplePersonaIdentifierDescription");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v12[4] = v4;
  +[CN isUsingSharedPhotoDescription](CN, "isUsingSharedPhotoDescription");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v12[5] = v5;
  +[CN fullscreenImageDataDescription](CN, "fullscreenImageDataDescription");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v12[6] = v6;
  +[CN syncImageDataDescription](CN, "syncImageDataDescription");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v12[7] = v7;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v12, 8);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "_cn_indexBy:", &__block_literal_global_40_0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "copy");
  v11 = (void *)imageValuePropertiesByKey_cn_once_object_0;
  imageValuePropertiesByKey_cn_once_object_0 = v10;

}

void __43__CNUnifiedContacts_imageValuePropertyKeys__block_invoke(uint64_t a1)
{
  void *v1;
  uint64_t v2;
  void *v3;
  id v4;

  objc_msgSend(*(id *)(a1 + 32), "imageValuePropertiesByKey");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "allKeys");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  +[CNContactKeyVector keyVectorWithKeys:](CNContactKeyVector, "keyVectorWithKeys:", v1);
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = (void *)imageValuePropertyKeys_cn_once_object_2;
  imageValuePropertyKeys_cn_once_object_2 = v2;

}

+ (id)wallpaperValuePropertyKeys
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __47__CNUnifiedContacts_wallpaperValuePropertyKeys__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (wallpaperValuePropertyKeys_cn_once_token_3 != -1)
    dispatch_once(&wallpaperValuePropertyKeys_cn_once_token_3, block);
  return (id)wallpaperValuePropertyKeys_cn_once_object_3;
}

+ (id)wallpaperValuePropertiesByKey
{
  if (wallpaperValuePropertiesByKey_cn_once_token_1 != -1)
    dispatch_once(&wallpaperValuePropertiesByKey_cn_once_token_1, &__block_literal_global_41);
  return (id)wallpaperValuePropertiesByKey_cn_once_object_1;
}

+ (void)unifyWallpaperOfContacts:(id)a3 intoContact:(id)a4 availableKeyDescriptor:(id)a5
{
  id v8;
  id v9;
  void *v10;
  int v11;
  _BOOL8 v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;

  v16 = a3;
  v8 = a4;
  v9 = a5;
  if (objc_msgSend(v9, "containsKey:", CFSTR("sharedPhotoDisplayPreference")))
  {
    objc_msgSend(a1, "wallpaperValuePropertyKeys");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v9, "intersectsKeyVector:", v10);

    if (v11)
    {
      v12 = objc_msgSend(v8, "sharedPhotoDisplayPreference") == 1
         || objc_msgSend(v8, "sharedPhotoDisplayPreference") == 3
         || objc_msgSend(v8, "sharedPhotoDisplayPreference") == 0;
      objc_msgSend(v16, "objectAtIndexedSubscript:", objc_msgSend(a1, "indexOfPreferredContactForWallpaper:prefersSharedImage:", v16, v12));
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(a1, "sortedContacts:withPreferredContact:", v16, v13);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(a1, "wallpaperValuePropertiesByKey");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(a1, "unifySingleValuesProperties:ofContacts:intoContact:availableKeyDescriptor:", v15, v14, v8, v9);

    }
  }

}

+ (void)unifySingleValuesProperties:(id)a3 ofContacts:(id)a4 intoContact:(id)a5 availableKeyDescriptor:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  id v14;
  id v15;
  _QWORD v16[4];
  id v17;
  id v18;
  id v19;
  id v20;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __95__CNUnifiedContacts_unifySingleValuesProperties_ofContacts_intoContact_availableKeyDescriptor___block_invoke;
  v16[3] = &unk_1E29F9010;
  v17 = v10;
  v18 = v11;
  v19 = v12;
  v20 = a1;
  v13 = v12;
  v14 = v11;
  v15 = v10;
  objc_msgSend(a6, "enumeratePropertiesUsingBlock:", v16);

}

+ (void)unifyNonNameSingleValuesOfContacts:(id)a3 withPreferredContact:(id)a4 intoContact:(id)a5 availableKeyDescriptor:(id)a6
{
  id v9;
  id v10;
  id v11;
  id v12;

  v9 = a6;
  v10 = a5;
  v11 = a3;
  objc_msgSend(a1, "nonNameSingleValuePropertiesByKey");
  v12 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "unifySingleValuesProperties:ofContacts:intoContact:availableKeyDescriptor:", v12, v11, v10, v9);

}

+ (void)unifyNamesOfContacts:(id)a3 withPreferredContact:(id)a4 intoContact:(id)a5 availableKeyDescriptor:(id)a6
{
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;

  v13 = a4;
  v7 = a5;
  if (objc_msgSend(v13, "isKeyAvailable:", CFSTR("namePrefix")))
  {
    objc_msgSend(v13, "namePrefix");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setNamePrefix:", v8);

  }
  if (objc_msgSend(v13, "isKeyAvailable:", CFSTR("givenName")))
  {
    objc_msgSend(v13, "givenName");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setGivenName:", v9);

  }
  if (objc_msgSend(v13, "isKeyAvailable:", CFSTR("middleName")))
  {
    objc_msgSend(v13, "middleName");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setMiddleName:", v10);

  }
  if (objc_msgSend(v13, "isKeyAvailable:", CFSTR("familyName")))
  {
    objc_msgSend(v13, "familyName");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setFamilyName:", v11);

  }
  if (objc_msgSend(v13, "isKeyAvailable:", CFSTR("nameSuffix")))
  {
    objc_msgSend(v13, "nameSuffix");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setNameSuffix:", v12);

  }
}

+ (void)unifyMultiValuesOfContacts:(void *)a3 intoContact:(void *)a4 availableKeyDescriptor:(void *)a5 options:
{
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  int v16;
  void *v17;
  id v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t i;
  void *v23;
  void *v24;
  int v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  uint64_t v30;
  id v31;
  id v32;
  uint64_t v33;
  id v34;
  id v35;
  uint64_t v36;
  id obj;
  uint64_t v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  _BYTE v47[128];
  _BYTE v48[128];
  uint64_t v49;

  v49 = *MEMORY[0x1E0C80C00];
  v35 = a2;
  v32 = a3;
  v8 = a4;
  v31 = a5;
  v30 = objc_opt_self();
  v43 = 0u;
  v44 = 0u;
  v45 = 0u;
  v46 = 0u;
  +[CN writableMultiValueContactProperties](CN, "writableMultiValueContactProperties");
  obj = (id)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v43, v48, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v44;
    v12 = *MEMORY[0x1E0D13878];
    v33 = *(_QWORD *)v44;
    v34 = v8;
    do
    {
      v13 = 0;
      v36 = v10;
      do
      {
        if (*(_QWORD *)v44 != v11)
          objc_enumerationMutation(obj);
        v14 = *(void **)(*((_QWORD *)&v43 + 1) + 8 * v13);
        objc_msgSend(v14, "key");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v16 = objc_msgSend(v8, "containsKey:", v15);

        if (v16)
        {
          v38 = v13;
          v17 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(v35, "count"));
          v39 = 0u;
          v40 = 0u;
          v41 = 0u;
          v42 = 0u;
          v18 = v35;
          v19 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v39, v47, 16);
          if (v19)
          {
            v20 = v19;
            v21 = *(_QWORD *)v40;
            do
            {
              for (i = 0; i != v20; ++i)
              {
                if (*(_QWORD *)v40 != v21)
                  objc_enumerationMutation(v18);
                v23 = *(void **)(*((_QWORD *)&v39 + 1) + 8 * i);
                objc_msgSend(v14, "key");
                v24 = (void *)objc_claimAutoreleasedReturnValue();
                v25 = objc_msgSend(v23, "isKeyAvailable:", v24);

                if (v25)
                {
                  objc_msgSend(v14, "CNValueForContact:", v23);
                  v26 = (void *)objc_claimAutoreleasedReturnValue();
                  (*(void (**)(uint64_t, void *))(v12 + 16))(v12, v26);
                  v27 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v17, "addObject:", v27);

                }
              }
              v20 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v39, v47, 16);
            }
            while (v20);
          }

          if (objc_msgSend(v17, "count"))
          {
            +[CNUnifiedContacts unifyMultivalues:forProperty:options:](v30, v17, v14, v31);
            v28 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v14, "key");
            v29 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v32, "setValue:forKey:", v28, v29);

          }
          v11 = v33;
          v8 = v34;
          v10 = v36;
          v13 = v38;
        }
        ++v13;
      }
      while (v13 != v10);
      v10 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v43, v48, 16);
    }
    while (v10);
  }

}

+ (void)unifyImageOfContacts:(id)a3 intoContact:(id)a4 availableKeyDescriptor:(id)a5
{
  id v8;
  id v9;
  void *v10;
  int v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;

  v15 = a3;
  v8 = a4;
  v9 = a5;
  objc_msgSend(a1, "imageValuePropertyKeys");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v9, "intersectsKeyVector:", v10);

  if (v11)
  {
    objc_msgSend(v15, "objectAtIndexedSubscript:", objc_msgSend(a1, "indexOfPreferredContactForImage:", v15));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "sortedContacts:withPreferredContact:", v15, v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "imageValuePropertiesByKey");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "unifySingleValuesProperties:ofContacts:intoContact:availableKeyDescriptor:", v14, v13, v8, v9);

  }
}

+ (id)unifyAvailableKeysOfContacts:(id)a3
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
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
  v3 = a3;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (!v4)
  {
    v6 = 0;
    goto LABEL_18;
  }
  v5 = v4;
  v6 = 0;
  v7 = *(_QWORD *)v17;
  v8 = *MEMORY[0x1E0C99768];
  do
  {
    for (i = 0; i != v5; ++i)
    {
      if (*(_QWORD *)v17 != v7)
        objc_enumerationMutation(v3);
      v10 = *(void **)(*((_QWORD *)&v16 + 1) + 8 * i);
      objc_msgSend(v10, "storeIdentifier");
      v11 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v11)
      {
        objc_msgSend(v10, "keyVector");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        if (v12)
        {
          if (v6)
          {
LABEL_9:
            if ((objc_msgSend(v12, "isEqual:", v6) & 1) == 0)
              objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", v8, CFSTR("Cannot unify contacts with different available keys."));
            goto LABEL_13;
          }
        }
        else
        {
          objc_msgSend(MEMORY[0x1E0C99E38], "null");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          if (v6)
            goto LABEL_9;
        }
        v6 = v12;
LABEL_13:

        continue;
      }
    }
    v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  }
  while (v5);
LABEL_18:
  (*(void (**)(void))(*MEMORY[0x1E0D13880] + 16))();
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (v13)
  {
    objc_msgSend(v13, "keyVectorByAddingKey:", CFSTR("linkIdentifier"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v14 = 0;
  }

  return v14;
}

+ (id)sortedContacts:(id)a3 withPreferredContact:(id)a4
{
  id v5;
  void *v6;
  void *v7;

  v5 = a4;
  v6 = (void *)objc_msgSend(a3, "mutableCopy");
  objc_msgSend(v6, "removeObject:", v5);
  objc_msgSend(v6, "insertObject:atIndex:", v5, 0);

  v7 = (void *)objc_msgSend(v6, "copy");
  return v7;
}

+ (id)nonNameSingleValuePropertiesByKey
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __54__CNUnifiedContacts_nonNameSingleValuePropertiesByKey__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (nonNameSingleValuePropertiesByKey_cn_once_token_4 != -1)
    dispatch_once(&nonNameSingleValuePropertiesByKey_cn_once_token_4, block);
  return (id)nonNameSingleValuePropertiesByKey_cn_once_object_4;
}

+ (id)makeNonNameSingleValuePropertiesByKey
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  _QWORD v18[2];
  _QWORD v19[6];

  v19[5] = *MEMORY[0x1E0C80C00];
  +[CN writableSingleValueContactProperties](CN, "writableSingleValueContactProperties");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)objc_msgSend(v2, "mutableCopy");
  +[CN namePrefixDescription](CN, "namePrefixDescription");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v19[0] = v4;
  +[CN givenNameDescription](CN, "givenNameDescription");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v19[1] = v5;
  +[CN middleNameDescription](CN, "middleNameDescription");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v19[2] = v6;
  +[CN familyNameDescription](CN, "familyNameDescription");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v19[3] = v7;
  +[CN nameSuffixDescription](CN, "nameSuffixDescription");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v19[4] = v8;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v19, 5);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObjectsInArray:", v9);

  +[CN preferredForNameDescription](CN, "preferredForNameDescription");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v18[0] = v10;
  +[CN preferredForImageDescription](CN, "preferredForImageDescription");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v18[1] = v11;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v18, 2);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObjectsInArray:", v12);

  objc_msgSend(a1, "imageValuePropertiesByKey");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "allValues");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObjectsInArray:", v14);

  objc_msgSend(v3, "_cn_indexBy:", &__block_literal_global_45);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  return v15;
}

+ (uint64_t)indexOfPreferredContactForUnifying:(int)a3 includingMainStoreContacts:
{
  id v4;
  uint64_t v5;
  uint64_t v6;

  v4 = a2;
  objc_opt_self();
  if (!a3
    || (v5 = objc_msgSend(v4, "_cn_indexOfFirstObjectPassingTest:", &__block_literal_global_37),
        v5 == 0x7FFFFFFFFFFFFFFFLL))
  {
    v6 = objc_msgSend(v4, "_cn_indexOfFirstObjectPassingTest:", &__block_literal_global_31);
    if (v6 == 0x7FFFFFFFFFFFFFFFLL)
      v5 = 0;
    else
      v5 = v6;
  }

  return v5;
}

+ (unint64_t)indexOfPreferredContactForImage:(id)a3
{
  unint64_t result;

  result = objc_msgSend(a3, "indexOfObjectPassingTest:", &__block_literal_global_35_0);
  if (result == 0x7FFFFFFFFFFFFFFFLL)
    return 0;
  return result;
}

+ (id)imageValuePropertyKeys
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __43__CNUnifiedContacts_imageValuePropertyKeys__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (imageValuePropertyKeys_cn_once_token_2 != -1)
    dispatch_once(&imageValuePropertyKeys_cn_once_token_2, block);
  return (id)imageValuePropertyKeys_cn_once_object_2;
}

+ (id)imageValuePropertiesByKey
{
  if (imageValuePropertiesByKey_cn_once_token_0 != -1)
    dispatch_once(&imageValuePropertiesByKey_cn_once_token_0, &__block_literal_global_37);
  return (id)imageValuePropertiesByKey_cn_once_object_0;
}

+ (id)_unifyContactsSortedByPreference:(void *)a3 options:
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  CNMutableContact *v11;

  v4 = a2;
  v5 = a3;
  v6 = (void *)objc_opt_self();
  if (((*(uint64_t (**)(void))(*MEMORY[0x1E0D137F8] + 16))() & 1) != 0)
  {
    v7 = 0;
  }
  else
  {
    v8 = objc_msgSend(v4, "count");
    objc_msgSend(v4, "firstObject");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (v8 != 1)
    {
      objc_msgSend(v6, "unifyAvailableKeysOfContacts:", v4);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v5, "shouldIncludeMainStoreContacts")
        && (objc_msgSend(v7, "linkIdentifier"), (v10 = (void *)objc_claimAutoreleasedReturnValue()) != 0)
        || (objc_msgSend(v7, "identifier"), (v10 = (void *)objc_claimAutoreleasedReturnValue()) != 0))
      {
        v11 = -[CNContact initWithIdentifier:availableKeyDescriptor:]([CNMutableContact alloc], "initWithIdentifier:availableKeyDescriptor:", v10, v9);
        objc_msgSend(v6, "unifyNamesOfContacts:withPreferredContact:intoContact:availableKeyDescriptor:", v4, v7, v11, v9);
        objc_msgSend(v6, "unifyNonNameSingleValuesOfContacts:withPreferredContact:intoContact:availableKeyDescriptor:", v4, v7, v11, v9);
        objc_msgSend(v6, "unifyImageOfContacts:intoContact:availableKeyDescriptor:", v4, v11, v9);
        objc_msgSend(v6, "unifyWallpaperOfContacts:intoContact:availableKeyDescriptor:", v4, v11, v9);
        +[CNUnifiedContacts unifyMultiValuesOfContacts:intoContact:availableKeyDescriptor:options:]((uint64_t)v6, v4, v11, v9, v5);
        -[CNMutableContact setLinkedContacts:](v11, "setLinkedContacts:", v4);

      }
      else
      {
        v11 = 0;
      }

      v7 = v11;
    }
  }

  return v7;
}

+ (id)unifyMultivalues:(void *)a3 forProperty:
{
  id v4;
  id v5;
  uint64_t v6;
  void *v7;
  void *v8;

  v4 = a3;
  v5 = a2;
  v6 = objc_opt_self();
  +[CNContactUnificationOptions sharedInstance](CNContactUnificationOptions, "sharedInstance");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  +[CNUnifiedContacts unifyMultivalues:forProperty:options:](v6, v5, v4, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

+ (id)identifierMapForUnifiedContact:(void *)a3 backingContacts:
{
  id v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  void *v12;
  int v13;
  void (**v14)(_QWORD, _QWORD);
  void *v15;
  void *v16;
  void *v17;
  id v19;
  id v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _BYTE v25[128];
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v4 = a2;
  v20 = a3;
  v5 = objc_opt_self();
  objc_msgSend(MEMORY[0x1E0D13AC8], "multiDictionary");
  v19 = (id)objc_claimAutoreleasedReturnValue();
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  +[CN writableMultiValueContactProperties](CN, "writableMultiValueContactProperties");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v22;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v22 != v9)
          objc_enumerationMutation(v6);
        v11 = *(void **)(*((_QWORD *)&v21 + 1) + 8 * i);
        objc_msgSend(v11, "key");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = objc_msgSend(v4, "isKeyAvailable:", v12);

        if (v13)
        {
          objc_msgSend(v11, "valueForKeyTransform");
          v14 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
          ((void (**)(_QWORD, id))v14)[2](v14, v4);
          v15 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v11, "valueForKeyTransform");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v20, "_cn_map:", v16);
          v17 = (void *)objc_claimAutoreleasedReturnValue();

          +[CNUnifiedContacts identifierMapForUnifiedMultiValue:backingMultiValues:intoMap:forProperty:](v5, v15, v17, v19, v11);
        }
      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
    }
    while (v8);
  }

  return v19;
}

+ (id)identifierMapForUnifiedMultiValue:(void *)a3 backingMultiValues:(void *)a4 forProperty:
{
  id v6;
  id v7;
  id v8;
  uint64_t v9;
  void *v10;

  v6 = a4;
  v7 = a3;
  v8 = a2;
  v9 = objc_opt_self();
  objc_msgSend(MEMORY[0x1E0D13AC8], "multiDictionary");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  +[CNUnifiedContacts identifierMapForUnifiedMultiValue:backingMultiValues:intoMap:forProperty:](v9, v8, v7, v10, v6);

  return v10;
}

+ (uint64_t)indexOfUnifiedIdentifier:(void *)a3 onNonUnifiedMultiValue:(void *)a4 withIdentifierMap:
{
  id v6;
  id v7;
  id v8;
  uint64_t v9;
  void *v10;
  id v11;
  void *v12;
  uint64_t v13;

  v6 = a2;
  v7 = a3;
  v8 = a4;
  v9 = objc_opt_self();
  objc_msgSend(v8, "objectsForKey:", v6);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  +[CNUnifiedContacts findFirstIdentifier:inMultiValue:](v9, v10, v7);
  v11 = (id)objc_claimAutoreleasedReturnValue();
  if (!v11)
    v11 = v6;
  +[CNLabeledValue testMatchingIdentifier:](CNLabeledValue, "testMatchingIdentifier:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v7, "indexOfObjectPassingTest:", v12);

  return v13;
}

+ (void)addLinkedIdentifier:(void *)a3 toLabeledValue:
{
  id v4;
  void *v5;
  void *v6;
  id v7;

  v7 = a2;
  v4 = a3;
  objc_opt_self();
  if (v7)
  {
    objc_msgSend(v4, "linkedIdentifiers");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = (void *)objc_msgSend(v5, "mutableCopy");

    if (!v6)
    {
      objc_msgSend(MEMORY[0x1E0C99E20], "set");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(v6, "addObject:", v7);
    objc_msgSend(v4, "setLinkedIdentifiers:", v6);

  }
}

+ (unint64_t)indexOfPreferredContactForWallpaper:(id)a3 prefersSharedImage:(BOOL)a4
{
  _BOOL4 v4;
  id v5;
  void *v6;
  uint64_t v7;
  unint64_t v8;

  v4 = a4;
  v5 = a3;
  v6 = v5;
  if (!v4
    || (v7 = objc_msgSend(v5, "indexOfObjectPassingTest:", &__block_literal_global_33), v7 == 0x7FFFFFFFFFFFFFFFLL))
  {
    v7 = objc_msgSend(v6, "indexOfObjectPassingTest:", &__block_literal_global_34_0);
  }
  if (v7 == 0x7FFFFFFFFFFFFFFFLL)
    v8 = 0;
  else
    v8 = v7;

  return v8;
}

uint64_t __76__CNUnifiedContacts_indexOfPreferredContactForWallpaper_prefersSharedImage___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  uint64_t v3;

  v2 = a2;
  if (objc_msgSend(v2, "isKeyAvailable:", CFSTR("isUsingSharedPhoto")))
    v3 = objc_msgSend(v2, "isUsingSharedPhoto");
  else
    v3 = 0;

  return v3;
}

uint64_t __76__CNUnifiedContacts_indexOfPreferredContactForWallpaper_prefersSharedImage___block_invoke_2(uint64_t a1, void *a2)
{
  id v2;
  uint64_t v3;

  v2 = a2;
  if (objc_msgSend(v2, "isKeyAvailable:", CFSTR("preferredForImage")))
    v3 = objc_msgSend(v2, "isPreferredForImage");
  else
    v3 = 0;

  return v3;
}

BOOL __58__CNUnifiedContacts_unifyMultivalues_forProperty_options___block_invoke(uint64_t a1, void *a2)
{
  return (unint64_t)objc_msgSend(a2, "count") > *(_QWORD *)(a1 + 32);
}

+ (unint64_t)indexOfValueMostInferiorTo:(id)a3 inMultiValue:(id)a4 forProperty:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  id v12;
  id v13;
  id v14;
  unint64_t v15;
  _QWORD v17[4];
  id v18;
  id v19;
  id v20;
  uint64_t *v21;
  uint64_t v22;
  uint64_t *v23;
  uint64_t v24;
  uint64_t v25;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  objc_msgSend(a1, "indexesOfValuesInferiorTo:inMultiValue:forProperty:", v8, v9, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = 0;
  v23 = &v22;
  v24 = 0x2020000000;
  v25 = 0x7FFFFFFFFFFFFFFFLL;
  v17[0] = MEMORY[0x1E0C809B0];
  v17[1] = 3221225472;
  v17[2] = __73__CNUnifiedContacts_indexOfValueMostInferiorTo_inMultiValue_forProperty___block_invoke;
  v17[3] = &unk_1E29F90F8;
  v21 = &v22;
  v12 = v8;
  v18 = v12;
  v13 = v9;
  v19 = v13;
  v14 = v10;
  v20 = v14;
  objc_msgSend(v11, "enumerateIndexesUsingBlock:", v17);
  v15 = v23[3];

  _Block_object_dispose(&v22, 8);
  return v15;
}

void __73__CNUnifiedContacts_indexOfValueMostInferiorTo_inMultiValue_forProperty___block_invoke(uint64_t a1, uint64_t a2)
{
  void *v4;
  void *v5;
  void *v6;
  id v7;

  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) == 0x7FFFFFFFFFFFFFFFLL)
  {
    objc_msgSend(*(id *)(a1 + 32), "value");
    v7 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 40), "objectAtIndex:");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "value");
    v7 = (id)objc_claimAutoreleasedReturnValue();

  }
  objc_msgSend(*(id *)(a1 + 40), "objectAtIndex:", a2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "value");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(*(id *)(a1 + 48), "isValue:preferredToUnifiedValue:", v7, v6))
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = a2;

}

+ (void)replaceInferiorValueInMultiValue:(id)a3 withEntryAtIndex:(unint64_t)a4 fromMultiValue:(id)a5 forProperty:(id)a6
{
  id v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  id v15;

  v15 = a3;
  v10 = a6;
  objc_msgSend(a5, "objectAtIndex:", a4);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "labelValuePair");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(a1, "indexOfValueMostInferiorTo:inMultiValue:forProperty:", v12, v15, v10);

  if (v13 != 0x7FFFFFFFFFFFFFFFLL)
  {
    objc_msgSend(v15, "objectAtIndex:", v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "addLinkedLabeledValue:toLabeledValue:forProperty:", v14, v11, v10);

    objc_msgSend(v15, "replaceObjectAtIndex:withObject:", v13, v11);
  }

}

+ (void)identifierMapForUnifiedMultiValue:(void *)a3 backingMultiValues:(void *)a4 intoMap:(void *)a5 forProperty:
{
  id v8;
  id v9;
  id v10;
  id v11;
  uint64_t v12;
  id v13;
  void (**v14)(void *, id);
  void *v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  _QWORD aBlock[4];
  id v27;
  _BYTE v28[128];
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v8 = a2;
  v9 = a3;
  v10 = a4;
  v11 = a5;
  v12 = objc_opt_self();
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __94__CNUnifiedContacts_identifierMapForUnifiedMultiValue_backingMultiValues_intoMap_forProperty___block_invoke;
  aBlock[3] = &unk_1E29F9148;
  v13 = v11;
  v27 = v13;
  v14 = (void (**)(void *, id))_Block_copy(aBlock);
  v21 = v8;
  v14[2](v14, v8);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "_cn_map:", v14);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  v25 = 0u;
  v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v22, v28, 16);
  if (v17)
  {
    v18 = v17;
    v19 = *(_QWORD *)v23;
    do
    {
      v20 = 0;
      do
      {
        if (*(_QWORD *)v23 != v19)
          objc_enumerationMutation(v16);
        +[CNUnifiedContacts correlateIdentifiersOfUnifiedMap:toIdentifiersOfMultiValueMap:intoMap:forProperty:](v12, v15, *(void **)(*((_QWORD *)&v22 + 1) + 8 * v20++), v10, v13);
      }
      while (v18 != v20);
      v18 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v22, v28, 16);
    }
    while (v18);
  }

}

id __94__CNUnifiedContacts_identifierMapForUnifiedMultiValue_backingMultiValues_intoMap_forProperty___block_invoke(uint64_t a1, uint64_t a2)
{
  return +[CN groupIdentifiersByLabeledValue:forProperty:](CN, "groupIdentifiersByLabeledValue:forProperty:", a2, *(_QWORD *)(a1 + 32));
}

+ (void)correlateIdentifiersOfUnifiedMap:(void *)a3 toIdentifiersOfMultiValueMap:(void *)a4 intoMap:(void *)a5 forProperty:
{
  id v8;
  id v9;
  id v10;
  id v11;
  uint64_t v12;
  id v13;
  id v14;
  id v15;
  _QWORD v16[4];
  id v17;
  id v18;
  id v19;
  uint64_t v20;

  v8 = a2;
  v9 = a4;
  v10 = a5;
  v11 = a3;
  v12 = objc_opt_self();
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __103__CNUnifiedContacts_correlateIdentifiersOfUnifiedMap_toIdentifiersOfMultiValueMap_intoMap_forProperty___block_invoke;
  v16[3] = &unk_1E29F9170;
  v17 = v8;
  v18 = v10;
  v19 = v9;
  v20 = v12;
  v13 = v9;
  v14 = v10;
  v15 = v8;
  objc_msgSend(v11, "eachObject:", v16);

}

void __103__CNUnifiedContacts_correlateIdentifiersOfUnifiedMap_toIdentifiersOfMultiValueMap_intoMap_forProperty___block_invoke(uint64_t a1, uint64_t a2, void *a3, unint64_t a4)
{
  void *v7;
  void *v8;
  id v9;

  v9 = a3;
  objc_msgSend(*(id *)(a1 + 56), "unifiedIdentifiersForLabeledValue:inUnifiedMap:forProperty:", a2, *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v7, "count") > a4)
  {
    objc_msgSend(v7, "objectAtIndex:", a4);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 48), "addObject:forKey:", v9, v8);

  }
}

+ (id)unifiedIdentifiersForLabeledValue:(id)a3 inUnifiedMap:(id)a4 forProperty:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  int v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v19;
  uint64_t v20;
  uint64_t (*v21)(uint64_t, void *);
  void *v22;
  id v23;
  id v24;

  v8 = a3;
  v9 = a5;
  v10 = a4;
  objc_msgSend(v8, "label");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "isEqual:", &stru_1E29FF900);

  if (v12)
  {
    objc_msgSend(v8, "value");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "unifiedIdentifiersForValue:inUnifiedMap:forProperty:", v13, v10, v9);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    objc_msgSend(v10, "allKeys");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = MEMORY[0x1E0C809B0];
    v20 = 3221225472;
    v21 = __80__CNUnifiedContacts_unifiedIdentifiersForLabeledValue_inUnifiedMap_forProperty___block_invoke;
    v22 = &unk_1E29F8F68;
    v23 = v8;
    v24 = v9;
    objc_msgSend(v15, "_cn_filter:", &v19);
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v10, "objectsForKeys:", v16, v19, v20, v21, v22);
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v17, "_cn_flatten");
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    v13 = v23;
  }

  return v14;
}

uint64_t __80__CNUnifiedContacts_unifiedIdentifiersForLabeledValue_inUnifiedMap_forProperty___block_invoke(uint64_t a1, void *a2)
{
  return canUnifyLabeledValuePairs(*(void **)(a1 + 32), a2, *(void **)(a1 + 40));
}

+ (BOOL)canUnifyLabel:(id)a3 withLabel:(id)a4 forProperty:(id)a5
{
  id v7;
  id v8;
  id v9;
  char v10;
  void *v12;
  _QWORD v13[4];
  id v14;

  v7 = a3;
  v8 = a4;
  v9 = a5;
  if ((objc_msgSend(MEMORY[0x1E0D13A40], "isObject:equalToOther:", v7, v8) & 1) != 0)
  {
LABEL_6:
    v10 = 1;
    goto LABEL_7;
  }
  v10 = 0;
  if (v7 && v8)
  {
    if ((objc_msgSend(v7, "isEqualToString:", &stru_1E29FF900) & 1) == 0
      && (objc_msgSend(v8, "isEqualToString:", &stru_1E29FF900) & 1) == 0)
    {
      objc_msgSend(v9, "unifiableLabelsForLabel:", v7);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13[0] = MEMORY[0x1E0C809B0];
      v13[1] = 3221225472;
      v13[2] = __57__CNUnifiedContacts_canUnifyLabel_withLabel_forProperty___block_invoke;
      v13[3] = &unk_1E29F9198;
      v14 = v8;
      v10 = objc_msgSend(v12, "_cn_any:", v13);

      goto LABEL_7;
    }
    goto LABEL_6;
  }
LABEL_7:

  return v10;
}

uint64_t __57__CNUnifiedContacts_canUnifyLabel_withLabel_forProperty___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "isEqualToString:", *(_QWORD *)(a1 + 32));
}

+ (id)unifiedIdentifiersForValue:(id)a3 inUnifiedMap:(id)a4 forProperty:(id)a5
{
  id v7;
  id v8;
  id v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t i;
  void *v16;
  void *v17;
  int v18;
  void *v19;
  id v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  _BYTE v26[128];
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  v9 = a5;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v21 = (id)objc_claimAutoreleasedReturnValue();
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  v25 = 0u;
  v10 = v8;
  objc_msgSend(v8, "allKeys");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
  if (v12)
  {
    v13 = v12;
    v14 = *(_QWORD *)v23;
    do
    {
      for (i = 0; i != v13; ++i)
      {
        if (*(_QWORD *)v23 != v14)
          objc_enumerationMutation(v11);
        v16 = *(void **)(*((_QWORD *)&v22 + 1) + 8 * i);
        objc_msgSend(v16, "value");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        v18 = objc_msgSend(v9, "canUnifyValue:withValue:", v17, v7);

        if (v18)
        {
          objc_msgSend(v10, "objectsForKey:", v16);
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v21, "addObjectsFromArray:", v19);

        }
      }
      v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
    }
    while (v13);
  }

  return v21;
}

+ (id)findFirstIdentifier:(void *)a3 inMultiValue:
{
  id v4;
  id v5;
  id v6;
  void *v7;
  _QWORD v9[4];
  id v10;

  v4 = a3;
  v5 = a2;
  objc_opt_self();
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __54__CNUnifiedContacts_findFirstIdentifier_inMultiValue___block_invoke;
  v9[3] = &unk_1E29F9198;
  v10 = v4;
  v6 = v4;
  objc_msgSend(v5, "_cn_firstObjectPassingTest:", v9);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

BOOL __54__CNUnifiedContacts_findFirstIdentifier_inMultiValue___block_invoke(uint64_t a1, uint64_t a2)
{
  void *v2;
  void *v3;
  uint64_t v4;

  v2 = *(void **)(a1 + 32);
  +[CNLabeledValue testMatchingIdentifier:](CNLabeledValue, "testMatchingIdentifier:", a2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v2, "indexOfObjectPassingTest:", v3);

  return v4 != 0x7FFFFFFFFFFFFFFFLL;
}

+ (void)addLinkedLabeledValue:(uint64_t)a1 toLabeledValue:(uint64_t)a2 forProperty:(os_log_t)log .cold.1(uint64_t a1, uint64_t a2, os_log_t log)
{
  int v3;
  uint64_t v4;
  __int16 v5;
  uint64_t v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v3 = 138412546;
  v4 = a1;
  v5 = 2112;
  v6 = a2;
  _os_log_fault_impl(&dword_18F8BD000, log, OS_LOG_TYPE_FAULT, "Unexpected nil for CNLabeledValue.identifier when unifying contacts, %@, %@", (uint8_t *)&v3, 0x16u);
}

@end
