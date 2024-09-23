@implementation INInteraction(CoreDuetContext)

- (id)contextMetadataWithBundleIdentifier:()CoreDuetContext eventUUID:
{
  void *v6;
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;

  v6 = (void *)MEMORY[0x1E0C99E08];
  v7 = a4;
  v8 = a3;
  objc_msgSend(v6, "dictionaryWithCapacity:", 5);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  +[_CDContextQueries intentSourceBundleIDKey](_CDContextQueries, "intentSourceBundleIDKey");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setObject:forKeyedSubscript:", v8, v10);

  objc_msgSend(a1, "identifier");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = (void *)objc_msgSend(v11, "copy");
  +[_CDContextQueries intentSourceItemIDKey](_CDContextQueries, "intentSourceItemIDKey");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setObject:forKeyedSubscript:", v12, v13);

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", objc_msgSend(a1, "_donatedBySiri"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  +[_CDContextQueries intentDonatedBySiriKey](_CDContextQueries, "intentDonatedBySiriKey");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setObject:forKeyedSubscript:", v14, v15);

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", objc_msgSend(a1, "intentHandlingStatus"));
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  +[_CDContextQueries intentHandlingStatusKey](_CDContextQueries, "intentHandlingStatusKey");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setObject:forKeyedSubscript:", v16, v17);

  v18 = (void *)objc_msgSend(v7, "copy");
  +[_CDContextQueries intentDKObjUUIDKey](_CDContextQueries, "intentDKObjUUIDKey");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setObject:forKeyedSubscript:", v18, v19);

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", objc_msgSend(a1, "direction"));
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  +[_CDContextQueries intentDirectionKey](_CDContextQueries, "intentDirectionKey");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setObject:forKeyedSubscript:", v20, v21);

  objc_msgSend(a1, "intent");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "contextMetadata");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "addEntriesFromDictionary:", v23);

  v24 = (void *)objc_msgSend(v9, "copy");
  return v24;
}

@end
