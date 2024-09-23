@implementation CNMultiValueReorderUpdate

- (BOOL)applyToABPerson:(void *)a3 abmultivalue:(void *)a4 propertyDescription:(id)a5 isUnified:(BOOL)a6 logger:(id)a7 error:(id *)a8
{
  id v12;
  id v13;
  NSOrderedSet *values;
  void *v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  BOOL v20;
  CNMultiValueReorderUpdate *v21;
  uint64_t v22;
  uint64_t v23;
  unint64_t v24;
  id v25;
  uint64_t v26;
  int inserted;
  void *v29;
  CFTypeRef v30;
  CFStringRef v31;
  void *v32;
  BOOL v33;
  void *v34;
  void *v35;
  void *v36;
  id *v38;
  id v39;
  void *v40;
  CNMultiValueReorderUpdate *v41;
  unint64_t v43;
  id v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  void *v49;
  const __CFString *v50;
  void *v51;
  _BYTE v52[128];
  uint64_t v53;

  v53 = *MEMORY[0x1E0C80C00];
  v12 = a5;
  v13 = a7;
  values = self->_values;
  objc_msgSend(v12, "key");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "applyContactUpdateOfKind:value:property:", "multi value reorder", values, v15);

  v47 = 0u;
  v48 = 0u;
  v45 = 0u;
  v46 = 0u;
  v41 = self;
  -[CNMultiValueReorderUpdate values](self, "values");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v45, v52, 16);
  if (!v17)
  {
    v32 = v16;
    v33 = 1;
LABEL_31:

    goto LABEL_33;
  }
  v18 = v17;
  v38 = a8;
  v39 = v13;
  v40 = v12;
  v43 = 0;
  v19 = *(_QWORD *)v46;
  v20 = a6;
  v21 = self;
LABEL_3:
  v22 = 0;
  while (1)
  {
    if (*(_QWORD *)v46 != v19)
      objc_enumerationMutation(v16);
    v23 = *(_QWORD *)(*((_QWORD *)&v45 + 1) + 8 * v22);
    v44 = 0;
    v24 = -[CNMultiValueUpdate multiValueIndexForValue:inMultiValue:identifier:](v21, "multiValueIndexForValue:inMultiValue:identifier:", v23, a4, &v44);
    v25 = v44;
    if (v24 == -1 && v20)
      goto LABEL_24;
    v26 = v19;
    inserted = v24 != -1;
    if (v24 == -1 || v24 <= v43)
      goto LABEL_22;
    v29 = v16;
    v30 = ABMultiValueCopyValueAtIndex(a4, v24);
    v31 = ABMultiValueCopyLabelAtIndex(a4, v24);
    if (ABMultiValueRemoveValueAndLabelAtIndex(a4, v24))
    {
      inserted = ABMultiValueInsertValueAndLabelAndUUIDAtIndex();
      if (!v30)
        goto LABEL_18;
LABEL_17:
      CFRelease(v30);
      goto LABEL_18;
    }
    inserted = 0;
    if (v30)
      goto LABEL_17;
LABEL_18:
    if (v31)
    {
      CFRelease(v31);
      v16 = v29;
      v20 = a6;
      v21 = v41;
      if ((inserted & 1) == 0)
        break;
      goto LABEL_23;
    }
    v16 = v29;
    v20 = a6;
    v21 = v41;
LABEL_22:
    if (!inserted)
      break;
LABEL_23:
    ++v43;
    v19 = v26;
LABEL_24:

    if (v18 == ++v22)
    {
      v18 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v45, v52, 16);
      if (v18)
        goto LABEL_3;
      v32 = v16;
      v33 = 1;
      v12 = v40;
      goto LABEL_29;
    }
  }

  if (v38)
  {
    v50 = CFSTR("CNKeyPaths");
    v12 = v40;
    objc_msgSend(v40, "key");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    v49 = v32;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v49, 1);
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    v51 = v34;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v51, &v50, 1);
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    +[CNErrorFactory genericiOSABError](CNErrorFactory, "genericiOSABError");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    +[CNErrorFactory errorByAddingUserInfoEntries:toError:](CNErrorFactory, "errorByAddingUserInfoEntries:toError:", v35, v36);
    *v38 = (id)objc_claimAutoreleasedReturnValue();

    v33 = 0;
LABEL_29:
    v13 = v39;
    goto LABEL_31;
  }
  v33 = 0;
  v13 = v39;
  v12 = v40;
LABEL_33:

  return v33;
}

- (CNMultiValueReorderUpdate)initWithValues:(id)a3
{
  id v4;
  CNMultiValueReorderUpdate *v5;
  uint64_t v6;
  NSOrderedSet *values;
  CNMultiValueReorderUpdate *v8;
  objc_super v10;

  v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)CNMultiValueReorderUpdate;
  v5 = -[CNMultiValueReorderUpdate init](&v10, sel_init);
  if (v5)
  {
    v6 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99E40]), "initWithArray:", v4);
    values = v5->_values;
    v5->_values = (NSOrderedSet *)v6;

    v8 = v5;
  }

  return v5;
}

- (void)applyToMutableMultiValue:(id)a3 withIdentifierMap:(id)a4
{
  _QWORD v4[5];

  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __72__CNMultiValueReorderUpdate_applyToMutableMultiValue_withIdentifierMap___block_invoke;
  v4[3] = &unk_1E29FDD98;
  v4[4] = self;
  objc_msgSend(a3, "sortUsingComparator:", v4, a4);
}

uint64_t __72__CNMultiValueReorderUpdate_applyToMutableMultiValue_withIdentifierMap___block_invoke(uint64_t a1, void *a2, void *a3)
{
  void *v4;
  id v5;
  void *v6;
  void *v7;
  uint64_t v8;

  v4 = *(void **)(a1 + 32);
  v5 = a3;
  objc_msgSend(a2, "identifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "identifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = objc_msgSend(v4, "compareIndexOfIdentifier:toIndexOfIdentifier:", v6, v7);
  return v8;
}

- (int64_t)compareIndexOfIdentifier:(id)a3 toIndexOfIdentifier:(id)a4
{
  id v6;
  id v7;
  NSOrderedSet *values;
  uint64_t v9;
  id v10;
  unint64_t v11;
  NSOrderedSet *v12;
  id v13;
  unint64_t v14;
  int64_t v15;
  _QWORD v17[4];
  id v18;
  _QWORD v19[4];
  id v20;

  v6 = a3;
  v7 = a4;
  values = self->_values;
  v9 = MEMORY[0x1E0C809B0];
  v19[0] = MEMORY[0x1E0C809B0];
  v19[1] = 3221225472;
  v19[2] = __74__CNMultiValueReorderUpdate_compareIndexOfIdentifier_toIndexOfIdentifier___block_invoke;
  v19[3] = &unk_1E29F9058;
  v20 = v6;
  v10 = v6;
  v11 = -[NSOrderedSet indexOfObjectPassingTest:](values, "indexOfObjectPassingTest:", v19);
  v12 = self->_values;
  v17[0] = v9;
  v17[1] = 3221225472;
  v17[2] = __74__CNMultiValueReorderUpdate_compareIndexOfIdentifier_toIndexOfIdentifier___block_invoke_2;
  v17[3] = &unk_1E29F9058;
  v18 = v7;
  v13 = v7;
  v14 = -[NSOrderedSet indexOfObjectPassingTest:](v12, "indexOfObjectPassingTest:", v17);
  if (v11 < v14)
    v15 = -1;
  else
    v15 = v11 > v14;

  return v15;
}

uint64_t __74__CNMultiValueReorderUpdate_compareIndexOfIdentifier_toIndexOfIdentifier___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;

  objc_msgSend(a2, "identifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isEqualToString:", *(_QWORD *)(a1 + 32));

  return v4;
}

uint64_t __74__CNMultiValueReorderUpdate_compareIndexOfIdentifier_toIndexOfIdentifier___block_invoke_2(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;

  objc_msgSend(a2, "identifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isEqualToString:", *(_QWORD *)(a1 + 32));

  return v4;
}

- (id)description
{
  void *v3;
  id v4;
  void *v5;

  objc_msgSend(MEMORY[0x1E0D13A08], "descriptionBuilderWithObject:", self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (id)objc_msgSend(v3, "appendNamesAndObjects:", CFSTR("values"), self->_values, 0);
  objc_msgSend(v3, "build");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (NSOrderedSet)values
{
  return self->_values;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_values, 0);
}

@end
