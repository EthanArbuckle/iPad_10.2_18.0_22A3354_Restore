@implementation SFCardSection(AssistantCardService)

+ (id)acs_uniquelyIdentifiedCardSection
{
  id v0;
  void *v1;
  void *v2;

  v0 = objc_alloc_init((Class)objc_opt_class());
  objc_msgSend(MEMORY[0x24BDD1880], "UUID");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "UUIDString");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "setCardSectionId:", v2);

  return v0;
}

- (void)acs_setParameters:()AssistantCardService
{
  id v4;
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCEB8]), "initWithCapacity:", objc_msgSend(v4, "count"));
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v6 = v4;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v13;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v13 != v9)
          objc_enumerationMutation(v6);
        objc_msgSend(a1, "acs_parameterKeyPathFromParameter:", *(_QWORD *)(*((_QWORD *)&v12 + 1) + 8 * v10), (_QWORD)v12);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v11, "length"))
          objc_msgSend(v5, "addObject:", v11);

        ++v10;
      }
      while (v8 != v10);
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v8);
  }

  objc_msgSend(a1, "setParameterKeyPaths:", v5);
}

- (void)acs_addParameter:()AssistantCardService
{
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  v4 = (void *)MEMORY[0x24BDBCEB8];
  v5 = a3;
  objc_msgSend(a1, "parameterKeyPaths");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "arrayWithArray:", v6);
  v9 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(a1, "acs_parameterKeyPathFromParameter:", v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v7, "length"))
    objc_msgSend(v9, "addObject:", v7);
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithArray:", v9);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "setParameterKeyPaths:", v8);

}

- (id)acs_parameterKeyPathFromParameter:()AssistantCardService
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  v3 = a3;
  v4 = (void *)objc_msgSend(v3, "parameterClass");
  if (objc_msgSend(v4, "isSubclassOfClass:", objc_opt_class()))
  {
    objc_msgSend(v3, "parameterClass");
    INIntentSchemaGetIntentDescriptionWithFacadeClass();
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    if (!objc_msgSend(v4, "isSubclassOfClass:", objc_opt_class()))
    {
      v7 = 0;
      goto LABEL_8;
    }
    objc_msgSend(v3, "parameterClass");
    INIntentSchemaGetIntentResponseDescriptionWithFacadeClass();
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v6 = v5;
  objc_msgSend(v5, "name");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v7)
  {
LABEL_8:
    v10 = 0;
    goto LABEL_9;
  }
  v8 = (void *)MEMORY[0x24BDD17C8];
  objc_msgSend(v3, "_subscriptedKeyPath");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "stringWithFormat:", CFSTR("%@.%@"), v7, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_9:
  return v10;
}

@end
