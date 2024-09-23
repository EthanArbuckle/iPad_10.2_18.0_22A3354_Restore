@implementation NTPBPurchaseOfferableConfiguration(FCAdditions)

+ (id)purchaseOfferableConfigurationsFromJSON:()FCAdditions
{
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v16;
  id v17;
  id obj;
  uint64_t v19;
  id v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _BYTE v25[128];
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v20 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99D80], "fc_dictionaryFromJSON:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "count"))
  {
    v17 = v3;
    v16 = v4;
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("purchaseIDs"));
    v21 = 0u;
    v22 = 0u;
    v23 = 0u;
    v24 = 0u;
    obj = (id)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
    if (v5)
    {
      v6 = v5;
      v19 = *(_QWORD *)v22;
      do
      {
        v7 = 0;
        do
        {
          if (*(_QWORD *)v22 != v19)
            objc_enumerationMutation(obj);
          v8 = *(void **)(*((_QWORD *)&v21 + 1) + 8 * v7);
          v9 = objc_alloc_init(MEMORY[0x1E0D627C8]);
          objc_msgSend(v8, "objectForKey:", CFSTR("purchaseID"));
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v9, "setPurchaseId:", v10);

          objc_msgSend(v8, "objectForKey:", CFSTR("allowsPubIPhoneApp"));
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v9, "setAllowsPublisherPhoneApp:", objc_msgSend(v11, "BOOLValue"));

          objc_msgSend(v8, "objectForKey:", CFSTR("allowsPubIPadApp"));
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v9, "setAllowsPublisherPadApp:", objc_msgSend(v12, "BOOLValue"));

          objc_msgSend(v8, "objectForKey:", CFSTR("allowsPubWebsite"));
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v9, "setAllowsPublisherWebSite:", objc_msgSend(v13, "BOOLValue"));

          objc_msgSend(v8, "objectForKey:", CFSTR("preferredOffer"));
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v9, "setPreferredOffer:", objc_msgSend(v14, "BOOLValue"));

          objc_msgSend(v20, "addObject:", v9);
          ++v7;
        }
        while (v6 != v7);
        v6 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
      }
      while (v6);
    }

    v4 = v16;
    v3 = v17;
  }

  return v20;
}

@end
