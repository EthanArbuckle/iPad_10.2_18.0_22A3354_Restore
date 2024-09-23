@implementation NSMutableDictionary(MCPayload)

- (id)MCValidateAndRemoveNonZeroLengthStringWithKey:()MCPayload isRequired:outError:
{
  id v8;
  void *v9;
  id v10;
  void *v11;

  v8 = a3;
  objc_msgSend(a1, "objectForKey:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (v9)
  {
    objc_msgSend(a1, "removeObjectForKey:", v8);
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      if (!a5)
      {
        v10 = 0;
        goto LABEL_12;
      }
      +[MCPayload badFieldTypeErrorWithField:](MCPayload, "badFieldTypeErrorWithField:", v8);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      goto LABEL_10;
    }
    if (objc_msgSend(v9, "length"))
    {
      v10 = v9;
      goto LABEL_12;
    }
  }
  v10 = 0;
  if (a5 && a4)
  {
    +[MCPayload missingFieldErrorWithField:underlyingError:](MCPayload, "missingFieldErrorWithField:underlyingError:", v8, 0);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_10:
    v10 = 0;
    *a5 = v11;
  }
LABEL_12:

  return v10;
}

- (id)MCValidateAndRemoveObjectOfClass:()MCPayload withKey:isRequired:outError:
{
  id v9;
  void *v10;
  id v11;
  void *v12;

  v9 = a4;
  objc_msgSend(a1, "objectForKey:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (v10)
  {
    objc_msgSend(a1, "removeObjectForKey:", v9);
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v11 = v10;
      goto LABEL_11;
    }
    if (!a6)
    {
      v11 = 0;
      goto LABEL_11;
    }
    +[MCPayload badFieldTypeErrorWithField:](MCPayload, "badFieldTypeErrorWithField:", v9);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_9:
    v11 = 0;
    *a6 = v12;
    goto LABEL_11;
  }
  v11 = 0;
  if (a6 && a5)
  {
    +[MCPayload missingFieldErrorWithField:underlyingError:](MCPayload, "missingFieldErrorWithField:underlyingError:", v9, 0);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_9;
  }
LABEL_11:

  return v11;
}

- (id)MCValidateAndRemoveArrayOfClass:()MCPayload withKey:isRequired:allowZeroLengthString:outError:
{
  id v11;
  void *v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t i;
  void *v18;
  id v19;
  void *v20;
  _QWORD *v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  _BYTE v27[128];
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v11 = a4;
  objc_msgSend(a1, "objectForKey:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v12)
  {
    v19 = 0;
    if (!a7 || !a5)
      goto LABEL_25;
    +[MCPayload missingFieldErrorWithField:underlyingError:](MCPayload, "missingFieldErrorWithField:underlyingError:", v11, 0);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_20:
    v19 = 0;
    *a7 = v20;
    goto LABEL_25;
  }
  objc_msgSend(a1, "removeObjectForKey:", v11);
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    if (!a7)
    {
LABEL_24:
      v19 = 0;
      goto LABEL_25;
    }
    +[MCPayload badFieldTypeErrorWithField:](MCPayload, "badFieldTypeErrorWithField:", v11);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_20;
  }
  v22 = a7;
  v25 = 0u;
  v26 = 0u;
  v23 = 0u;
  v24 = 0u;
  v13 = v12;
  v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
  if (v14)
  {
    v15 = v14;
    v16 = *(_QWORD *)v24;
    while (2)
    {
      for (i = 0; i != v15; ++i)
      {
        if (*(_QWORD *)v24 != v16)
          objc_enumerationMutation(v13);
        v18 = *(void **)(*((_QWORD *)&v23 + 1) + 8 * i);
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          if ((a6 & 1) != 0)
            continue;
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) == 0 || objc_msgSend(v18, "length"))
            continue;
        }
        if (v22)
        {
          +[MCPayload badFieldTypeErrorWithField:](MCPayload, "badFieldTypeErrorWithField:", v11);
          *v22 = (id)objc_claimAutoreleasedReturnValue();
        }

        goto LABEL_24;
      }
      v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
      if (v15)
        continue;
      break;
    }
  }

  v19 = v13;
LABEL_25:

  return v19;
}

- (uint64_t)MCValidateAndRemoveArrayOfClass:()MCPayload withKey:isRequired:outError:
{
  return objc_msgSend(a1, "MCValidateAndRemoveArrayOfClass:withKey:isRequired:allowZeroLengthString:outError:", a3, a4, a5, 1, a6);
}

- (id)MCMutableDictionaryContainingValidatedKeysAndClasses:()MCPayload removeKeys:outError:
{
  id v7;
  void *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  uint64_t v14;
  id v15;
  void *v16;
  void *v17;
  id v18;
  _QWORD *v20;
  void *v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  _BYTE v26[128];
  uint64_t v27;

  v20 = a5;
  v27 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", objc_msgSend(v7, "count"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v7, "count"));
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  v25 = 0u;
  v9 = v7;
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v23;
    while (2)
    {
      for (i = 0; i != v11; ++i)
      {
        if (*(_QWORD *)v23 != v12)
          objc_enumerationMutation(v9);
        v14 = *(_QWORD *)(*((_QWORD *)&v22 + 1) + 8 * i);
        v15 = (id)objc_msgSend(v9, "objectForKeyedSubscript:", v14, v20);
        objc_msgSend(a1, "objectForKeyedSubscript:", v14);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        if (v16)
        {
          if ((objc_opt_isKindOfClass() & 1) == 0)
          {
            if (v20)
            {
              +[MCPayload badFieldTypeErrorWithField:](MCPayload, "badFieldTypeErrorWithField:", v14);
              *v20 = (id)objc_claimAutoreleasedReturnValue();
            }

            v18 = 0;
            v17 = v21;
            goto LABEL_18;
          }
          objc_msgSend(v8, "setObject:forKeyedSubscript:", v16, v14);
          if (a4)
            objc_msgSend(v21, "addObject:", v14);
        }

      }
      v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
      if (v11)
        continue;
      break;
    }
  }

  v17 = v21;
  if (objc_msgSend(v21, "count"))
    objc_msgSend(a1, "removeObjectsForKeys:", v21);
  v18 = v8;
LABEL_18:

  return v18;
}

@end
