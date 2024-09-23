@implementation CNContactSubsetCalculator

+ (BOOL)isContact:(id)a3 subsetOfContact:(id)a4 ignoringProperties:(id)a5
{
  id v7;
  id v8;
  id v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  void *v16;
  char v17;
  void *v18;
  void *v19;
  int v20;
  void *v21;
  void *v22;
  int v23;
  BOOL v24;
  void *v27;
  id obj;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  void *v33;
  void *v34;
  _BYTE v35[128];
  uint64_t v36;

  v36 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  v9 = a5;
  v27 = v9;
  if (v7 == v8)
  {
    v24 = 1;
  }
  else
  {
    v10 = v9;
    v31 = 0u;
    v32 = 0u;
    v29 = 0u;
    v30 = 0u;
    +[CN writableContactProperties](CN, "writableContactProperties");
    obj = (id)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v29, v35, 16);
    if (v11)
    {
      v12 = v11;
      v13 = *(_QWORD *)v30;
LABEL_4:
      v14 = 0;
      while (1)
      {
        if (*(_QWORD *)v30 != v13)
          objc_enumerationMutation(obj);
        v15 = *(void **)(*((_QWORD *)&v29 + 1) + 8 * v14);
        objc_msgSend(v15, "key");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v17 = objc_msgSend(v10, "containsKey:", v16);

        if ((v17 & 1) == 0)
          break;
LABEL_21:
        if (v12 == ++v14)
        {
          v12 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v29, v35, 16);
          if (v12)
            goto LABEL_4;
          goto LABEL_23;
        }
      }
      if (v7)
      {
        objc_msgSend(v15, "key");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        v34 = v18;
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v34, 1);
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        v20 = objc_msgSend(v7, "areKeysAvailable:", v19);

        if (v8)
          goto LABEL_10;
      }
      else
      {
        v20 = 1;
        if (v8)
        {
LABEL_10:
          objc_msgSend(v15, "key");
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          v33 = v21;
          objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v33, 1);
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          v23 = objc_msgSend(v8, "areKeysAvailable:", v22);

          if (v7)
          {
            v10 = v27;
            if (((v20 ^ v23) & 1) != 0)
              goto LABEL_25;
          }
          else
          {
            v10 = v27;
          }
LABEL_16:
          if ((v20 & v23) == 1)
          {
            if (objc_msgSend(v15, "isMultiValue"))
            {
              if ((objc_msgSend(a1, "isContact:subsetOfContact:forMultiValueProperty:", v7, v8, v15) & 1) == 0)
                goto LABEL_25;
            }
            else if (!objc_msgSend(a1, "isContact:subsetOfContact:forSingleValueProperty:", v7, v8, v15))
            {
LABEL_25:
              v24 = 0;
              goto LABEL_26;
            }
          }
          goto LABEL_21;
        }
      }
      v23 = 1;
      goto LABEL_16;
    }
LABEL_23:
    v24 = 1;
LABEL_26:

  }
  return v24;
}

+ (BOOL)isContact:(id)a3 subsetOfContact:(id)a4 forSingleValueProperty:(id)a5
{
  id v7;
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  char v13;
  BOOL v14;
  void *v15;

  v7 = a3;
  v8 = a5;
  v9 = a4;
  objc_msgSend(v8, "CNValueForContact:", v7);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "CNValueForContact:", v9);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if ((objc_msgSend(v8, "canUnifyValue:withValue:", v10, v11) & 1) != 0
    || (+[CNContact emptyContact](CNContact, "emptyContact"),
        v12 = (void *)objc_claimAutoreleasedReturnValue(),
        v13 = objc_msgSend(v8, "isEqualIgnoringIdentifiersForContact:other:", v7, v12),
        v12,
        (v13 & 1) != 0))
  {
    v14 = 1;
  }
  else
  {
    objc_msgSend(v8, "CNValueForContact:", v7);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = v15 == 0;

  }
  return v14;
}

+ (BOOL)isContact:(id)a3 subsetOfContact:(id)a4 forMultiValueProperty:(id)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t i;
  BOOL v18;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v8 = a4;
  v9 = a5;
  objc_msgSend(v9, "CNValueForContact:", a3);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "CNValueForContact:", v8);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = (void *)objc_opt_new();
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v13 = v10;
  v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
  if (v14)
  {
    v15 = v14;
    v16 = *(_QWORD *)v21;
    while (2)
    {
      for (i = 0; i != v15; ++i)
      {
        if (*(_QWORD *)v21 != v16)
          objc_enumerationMutation(v13);
        if (!objc_msgSend(a1, "_isLabeledValue:availableInLabeledValues:claimedIndices:forMultiValueProperty:", *(_QWORD *)(*((_QWORD *)&v20 + 1) + 8 * i), v11, v12, v9, (_QWORD)v20))
        {
          v18 = 0;
          goto LABEL_11;
        }
      }
      v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
      if (v15)
        continue;
      break;
    }
  }
  v18 = 1;
LABEL_11:

  return v18;
}

+ (BOOL)_isLabeledValue:(id)a3 availableInLabeledValues:(id)a4 claimedIndices:(id)a5 forMultiValueProperty:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  void *v15;
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  _QWORD v22[4];
  id v23;
  id v24;
  id v25;
  id v26;
  id v27;
  uint64_t *v28;
  id v29;
  uint64_t v30;
  uint64_t *v31;
  uint64_t v32;
  char v33;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  objc_msgSend(v13, "equivalentLabelSets");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v30 = 0;
  v31 = &v30;
  v32 = 0x2020000000;
  v33 = 0;
  objc_msgSend(v10, "label");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v22[0] = MEMORY[0x1E0C809B0];
  v22[1] = 3221225472;
  v22[2] = __107__CNContactSubsetCalculator__isLabeledValue_availableInLabeledValues_claimedIndices_forMultiValueProperty___block_invoke;
  v22[3] = &unk_1E29FBE60;
  v16 = v12;
  v23 = v16;
  v29 = a1;
  v17 = v15;
  v24 = v17;
  v18 = v14;
  v25 = v18;
  v19 = v13;
  v26 = v19;
  v20 = v10;
  v27 = v20;
  v28 = &v30;
  objc_msgSend(v11, "enumerateObjectsUsingBlock:", v22);
  LOBYTE(v14) = *((_BYTE *)v31 + 24);

  _Block_object_dispose(&v30, 8);
  return (char)v14;
}

void __107__CNContactSubsetCalculator__isLabeledValue_availableInLabeledValues_claimedIndices_forMultiValueProperty___block_invoke(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  char v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;

  v13 = a2;
  v7 = objc_msgSend(*(id *)(a1 + 32), "containsIndex:", a3);
  v8 = v13;
  if ((v7 & 1) == 0)
  {
    objc_msgSend(v13, "label");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(*(id *)(a1 + 80), "_isLabel:subsumableIntoLabel:equivalencies:", *(_QWORD *)(a1 + 40), v9, *(_QWORD *)(a1 + 48)))
    {
      v10 = *(void **)(a1 + 56);
      objc_msgSend(*(id *)(a1 + 64), "value");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "value");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      LODWORD(v10) = objc_msgSend(v10, "canUnifyValue:withValue:", v11, v12);

      if ((_DWORD)v10)
      {
        objc_msgSend(*(id *)(a1 + 32), "addIndex:", a3);
        *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 24) = 1;
        *a4 = 1;
      }
    }

    v8 = v13;
  }

}

+ (BOOL)_isLabel:(id)a3 subsumableIntoLabel:(id)a4 equivalencies:(id)a5
{
  id v7;
  id v8;
  id v9;
  uint64_t v10;
  void *v11;
  void *v12;
  id v13;
  uint64_t v14;
  uint64_t i;
  void *v16;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  v9 = a5;
  if (((*(uint64_t (**)(void))(*MEMORY[0x1E0D13848] + 16))() & 1) != 0 || (objc_msgSend(v7, "isEqual:", v8) & 1) != 0)
  {
    LOBYTE(v10) = 1;
  }
  else
  {
    +[CNLabeledValue localizedStringForLabel:](CNLabeledValue, "localizedStringForLabel:", v7);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    +[CNLabeledValue localizedStringForLabel:](CNLabeledValue, "localizedStringForLabel:", v8);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v11, "isEqual:", v12) & 1) != 0)
    {
      LOBYTE(v10) = 1;
    }
    else
    {
      v20 = 0u;
      v21 = 0u;
      v18 = 0u;
      v19 = 0u;
      v13 = v9;
      v10 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
      if (v10)
      {
        v14 = *(_QWORD *)v19;
        while (2)
        {
          for (i = 0; i != v10; ++i)
          {
            if (*(_QWORD *)v19 != v14)
              objc_enumerationMutation(v13);
            v16 = *(void **)(*((_QWORD *)&v18 + 1) + 8 * i);
            if (objc_msgSend(v16, "containsObject:", v7, (_QWORD)v18)
              && (objc_msgSend(v16, "containsObject:", v8) & 1) != 0)
            {
              LOBYTE(v10) = 1;
              goto LABEL_17;
            }
          }
          v10 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
          if (v10)
            continue;
          break;
        }
      }
LABEL_17:

    }
  }

  return v10;
}

@end
