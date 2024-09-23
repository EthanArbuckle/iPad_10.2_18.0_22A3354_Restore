@implementation NSArray(HMFDeprecated)

- (id)secureDescriptionWithIndent:()HMFDeprecated newLine:blacklistedKeys:
{
  __CFString *v8;
  id v9;
  void *v10;
  __CFString *v11;
  __CFString *v12;
  void *v13;
  id v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  uint64_t v20;
  void *v21;
  uint64_t v22;
  const __CFString *v23;
  __CFString *v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  _BYTE v30[128];
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a5;
  objc_msgSend(MEMORY[0x1E0CB37A0], "string");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = CFSTR("\n");
  if (!a4)
    v11 = &stru_1E3B39EC0;
  v12 = v11;
  v25 = v12;
  if (v8)
  {
    objc_msgSend(v10, "appendFormat:", CFSTR("%@%@(\n"), v12, v8, v12);
    -[__CFString indentationByLevels:](v8, "indentationByLevels:", 1);
  }
  else
  {
    objc_msgSend(v10, "appendFormat:", CFSTR("%@(\n"), v12);
    +[HMFStringIndentation indentation](HMFStringIndentation, "indentation");
  }
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v28 = 0u;
  v29 = 0u;
  v26 = 0u;
  v27 = 0u;
  v14 = a1;
  v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v26, v30, 16);
  if (v15)
  {
    v16 = v15;
    v17 = *(_QWORD *)v27;
    do
    {
      v18 = 0;
      do
      {
        if (*(_QWORD *)v27 != v17)
          objc_enumerationMutation(v14);
        v19 = *(void **)(*((_QWORD *)&v26 + 1) + 8 * v18);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
        {
          objc_msgSend(v19, "secureDescriptionWithIndent:newLine:blacklistedKeys:", v13, 0, v9);
          v20 = objc_claimAutoreleasedReturnValue();
LABEL_14:
          v21 = (void *)v20;
          objc_msgSend(v10, "appendString:", v20);
          goto LABEL_15;
        }
        if (objc_msgSend(v19, "conformsToProtocol:", &unk_1EE3FC8E0)
          || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
        {
          objc_msgSend(v19, "shortDescription");
          v20 = objc_claimAutoreleasedReturnValue();
          goto LABEL_14;
        }
        objc_msgSend(v19, "description");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "appendFormat:", CFSTR("%@%@"), v13, v21);
LABEL_15:

        objc_msgSend(v10, "appendString:", CFSTR(",\n"));
        ++v18;
      }
      while (v16 != v18);
      v22 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v26, v30, 16);
      v16 = v22;
    }
    while (v22);
  }

  v23 = &stru_1E3B39EC0;
  if (v8)
    v23 = v8;
  objc_msgSend(v10, "appendFormat:", CFSTR("%@)"), v23);

  return v10;
}

- (uint64_t)secureDescriptionWithBlacklistKeys:()HMFDeprecated
{
  return objc_msgSend(a1, "secureDescriptionWithIndent:newLine:blacklistedKeys:", 0, 0, a3);
}

- (id)describeElements:()HMFDeprecated
{
  void (**v4)(id, _QWORD);
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(MEMORY[0x1E0CB37A0], "string");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v6 = a1;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v15;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v15 != v9)
          objc_enumerationMutation(v6);
        v11 = *(_QWORD *)(*((_QWORD *)&v14 + 1) + 8 * v10);
        objc_msgSend(v5, "appendString:", CFSTR("\r"), (_QWORD)v14);
        v4[2](v4, v11);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "appendString:", v12);

        ++v10;
      }
      while (v8 != v10);
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v8);
  }

  return v5;
}

@end
