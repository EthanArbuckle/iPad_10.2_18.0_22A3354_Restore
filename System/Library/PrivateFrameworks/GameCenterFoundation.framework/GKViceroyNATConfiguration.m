@implementation GKViceroyNATConfiguration

+ (NSArray)settingsKeys
{
  return (NSArray *)&unk_1E75FAEC0;
}

+ (void)applySettings:(id)a3
{
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;

  v16 = a3;
  v3 = (void *)MEMORY[0x1E0C99D80];
  objc_msgSend(v16, "objectForKey:", CFSTR("gk-commnat-main0"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = *MEMORY[0x1E0D25B88];
  objc_msgSend(v16, "objectForKey:", CFSTR("gk-commnat-main1"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = *MEMORY[0x1E0D25B90];
  objc_msgSend(v16, "objectForKey:", CFSTR("gk-commnat-cohort"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = *MEMORY[0x1E0D25B80];
  objc_msgSend(v16, "objectForKey:", CFSTR("gk-cdx"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "dictionaryWithObjectsAndKeys:", v4, v5, v6, v7, v8, v9, v10, *MEMORY[0x1E0D25B78], 0);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0D25C78], "setServerAddresses:", v11);
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "objectForKey:", CFSTR("gk-p2p-ice-timeout"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if (v13)
    objc_msgSend(v12, "setObject:forKey:", v13, *MEMORY[0x1E0D25BA0]);
  objc_msgSend(v16, "objectForKey:", CFSTR("gk-p2p-nat-type-timeout"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  if (v14)
    objc_msgSend(v12, "setObject:forKey:", v14, *MEMORY[0x1E0D25BA8]);
  objc_msgSend(v16, "objectForKey:", CFSTR("gk-p2p-blob-size-max"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  if (v15)
    objc_msgSend(v12, "setObject:forKey:", v15, *MEMORY[0x1E0D25B98]);
  objc_msgSend(MEMORY[0x1E0D25C78], "setClientOptions:", v12);

}

+ (id)externalAddressForSelfConnectionData:(id)a3
{
  return (id)objc_msgSend(MEMORY[0x1E0D25C60], "externalAddressForSelfConnectionData:", a3);
}

@end
