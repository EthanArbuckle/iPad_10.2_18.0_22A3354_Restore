@implementation CNPolicy

- (BOOL)isReadonly
{
  return 0;
}

- (unint64_t)maximumCountOfValuesForContactProperty:(id)a3
{
  return 0;
}

- (id)supportedLabelsForContactProperty:(id)a3
{
  return (id)objc_msgSend(MEMORY[0x1E0C99D20], "array", a3);
}

- (unint64_t)maximumCountOfValuesForContactProperty:(id)a3 label:(id)a4
{
  return 0;
}

- (id)unsupportedAttributesForLabeledContactProperty:(id)a3
{
  return 0;
}

- (BOOL)shouldAddContact:(id)a3
{
  return 0;
}

- (BOOL)shouldRemoveContact:(id)a3
{
  return 0;
}

- (BOOL)isContactPropertySupported:(id)a3
{
  return 0;
}

- (BOOL)shouldSetValue:(id)a3 property:(id)a4 contact:(id)a5 replacementValue:(id *)a6
{
  id v9;
  id v10;
  void *v11;
  void *v12;
  unint64_t v13;
  id v14;
  int v15;
  _BOOL4 v17;
  id v18;
  void *v19;
  id v20;
  _BOOL4 v21;
  id v22;
  id v23;

  v9 = a3;
  v10 = a4;
  +[CN contactPropertiesByKey](CN, "contactPropertiesByKey");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "objectForKey:", v10);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (!-[CNPolicy isContactPropertySupported:](self, "isContactPropertySupported:", v10))
    goto LABEL_5;
  if (!objc_msgSend(v12, "isMultiValue"))
  {
    v14 = 0;
    LOBYTE(v15) = 1;
    goto LABEL_7;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0
    && (v13 = objc_msgSend(v9, "count"),
        v13 <= -[CNPolicy maximumCountOfValuesForContactProperty:](self, "maximumCountOfValuesForContactProperty:", v10)))
  {
    v23 = 0;
    v17 = -[CNPolicy _validateLabeledValueArrayLabels:forContactProperty:replacementValue:](self, "_validateLabeledValueArrayLabels:forContactProperty:replacementValue:", v9, v10, &v23);
    v18 = v23;
    v19 = v18;
    if (!v17 && v18)
    {
      v20 = v18;

      v9 = v20;
    }
    v22 = v19;
    v21 = -[CNPolicy _validateLabeledValueArrayAttributeSupport:forContactProperty:replacementValue:](self, "_validateLabeledValueArrayAttributeSupport:forContactProperty:replacementValue:", v9, v10, &v22);
    v14 = v22;

    v15 = v17 && v21;
    if (a6 && !v15 && v14)
    {
      v14 = objc_retainAutorelease(v14);
      *a6 = v14;
    }
  }
  else
  {
LABEL_5:
    v14 = 0;
    LOBYTE(v15) = 0;
  }
LABEL_7:

  return v15;
}

- (BOOL)_validateLabeledValueArrayLabels:(id)a3 forContactProperty:(id)a4 replacementValue:(id *)a5
{
  void *v7;
  void *v8;
  BOOL v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  int v18;
  uint64_t j;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  uint64_t v26;
  id v27;
  void *v28;
  id v29;
  id v30;
  int v31;
  id v34;
  void *v35;
  void *v36;
  id obj;
  id v38;
  _QWORD v39[4];
  id v40;
  id v41;
  _QWORD v42[4];
  id v43;
  id v44;
  uint64_t *v45;
  uint64_t v46;
  uint64_t *v47;
  uint64_t v48;
  char v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  _BYTE v58[128];
  _BYTE v59[128];
  uint64_t v60;

  v60 = *MEMORY[0x1E0C80C00];
  v34 = a3;
  v38 = a4;
  -[CNPolicy supportedLabelsForContactProperty:](self, "supportedLabelsForContactProperty:");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v35, "count"))
  {
    v9 = 1;
    goto LABEL_36;
  }
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (a5)
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v34, "count"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3788], "indexSet");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v36 = 0;
    v8 = 0;
  }
  v56 = 0u;
  v57 = 0u;
  v54 = 0u;
  v55 = 0u;
  v10 = v35;
  v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v54, v59, 16);
  if (v11)
  {
    v12 = *(_QWORD *)v55;
    do
    {
      for (i = 0; i != v11; ++i)
      {
        if (*(_QWORD *)v55 != v12)
          objc_enumerationMutation(v10);
        v14 = *(_QWORD *)(*((_QWORD *)&v54 + 1) + 8 * i);
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", -[CNPolicy maximumCountOfValuesForContactProperty:label:](self, "maximumCountOfValuesForContactProperty:label:", v38, v14));
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "setObject:forKey:", v15, v14);

      }
      v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v54, v59, 16);
    }
    while (v11);
  }

  v52 = 0u;
  v53 = 0u;
  v50 = 0u;
  v51 = 0u;
  obj = v34;
  v16 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v50, v58, 16);
  if (!v16)
  {

    v31 = 1;
    goto LABEL_35;
  }
  v17 = *(_QWORD *)v51;
  v18 = 1;
  do
  {
    for (j = 0; j != v16; ++j)
    {
      if (*(_QWORD *)v51 != v17)
        objc_enumerationMutation(obj);
      v20 = *(void **)(*((_QWORD *)&v50 + 1) + 8 * j);
      objc_msgSend(v20, "label");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "objectForKey:", v21);
      v22 = (void *)objc_claimAutoreleasedReturnValue();

      if (v22 && objc_msgSend(v22, "integerValue"))
      {
        if (v8)
        {
          objc_msgSend(v20, "label");
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v8, "addObject:", v23);

        }
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", objc_msgSend(v22, "integerValue") - 1);
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v20, "label");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "setObject:forKey:", v24, v25);

        goto LABEL_25;
      }
      if (v8)
      {
        objc_msgSend(v36, "addIndex:", objc_msgSend(v8, "count"));
        objc_msgSend(MEMORY[0x1E0C99E38], "null");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "addObject:", v24);
        v18 = 0;
LABEL_25:

        goto LABEL_27;
      }
      v18 = 0;
LABEL_27:

    }
    v16 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v50, v58, 16);
  }
  while (v16);

  if (v18 & 1 | (a5 == 0))
  {
    v31 = v18;
  }
  else
  {
    v46 = 0;
    v47 = &v46;
    v48 = 0x2020000000;
    v49 = 1;
    v26 = MEMORY[0x1E0C809B0];
    v42[0] = MEMORY[0x1E0C809B0];
    v42[1] = 3221225472;
    v42[2] = __81__CNPolicy__validateLabeledValueArrayLabels_forContactProperty_replacementValue___block_invoke;
    v42[3] = &unk_1E29FD8B0;
    v43 = v7;
    v27 = v8;
    v44 = v27;
    v45 = &v46;
    objc_msgSend(v36, "enumerateIndexesUsingBlock:", v42);
    if (*((_BYTE *)v47 + 24))
    {
      objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(obj, "count"));
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      v39[0] = v26;
      v39[1] = 3221225472;
      v39[2] = __81__CNPolicy__validateLabeledValueArrayLabels_forContactProperty_replacementValue___block_invoke_2;
      v39[3] = &unk_1E29F9D98;
      v40 = v27;
      v29 = v28;
      v41 = v29;
      objc_msgSend(obj, "enumerateObjectsUsingBlock:", v39);
      v30 = objc_retainAutorelease(v29);
      *a5 = v30;

    }
    _Block_object_dispose(&v46, 8);
    v31 = 0;
  }
LABEL_35:

  v9 = v31 != 0;
LABEL_36:

  return v9;
}

void __81__CNPolicy__validateLabeledValueArrayLabels_forContactProperty_replacementValue___block_invoke(uint64_t a1, uint64_t a2)
{
  void *v4;
  void *v5;
  void *v6;
  _QWORD v7[6];
  uint64_t v8;
  uint64_t *v9;
  uint64_t v10;
  uint64_t (*v11)(uint64_t, uint64_t);
  void (*v12)(uint64_t);
  id v13;
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t (*v17)(uint64_t, uint64_t);
  void (*v18)(uint64_t);
  id v19;

  v14 = 0;
  v15 = &v14;
  v16 = 0x3032000000;
  v17 = __Block_byref_object_copy__30;
  v18 = __Block_byref_object_dispose__30;
  v19 = 0;
  v8 = 0;
  v9 = &v8;
  v10 = 0x3032000000;
  v11 = __Block_byref_object_copy__30;
  v12 = __Block_byref_object_dispose__30;
  v13 = 0;
  v4 = *(void **)(a1 + 32);
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __81__CNPolicy__validateLabeledValueArrayLabels_forContactProperty_replacementValue___block_invoke_23;
  v7[3] = &unk_1E29FD888;
  v7[4] = &v14;
  v7[5] = &v8;
  objc_msgSend(v4, "enumerateKeysAndObjectsUsingBlock:", v7);
  if (v15[5])
  {
    objc_msgSend(*(id *)(a1 + 40), "replaceObjectAtIndex:withObject:", a2);
    v5 = *(void **)(a1 + 32);
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", objc_msgSend((id)v9[5], "integerValue") - 1);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setObject:forKey:", v6, v15[5]);

  }
  else
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = 0;
  }
  _Block_object_dispose(&v8, 8);

  _Block_object_dispose(&v14, 8);
}

void __81__CNPolicy__validateLabeledValueArrayLabels_forContactProperty_replacementValue___block_invoke_23(uint64_t a1, void *a2, void *a3, _BYTE *a4)
{
  id v8;
  id v9;

  v9 = a2;
  v8 = a3;
  if (objc_msgSend(v8, "integerValue") >= 1)
  {
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), a3);
    *a4 = 1;
  }

}

void __81__CNPolicy__validateLabeledValueArrayLabels_forContactProperty_replacementValue___block_invoke_2(uint64_t a1, void *a2, uint64_t a3)
{
  void *v5;
  void *v6;
  int v7;
  void *v8;
  void *v9;
  id v10;

  v10 = a2;
  objc_msgSend(v10, "label");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "objectAtIndex:", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v5, "isEqualToString:", v6);

  if (v7)
  {
    objc_msgSend(*(id *)(a1 + 40), "addObject:", v10);
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "objectAtIndex:", a3);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "labeledValueBySettingLabel:", v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(*(id *)(a1 + 40), "addObject:", v9);
  }

}

- (BOOL)_validateLabeledValueArrayAttributeSupport:(id)a3 forContactProperty:(id)a4 replacementValue:(id *)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  char v13;
  _QWORD v15[4];
  id v16;
  id v17;
  CNPolicy *v18;
  uint64_t *v19;
  uint64_t *v20;
  BOOL v21;
  uint64_t v22;
  uint64_t *v23;
  uint64_t v24;
  uint64_t (*v25)(uint64_t, uint64_t);
  void (*v26)(uint64_t);
  id v27;
  uint64_t v28;
  uint64_t *v29;
  uint64_t v30;
  char v31;

  v8 = a3;
  v9 = a4;
  v28 = 0;
  v29 = &v28;
  v30 = 0x2020000000;
  v31 = 1;
  v22 = 0;
  v23 = &v22;
  v24 = 0x3032000000;
  v25 = __Block_byref_object_copy__30;
  v26 = __Block_byref_object_dispose__30;
  v27 = 0;
  -[CNPolicy unsupportedAttributesForLabeledContactProperty:](self, "unsupportedAttributesForLabeledContactProperty:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v10;
  if (!v10)
  {
    *((_BYTE *)v29 + 24) = 0;
    if (!a5)
      goto LABEL_9;
    goto LABEL_7;
  }
  if (objc_msgSend(v10, "count"))
  {
    v15[0] = MEMORY[0x1E0C809B0];
    v15[1] = 3221225472;
    v15[2] = __91__CNPolicy__validateLabeledValueArrayAttributeSupport_forContactProperty_replacementValue___block_invoke;
    v15[3] = &unk_1E29FD8D8;
    v16 = v11;
    v19 = &v28;
    v21 = a5 != 0;
    v20 = &v22;
    v17 = v8;
    v18 = self;
    objc_msgSend(v17, "enumerateObjectsUsingBlock:", v15);

  }
  if (a5)
  {
LABEL_7:
    v12 = (void *)v23[5];
    if (v12)
      *a5 = objc_retainAutorelease(v12);
  }
LABEL_9:
  v13 = *((_BYTE *)v29 + 24);

  _Block_object_dispose(&v22, 8);
  _Block_object_dispose(&v28, 8);

  return v13;
}

void __91__CNPolicy__validateLabeledValueArrayAttributeSupport_forContactProperty_replacementValue___block_invoke(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  id v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  uint64_t v13;
  void *v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  void *v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  _BYTE v27[128];
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v7 = a2;
  v23 = 0u;
  v24 = 0u;
  v25 = 0u;
  v26 = 0u;
  v8 = *(id *)(a1 + 32);
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v24;
    do
    {
      for (i = 0; i != v10; ++i)
      {
        if (*(_QWORD *)v24 != v11)
          objc_enumerationMutation(v8);
        v13 = *(_QWORD *)(*((_QWORD *)&v23 + 1) + 8 * i);
        objc_msgSend(v7, "value", (_QWORD)v23);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "valueForKey:", v13);
        v15 = (void *)objc_claimAutoreleasedReturnValue();

        if (v15)
        {
          *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = 0;
          if (*(_BYTE *)(a1 + 72))
          {
            if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40))
            {
              v16 = objc_msgSend(*(id *)(a1 + 40), "mutableCopy");
              v17 = *(_QWORD *)(*(_QWORD *)(a1 + 64) + 8);
              v18 = *(void **)(v17 + 40);
              *(_QWORD *)(v17 + 40) = v16;

            }
          }
          else
          {
            *a4 = 1;
          }
          objc_msgSend(*(id *)(a1 + 48), "_replacementLabeledValue:omittingKeys:", v7, *(_QWORD *)(a1 + 32));
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          if (v19)
          {
            objc_msgSend(v7, "labeledValueBySettingValue:", v19);
            v20 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40), "replaceObjectAtIndex:withObject:", a3, v20);

          }
          else
          {
            v21 = *(_QWORD *)(*(_QWORD *)(a1 + 64) + 8);
            v22 = *(void **)(v21 + 40);
            *(_QWORD *)(v21 + 40) = 0;

            *a4 = 1;
          }

        }
      }
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
    }
    while (v10);
  }

}

- (id)_replacementLabeledValue:(id)a3 omittingKeys:(id)a4
{
  id v5;
  id v6;
  void *v7;
  char v8;
  void *v9;
  void *v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  objc_msgSend(v5, "value");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_opt_respondsToSelector();

  if ((v8 & 1) != 0)
  {
    objc_msgSend(v5, "value");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = (void *)objc_msgSend(v9, "mutableCopy");

    v19 = 0u;
    v20 = 0u;
    v17 = 0u;
    v18 = 0u;
    v11 = v6;
    v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    if (v12)
    {
      v13 = v12;
      v14 = *(_QWORD *)v18;
      do
      {
        v15 = 0;
        do
        {
          if (*(_QWORD *)v18 != v14)
            objc_enumerationMutation(v11);
          objc_msgSend(v10, "setValue:forKey:", 0, *(_QWORD *)(*((_QWORD *)&v17 + 1) + 8 * v15++), (_QWORD)v17);
        }
        while (v13 != v15);
        v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
      }
      while (v13);
    }

  }
  else
  {
    v10 = 0;
  }

  return v10;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (CNPolicy)initWithCoder:(id)a3
{
  CNPolicy *v3;
  CNPolicy *v4;
  CNPolicy *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)CNPolicy;
  v3 = -[CNPolicy init](&v7, sel_init, a3);
  v4 = v3;
  if (v3)
    v5 = v3;

  return v4;
}

@end
