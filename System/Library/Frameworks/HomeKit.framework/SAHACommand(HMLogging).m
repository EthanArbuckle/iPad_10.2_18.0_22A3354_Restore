@implementation SAHACommand(HMLogging)

- (id)hm_shortDescription
{
  void *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  void *v27;
  uint64_t v29;
  uint64_t v30;
  void *v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  _BYTE v40[128];
  _BYTE v41[128];
  uint64_t v42;

  v42 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CB37A0], "string");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = *MEMORY[0x1E0D88900];
  objc_msgSend(a1, "filter");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "hm_shortDescription");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "appendFormat:", CFSTR("\t%@: %@"), v3, v5);

  v6 = *MEMORY[0x1E0D888D8];
  objc_msgSend(a1, "commandTimeout");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "appendFormat:", CFSTR("\n\t%@: %@"), v6, v7);

  v8 = (void *)*MEMORY[0x1E0D88958];
  objc_msgSend(a1, "serverValidity");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  appendToShortDescription(v2, v8, v9);

  v38 = 0u;
  v39 = 0u;
  v36 = 0u;
  v37 = 0u;
  v31 = a1;
  objc_msgSend(a1, "actionRequests");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v36, v41, 16);
  if (v11)
  {
    v12 = v11;
    v13 = 0;
    v14 = *(_QWORD *)v37;
    v15 = *MEMORY[0x1E0D888C8];
    do
    {
      v16 = 0;
      do
      {
        if (*(_QWORD *)v37 != v14)
          objc_enumerationMutation(v10);
        v17 = *(void **)(*((_QWORD *)&v36 + 1) + 8 * v16);
        if (v13 + v16)
          objc_msgSend(v2, "appendFormat:", CFSTR("\n\t\t\t[%tu]"), v13 + v16, v29);
        else
          objc_msgSend(v2, "appendFormat:", CFSTR("\n\t%@: [%tu]"), v15, 0);
        objc_msgSend(v17, "hm_shortDescription");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v2, "appendFormat:", CFSTR("\n\t\t%@"), v18);

        ++v16;
      }
      while (v12 != v16);
      v13 += v16;
      v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v36, v41, 16);
    }
    while (v12);
  }

  v34 = 0u;
  v35 = 0u;
  v32 = 0u;
  v33 = 0u;
  objc_msgSend(v31, "actions");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v32, v40, 16);
  if (v20)
  {
    v21 = v20;
    v22 = 0;
    v23 = *(_QWORD *)v33;
    v24 = *MEMORY[0x1E0D888D0];
    do
    {
      v25 = 0;
      do
      {
        if (*(_QWORD *)v33 != v23)
          objc_enumerationMutation(v19);
        objc_msgSend(*(id *)(*((_QWORD *)&v32 + 1) + 8 * v25), "hm_shortDescription");
        v26 = objc_claimAutoreleasedReturnValue();
        v27 = (void *)v26;
        if (v22 + v25)
          objc_msgSend(v2, "appendFormat:", CFSTR("\n\t\t[%tu] %@"), v22 + v25, v26, v30);
        else
          objc_msgSend(v2, "appendFormat:", CFSTR("\n\t%@: [%tu] %@"), v24, 0, v26);

        ++v25;
      }
      while (v21 != v25);
      v22 += v25;
      v21 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v32, v40, 16);
    }
    while (v21);
  }

  return v2;
}

@end
