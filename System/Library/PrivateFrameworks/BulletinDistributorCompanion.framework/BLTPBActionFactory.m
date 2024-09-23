@implementation BLTPBActionFactory

+ (id)bltVersionToFactories
{
  if (bltVersionToFactories_onceToken != -1)
    dispatch_once(&bltVersionToFactories_onceToken, &__block_literal_global_5);
  return (id)bltVersionToFactories___bltVersionToFeatureDictionary;
}

void __43__BLTPBActionFactory_bltVersionToFactories__block_invoke()
{
  BLTPBActionFactoryVersion1 *v0;
  BLTPBActionFactory *v1;
  uint64_t v2;
  void *v3;
  _QWORD v4[2];
  _QWORD v5[3];

  v5[2] = *MEMORY[0x24BDAC8D0];
  v4[0] = &unk_24D7866B0;
  v0 = objc_alloc_init(BLTPBActionFactoryVersion1);
  v4[1] = &unk_24D7866C8;
  v5[0] = v0;
  v1 = objc_alloc_init(BLTPBActionFactory);
  v5[1] = v1;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v5, v4, 2);
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = (void *)bltVersionToFactories___bltVersionToFeatureDictionary;
  bltVersionToFactories___bltVersionToFeatureDictionary = v2;

}

+ (id)sharedInstance
{
  void *v3;
  unint64_t v4;
  uint64_t v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;

  objc_msgSend(MEMORY[0x24BE6B4E0], "blt_boundedWaitForActivePairedDevice");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "bltVersion");

  if (v4 >= 2)
    v5 = 2;
  else
    v5 = v4;
  if (v5 != gCurrentVersion)
  {
    objc_msgSend(a1, "bltVersionToFactories");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", v5);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "objectForKeyedSubscript:", v7);
    v8 = objc_claimAutoreleasedReturnValue();
    v9 = (void *)gCurrentFactory;
    gCurrentFactory = v8;

    gCurrentVersion = v5;
  }
  return (id)gCurrentFactory;
}

- (id)actionWithBBAction:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  BLTPBImage *v6;
  void *v7;
  void *v8;
  _BOOL8 v9;
  BLTPBAppearance *v10;
  void *v11;
  BLTPBAction *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  int v17;
  int v18;
  id *v19;
  void *v20;
  id v21;
  id v22;
  NSObject *v23;
  id v25;
  id v26;
  uint8_t buf[4];
  id v28;
  __int16 v29;
  void *v30;
  __int16 v31;
  void *v32;
  uint64_t v33;

  v33 = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  v4 = v3;
  if (v3)
  {
    objc_msgSend(v3, "appearance");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_alloc_init(BLTPBImage);
    objc_msgSend(v5, "image");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "data");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[BLTPBImage setData:](v6, "setData:", v8);

    v9 = objc_msgSend(v5, "style") == 1;
    v10 = objc_alloc_init(BLTPBAppearance);
    objc_msgSend(v5, "title");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[BLTPBAppearance setTitle:](v10, "setTitle:", v11);

    -[BLTPBAppearance setDestructive:](v10, "setDestructive:", v9);
    v12 = objc_alloc_init(BLTPBAction);
    objc_msgSend(v4, "identifier");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[BLTPBAction setIdentifier:](v12, "setIdentifier:", v13);

    -[BLTPBAction setActivationMode:](v12, "setActivationMode:", objc_msgSend(v4, "activationMode"));
    -[BLTPBAction setAppearance:](v12, "setAppearance:", v10);
    objc_msgSend(v4, "launchURL");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "absoluteString");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[BLTPBAction setLaunchURL:](v12, "setLaunchURL:", v15);

    -[BLTPBAction setBehavior:](v12, "setBehavior:", objc_msgSend(v4, "behavior"));
    objc_msgSend(v4, "behaviorParameters");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = objc_msgSend(MEMORY[0x24BE6B4A8], "activePairedDeviceSupportsNSNullPListExtenion");
    v18 = v17;
    if (v17)
      v19 = &v26;
    else
      v19 = 0;
    if (v17)
      v26 = 0;
    v25 = 0;
    +[BLTObjectSerializer serializeObject:nulls:error:](BLTObjectSerializer, "serializeObject:nulls:error:", v16, v19, &v25);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = 0;
    if (v18)
      v21 = v26;
    v22 = v25;

    if (v22)
    {
      blt_ids_log();
      v23 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412802;
        v28 = v22;
        v29 = 2112;
        v30 = v20;
        v31 = 2112;
        v32 = v4;
        _os_log_error_impl(&dword_2173D9000, v23, OS_LOG_TYPE_ERROR, "Error serializing action behaviorParameters: %@, %@, %@", buf, 0x20u);
      }

    }
    else
    {
      -[BLTPBAction setBehaviorParameters:](v12, "setBehaviorParameters:", v20);
      -[BLTPBAction setBehaviorParametersNulls:](v12, "setBehaviorParametersNulls:", v21);
    }

  }
  else
  {
    v12 = 0;
  }

  return v12;
}

@end
