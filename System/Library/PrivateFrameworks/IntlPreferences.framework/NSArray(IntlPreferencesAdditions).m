@implementation NSArray(IntlPreferencesAdditions)

- (id)filteredLanguagesBySearchString:()IntlPreferencesAdditions
{
  void *v4;
  uint64_t v5;
  uint64_t i;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  id v11;
  id v12;
  uint64_t v13;
  id v14;
  void *v15;
  void *v16;
  int v17;
  id v19;
  id obj;
  uint64_t v21;
  id v22;
  _QWORD v23[4];
  id v24;
  id v25;
  void *v26;
  uint64_t *v27;
  _QWORD v28[4];
  id v29;
  id v30;
  void *v31;
  uint64_t *v32;
  uint64_t v33;
  uint64_t *v34;
  uint64_t v35;
  char v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  _BYTE v41[128];
  uint64_t v42;

  v42 = *MEMORY[0x1E0C80C00];
  v19 = a3;
  if (objc_msgSend(v19, "length"))
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v22 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("SELF beginswith[cld] %@"), v19);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v39 = 0u;
    v40 = 0u;
    v37 = 0u;
    v38 = 0u;
    obj = a1;
    v5 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v37, v41, 16);
    if (v5)
    {
      v21 = *(_QWORD *)v38;
      do
      {
        for (i = 0; i != v5; ++i)
        {
          if (*(_QWORD *)v38 != v21)
            objc_enumerationMutation(obj);
          v7 = *(void **)(*((_QWORD *)&v37 + 1) + 8 * i);
          objc_msgSend(v7, "name");
          v8 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v7, "localizedStringForName");
          v9 = (void *)objc_claimAutoreleasedReturnValue();
          if (objc_msgSend(v4, "evaluateWithObject:", v8)
            || objc_msgSend(v4, "evaluateWithObject:", v9))
          {
            objc_msgSend(v22, "addObject:", v7);
          }
          else
          {
            v33 = 0;
            v34 = &v33;
            v35 = 0x2020000000;
            v36 = 0;
            v10 = objc_msgSend(v8, "length");
            v28[0] = MEMORY[0x1E0C809B0];
            v28[1] = 3221225472;
            v28[2] = __69__NSArray_IntlPreferencesAdditions__filteredLanguagesBySearchString___block_invoke;
            v28[3] = &unk_1E70693A8;
            v11 = v4;
            v29 = v11;
            v12 = v22;
            v30 = v12;
            v31 = v7;
            v32 = &v33;
            objc_msgSend(v8, "enumerateSubstringsInRange:options:usingBlock:", 0, v10, 3, v28);
            if (!*((_BYTE *)v34 + 24))
            {
              v13 = objc_msgSend(v9, "length");
              v23[0] = MEMORY[0x1E0C809B0];
              v23[1] = 3221225472;
              v23[2] = __69__NSArray_IntlPreferencesAdditions__filteredLanguagesBySearchString___block_invoke_2;
              v23[3] = &unk_1E70693A8;
              v24 = v11;
              v14 = v12;
              v25 = v14;
              v26 = v7;
              v27 = &v33;
              objc_msgSend(v9, "enumerateSubstringsInRange:options:usingBlock:", 0, v13, 3, v23);
              if (!*((_BYTE *)v34 + 24))
              {
                objc_msgSend(v7, "identifier");
                v15 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v19, "lowercaseString");
                v16 = (void *)objc_claimAutoreleasedReturnValue();
                v17 = objc_msgSend(v15, "hasPrefix:", v16);

                if (v17)
                  objc_msgSend(v14, "addObject:", v7);
              }

            }
            _Block_object_dispose(&v33, 8);
          }

        }
        v5 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v37, v41, 16);
      }
      while (v5);
    }

  }
  else
  {
    v22 = (id)objc_msgSend(a1, "copy");
  }

  return v22;
}

@end
