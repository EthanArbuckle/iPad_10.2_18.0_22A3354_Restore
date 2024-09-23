@implementation NSDictionary(VSAdditions)

- (id)vs_objectOfClass:()VSAdditions forKey:
{
  void *v4;

  objc_msgSend(a1, "objectForKey:", a4);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {

    v4 = 0;
  }
  return v4;
}

- (id)vs_dictionaryForKey:()VSAdditions
{
  id v4;
  void *v5;

  v4 = a3;
  objc_msgSend(a1, "vs_objectOfClass:forKey:", objc_opt_class(), v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)vs_arrayForKey:()VSAdditions
{
  id v4;
  void *v5;

  v4 = a3;
  objc_msgSend(a1, "vs_objectOfClass:forKey:", objc_opt_class(), v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)vs_arrayOfKindOfClass:()VSAdditions forKey:
{
  void *v5;
  void *v6;
  void *v7;
  _QWORD v9[5];

  objc_msgSend(a1, "vs_arrayForKey:", a4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __58__NSDictionary_VSAdditions__vs_arrayOfKindOfClass_forKey___block_invoke;
  v9[3] = &__block_descriptor_40_e25_B24__0_8__NSDictionary_16lu32l8;
  v9[4] = a3;
  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithBlock:", v9);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "filteredArrayUsingPredicate:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (id)vs_arrayOfStringsForKey:()VSAdditions
{
  id v4;
  void *v5;

  v4 = a3;
  objc_msgSend(a1, "vs_arrayOfKindOfClass:forKey:", objc_opt_class(), v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)vs_arrayOfNumbersForKey:()VSAdditions
{
  id v4;
  void *v5;

  v4 = a3;
  objc_msgSend(a1, "vs_arrayOfKindOfClass:forKey:", objc_opt_class(), v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)vs_arrayOfDictionariesForKey:()VSAdditions
{
  id v4;
  void *v5;

  v4 = a3;
  objc_msgSend(a1, "vs_arrayOfKindOfClass:forKey:", objc_opt_class(), v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)vs_numberForKey:()VSAdditions
{
  id v4;
  void *v5;

  v4 = a3;
  objc_msgSend(a1, "vs_objectOfClass:forKey:", objc_opt_class(), v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (uint64_t)vs_BOOLForKey:()VSAdditions
{
  void *v1;
  uint64_t v2;

  objc_msgSend(a1, "vs_numberForKey:");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = objc_msgSend(v1, "BOOLValue");

  return v2;
}

- (id)vs_stringForKey:()VSAdditions
{
  id v4;
  void *v5;

  v4 = a3;
  objc_msgSend(a1, "vs_objectOfClass:forKey:", objc_opt_class(), v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)vs_objectForCaseInsensitiveKey:()VSAdditions
{
  id v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  uint64_t v10;
  void *v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(a1, "allKeys");
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v5 = (id)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v14;
    while (2)
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v14 != v8)
          objc_enumerationMutation(v5);
        v10 = *(_QWORD *)(*((_QWORD *)&v13 + 1) + 8 * i);
        if (!objc_msgSend(v4, "caseInsensitiveCompare:", v10, (_QWORD)v13))
        {
          objc_msgSend(a1, "objectForKey:", v10);
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          goto LABEL_11;
        }
      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
      if (v7)
        continue;
      break;
    }
  }
  v11 = 0;
LABEL_11:

  return v11;
}

- (id)vs_objectForNormalizedKey:()VSAdditions
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v20;
  id v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  _BYTE v26[128];
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(a1, "allKeys");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3500], "whitespaceCharacterSet");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "componentsSeparatedByCharactersInSet:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "componentsJoinedByString:", &stru_1E93A8CC0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v24 = 0u;
  v25 = 0u;
  v22 = 0u;
  v23 = 0u;
  v9 = v5;
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
  if (v10)
  {
    v11 = v10;
    v20 = a1;
    v21 = v4;
    v12 = *(_QWORD *)v23;
    while (2)
    {
      for (i = 0; i != v11; ++i)
      {
        if (*(_QWORD *)v23 != v12)
          objc_enumerationMutation(v9);
        v14 = *(void **)(*((_QWORD *)&v22 + 1) + 8 * i);
        objc_msgSend(MEMORY[0x1E0CB3500], "whitespaceCharacterSet", v20);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "componentsSeparatedByCharactersInSet:", v15);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "componentsJoinedByString:", &stru_1E93A8CC0);
        v17 = (void *)objc_claimAutoreleasedReturnValue();

        if (!objc_msgSend(v8, "caseInsensitiveCompare:", v17))
        {
          objc_msgSend(v20, "objectForKey:", v14);
          v18 = (void *)objc_claimAutoreleasedReturnValue();

          goto LABEL_11;
        }

      }
      v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
      if (v11)
        continue;
      break;
    }
    v18 = 0;
LABEL_11:
    v4 = v21;
  }
  else
  {
    v18 = 0;
  }

  return v18;
}

@end
