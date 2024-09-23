@implementation NSMutableDictionary(MCUtilities)

- (void)MCDeepCopyEntriesFromDictionary:()MCUtilities
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  void *v12;
  BOOL v13;
  uint64_t v14;
  void *v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v17;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v17 != v7)
          objc_enumerationMutation(v4);
        v9 = *(_QWORD *)(*((_QWORD *)&v16 + 1) + 8 * i);
        objc_msgSend(v4, "objectForKey:", v9);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(a1, "objectForKey:", v9);
        v11 = objc_claimAutoreleasedReturnValue();
        v12 = (void *)v11;
        if (v10)
          v13 = v11 == 0;
        else
          v13 = 1;
        if (!v13)
        {
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0)
            {
              objc_msgSend(v12, "MCDeepCopyEntriesFromDictionary:", v10);
              goto LABEL_18;
            }
          }
        }
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v14 = objc_msgSend(v10, "MCMutableDeepCopy");
        }
        else
        {
          if (!v10)
            goto LABEL_18;
          v14 = objc_msgSend(v10, "copy");
        }
        v15 = (void *)v14;
        objc_msgSend(a1, "setObject:forKey:", v14, v9);

LABEL_18:
      }
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    }
    while (v6);
  }

}

- (void)MCDeepCopyMissingEntriesFromDictionary:()MCUtilities
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  uint64_t v9;
  void *v10;
  void *v11;
  BOOL v12;
  uint64_t v13;
  char isKindOfClass;
  void *v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v17;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v17 != v7)
          objc_enumerationMutation(v4);
        v9 = *(_QWORD *)(*((_QWORD *)&v16 + 1) + 8 * i);
        objc_msgSend(a1, "objectForKey:", v9);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "objectForKey:", v9);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        if (v11)
          v12 = v10 == 0;
        else
          v12 = 1;
        if (v12)
        {
          if (v10)
            goto LABEL_20;
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            v13 = objc_msgSend(v11, "MCMutableDeepCopy");
          }
          else
          {
            if (!v11)
              goto LABEL_20;
            v13 = objc_msgSend(v11, "copy");
          }
          v15 = (void *)v13;
          objc_msgSend(a1, "setObject:forKey:", v13, v9);

        }
        else
        {
          objc_opt_class();
          isKindOfClass = objc_opt_isKindOfClass();
          if ((isKindOfClass & 1) != 0)
          {
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0)
              objc_msgSend(v10, "MCDeepCopyMissingEntriesFromDictionary:", v11);
          }
        }
LABEL_20:

      }
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    }
    while (v6);
  }

}

- (void)MCSetObjectIfNotNil:()MCUtilities forKey:
{
  if (a3)
    return (void *)objc_msgSend(a1, "setObject:forKey:");
  return a1;
}

- (void)MCSetBoolRestriction:()MCUtilities value:
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  id v19;
  _QWORD v20[2];
  _QWORD v21[3];

  v21[2] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  +[MCRestrictionManager sharedManager](MCRestrictionManager, "sharedManager");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "defaultRestrictions");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("restrictedBool"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "objectForKeyedSubscript:", v6);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("preference"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v11)
  {
    v16 = (void *)MEMORY[0x1E0C99DA0];
    v17 = *MEMORY[0x1E0C99778];
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@ is not a BOOL restriction."), v6);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "exceptionWithName:reason:userInfo:", v17, v18, 0);
    v19 = (id)objc_claimAutoreleasedReturnValue();

    objc_exception_throw(v19);
  }
  objc_msgSend(a1, "objectForKeyedSubscript:", CFSTR("restrictedBool"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = (void *)objc_msgSend(v12, "mutableCopy");

  if (!v13)
  {
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v20[0] = CFSTR("preference");
  v20[1] = CFSTR("value");
  v21[0] = v11;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", a4);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v21[1] = v14;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v21, v20, 2);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setObject:forKeyedSubscript:", v15, v6);

  objc_msgSend(a1, "setObject:forKeyedSubscript:", v13, CFSTR("restrictedBool"));
}

- (void)MCDeleteBoolRestriction:()MCUtilities
{
  void *v4;
  void *v5;
  id v6;

  v6 = a3;
  objc_msgSend(a1, "objectForKeyedSubscript:", CFSTR("restrictedBool"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v4, "mutableCopy");

  if (v5)
  {
    objc_msgSend(v5, "removeObjectForKey:", v6);
    objc_msgSend(a1, "setObject:forKeyedSubscript:", v5, CFSTR("restrictedBool"));
  }

}

- (void)MCSetValueRestriction:()MCUtilities value:
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  void *v20;
  id v21;
  _QWORD v22[2];
  _QWORD v23[3];

  v23[2] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  if (v7)
  {
    +[MCRestrictionManager sharedManager](MCRestrictionManager, "sharedManager");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "defaultRestrictions");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("restrictedValue"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "objectForKeyedSubscript:", v6);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("preferSmallerValues"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v12)
    {
      v18 = (void *)MEMORY[0x1E0C99DA0];
      v19 = *MEMORY[0x1E0C99778];
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@ is not a value restriction."), v6);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "exceptionWithName:reason:userInfo:", v19, v20, 0);
      v21 = (id)objc_claimAutoreleasedReturnValue();

      objc_exception_throw(v21);
    }
    objc_msgSend(a1, "objectForKeyedSubscript:", CFSTR("restrictedValue"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = (void *)objc_msgSend(v13, "mutableCopy");

    if (!v14)
    {
      objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
    }
    v22[0] = CFSTR("preferSmallerValues");
    v22[1] = CFSTR("value");
    v23[0] = v12;
    v23[1] = v7;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v23, v22, 2);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setObject:forKeyedSubscript:", v15, v6);

    objc_msgSend(a1, "setObject:forKeyedSubscript:", v14, CFSTR("restrictedValue"));
  }
  else
  {
    objc_msgSend(a1, "objectForKeyedSubscript:", CFSTR("restrictedValue"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = (void *)objc_msgSend(v16, "mutableCopy");

    if (v17)
    {
      objc_msgSend(v17, "removeObjectForKey:", v6);
      objc_msgSend(a1, "setObject:forKeyedSubscript:", v17, CFSTR("restrictedValue"));
    }

  }
}

- (void)MCSetIntersectionRestriction:()MCUtilities values:
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  id v20;
  const __CFString *v21;
  _QWORD v22[2];

  v22[1] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  if (v7)
  {
    +[MCRestrictionManager sharedManager](MCRestrictionManager, "sharedManager");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "defaultRestrictions");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("intersection"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "objectForKeyedSubscript:", v6);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v11)
    {
      v17 = (void *)MEMORY[0x1E0C99DA0];
      v18 = *MEMORY[0x1E0C99778];
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@ is not an intersection restriction."), v6);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "exceptionWithName:reason:userInfo:", v18, v19, 0);
      v20 = (id)objc_claimAutoreleasedReturnValue();

      objc_exception_throw(v20);
    }
    objc_msgSend(a1, "objectForKeyedSubscript:", CFSTR("intersection"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = (void *)objc_msgSend(v12, "mutableCopy");

    if (!v13)
    {
      objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
    }
    v21 = CFSTR("values");
    v22[0] = v7;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v22, &v21, 1);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setObject:forKeyedSubscript:", v14, v6);

    objc_msgSend(a1, "setObject:forKeyedSubscript:", v13, CFSTR("intersection"));
  }
  else
  {
    objc_msgSend(a1, "objectForKeyedSubscript:", CFSTR("intersection"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = (void *)objc_msgSend(v15, "mutableCopy");

    if (v16)
    {
      objc_msgSend(v16, "removeObjectForKey:", v6);
      objc_msgSend(a1, "setObject:forKeyedSubscript:", v16, CFSTR("intersection"));
    }

  }
}

- (void)MCSetUnionRestriction:()MCUtilities values:
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  id v20;
  const __CFString *v21;
  _QWORD v22[2];

  v22[1] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  if (v7)
  {
    +[MCRestrictionManager sharedManager](MCRestrictionManager, "sharedManager");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "defaultRestrictions");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("union"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "objectForKeyedSubscript:", v6);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v11)
    {
      v17 = (void *)MEMORY[0x1E0C99DA0];
      v18 = *MEMORY[0x1E0C99778];
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@ is not an union restriction."), v6);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "exceptionWithName:reason:userInfo:", v18, v19, 0);
      v20 = (id)objc_claimAutoreleasedReturnValue();

      objc_exception_throw(v20);
    }
    objc_msgSend(a1, "objectForKeyedSubscript:", CFSTR("union"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = (void *)objc_msgSend(v12, "mutableCopy");

    if (!v13)
    {
      objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
    }
    v21 = CFSTR("values");
    v22[0] = v7;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v22, &v21, 1);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setObject:forKeyedSubscript:", v14, v6);

    objc_msgSend(a1, "setObject:forKeyedSubscript:", v13, CFSTR("union"));
  }
  else
  {
    objc_msgSend(a1, "objectForKeyedSubscript:", CFSTR("union"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = (void *)objc_msgSend(v15, "mutableCopy");

    if (v16)
    {
      objc_msgSend(v16, "removeObjectForKey:", v6);
      objc_msgSend(a1, "setObject:forKeyedSubscript:", v16, CFSTR("union"));
    }

  }
}

- (void)MCSetIntersectionSetting:()MCUtilities values:
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  id v20;
  const __CFString *v21;
  _QWORD v22[2];

  v22[1] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  if (v7)
  {
    +[MCRestrictionManager sharedManager](MCRestrictionManager, "sharedManager");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "defaultSettings");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("intersection"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "objectForKeyedSubscript:", v6);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v11)
    {
      v17 = (void *)MEMORY[0x1E0C99DA0];
      v18 = *MEMORY[0x1E0C99778];
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@ is not an intersection setting."), v6);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "exceptionWithName:reason:userInfo:", v18, v19, 0);
      v20 = (id)objc_claimAutoreleasedReturnValue();

      objc_exception_throw(v20);
    }
    objc_msgSend(a1, "objectForKeyedSubscript:", CFSTR("intersection"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = (void *)objc_msgSend(v12, "mutableCopy");

    if (!v13)
    {
      objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
    }
    v21 = CFSTR("values");
    v22[0] = v7;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v22, &v21, 1);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setObject:forKeyedSubscript:", v14, v6);

    objc_msgSend(a1, "setObject:forKeyedSubscript:", v13, CFSTR("intersection"));
  }
  else
  {
    objc_msgSend(a1, "objectForKeyedSubscript:", CFSTR("intersection"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = (void *)objc_msgSend(v15, "mutableCopy");

    if (v16)
    {
      objc_msgSend(v16, "removeObjectForKey:", v6);
      objc_msgSend(a1, "setObject:forKeyedSubscript:", v16, CFSTR("intersection"));
    }

  }
}

- (void)MCSetUnionSetting:()MCUtilities values:
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  id v20;
  const __CFString *v21;
  _QWORD v22[2];

  v22[1] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  if (v7)
  {
    +[MCRestrictionManager sharedManager](MCRestrictionManager, "sharedManager");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "defaultSettings");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("union"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "objectForKeyedSubscript:", v6);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v11)
    {
      v17 = (void *)MEMORY[0x1E0C99DA0];
      v18 = *MEMORY[0x1E0C99778];
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@ is not an union setting."), v6);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "exceptionWithName:reason:userInfo:", v18, v19, 0);
      v20 = (id)objc_claimAutoreleasedReturnValue();

      objc_exception_throw(v20);
    }
    objc_msgSend(a1, "objectForKeyedSubscript:", CFSTR("union"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = (void *)objc_msgSend(v12, "mutableCopy");

    if (!v13)
    {
      objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
    }
    v21 = CFSTR("values");
    v22[0] = v7;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v22, &v21, 1);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setObject:forKeyedSubscript:", v14, v6);

    objc_msgSend(a1, "setObject:forKeyedSubscript:", v13, CFSTR("union"));
  }
  else
  {
    objc_msgSend(a1, "objectForKeyedSubscript:", CFSTR("union"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = (void *)objc_msgSend(v15, "mutableCopy");

    if (v16)
    {
      objc_msgSend(v16, "removeObjectForKey:", v6);
      objc_msgSend(a1, "setObject:forKeyedSubscript:", v16, CFSTR("union"));
    }

  }
}

- (void)MCFilterRestrictionPayloadKeys:()MCUtilities
{
  id v4;
  void *v5;
  void (**v6)(_QWORD, _QWORD);
  _QWORD v7[5];
  id v8;

  v4 = a3;
  v5 = v4;
  if (v4)
  {
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __67__NSMutableDictionary_MCUtilities__MCFilterRestrictionPayloadKeys___block_invoke;
    v7[3] = &unk_1E41E0950;
    v7[4] = a1;
    v8 = v4;
    v6 = (void (**)(_QWORD, _QWORD))MEMORY[0x1A1AF040C](v7);
    ((void (**)(_QWORD, const __CFString *))v6)[2](v6, CFSTR("restrictedBool"));
    ((void (**)(_QWORD, const __CFString *))v6)[2](v6, CFSTR("restrictedValue"));
    ((void (**)(_QWORD, const __CFString *))v6)[2](v6, CFSTR("intersection"));
    ((void (**)(_QWORD, const __CFString *))v6)[2](v6, CFSTR("union"));

  }
}

- (void)MCFixUpRestrictionsDictionaryForMDMReporting
{
  void *v1;
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
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  void *v26;
  void *v27;
  BOOL v28;
  id v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t i;
  id v34;
  void *v35;
  void *v36;
  uint64_t v37;
  uint64_t v38;
  id obj;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  _BYTE v48[128];
  _BYTE v49[128];
  uint64_t v50;

  v1 = a1;
  v50 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "objectForKey:", CFSTR("restrictedValue"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2)
  {
    v4 = (void *)objc_msgSend(v2, "mutableCopy");
    objc_msgSend(v4, "objectForKey:", CFSTR("maxGracePeriod"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = v5;
    if (v5)
    {
      v7 = (void *)objc_msgSend(v5, "mutableCopy");
      objc_msgSend(v7, "valueForKey:", CFSTR("value"));
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = v8;
      if (v8)
      {
        v10 = v1;
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLong:", objc_msgSend(v8, "longValue") / 60);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "setObject:forKey:", v11, CFSTR("value"));

        v1 = v10;
      }
      objc_msgSend(v4, "setObject:forKey:", v7, CFSTR("maxGracePeriod"));

    }
    objc_msgSend(v4, "objectForKey:", CFSTR("maxInactivity"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = v12;
    if (v12)
    {
      v14 = (void *)objc_msgSend(v12, "mutableCopy");
      objc_msgSend(v14, "valueForKey:", CFSTR("value"));
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = v15;
      if (v15)
      {
        v17 = v1;
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLong:", objc_msgSend(v15, "longValue") / 60);
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "setObject:forKey:", v18, CFSTR("value"));

        v1 = v17;
      }
      objc_msgSend(v4, "setObject:forKey:", v14, CFSTR("maxInactivity"));

    }
    objc_msgSend(v1, "setObject:forKey:", v4, CFSTR("restrictedValue"));

  }
  objc_msgSend(v1, "objectForKey:", CFSTR("intersection"));
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  if (v19)
  {
    v34 = v19;
    v35 = v1;
    v36 = v3;
    v20 = (void *)objc_msgSend(v19, "mutableCopy");
    +[MCRestrictionUtilities intersectionFeaturesWithPayloadRestictionKeyAlias](MCRestrictionUtilities, "intersectionFeaturesWithPayloadRestictionKeyAlias");
    v44 = 0u;
    v45 = 0u;
    v46 = 0u;
    v47 = 0u;
    obj = (id)objc_claimAutoreleasedReturnValue();
    v21 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v44, v49, 16);
    if (v21)
    {
      v22 = v21;
      v23 = *(_QWORD *)v45;
      v37 = *(_QWORD *)v45;
      do
      {
        v24 = 0;
        v38 = v22;
        do
        {
          if (*(_QWORD *)v45 != v23)
            objc_enumerationMutation(obj);
          v25 = *(_QWORD *)(*((_QWORD *)&v44 + 1) + 8 * v24);
          +[MCRestrictionUtilities intersectionPayloadRestrictionKeysForFeature:](MCRestrictionUtilities, "intersectionPayloadRestrictionKeysForFeature:", v25);
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v20, "objectForKey:", v25);
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          if (v27)
            v28 = v26 == 0;
          else
            v28 = 1;
          if (!v28)
          {
            v42 = 0u;
            v43 = 0u;
            v40 = 0u;
            v41 = 0u;
            v29 = v26;
            v30 = objc_msgSend(v29, "countByEnumeratingWithState:objects:count:", &v40, v48, 16);
            if (v30)
            {
              v31 = v30;
              v32 = *(_QWORD *)v41;
              do
              {
                for (i = 0; i != v31; ++i)
                {
                  if (*(_QWORD *)v41 != v32)
                    objc_enumerationMutation(v29);
                  objc_msgSend(v20, "setObject:forKey:", v27, *(_QWORD *)(*((_QWORD *)&v40 + 1) + 8 * i));
                }
                v31 = objc_msgSend(v29, "countByEnumeratingWithState:objects:count:", &v40, v48, 16);
              }
              while (v31);
            }

            objc_msgSend(v20, "removeObjectForKey:", v25);
            v23 = v37;
            v22 = v38;
          }

          ++v24;
        }
        while (v24 != v22);
        v22 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v44, v49, 16);
      }
      while (v22);
    }

    objc_msgSend(v35, "setObject:forKey:", v20, CFSTR("intersection"));
    v3 = v36;
    v19 = v34;
  }

}

- (void)MCSanitizeRestrictions
{
  void *v2;
  void *v3;
  void *v4;
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
  id v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t j;
  uint64_t v20;
  void *v21;
  void *v22;
  void *v23;
  id v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t k;
  uint64_t v29;
  void *v30;
  void *v31;
  void *v32;
  id v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t m;
  uint64_t v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  _BYTE v60[128];
  _BYTE v61[128];
  _BYTE v62[128];
  _BYTE v63[128];
  uint64_t v64;

  v64 = *MEMORY[0x1E0C80C00];
  +[MCRestrictionManager sharedManager](MCRestrictionManager, "sharedManager");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "defaultRestrictions");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(a1, "objectForKeyedSubscript:", CFSTR("restrictedBool"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v4, "mutableCopy");
  v56 = 0u;
  v57 = 0u;
  v58 = 0u;
  v59 = 0u;
  v6 = v4;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v56, v63, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v57;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v57 != v9)
          objc_enumerationMutation(v6);
        v11 = *(_QWORD *)(*((_QWORD *)&v56 + 1) + 8 * i);
        if ((objc_msgSend(a1, "MCValidateBoolRestriction:inRestrictions:defaultRestrictions:", v11, v6, v3) & 1) == 0)
          objc_msgSend(v5, "setObject:forKeyedSubscript:", 0, v11);
      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v56, v63, 16);
    }
    while (v8);
  }
  v42 = v6;

  v12 = (void *)objc_msgSend(v5, "copy");
  objc_msgSend(a1, "setObject:forKeyedSubscript:", v12, CFSTR("restrictedBool"));

  objc_msgSend(a1, "objectForKeyedSubscript:", CFSTR("restrictedValue"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = (void *)objc_msgSend(v13, "mutableCopy");
  v52 = 0u;
  v53 = 0u;
  v54 = 0u;
  v55 = 0u;
  v15 = v13;
  v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v52, v62, 16);
  if (v16)
  {
    v17 = v16;
    v18 = *(_QWORD *)v53;
    do
    {
      for (j = 0; j != v17; ++j)
      {
        if (*(_QWORD *)v53 != v18)
          objc_enumerationMutation(v15);
        v20 = *(_QWORD *)(*((_QWORD *)&v52 + 1) + 8 * j);
        if ((objc_msgSend(a1, "MCValidateValueRestriction:inRestrictions:defaultRestrictions:", v20, v15, v3) & 1) == 0)
          objc_msgSend(v14, "setObject:forKeyedSubscript:", 0, v20);
      }
      v17 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v52, v62, 16);
    }
    while (v17);
  }
  v43 = v5;

  v41 = v14;
  v21 = (void *)objc_msgSend(v14, "copy");
  objc_msgSend(a1, "setObject:forKeyedSubscript:", v21, CFSTR("restrictedValue"));

  objc_msgSend(a1, "objectForKeyedSubscript:", CFSTR("intersection"));
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = (void *)objc_msgSend(v22, "mutableCopy");
  v48 = 0u;
  v49 = 0u;
  v50 = 0u;
  v51 = 0u;
  v24 = v22;
  v25 = objc_msgSend(v24, "countByEnumeratingWithState:objects:count:", &v48, v61, 16);
  if (v25)
  {
    v26 = v25;
    v27 = *(_QWORD *)v49;
    do
    {
      for (k = 0; k != v26; ++k)
      {
        if (*(_QWORD *)v49 != v27)
          objc_enumerationMutation(v24);
        v29 = *(_QWORD *)(*((_QWORD *)&v48 + 1) + 8 * k);
        if ((objc_msgSend(a1, "MCValidateIntersectionRestriction:inRestrictions:defaultRestrictions:", v29, v24, v3) & 1) == 0)
          objc_msgSend(v23, "setObject:forKeyedSubscript:", 0, v29);
      }
      v26 = objc_msgSend(v24, "countByEnumeratingWithState:objects:count:", &v48, v61, 16);
    }
    while (v26);
  }

  v40 = v23;
  v30 = (void *)objc_msgSend(v23, "copy");
  objc_msgSend(a1, "setObject:forKeyedSubscript:", v30, CFSTR("intersection"));

  objc_msgSend(a1, "objectForKeyedSubscript:");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  v32 = (void *)objc_msgSend(v31, "mutableCopy");
  v44 = 0u;
  v45 = 0u;
  v46 = 0u;
  v47 = 0u;
  v33 = v31;
  v34 = objc_msgSend(v33, "countByEnumeratingWithState:objects:count:", &v44, v60, 16);
  if (v34)
  {
    v35 = v34;
    v36 = *(_QWORD *)v45;
    do
    {
      for (m = 0; m != v35; ++m)
      {
        if (*(_QWORD *)v45 != v36)
          objc_enumerationMutation(v33);
        v38 = *(_QWORD *)(*((_QWORD *)&v44 + 1) + 8 * m);
        if ((objc_msgSend(a1, "MCValidateUnionRestriction:inRestrictions:defaultRestrictions:", v38, v33, v3) & 1) == 0)
          objc_msgSend(v32, "setObject:forKeyedSubscript:", 0, v38);
      }
      v35 = objc_msgSend(v33, "countByEnumeratingWithState:objects:count:", &v44, v60, 16);
    }
    while (v35);
  }

  v39 = (void *)objc_msgSend(v32, "copy");
  objc_msgSend(a1, "setObject:forKeyedSubscript:", v39, CFSTR("union"));

}

@end
