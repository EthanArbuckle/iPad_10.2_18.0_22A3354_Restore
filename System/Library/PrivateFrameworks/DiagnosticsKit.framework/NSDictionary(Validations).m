@implementation NSDictionary(Validations)

- (id)dk_stringFromKey:()Validations maxLength:defaultValue:failed:
{
  id v10;
  uint64_t v11;
  void *v12;
  id v13;

  v10 = a5;
  objc_msgSend(a1, "objectForKey:", a3);
  v11 = objc_claimAutoreleasedReturnValue();
  if (v11)
  {
    v12 = (void *)v11;
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0 && objc_msgSend(v12, "length") <= a4)
    {
      v13 = v12;
    }
    else
    {
      v13 = v10;

      if (a6)
        *a6 = 1;
    }
  }
  else
  {
    v13 = v10;
  }

  return v13;
}

- (id)dk_stringFromKey:()Validations inSet:defaultValue:failed:
{
  id v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  id v15;

  v10 = a4;
  v11 = a5;
  v12 = a3;
  objc_msgSend(v10, "valueForKeyPath:", CFSTR("@max.length"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "dk_stringFromKey:maxLength:defaultValue:failed:", v12, objc_msgSend(v13, "unsignedIntegerValue"), v11, a6);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  if (v14)
  {
    if ((objc_msgSend(v10, "containsObject:", v14) & 1) != 0)
    {
      v15 = v14;
    }
    else
    {
      v15 = v11;

      if (a6)
        *a6 = 1;
    }
  }
  else
  {
    v15 = 0;
  }

  return v15;
}

- (id)dk_numberFromKey:()Validations lowerBound:upperBound:defaultValue:failed:
{
  id v12;
  id v13;
  id v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  id v18;

  v12 = a4;
  v13 = a5;
  v14 = a6;
  objc_msgSend(a1, "objectForKey:", a3);
  v15 = objc_claimAutoreleasedReturnValue();
  if (v15)
  {
    v16 = (void *)v15;
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0
      && (v17 = objc_msgSend(v16, "compare:", v13), (unint64_t)objc_msgSend(v16, "compare:", v12) <= 1)
      && (unint64_t)(v17 + 1) < 2)
    {
      v18 = v16;
    }
    else
    {
      v18 = v14;

      if (a7)
        *a7 = 1;
    }
  }
  else
  {
    v18 = v14;
  }

  return v18;
}

- (uint64_t)dk_BOOLFromKey:()Validations defaultValue:failed:
{
  void *v7;

  objc_msgSend(a1, "objectForKey:");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      a4 = objc_msgSend(v7, "BOOLValue");
    }
    else if (a5)
    {
      *a5 = 1;
    }
  }

  return a4;
}

- (id)dk_dictionaryFromKey:()Validations defaultValue:failed:
{
  id v8;
  uint64_t v9;
  void *v10;
  id v11;

  v8 = a4;
  objc_msgSend(a1, "objectForKey:", a3);
  v9 = objc_claimAutoreleasedReturnValue();
  if (v9)
  {
    v10 = (void *)v9;
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v11 = v10;
    }
    else
    {
      v11 = v8;

      if (a5)
        *a5 = 1;
    }
  }
  else
  {
    v11 = v8;
  }

  return v11;
}

- (id)dk_dictionaryFromKey:()Validations limitedToKeys:defaultValue:failed:
{
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;

  v10 = a4;
  objc_msgSend(a1, "dk_dictionaryFromKey:defaultValue:failed:", a3, a5, a6);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = v11;
  if (v11)
  {
    v13 = (void *)MEMORY[0x24BDBCEF0];
    objc_msgSend(v11, "allKeys");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setWithArray:", v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v15, "intersectSet:", v10);
    objc_msgSend(v15, "allObjects");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "dictionaryWithValuesForKeys:", v16);
    v17 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v17 = 0;
  }

  return v17;
}

- (uint64_t)dk_arrayFromKey:()Validations types:maxLength:defaultValue:failed:
{
  return objc_msgSend(a1, "dk_arrayFromKey:types:maxLength:defaultValue:failed:validator:", a3, a4, a5, a6, a7, &__block_literal_global_0);
}

- (id)dk_arrayFromKey:()Validations types:maxLength:defaultValue:failed:validator:
{
  id v14;
  id v15;
  unsigned int (**v16)(id, _QWORD);
  uint64_t v17;
  void *v18;
  id v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t i;
  uint64_t v24;
  uint64_t v25;
  objc_class *Superclass;
  uint64_t v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  _BYTE v33[128];
  uint64_t v34;

  v34 = *MEMORY[0x24BDAC8D0];
  v14 = a4;
  v15 = a6;
  v16 = a8;
  objc_msgSend(a1, "objectForKey:", a3);
  v17 = objc_claimAutoreleasedReturnValue();
  if (v17)
  {
    v18 = (void *)v17;
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0 && objc_msgSend(v18, "count") <= a5)
    {
      v31 = 0u;
      v32 = 0u;
      v29 = 0u;
      v30 = 0u;
      v19 = v18;
      v20 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v29, v33, 16);
      if (v20)
      {
        v21 = v20;
        v22 = *(_QWORD *)v30;
        v28 = *(_QWORD *)v30;
        while (2)
        {
          for (i = 0; i != v21; ++i)
          {
            if (*(_QWORD *)v30 != v22)
              objc_enumerationMutation(v19);
            v24 = *(_QWORD *)(*((_QWORD *)&v29 + 1) + 8 * i);
            v25 = objc_opt_class();
            if (!v25)
              goto LABEL_19;
            Superclass = (objc_class *)v25;
            while ((objc_msgSend(v14, "containsObject:", Superclass) & 1) == 0)
            {
              Superclass = class_getSuperclass(Superclass);
              if (!Superclass)
                goto LABEL_19;
            }
            if (!v16[2](v16, v24))
            {
LABEL_19:

              goto LABEL_20;
            }
            v22 = v28;
          }
          v21 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v29, v33, 16);
          if (v21)
            continue;
          break;
        }
      }

    }
    else
    {
LABEL_20:
      v19 = v15;

      if (a7)
        *a7 = 1;
    }
  }
  else
  {
    v19 = v15;
  }

  return v19;
}

- (id)dk_arrayFromKey:()Validations inSet:maxLength:defaultValue:failed:
{
  id v12;
  id v13;
  uint64_t v14;
  void *v15;
  id v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  _BYTE v26[128];
  uint64_t v27;

  v27 = *MEMORY[0x24BDAC8D0];
  v12 = a4;
  v13 = a6;
  objc_msgSend(a1, "objectForKey:", a3);
  v14 = objc_claimAutoreleasedReturnValue();
  if (v14)
  {
    v15 = (void *)v14;
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0 && objc_msgSend(v15, "count") <= a5)
    {
      v24 = 0u;
      v25 = 0u;
      v22 = 0u;
      v23 = 0u;
      v16 = v15;
      v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
      if (v17)
      {
        v18 = v17;
        v19 = *(_QWORD *)v23;
        while (2)
        {
          v20 = 0;
          do
          {
            if (*(_QWORD *)v23 != v19)
              objc_enumerationMutation(v16);
            if (!objc_msgSend(v12, "containsObject:", *(_QWORD *)(*((_QWORD *)&v22 + 1) + 8 * v20), (_QWORD)v22))
            {

              goto LABEL_15;
            }
            ++v20;
          }
          while (v18 != v20);
          v18 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
          if (v18)
            continue;
          break;
        }
      }

    }
    else
    {
LABEL_15:
      v16 = v13;

      if (a7)
        *a7 = 1;
    }
  }
  else
  {
    v16 = v13;
  }

  return v16;
}

- (id)dk_dataFromKey:()Validations minLength:maxLength:defaultValue:failed:
{
  id v12;
  uint64_t v13;
  void *v14;
  id v15;

  v12 = a6;
  objc_msgSend(a1, "objectForKey:", a3);
  v13 = objc_claimAutoreleasedReturnValue();
  if (v13)
  {
    v14 = (void *)v13;
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0 && objc_msgSend(v14, "length") <= a5 && objc_msgSend(v14, "length") >= a4)
    {
      v15 = v14;
    }
    else
    {
      v15 = v12;

      if (a7)
        *a7 = 1;
    }
  }
  else
  {
    v15 = v12;
  }

  return v15;
}

- (__CFString)dk_stringFromRequiredKey:()Validations maxLength:failed:
{
  __CFString *v6;

  objc_msgSend(a1, "dk_stringFromKey:maxLength:defaultValue:failed:", a3, a4, 0, a5);
  v6 = (__CFString *)objc_claimAutoreleasedReturnValue();
  if (!v6)
  {
    if (a5)
      *a5 = 1;
    v6 = &stru_24F99B508;
  }
  return v6;
}

- (id)dk_stringFromRequiredKey:()Validations inSet:failed:
{
  id v8;
  void *v9;

  v8 = a4;
  objc_msgSend(a1, "dk_stringFromKey:inSet:defaultValue:failed:", a3, v8, 0, a5);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v9)
  {
    objc_msgSend(v8, "anyObject");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (a5)
      *a5 = 1;
  }

  return v9;
}

- (id)dk_numberFromRequiredKey:()Validations lowerBound:upperBound:failed:
{
  id v10;
  id v11;

  v10 = a4;
  objc_msgSend(a1, "dk_numberFromKey:lowerBound:upperBound:defaultValue:failed:", a3, v10, a5, 0, a6);
  v11 = (id)objc_claimAutoreleasedReturnValue();
  if (!v11)
  {
    v11 = v10;
    if (a6)
      *a6 = 1;
  }

  return v11;
}

- (uint64_t)dk_BOOLFromRequiredKey:()Validations failed:
{
  id v6;
  void *v7;
  uint64_t v8;

  v6 = a3;
  objc_msgSend(a1, "objectForKey:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    v8 = objc_msgSend(a1, "dk_BOOLFromKey:defaultValue:failed:", v6, 0, a4);
  }
  else
  {
    v8 = 0;
    if (a4)
      *a4 = 1;
  }

  return v8;
}

- (id)dk_dictionaryFromRequiredKey:()Validations failed:
{
  void *v5;

  objc_msgSend(a1, "dk_dictionaryFromKey:defaultValue:failed:", a3, 0, a4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v5)
  {
    if (a4)
      *a4 = 1;
    v5 = (void *)MEMORY[0x24BDBD1B8];
  }
  return v5;
}

- (id)dk_dictionaryFromRequiredKey:()Validations limitedToKeys:failed:
{
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;

  v8 = a4;
  objc_msgSend(a1, "dk_dictionaryFromRequiredKey:failed:", a3, a5);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v9;
  if (v9)
  {
    v11 = (void *)MEMORY[0x24BDBCEF0];
    objc_msgSend(v9, "allKeys");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setWithArray:", v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v13, "intersectSet:", v8);
    objc_msgSend(v13, "allObjects");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "dictionaryWithValuesForKeys:", v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v15 = (void *)MEMORY[0x24BDBD1B8];
  }

  return v15;
}

- (id)dk_arrayFromRequiredKey:()Validations types:maxLength:failed:
{
  void *v7;

  objc_msgSend(a1, "dk_arrayFromKey:types:maxLength:defaultValue:failed:", a3, a4, a5, 0, a6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v7)
  {
    if (a6)
      *a6 = 1;
    v7 = (void *)MEMORY[0x24BDBD1A8];
  }
  return v7;
}

- (id)dk_arrayFromRequiredKey:()Validations types:maxLength:failed:validator:
{
  void *v8;

  objc_msgSend(a1, "dk_arrayFromKey:types:maxLength:defaultValue:failed:validator:", a3, a4, a5, 0, a6, a7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v8)
  {
    if (a6)
      *a6 = 1;
    v8 = (void *)MEMORY[0x24BDBD1A8];
  }
  return v8;
}

- (id)dk_arrayFromRequiredKey:()Validations inSet:maxLength:failed:
{
  void *v7;

  objc_msgSend(a1, "dk_arrayFromKey:inSet:maxLength:defaultValue:failed:", a3, a4, a5, 0, a6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v7)
  {
    if (a6)
      *a6 = 1;
    v7 = (void *)MEMORY[0x24BDBD1A8];
  }
  return v7;
}

- (id)dk_dataFromRequiredKey:()Validations maxLength:failed:
{
  void *v6;

  objc_msgSend(a1, "dk_dataFromKey:minLength:maxLength:defaultValue:failed:", a3, 0, a4, 0, a5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v6)
  {
    objc_msgSend(MEMORY[0x24BDBCE50], "data");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (a5)
      *a5 = 1;
  }
  return v6;
}

@end
