@implementation NSDictionary(HMFDeprecated)

- (id)errorFromDataForKey:()HMFDeprecated
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  id v5;

  objc_msgSend(a1, "hmf_dataForKey:");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  if (v1)
  {
    v2 = (void *)MEMORY[0x1E0CB3710];
    objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", objc_opt_class());
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "deserializeObjectWithData:allowedClasses:", v1, v3);
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    if (v4 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
      v5 = v4;
    else
      v5 = 0;

  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (id)secureDescriptionWithIndent:()HMFDeprecated newLine:blacklistedKeys:
{
  __CFString *v7;
  id v8;
  void *v9;
  __CFString *v10;
  __CFString *v11;
  void *v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t i;
  void *v18;
  id v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  void *v25;
  uint64_t v26;
  void *v27;
  uint64_t v28;
  const __CFString *v29;
  __CFString *v31;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  _BYTE v41[128];
  _BYTE v42[128];
  uint64_t v43;

  v43 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a5;
  objc_msgSend(MEMORY[0x1E0CB37A0], "string");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = CFSTR("\n");
  if (!a4)
    v10 = &stru_1E3B39EC0;
  v11 = v10;
  v31 = v11;
  if (v7)
  {
    objc_msgSend(v9, "appendFormat:", CFSTR("%@%@{\n"), v11, v7);
    -[__CFString indentationByLevels:](v7, "indentationByLevels:", 1);
  }
  else
  {
    objc_msgSend(v9, "appendFormat:", CFSTR("%@{\n"), v11);
    +[HMFStringIndentation indentation](HMFStringIndentation, "indentation");
  }
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "allKeys");
  v37 = 0u;
  v38 = 0u;
  v39 = 0u;
  v40 = 0u;
  v13 = (id)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v37, v42, 16);
  if (v14)
  {
    v15 = v14;
    v16 = *(_QWORD *)v38;
    while (2)
    {
      for (i = 0; i != v15; ++i)
      {
        if (*(_QWORD *)v38 != v16)
          objc_enumerationMutation(v13);
        if ((objc_opt_respondsToSelector() & 1) == 0)
        {
          v18 = v13;
          goto LABEL_17;
        }
      }
      v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v37, v42, 16);
      if (v15)
        continue;
      break;
    }
  }

  objc_msgSend(v13, "sortedArrayUsingSelector:", sel_compare_);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_17:

  v35 = 0u;
  v36 = 0u;
  v33 = 0u;
  v34 = 0u;
  v19 = v18;
  v20 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v33, v41, 16);
  if (v20)
  {
    v21 = v20;
    v22 = *(_QWORD *)v34;
    do
    {
      v23 = 0;
      do
      {
        if (*(_QWORD *)v34 != v22)
          objc_enumerationMutation(v19);
        v24 = *(_QWORD *)(*((_QWORD *)&v33 + 1) + 8 * v23);
        if ((objc_msgSend(v8, "containsObject:", v24) & 1) == 0)
        {
          objc_msgSend(v9, "appendFormat:", CFSTR("%@%@ = "), v12, v24);
          objc_msgSend(a1, "objectForKeyedSubscript:", v24);
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
          {
            objc_msgSend(v25, "secureDescriptionWithIndent:newLine:blacklistedKeys:", v12, 1, v8);
            v26 = objc_claimAutoreleasedReturnValue();
          }
          else if (objc_msgSend(v25, "conformsToProtocol:", &unk_1EE3FC8E0)
                 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
          {
            objc_msgSend(v25, "shortDescription");
            v26 = objc_claimAutoreleasedReturnValue();
          }
          else
          {
            objc_msgSend(v25, "description");
            v26 = objc_claimAutoreleasedReturnValue();
          }
          v27 = (void *)v26;
          objc_msgSend(v9, "appendString:", v26);

          objc_msgSend(v9, "appendString:", CFSTR(",\n"));
        }
        ++v23;
      }
      while (v21 != v23);
      v28 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v33, v41, 16);
      v21 = v28;
    }
    while (v28);
  }

  v29 = &stru_1E3B39EC0;
  if (v7)
    v29 = v7;
  objc_msgSend(v9, "appendFormat:", CFSTR("%@}"), v29);

  return v9;
}

- (uint64_t)secureDescriptionWithBlacklistKeys:()HMFDeprecated
{
  return objc_msgSend(a1, "secureDescriptionWithIndent:newLine:blacklistedKeys:", 0, 1, a3);
}

- (id)uuidFromStringForKey:()HMFDeprecated
{
  void *v1;
  void *v2;

  objc_msgSend(a1, "hmf_stringForKey:");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  if (v1)
    v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3A28]), "initWithUUIDString:", v1);
  else
    v2 = 0;

  return v2;
}

- (id)timeZoneFromDataForKey:()HMFDeprecated
{
  void *v1;
  void *v2;

  objc_msgSend(a1, "hmf_dataForKey:");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "decodeTimeZone");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  return v2;
}

- (id)dateComponentsForKey:()HMFDeprecated
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;

  v4 = a3;
  objc_msgSend(a1, "hmf_dateComponentsForKey:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5)
  {
    v7 = v5;
  }
  else
  {
    objc_msgSend(a1, "dateComponentsFromDataForKey:", v4);
    v7 = (id)objc_claimAutoreleasedReturnValue();
  }
  v8 = v7;

  return v8;
}

- (id)dateComponentsFromDataForKey:()HMFDeprecated
{
  void *v1;
  void *v2;

  objc_msgSend(a1, "hmf_dataForKey:");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "decodeDateComponents");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  return v2;
}

- (id)calendarFromDataForKey:()HMFDeprecated
{
  void *v1;
  void *v2;

  objc_msgSend(a1, "hmf_dataForKey:");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "decodeCalendar");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  return v2;
}

- (id)predicateFromDataForKey:()HMFDeprecated
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  _QWORD v9[3];

  v9[2] = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "hmf_dataForKey:");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  if (v1)
  {
    v2 = (void *)MEMORY[0x1E0CB3710];
    v3 = (void *)MEMORY[0x1E0C99E60];
    v9[0] = objc_opt_class();
    v9[1] = objc_opt_class();
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v9, 2);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setWithArray:", v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "deserializeObjectWithData:allowedClasses:", v1, v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (v6 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
      v7 = v6;
    else
      v7 = 0;

  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (id)arrayOfDateComponentsFromDataForKey:()HMFDeprecated
{
  void *v1;
  void *v2;

  objc_msgSend(a1, "hmf_dataForKey:");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "decodeArrayOfDateComponents");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  return v2;
}

@end
