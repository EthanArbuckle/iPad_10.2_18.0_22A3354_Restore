@implementation CEMConfigurationBase

+ (NSString)declarationClass
{
  return (NSString *)CFSTR("configuration");
}

+ (NSString)profileType
{
  return (NSString *)&stru_24C63AAC0;
}

+ (NSSet)restrictionPayloadKeys
{
  return (NSSet *)objc_msgSend(MEMORY[0x24BDBCF20], "set");
}

- (BOOL)multipleAllowed
{
  return 1;
}

- (BOOL)mustBeSupervised
{
  return 0;
}

- (int)activationLevel
{
  return 2;
}

- (id)assetReferences
{
  return (id)MEMORY[0x24BDBD1A8];
}

- (id)synthesizeProfileOutUUIDs:(id)a3 withOldUUIDs:(id)a4 assetProviders:(id)a5
{
  void *v8;
  id v9;
  id v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;

  v8 = (void *)MEMORY[0x24BDBCED8];
  v9 = a5;
  v10 = a4;
  v11 = a3;
  objc_msgSend(v8, "dictionary");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = (void *)MEMORY[0x24BDD17C8];
  -[CEMDeclarationBase declarationType](self, "declarationType");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "substringFromIndex:", 24);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[CEMDeclarationBase declarationIdentifier](self, "declarationIdentifier");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "stringWithFormat:", CFSTR("%@.%@"), v15, v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setObject:forKeyedSubscript:", v17, CFSTR("PayloadIdentifier"));

  -[CEMDeclarationBase declarationIdentifier](self, "declarationIdentifier");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setObject:forKeyedSubscript:", v18, CFSTR("PayloadUUID"));

  objc_msgSend(v12, "setObject:forKeyedSubscript:", CFSTR("Configuration"), CFSTR("PayloadType"));
  objc_msgSend(v12, "setObject:forKeyedSubscript:", &unk_24C69CC98, CFSTR("PayloadVersion"));
  -[CEMConfigurationBase synthesizeProfilePayloadOutUUIDs:withOldUUIDs:assetProviders:](self, "synthesizeProfilePayloadOutUUIDs:withOldUUIDs:assetProviders:", v11, v10, v9);
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v12, "setObject:forKeyedSubscript:", v19, CFSTR("PayloadContent"));
  v20 = (void *)objc_msgSend(v12, "copy");

  return v20;
}

- (id)payloadUUIDWithIdentifier:(id)a3 outUUIDs:(id)a4 oldUUIDs:(id)a5
{
  id v7;
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;

  v7 = a3;
  v8 = a4;
  v9 = a5;
  v10 = v9;
  if (v9
    && (objc_msgSend(v9, "objectForKeyedSubscript:", v7),
        v11 = (void *)objc_claimAutoreleasedReturnValue(),
        v11,
        v11))
  {
    objc_msgSend(v10, "objectForKeyedSubscript:", v7);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD1880], "UUID");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "UUIDString");
    v12 = (void *)objc_claimAutoreleasedReturnValue();

  }
  objc_msgSend(v8, "setObject:forKeyedSubscript:", v12, v7);

  return v12;
}

- (id)synthesizeProfilePayloadOutUUIDs:(id)a3 withOldUUIDs:(id)a4 assetProviders:(id)a5
{
  id v8;
  id v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  id v21;
  id v22;
  void *v23;
  uint64_t v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  id v30;
  id v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v40;
  void *v41;
  void *v42;

  v8 = a3;
  v9 = a4;
  v10 = (void *)MEMORY[0x24BDBCEB8];
  v11 = a5;
  objc_msgSend(v10, "arrayWithCapacity:", 2);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[CEMConfigurationBase profilePayloadsByTypeWithAssetProviders:](self, "profilePayloadsByTypeWithAssetProviders:", v11);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend((id)objc_opt_class(), "profileType");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "objectForKeyedSubscript:", v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v42 = v14;
  if (objc_msgSend(v14, "length") && objc_msgSend(v15, "count"))
  {
    objc_msgSend(MEMORY[0x24BDBCED8], "dictionaryWithCapacity:", objc_msgSend(v15, "count") + 4);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = (void *)MEMORY[0x24BDD17C8];
    -[CEMDeclarationBase declarationIdentifier](self, "declarationIdentifier");
    v18 = v15;
    v19 = v13;
    v20 = v12;
    v21 = v9;
    v22 = v8;
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "stringWithFormat:", CFSTR("%@.%@"), v42, v23);
    v24 = objc_claimAutoreleasedReturnValue();

    v8 = v22;
    v9 = v21;
    v12 = v20;
    v13 = v19;
    v15 = v18;
    objc_msgSend(v16, "setObject:forKeyedSubscript:", v42, CFSTR("PayloadType"));
    objc_msgSend(v16, "setObject:forKeyedSubscript:", &unk_24C69CC98, CFSTR("PayloadVersion"));
    v40 = (void *)v24;
    objc_msgSend(v16, "setObject:forKeyedSubscript:", v24, CFSTR("PayloadIdentifier"));
    -[CEMConfigurationBase payloadUUIDWithIdentifier:outUUIDs:oldUUIDs:](self, "payloadUUIDWithIdentifier:outUUIDs:oldUUIDs:", v24, v8, v9);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "setObject:forKeyedSubscript:", v25, CFSTR("PayloadUUID"));

    objc_msgSend(v16, "addEntriesFromDictionary:", v18);
    v26 = (void *)objc_msgSend(v16, "copy");
    objc_msgSend(v12, "addObject:", v26);

  }
  objc_msgSend(v13, "objectForKeyedSubscript:", CFSTR("com.apple.applicationaccess"));
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v27, "count"))
  {
    objc_msgSend(MEMORY[0x24BDBCED8], "dictionaryWithCapacity:", objc_msgSend(v27, "count") + 4);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v41 = v13;
    v29 = v12;
    v30 = v9;
    v31 = v8;
    v32 = (void *)MEMORY[0x24BDD17C8];
    -[CEMDeclarationBase declarationIdentifier](self, "declarationIdentifier");
    v33 = v15;
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "stringWithFormat:", CFSTR("%@.%@"), CFSTR("com.apple.applicationaccess"), v34);
    v35 = (void *)objc_claimAutoreleasedReturnValue();

    v15 = v33;
    objc_msgSend(v28, "setObject:forKeyedSubscript:", CFSTR("com.apple.applicationaccess"), CFSTR("PayloadType"));
    objc_msgSend(v28, "setObject:forKeyedSubscript:", &unk_24C69CC98, CFSTR("PayloadVersion"));
    objc_msgSend(v28, "setObject:forKeyedSubscript:", v35, CFSTR("PayloadIdentifier"));
    -[CEMConfigurationBase payloadUUIDWithIdentifier:outUUIDs:oldUUIDs:](self, "payloadUUIDWithIdentifier:outUUIDs:oldUUIDs:", v35, v31, v30);
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "setObject:forKeyedSubscript:", v36, CFSTR("PayloadUUID"));

    objc_msgSend(v28, "addEntriesFromDictionary:", v27);
    v37 = (void *)objc_msgSend(v28, "copy");
    objc_msgSend(v29, "addObject:", v37);

    v8 = v31;
    v9 = v30;
    v12 = v29;
    v13 = v41;

  }
  v38 = (void *)objc_msgSend(v12, "copy");

  return v38;
}

- (id)profilePayloadsByTypeWithAssetProviders:(id)a3
{
  id v4;
  void *v5;
  __CFString *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  uint64_t v15;
  void *v16;
  int v17;
  void *v18;
  const __CFString *v19;
  void *v20;
  void *v21;
  void *v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  _BYTE v28[128];
  uint64_t v29;

  v29 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = (void *)objc_opt_class();
  objc_msgSend(v5, "profileType");
  v6 = (__CFString *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCED8], "dictionaryWithCapacity:", 2);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setObject:forKeyedSubscript:", v8, v6);

  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setObject:forKeyedSubscript:", v9, CFSTR("com.apple.applicationaccess"));

  v23 = v4;
  -[CEMPayloadBase serializePayloadWithAssetProviders:](self, "serializePayloadWithAssetProviders:", v4);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = 0u;
  v25 = 0u;
  v26 = 0u;
  v27 = 0u;
  v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
  if (v11)
  {
    v12 = v11;
    v13 = *(_QWORD *)v25;
    do
    {
      for (i = 0; i != v12; ++i)
      {
        if (*(_QWORD *)v25 != v13)
          objc_enumerationMutation(v10);
        v15 = *(_QWORD *)(*((_QWORD *)&v24 + 1) + 8 * i);
        objc_msgSend(v5, "restrictionPayloadKeys");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v17 = objc_msgSend(v16, "containsObject:", v15);

        objc_msgSend(v10, "objectForKeyedSubscript:", v15);
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        if (v17)
          v19 = CFSTR("com.apple.applicationaccess");
        else
          v19 = v6;
        objc_msgSend(v7, "objectForKeyedSubscript:", v19);
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v20, "setObject:forKeyedSubscript:", v18, v15);

      }
      v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
    }
    while (v12);
  }
  v21 = (void *)objc_msgSend(v7, "copy");

  return v21;
}

@end
