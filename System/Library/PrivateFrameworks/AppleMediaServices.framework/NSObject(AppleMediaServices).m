@implementation NSObject(AppleMediaServices)

- (id)ams_generateDescriptionWithSubObjects:()AppleMediaServices
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  unint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  id v15;
  unint64_t v16;
  id v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t i;
  void *v22;
  uint64_t v24;
  uint64_t v25;
  id obj;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  _BYTE v35[128];
  _BYTE v36[128];
  uint64_t v37;

  v37 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB37A0]), "initWithFormat:", CFSTR("<%@: %p>"), objc_opt_class(), a1);
  if (objc_msgSend(v4, "count"))
  {
    objc_msgSend(v5, "appendString:", CFSTR(" {\n"));
    objc_msgSend(v4, "allKeys");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "sortedArrayUsingSelector:", sel_caseInsensitiveCompare_);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    v33 = 0u;
    v34 = 0u;
    v31 = 0u;
    v32 = 0u;
    obj = v7;
    v8 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v31, v36, 16);
    if (v8)
    {
      v9 = v8;
      v10 = 0x1E0C99000uLL;
      v11 = *(_QWORD *)v32;
      v24 = *(_QWORD *)v32;
      do
      {
        v12 = 0;
        v25 = v9;
        do
        {
          if (*(_QWORD *)v32 != v11)
            objc_enumerationMutation(obj);
          v13 = *(_QWORD *)(*((_QWORD *)&v31 + 1) + 8 * v12);
          objc_msgSend(v4, "objectForKeyedSubscript:", v13);
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            v15 = v4;
            v16 = v10;
            objc_msgSend(v5, "appendFormat:", CFSTR(" %@ = {\n"), v13);
            v29 = 0u;
            v30 = 0u;
            v27 = 0u;
            v28 = 0u;
            v17 = v14;
            v18 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v27, v35, 16);
            if (v18)
            {
              v19 = v18;
              v20 = *(_QWORD *)v28;
              do
              {
                for (i = 0; i != v19; ++i)
                {
                  if (*(_QWORD *)v28 != v20)
                    objc_enumerationMutation(v17);
                  objc_msgSend(v5, "appendFormat:", CFSTR("  %@,\n"), *(_QWORD *)(*((_QWORD *)&v27 + 1) + 8 * i));
                }
                v19 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v27, v35, 16);
              }
              while (v19);
            }

            objc_msgSend(v5, "appendString:", CFSTR("}"));
            v10 = v16;
            v4 = v15;
            v11 = v24;
            v9 = v25;
          }
          else
          {
            objc_msgSend(v4, "objectForKeyedSubscript:", v13);
            v22 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v5, "appendFormat:", CFSTR("  %@ = %@,\n"), v13, v22);

          }
          ++v12;
        }
        while (v12 != v9);
        v9 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v31, v36, 16);
      }
      while (v9);
    }

    objc_msgSend(v5, "appendString:", CFSTR("}"));
  }

  return v5;
}

@end
