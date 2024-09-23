@implementation NSDictionary(IconFoundationAdditions)

- (id)_IF_objectOfClass:()IconFoundationAdditions forKey:
{
  void *v4;
  id v5;

  objc_msgSend(a1, "objectForKey:", a4);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v5 = v4;
  else
    v5 = 0;

  return v5;
}

- (id)_IF_stringForKey:()IconFoundationAdditions
{
  id v4;
  void *v5;

  v4 = a3;
  objc_msgSend(a1, "_IF_objectOfClass:forKey:", objc_opt_class(), v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)_IF_numberForKey:()IconFoundationAdditions
{
  id v4;
  void *v5;

  v4 = a3;
  objc_msgSend(a1, "_IF_objectOfClass:forKey:", objc_opt_class(), v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)_IF_arrayForKey:()IconFoundationAdditions
{
  id v4;
  void *v5;

  v4 = a3;
  objc_msgSend(a1, "_IF_objectOfClass:forKey:", objc_opt_class(), v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)_IF_dictionaryForKey:()IconFoundationAdditions
{
  id v4;
  void *v5;

  v4 = a3;
  objc_msgSend(a1, "_IF_objectOfClass:forKey:", objc_opt_class(), v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)_IF_dataForKey:()IconFoundationAdditions
{
  id v4;
  void *v5;

  v4 = a3;
  objc_msgSend(a1, "_IF_objectOfClass:forKey:", objc_opt_class(), v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (uint64_t)_IF_BOOLForKey:()IconFoundationAdditions
{
  id v4;
  void *v5;
  uint64_t v6;

  v4 = a3;
  objc_msgSend(a1, "_IF_objectOfClass:forKey:", objc_opt_class(), v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = objc_msgSend(v5, "BOOLValue");
  return v6;
}

- (uint64_t)_IF_BOOLForKey:()IconFoundationAdditions defaultValue:
{
  id v6;
  void *v7;

  v6 = a3;
  objc_msgSend(a1, "_IF_objectOfClass:forKey:", objc_opt_class(), v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
    a4 = objc_msgSend(v7, "BOOLValue");

  return a4;
}

- (id)_IF_objectOfClass:()IconFoundationAdditions forKeys:
{
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v5 = a4;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v13;
LABEL_3:
    v9 = 0;
    while (1)
    {
      if (*(_QWORD *)v13 != v8)
        objc_enumerationMutation(v5);
      objc_msgSend(a1, "objectForKey:", *(_QWORD *)(*((_QWORD *)&v12 + 1) + 8 * v9), (_QWORD)v12);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        break;

      if (v7 == ++v9)
      {
        v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
        if (v7)
          goto LABEL_3;
        goto LABEL_9;
      }
    }
  }
  else
  {
LABEL_9:
    v10 = 0;
  }

  return v10;
}

- (id)_IF_stringForKeys:()IconFoundationAdditions
{
  id v4;
  void *v5;

  v4 = a3;
  objc_msgSend(a1, "_IF_objectOfClass:forKeys:", objc_opt_class(), v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)_IF_numberForKeys:()IconFoundationAdditions
{
  id v4;
  void *v5;

  v4 = a3;
  objc_msgSend(a1, "_IF_objectOfClass:forKeys:", objc_opt_class(), v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)_IF_arrayForKeys:()IconFoundationAdditions
{
  id v4;
  void *v5;

  v4 = a3;
  objc_msgSend(a1, "_IF_objectOfClass:forKeys:", objc_opt_class(), v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)_IF_dictionaryForKeys:()IconFoundationAdditions
{
  id v4;
  void *v5;

  v4 = a3;
  objc_msgSend(a1, "_IF_objectOfClass:forKeys:", objc_opt_class(), v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (uint64_t)_IF_BOOLForKeys:()IconFoundationAdditions
{
  id v4;
  void *v5;
  uint64_t v6;

  v4 = a3;
  objc_msgSend(a1, "_IF_objectOfClass:forKeys:", objc_opt_class(), v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = objc_msgSend(v5, "BOOLValue");
  return v6;
}

- (uint64_t)_IF_BOOLForKeys:()IconFoundationAdditions defaultValue:
{
  id v6;
  void *v7;

  v6 = a3;
  objc_msgSend(a1, "_IF_objectOfClass:forKeys:", objc_opt_class(), v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
    a4 = objc_msgSend(v7, "BOOLValue");

  return a4;
}

- (id)_IF_dictionaryAddingEntriesFromDictionary:()IconFoundationAdditions
{
  objc_class *v4;
  id v5;
  void *v6;
  void *v7;

  v4 = (objc_class *)MEMORY[0x1E0C99E08];
  v5 = a3;
  v6 = (void *)objc_msgSend([v4 alloc], "initWithDictionary:", a1);
  objc_msgSend(v6, "addEntriesFromDictionary:", v5);

  v7 = (void *)objc_msgSend(v6, "copy");
  return v7;
}

- (id)_IF_dictionarySubsetForKeys:()IconFoundationAdditions
{
  id v4;
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  uint64_t v11;
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
  v4 = a3;
  v5 = (void *)objc_opt_new();
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v6 = v4;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v17;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v17 != v9)
          objc_enumerationMutation(v6);
        v11 = *(_QWORD *)(*((_QWORD *)&v16 + 1) + 8 * i);
        objc_msgSend(a1, "objectForKeyedSubscript:", v11, (_QWORD)v16);
        v12 = (void *)objc_claimAutoreleasedReturnValue();

        if (v12)
        {
          objc_msgSend(a1, "objectForKeyedSubscript:", v11);
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v5, "setObject:forKey:", v13, v11);

        }
      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    }
    while (v8);
  }

  v14 = (void *)objc_msgSend(v5, "copy");
  return v14;
}

@end
