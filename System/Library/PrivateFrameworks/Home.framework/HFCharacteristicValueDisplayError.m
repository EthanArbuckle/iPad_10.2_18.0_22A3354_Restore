@implementation HFCharacteristicValueDisplayError

+ (id)errorWithUnderlyingError:(id)a3 readTraits:(id)a4 contextProvider:(id)a5
{
  id v7;
  id v8;
  id v9;
  void *v10;
  uint64_t v11;
  int v12;
  void *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  int v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  HFCharacteristicValueDisplayError *v25;
  uint64_t v27;

  v7 = a3;
  v8 = a4;
  v9 = a5;
  objc_msgSend(v7, "domain");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = *MEMORY[0x1E0CB8C70];
  v12 = objc_msgSend(v10, "isEqualToString:", *MEMORY[0x1E0CB8C70]);

  if (!v12)
  {
    objc_msgSend(v7, "domain");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = objc_msgSend(v17, "isEqualToString:", CFSTR("HFErrorDomain"));

    if (v18)
    {
      v19 = objc_msgSend(v7, "code");
      if (v19 > 57)
      {
        v20 = 11;
        v21 = 12;
        if (v19 != 72)
          v21 = 0;
        if (v19 != 71)
          v20 = v21;
        v22 = 9;
        v23 = 10;
        if (v19 != 70)
          v23 = 0;
        if (v19 != 58)
          v22 = v23;
        if (v19 <= 70)
          v16 = v22;
        else
          v16 = v20;
      }
      else if ((unint64_t)(v19 - 34) < 2)
      {
        v16 = 1;
      }
      else if (v19 == 4)
      {
        if ((objc_msgSend(v8, "containsObject:", CFSTR("DoesNotSupportNotifications")) & 1) != 0)
        {
          v16 = 5;
        }
        else
        {
          if ((objc_msgSend(v8, "containsObject:", CFSTR("InvalidOrMissingAuthorizationData")) & 1) == 0
            && !objc_msgSend(v8, "containsObject:", CFSTR("AdditionalSetupRequired")))
          {
            v25 = 0;
            goto LABEL_37;
          }
          v16 = 6;
        }
      }
      else if (v19 == 56)
      {
        v16 = 8;
      }
      else
      {
        v16 = 0;
      }
    }
    else
    {
      v16 = 0;
    }
    goto LABEL_35;
  }
  objc_msgSend(v7, "userInfo");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "valueForKey:", *MEMORY[0x1E0CB3388]);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  v15 = objc_msgSend(v7, "code");
  if (v15 > 77)
  {
    if (v15 != 78)
    {
      if (v15 == 87)
      {
        v16 = 6;
        goto LABEL_6;
      }
      v16 = 0;
      if (v15 != 103)
        goto LABEL_6;
LABEL_47:
      v25 = 0;
      goto LABEL_36;
    }
  }
  else
  {
    if ((unint64_t)v15 > 0x3B)
    {
      v16 = 0;
      goto LABEL_6;
    }
    if (((1 << v15) & 0x840000000004300) != 0)
      goto LABEL_5;
    v16 = 0;
    if (v15 != 4)
      goto LABEL_6;
    objc_msgSend(v14, "domain");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v24, "isEqualToString:", v11))
    {
      if (objc_msgSend(v14, "code") == 2400)
      {

        goto LABEL_47;
      }
      v27 = objc_msgSend(v14, "code");

      if (v27 == 2401)
        goto LABEL_47;
    }
    else
    {

    }
  }
LABEL_5:
  v16 = 1;
LABEL_6:

LABEL_35:
  v25 = objc_alloc_init(HFCharacteristicValueDisplayError);
  -[HFCharacteristicValueDisplayError setCategory:](v25, "setCategory:", v16);
  -[HFCharacteristicValueDisplayError setContextProvider:](v25, "setContextProvider:", v9);
  v14 = (void *)objc_msgSend(v7, "copy");
  -[HFCharacteristicValueDisplayError setUnderlyingError:](v25, "setUnderlyingError:", v14);
LABEL_36:

LABEL_37:
  return v25;
}

+ (id)errorWithUnderlyingSymptom:(id)a3 isFixingCurrently:(BOOL)a4 contextProvider:(id)a5
{
  id v6;
  id v7;
  HFCharacteristicValueDisplayError *v8;

  v6 = a5;
  v7 = a3;
  v8 = objc_alloc_init(HFCharacteristicValueDisplayError);
  -[HFCharacteristicValueDisplayError setCategory:](v8, "setCategory:", 7);
  -[HFCharacteristicValueDisplayError setContextProvider:](v8, "setContextProvider:", v6);

  -[HFCharacteristicValueDisplayError setUnderlyingSymptom:](v8, "setUnderlyingSymptom:", v7);
  return v8;
}

+ (id)mostEgregiousError:(id)a3
{
  id v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t i;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  _QWORD v34[2];
  _BYTE v35[128];
  uint64_t v36;

  v36 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  if ((unint64_t)objc_msgSend(v3, "count") > 1)
  {
    objc_msgSend(v3, "na_firstObjectPassingTest:", &__block_literal_global_20_3);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "na_filter:", &__block_literal_global_21_4);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v6;
    if (v5)
    {
      objc_msgSend(v3, "na_firstObjectPassingTest:", &__block_literal_global_22_4);
      v8 = objc_claimAutoreleasedReturnValue();
      v9 = (void *)v8;
      if (v8)
        v10 = (void *)v8;
      else
        v10 = v5;
      v4 = v10;

    }
    else if (objc_msgSend(v6, "count") == 1)
    {
      objc_msgSend(v7, "anyObject");
      v4 = (id)objc_claimAutoreleasedReturnValue();
    }
    else if ((unint64_t)objc_msgSend(v7, "count") < 2)
    {
      v29 = v7;
      objc_msgSend(v3, "na_dictionaryByBucketingObjectsUsingKeyGenerator:", &__block_literal_global_27_5);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v30 = 0u;
      v31 = 0u;
      v32 = 0u;
      v33 = 0u;
      v14 = *MEMORY[0x1E0CB8C70];
      v34[0] = CFSTR("HFErrorDomain");
      v34[1] = v14;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v34, 2);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v30, v35, 16);
      if (v16)
      {
        v17 = v16;
        v18 = *(_QWORD *)v31;
        while (2)
        {
          for (i = 0; i != v17; ++i)
          {
            if (*(_QWORD *)v31 != v18)
              objc_enumerationMutation(v15);
            objc_msgSend(v13, "objectForKeyedSubscript:", *(_QWORD *)(*((_QWORD *)&v30 + 1) + 8 * i));
            v20 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v20, "allObjects");
            v21 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v21, "sortedArrayUsingComparator:", &__block_literal_global_31_2);
            v22 = (void *)objc_claimAutoreleasedReturnValue();

            if (objc_msgSend(v22, "count"))
            {
              v24 = v15;
              goto LABEL_22;
            }

          }
          v17 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v30, v35, 16);
          if (v17)
            continue;
          break;
        }
      }

      objc_msgSend(v13, "allKeys");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "sortedArrayUsingSelector:", sel_compare_);
      v24 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v24, "firstObject");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "objectForKey:", v25);
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "allObjects");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v27, "sortedArrayUsingComparator:", &__block_literal_global_31_2);
      v22 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_22:
      objc_msgSend(v22, "firstObject");
      v4 = (id)objc_claimAutoreleasedReturnValue();

      v7 = v29;
    }
    else
    {
      objc_msgSend(v7, "allObjects");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "sortedArrayUsingComparator:", &__block_literal_global_24_2);
      v12 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v12, "firstObject");
      v4 = (id)objc_claimAutoreleasedReturnValue();

    }
  }
  else
  {
    objc_msgSend(v3, "anyObject");
    v4 = (id)objc_claimAutoreleasedReturnValue();
  }

  return v4;
}

uint64_t __56__HFCharacteristicValueDisplayError_mostEgregiousError___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  uint64_t v3;

  objc_msgSend(a2, "underlyingError");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "hf_isHomeKitUnreachableError");

  return v3;
}

BOOL __56__HFCharacteristicValueDisplayError_mostEgregiousError___block_invoke_2(uint64_t a1, void *a2)
{
  void *v2;
  _BOOL8 v3;

  objc_msgSend(a2, "underlyingSymptom");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2 != 0;

  return v3;
}

BOOL __56__HFCharacteristicValueDisplayError_mostEgregiousError___block_invoke_3(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  _BOOL8 v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v2 = a2;
  objc_msgSend(v2, "underlyingSymptom");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "type") == 11)
  {
    v4 = 1;
  }
  else
  {
    objc_msgSend(v2, "underlyingSymptom");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v5, "type") == 19)
    {
      v4 = 1;
    }
    else
    {
      objc_msgSend(v2, "underlyingSymptom");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v6, "type") == 1)
      {
        v4 = 1;
      }
      else
      {
        objc_msgSend(v2, "underlyingSymptom");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v7, "type") == 20)
        {
          v4 = 1;
        }
        else
        {
          objc_msgSend(v2, "underlyingSymptom");
          v8 = (void *)objc_claimAutoreleasedReturnValue();
          v4 = objc_msgSend(v8, "type") == 2;

        }
      }

    }
  }

  return v4;
}

uint64_t __56__HFCharacteristicValueDisplayError_mostEgregiousError___block_invoke_4(uint64_t a1, void *a2, void *a3)
{
  id v4;
  void *v5;
  void *v6;
  uint64_t (**v7)(_QWORD, _QWORD, _QWORD);
  uint64_t v8;

  v4 = a3;
  objc_msgSend(a2, "underlyingSymptom");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "underlyingSymptom");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CBA8E8], "hf_symptomArraySortComparator");
  v7 = (uint64_t (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
  v8 = ((uint64_t (**)(_QWORD, void *, void *))v7)[2](v7, v5, v6);

  return v8;
}

id __56__HFCharacteristicValueDisplayError_mostEgregiousError___block_invoke_5(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  v2 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend(a2, "underlyingError");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "domain");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stringWithFormat:", CFSTR("%@"), v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

uint64_t __56__HFCharacteristicValueDisplayError_mostEgregiousError___block_invoke_6(uint64_t a1, void *a2, void *a3)
{
  id v4;
  id v5;
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

  v4 = a2;
  v5 = a3;
  objc_msgSend(v4, "underlyingError");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "domain");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "underlyingError");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "domain");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v7, "compare:", v9);

  if (!v10)
  {
    v11 = (void *)MEMORY[0x1E0CB37E8];
    objc_msgSend(v4, "underlyingError");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "numberWithInteger:", objc_msgSend(v12, "code"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = (void *)MEMORY[0x1E0CB37E8];
    objc_msgSend(v5, "underlyingError");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "numberWithInteger:", objc_msgSend(v15, "code"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v13, "compare:", v16);

  }
  return v10;
}

+ (id)errorWithCategory:(unint64_t)a3
{
  HFCharacteristicValueDisplayError *v4;

  v4 = objc_alloc_init(HFCharacteristicValueDisplayError);
  -[HFCharacteristicValueDisplayError setCategory:](v4, "setCategory:", a3);
  return v4;
}

- (BOOL)isPersistentError
{
  void *v3;
  uint64_t v4;

  -[HFCharacteristicValueDisplayError contextProvider](self, "contextProvider");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "hf_remoteAccessState");

  return -[HFCharacteristicValueDisplayError category](self, "category") - 5 < 8 || (unint64_t)(v4 - 1) < 2;
}

- (id)description
{
  void *v3;
  void *v4;
  id v5;
  void *v6;
  id v7;
  void *v8;
  id v9;
  void *v10;

  objc_msgSend(MEMORY[0x1E0D519B8], "builderWithObject:", self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", -[HFCharacteristicValueDisplayError category](self, "category"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (id)objc_msgSend(v3, "appendObject:withName:", v4, CFSTR("category"));

  -[HFCharacteristicValueDisplayError underlyingError](self, "underlyingError");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (id)objc_msgSend(v3, "appendObject:withName:skipIfNil:", v6, CFSTR("error"), 1);

  -[HFCharacteristicValueDisplayError underlyingSymptom](self, "underlyingSymptom");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (id)objc_msgSend(v3, "appendObject:withName:skipIfNil:", v8, CFSTR("symptom"), 1);

  objc_msgSend(v3, "build");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (BOOL)isThreadNetworkError
{
  return -[HFCharacteristicValueDisplayError category](self, "category") == 4
      || -[HFCharacteristicValueDisplayError category](self, "category") == 2
      || -[HFCharacteristicValueDisplayError category](self, "category") == 3;
}

- (unint64_t)category
{
  return self->_category;
}

- (void)setCategory:(unint64_t)a3
{
  self->_category = a3;
}

- (HFCharacteristicOperationContextProviding)contextProvider
{
  return self->_contextProvider;
}

- (void)setContextProvider:(id)a3
{
  objc_storeStrong((id *)&self->_contextProvider, a3);
}

- (NSError)underlyingError
{
  return self->_underlyingError;
}

- (void)setUnderlyingError:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (HMSymptom)underlyingSymptom
{
  return self->_underlyingSymptom;
}

- (void)setUnderlyingSymptom:(id)a3
{
  objc_storeStrong((id *)&self->_underlyingSymptom, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_underlyingSymptom, 0);
  objc_storeStrong((id *)&self->_underlyingError, 0);
  objc_storeStrong((id *)&self->_contextProvider, 0);
}

@end
