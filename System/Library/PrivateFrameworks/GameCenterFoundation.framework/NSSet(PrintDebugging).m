@implementation NSSet(PrintDebugging)

- (id)_gkDescriptionWithChildren:()PrintDebugging
{
  void *v5;
  void *v6;
  objc_class *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  __CFString *v17;
  id obj;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  _gkTabStringForTabLevel(a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37A0], "string");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (objc_class *)objc_opt_class();
  NSStringFromClass(v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "appendFormat:", CFSTR("%@<%@ %p> {(\n"), v5, v8, a1);

  v22 = 0u;
  v23 = 0u;
  v20 = 0u;
  v21 = 0u;
  obj = a1;
  v9 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v21;
    v12 = a3 + 1;
    do
    {
      v13 = 0;
      do
      {
        if (*(_QWORD *)v21 != v11)
          objc_enumerationMutation(obj);
        v14 = *(void **)(*((_QWORD *)&v20 + 1) + 8 * v13);
        if (v14)
        {
          objc_msgSend(v14, "_gkDescriptionWithChildren:", v12);
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x1E0CB3500], "whitespaceCharacterSet");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v15, "stringByTrimmingCharactersInSet:", v16);
          v17 = (__CFString *)objc_claimAutoreleasedReturnValue();

        }
        else
        {
          v17 = CFSTR("(null)\n");
        }
        objc_msgSend(v6, "appendFormat:", CFSTR("%@    %@"), v5, v17);

        ++v13;
      }
      while (v10 != v13);
      v10 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
    }
    while (v10);
  }

  objc_msgSend(v6, "appendFormat:", CFSTR("%@)}\n"), v5);
  return v6;
}

@end
