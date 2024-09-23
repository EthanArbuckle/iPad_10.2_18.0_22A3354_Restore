@implementation NSDictionary(PrintDebugging)

- (id)_gkDescriptionWithChildren:()PrintDebugging
{
  uint64_t v5;
  void *v6;
  objc_class *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  __CFString *v20;
  id obj;
  uint64_t v23;
  void *v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  _BYTE v29[128];
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  _gkTabStringForTabLevel(a3);
  v5 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37A0], "string");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (objc_class *)objc_opt_class();
  NSStringFromClass(v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = (void *)v5;
  objc_msgSend(v6, "appendFormat:", CFSTR("%@<%@ %p> {\n"), v5, v8, a1);

  v9 = v6;
  v27 = 0u;
  v28 = 0u;
  v25 = 0u;
  v26 = 0u;
  v10 = a1;
  objc_msgSend(a1, "allKeys");
  obj = (id)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
  if (v11)
  {
    v12 = v11;
    v13 = *(_QWORD *)v26;
    v23 = a3 + 1;
    do
    {
      for (i = 0; i != v12; ++i)
      {
        if (*(_QWORD *)v26 != v13)
          objc_enumerationMutation(obj);
        v15 = *(_QWORD *)(*((_QWORD *)&v25 + 1) + 8 * i);
        objc_msgSend(v10, "objectForKeyedSubscript:", v15);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v17 = v16;
        if (v16)
        {
          objc_msgSend(v16, "_gkDescriptionWithChildren:", v23);
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x1E0CB3500], "whitespaceCharacterSet");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v18, "stringByTrimmingCharactersInSet:", v19);
          v20 = (__CFString *)objc_claimAutoreleasedReturnValue();

        }
        else
        {
          v20 = CFSTR("(null)\n");
        }
        objc_msgSend(v9, "appendFormat:", CFSTR("%@    %@ : %@"), v24, v15, v20);

      }
      v12 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
    }
    while (v12);
  }

  objc_msgSend(v9, "appendFormat:", CFSTR("%@}\n"), v24);
  return v9;
}

@end
