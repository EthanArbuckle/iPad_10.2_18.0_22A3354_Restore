@implementation TDEffectStyleProduction

- (void)generateRenditionsWithDocument:(id)a3
{
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  unint64_t v14;
  uint64_t v15;
  void *v16;
  TDEffectRenditionSpec *v17;
  TDEffectRenditionSpec *v18;
  void *v19;
  void *v20;
  void *v21;
  double v22;
  id v23;
  void *v24;
  void *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t j;
  uint64_t v30;
  TDEffectRenditionSpec *v31;
  TDEffectRenditionSpec *v32;
  uint64_t v33;
  uint64_t v34;
  id obj;
  uint64_t v36;
  void *v37;
  uint64_t v38;
  TDEffectStyleProduction *v39;
  void *v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  uint64_t v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  _BYTE v54[128];
  _BYTE v55[128];
  _BYTE v56[128];
  uint64_t v57;

  v57 = *MEMORY[0x24BDAC8D0];
  obj = (id)objc_msgSend((id)-[TDEffectStyleProduction partDefinition](self, "partDefinition"), "renditions");
  v39 = self;
  if (objc_msgSend((id)-[TDEffectStyleProduction renditions](self, "renditions"), "count"))
  {
    NSLog(CFSTR("Deleting existing effect renditions during regeneration"));
    v5 = (void *)-[TDEffectStyleProduction managedObjectContext](self, "managedObjectContext");
    v50 = 0u;
    v51 = 0u;
    v52 = 0u;
    v53 = 0u;
    v6 = (void *)-[TDEffectStyleProduction renditions](self, "renditions");
    v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v50, v56, 16);
    if (v7)
    {
      v8 = v7;
      v9 = *(_QWORD *)v51;
      do
      {
        for (i = 0; i != v8; ++i)
        {
          if (*(_QWORD *)v51 != v9)
            objc_enumerationMutation(v6);
          objc_msgSend(v5, "deleteObject:", *(_QWORD *)(*((_QWORD *)&v50 + 1) + 8 * i));
        }
        v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v50, v56, 16);
      }
      while (v8);
    }
  }
  v40 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCEF0]), "initWithCapacity:", objc_msgSend(obj, "count"));
  v46 = 0u;
  v47 = 0u;
  v48 = 0u;
  v49 = 0u;
  v11 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v46, v55, 16);
  if (v11)
  {
    v12 = v11;
    v13 = *(_QWORD *)v47;
    v14 = 0x24BDD1000uLL;
    v33 = *(_QWORD *)v47;
    do
    {
      v15 = 0;
      v34 = v12;
      do
      {
        if (*(_QWORD *)v47 != v13)
          objc_enumerationMutation(obj);
        v16 = *(void **)(*((_QWORD *)&v46 + 1) + 8 * v15);
        v38 = objc_msgSend((id)objc_msgSend((id)objc_msgSend((id)-[TDEffectStyleProduction entity](v39, "entity", v33), "managedObjectModel"), "entitiesByName"), "objectForKey:", CFSTR("EffectRenditionSpec"));
        v17 = -[TDEffectRenditionSpec initWithEntity:insertIntoManagedObjectContext:]([TDEffectRenditionSpec alloc], "initWithEntity:insertIntoManagedObjectContext:", v38, -[TDEffectStyleProduction managedObjectContext](v39, "managedObjectContext"));
        v18 = v17;
        -[TDEffectRenditionSpec setProduction:](v17, "setProduction:", v39);
        -[TDRenditionSpec resetToBaseKeySpec](v17, "resetToBaseKeySpec");
        v19 = (void *)-[TDEffectRenditionSpec keySpec](v17, "keySpec");
        objc_msgSend(v19, "setAttributesFromRenditionKey:withDocument:", objc_msgSend(v16, "key"), a3);
        v20 = (void *)objc_msgSend(v16, "effectPreset");
        v21 = *(void **)(v14 + 1760);
        objc_msgSend(v20, "effectScale");
        *(float *)&v22 = v22;
        -[TDEffectRenditionSpec setEffectScale:](v17, "setEffectScale:", objc_msgSend(v21, "numberWithFloat:", v22));
        v37 = v20;
        -[TDEffectRenditionSpec setComponentsFromEffectPreset:withDocument:](v17, "setComponentsFromEffectPreset:withDocument:", v20, a3);
        if (objc_msgSend((id)objc_msgSend(a3, "catalogGlobals"), "supportsMultipleAppearancesForEffects"))
        {
          v36 = v15;
          v45 = 0;
          v23 = a3;
          v24 = (void *)objc_msgSend(a3, "allObjectsForEntity:withSortDescriptors:error:", CFSTR("Appearance"), 0, &v45);
          v41 = 0u;
          v42 = 0u;
          v43 = 0u;
          v44 = 0u;
          v25 = v24;
          v26 = objc_msgSend(v24, "countByEnumeratingWithState:objects:count:", &v41, v54, 16);
          if (v26)
          {
            v27 = v26;
            v28 = *(_QWORD *)v42;
            do
            {
              for (j = 0; j != v27; ++j)
              {
                if (*(_QWORD *)v42 != v28)
                  objc_enumerationMutation(v25);
                v30 = *(_QWORD *)(*((_QWORD *)&v41 + 1) + 8 * j);
                v31 = v17;
                if (objc_msgSend(v19, "appearance"))
                {
                  v31 = -[TDEffectRenditionSpec initWithEntity:insertIntoManagedObjectContext:]([TDEffectRenditionSpec alloc], "initWithEntity:insertIntoManagedObjectContext:", v38, -[TDEffectStyleProduction managedObjectContext](v39, "managedObjectContext"));
                  -[TDEffectRenditionSpec setProduction:](v31, "setProduction:", v39);
                  -[TDRenditionSpec resetToBaseKeySpec](v31, "resetToBaseKeySpec");
                  objc_msgSend(v19, "copyAttributesInto:", -[TDEffectRenditionSpec keySpec](v31, "keySpec"));
                  -[TDEffectRenditionSpec setEffectScale:](v31, "setEffectScale:", -[TDEffectRenditionSpec effectScale](v17, "effectScale"));
                  -[TDEffectRenditionSpec setComponentsFromEffectPreset:withDocument:](v31, "setComponentsFromEffectPreset:withDocument:", v37, v23);
                  v32 = v31;
                }
                objc_msgSend((id)-[TDEffectRenditionSpec keySpec](v31, "keySpec"), "setAppearance:", v30);
                objc_msgSend(v40, "addObject:", v31);
              }
              v27 = objc_msgSend(v25, "countByEnumeratingWithState:objects:count:", &v41, v54, 16);
            }
            while (v27);
          }
          a3 = v23;
          v13 = v33;
          v12 = v34;
          v14 = 0x24BDD1000;
          v15 = v36;
        }
        else
        {
          objc_msgSend(v40, "addObject:", v17);
        }
        ++v15;
      }
      while (v15 != v12);
      v12 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v46, v55, 16);
    }
    while (v12);
  }

}

- (id)associatedFileModificationDateWithDocument:(id)a3
{
  return 0;
}

- (void)deleteRenditionsInDocument:(id)a3 shouldDeleteAssetFiles:(BOOL)a4
{
  objc_msgSend(a3, "deleteObjects:", objc_msgSend((id)-[TDEffectStyleProduction renditions](self, "renditions", a3, a4), "allObjects"));
}

- (id)displayName
{
  if (-[TDEffectStyleProduction name](self, "name"))
    return (id)objc_msgSend((id)-[TDEffectStyleProduction name](self, "name"), "name");
  else
    return (id)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Effect: %@ – %@"), objc_msgSend((id)objc_msgSend((id)-[TDEffectStyleProduction baseKeySpec](self, "baseKeySpec"), "element"), "displayName"), objc_msgSend((id)objc_msgSend((id)-[TDEffectStyleProduction baseKeySpec](self, "baseKeySpec"), "part"), "displayName"));
}

@end
