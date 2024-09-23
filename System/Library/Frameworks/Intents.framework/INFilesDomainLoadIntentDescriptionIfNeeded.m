@implementation INFilesDomainLoadIntentDescriptionIfNeeded

void ___INFilesDomainLoadIntentDescriptionIfNeeded_block_invoke()
{
  void *v0;
  uint64_t v1;
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  void *v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v0 = (void *)MEMORY[0x1E0C9AA60];
  v1 = objc_msgSend(MEMORY[0x1E0C9AA60], "count");
  v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithCapacity:", v1);
  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithCapacity:", v1);
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v4 = objc_msgSend(v0, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v16;
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v16 != v6)
          objc_enumerationMutation(v0);
        v8 = *(void **)(*((_QWORD *)&v15 + 1) + 8 * i);
        objc_msgSend(v8, "name");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v2, "setObject:forKey:", v8, v9);

        objc_msgSend(v8, "type");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v3, "setObject:forKey:", v8, v10);

      }
      v5 = objc_msgSend(v0, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v5);
  }
  v11 = objc_msgSend(v2, "copy");
  v12 = (void *)sFilesDomain_intentDescsByName;
  sFilesDomain_intentDescsByName = v11;

  v13 = objc_msgSend(v3, "copy");
  v14 = (void *)sFilesDomain_intentDescsByType;
  sFilesDomain_intentDescsByType = v13;

}

@end
