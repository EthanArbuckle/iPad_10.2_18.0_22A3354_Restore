@implementation ATXUserNotification(RawIdentifiers)

- (void)setRawIdentifiersWithContactRepresentationDataStore:()RawIdentifiers
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  id obj;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v18 = a1;
  objc_msgSend(a1, "contactIDs");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_opt_new();
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  obj = v5;
  v7 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v21;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v21 != v9)
          objc_enumerationMutation(obj);
        objc_msgSend(v4, "cnContactForCnContactId:rawIdentifier:", *(_QWORD *)(*((_QWORD *)&v20 + 1) + 8 * v10), 0);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "phoneNumbers");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "_pas_mappedArrayWithTransform:", &__block_literal_global_28);
        v13 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v11, "emailAddresses");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "_pas_mappedArrayWithTransform:", &__block_literal_global_8);
        v15 = (void *)objc_claimAutoreleasedReturnValue();

        if (objc_msgSend(v13, "count"))
        {
          objc_msgSend(v13, "firstObject");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v6, "addObject:", v16);

        }
        if (objc_msgSend(v15, "count"))
        {
          objc_msgSend(v15, "firstObject");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v6, "addObject:", v17);

        }
        ++v10;
      }
      while (v8 != v10);
      v8 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
    }
    while (v8);
  }

  objc_msgSend(v18, "setRawIdentifiers:", v6);
}

@end
