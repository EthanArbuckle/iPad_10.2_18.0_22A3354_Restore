@implementation NSDictionary(AXPropertyListCoersion)

- (id)_axRecursivelyPropertyListCoercedRepresentationWithError:()AXPropertyListCoersion
{
  id v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t i;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  __CFString *v10;
  id v11;
  id v12;
  void *v13;
  uint64_t v15;
  void *v16;
  id v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", objc_msgSend(a1, "count"));
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v2 = a1;
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
  if (!v3)
    goto LABEL_17;
  v4 = v3;
  v15 = *(_QWORD *)v19;
  do
  {
    for (i = 0; i != v4; ++i)
    {
      if (*(_QWORD *)v19 != v15)
        objc_enumerationMutation(v2);
      v6 = *(void **)(*((_QWORD *)&v18 + 1) + 8 * i);
      v7 = (void *)MEMORY[0x1B5E4B708]();
      objc_msgSend(v2, "objectForKey:", v6);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      if ((objc_opt_respondsToSelector() & 1) != 0)
      {
        objc_msgSend(v6, "_axDictionaryKeyReplacementRepresentation");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        if (!v9)
        {

          objc_autoreleasePoolPop(v7);
          v12 = 0;
          v13 = v16;
          goto LABEL_18;
        }
      }
      else
      {
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@"), v6);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
      }
      if ((objc_opt_respondsToSelector() & 1) != 0)
      {
        v17 = 0;
        objc_msgSend(v8, "_axRecursivelyPropertyListCoercedRepresentationWithError:", &v17);
        v10 = (__CFString *)objc_claimAutoreleasedReturnValue();
        v11 = v17;
        if (v10)
          goto LABEL_15;
      }
      else
      {
        v11 = 0;
      }
      v10 = &stru_1E691BCF0;
LABEL_15:
      objc_msgSend(v16, "setObject:forKey:", v10, v9);

      objc_autoreleasePoolPop(v7);
    }
    v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
  }
  while (v4);
LABEL_17:

  v13 = v16;
  v12 = v16;
LABEL_18:

  return v12;
}

- (id)_axRecursivelyReconstitutedRepresentationFromPropertyListWithError:()AXPropertyListCoersion
{
  id v4;
  void *v5;
  unint64_t v6;
  void *v7;
  id v8;
  void *v9;
  id v10;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t i;
  void *v17;
  void *v18;
  uint64_t v19;
  void *v20;
  _QWORD *v21;
  uint64_t v22;
  void *v23;
  void *v24;
  id obj;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  id v30;
  _BYTE v31[128];
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  v30 = 0;
  v4 = a1;
  objc_msgSend(v4, "objectForKey:", CFSTR("SmugType"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5
    && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
    && (v6 = objc_msgSend(v5, "unsignedIntegerValue"), v6 <= 9))
  {
    ((void (*)(id, id *))off_1E691A1B0[v6])(v4, &v30);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v7 = 0;
  }

  v8 = v30;
  v9 = v8;
  if (v7)
  {
    v10 = v7;
  }
  else if (v8)
  {
    v10 = 0;
    if (a3)
      *a3 = objc_retainAutorelease(v8);
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", objc_msgSend(v4, "count"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = 0u;
    v27 = 0u;
    v28 = 0u;
    v29 = 0u;
    objc_msgSend(v4, "keyEnumerator");
    obj = (id)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v26, v31, 16);
    if (v13)
    {
      v14 = v13;
      v15 = *(_QWORD *)v27;
      v24 = 0;
      while (2)
      {
        for (i = 0; i != v14; ++i)
        {
          if (*(_QWORD *)v27 != v15)
            objc_enumerationMutation(obj);
          v17 = *(void **)(*((_QWORD *)&v26 + 1) + 8 * i);
          objc_msgSend(v4, "objectForKey:", v17, v24);
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v17, "_axReconstitutedRepresentationForDictionaryKeyReplacement");
          v19 = objc_claimAutoreleasedReturnValue();
          if (!v19)
            goto LABEL_24;
          v20 = (void *)v19;
          v21 = a3;
          objc_msgSend(v18, "_axRecursivelyReconstitutedRepresentationFromPropertyListWithError:", a3);
          v22 = objc_claimAutoreleasedReturnValue();
          if (!v22)
          {

LABEL_24:
            v10 = 0;
            v9 = v24;
            goto LABEL_25;
          }
          v23 = (void *)v22;
          objc_msgSend(v12, "setObject:forKey:", v22, v20);

          a3 = v21;
        }
        v14 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v26, v31, 16);
        v9 = v24;
        if (v14)
          continue;
        break;
      }
    }

    v10 = v12;
LABEL_25:

  }
  return v10;
}

@end
