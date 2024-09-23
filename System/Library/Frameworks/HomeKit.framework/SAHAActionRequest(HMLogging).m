@implementation SAHAActionRequest(HMLogging)

- (id)hm_shortDescription
{
  void *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  void *v16;
  uint64_t v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CB37A0], "string");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = *MEMORY[0x1E0D88900];
  objc_msgSend(a1, "filter");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "hm_shortDescription");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "appendFormat:", CFSTR("\t%@: %@"), v3, v5);

  v6 = *MEMORY[0x1E0D887C0];
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", objc_msgSend(a1, "executionOrder"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "appendFormat:", CFSTR("\n\t\t\t%@: %@"), v6, v7);

  v21 = 0u;
  v22 = 0u;
  v19 = 0u;
  v20 = 0u;
  objc_msgSend(a1, "actions");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
  if (v9)
  {
    v10 = v9;
    v11 = 0;
    v12 = *(_QWORD *)v20;
    v13 = *MEMORY[0x1E0D887B8];
    do
    {
      v14 = 0;
      do
      {
        if (*(_QWORD *)v20 != v12)
          objc_enumerationMutation(v8);
        v15 = *(void **)(*((_QWORD *)&v19 + 1) + 8 * v14);
        if (v11 + v14)
          objc_msgSend(v2, "appendFormat:", CFSTR("\n\t\t\t\t [%tu]"), v11 + v14, v18);
        else
          objc_msgSend(v2, "appendFormat:", CFSTR("\n\t\t\t%@: [%tu]"), v13, 0);
        objc_msgSend(v15, "hm_shortDescription");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v2, "appendFormat:", CFSTR("\n\t\t\t\t %@"), v16);

        ++v14;
      }
      while (v10 != v14);
      v11 += v14;
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
    }
    while (v10);
  }

  return v2;
}

@end
