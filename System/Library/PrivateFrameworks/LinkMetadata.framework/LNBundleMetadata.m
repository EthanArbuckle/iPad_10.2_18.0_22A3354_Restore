@implementation LNBundleMetadata

- (LNBundleMetadata)initWithArray:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  id v10;
  uint64_t i;
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
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  uint64_t v30;
  void *v31;
  void *v32;
  uint64_t v34;
  void *v35;
  void *v36;
  LNBundleMetadata *v38;
  id obj;
  uint64_t v40;
  void *v41;
  id v42;
  id v43;
  id v44;
  id v45;
  id v46;
  id v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  _BYTE v52[128];
  uint64_t v53;

  v53 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v4 = (void *)objc_opt_new();
  v47 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v5 = (void *)objc_opt_new();
  v6 = (void *)objc_opt_new();
  v7 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v46 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v45 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v44 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v43 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v42 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v48 = 0u;
  v49 = 0u;
  v50 = 0u;
  v51 = 0u;
  obj = v3;
  v8 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v48, v52, 16);
  if (v8)
  {
    v9 = v8;
    v10 = 0;
    v40 = *(_QWORD *)v49;
    do
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v49 != v40)
          objc_enumerationMutation(obj);
        v12 = *(void **)(*((_QWORD *)&v48 + 1) + 8 * i);
        objc_msgSend(v12, "actions");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "ln_deduping:", v4);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "addEntriesFromDictionary:", v14);

        objc_msgSend(v12, "queries");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "ln_deduping:", v6);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "addEntriesFromDictionary:", v16);

        objc_msgSend(v12, "entities");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "ln_deduping:", v5);
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "addEntriesFromDictionary:", v18);

        objc_msgSend(v12, "enums");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "ln_deduping:", v7);
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "addEntriesFromDictionary:", v20);

        objc_msgSend(v12, "autoShortcuts");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v47, "addObjectsFromArray:", v21);

        objc_msgSend(v12, "negativePhrases");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v46, "addObjectsFromArray:", v22);

        objc_msgSend(v12, "examplePhrases");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v45, "addObjectsFromArray:", v23);

        objc_msgSend(v12, "assistantIntents");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v44, "addObjectsFromArray:", v24);

        objc_msgSend(v12, "assistantIntentNegativePhrases");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v43, "addObjectsFromArray:", v25);

        objc_msgSend(v12, "assistantEntities");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v42, "addObjectsFromArray:", v26);

        if (!v10)
        {
          objc_msgSend(v12, "autoShortcutProviderMangledName");
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x1E0CB3500], "whitespaceAndNewlineCharacterSet");
          v28 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v27, "stringByTrimmingCharactersInSet:", v28);
          v29 = (void *)objc_claimAutoreleasedReturnValue();

          if (objc_msgSend(v29, "length"))
            v10 = v29;
          else
            v10 = 0;

        }
      }
      v9 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v48, v52, 16);
    }
    while (v9);
  }
  else
  {
    v10 = 0;
  }

  objc_msgSend(v7, "allValues");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(obj, "firstObject");
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  v34 = objc_msgSend(v41, "shortcutTileColor");
  objc_msgSend(obj, "firstObject");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  v30 = objc_msgSend(v36, "version");
  objc_msgSend(obj, "firstObject");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "generator");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  v38 = -[LNBundleMetadata initWithActions:entities:queries:enums:autoShortcutProviderMangledName:autoShortcuts:shortcutTileColor:version:generator:negativePhrases:examplePhrases:assistantIntents:assistantIntentNegativePhrases:assistantEntities:](self, "initWithActions:entities:queries:enums:autoShortcutProviderMangledName:autoShortcuts:shortcutTileColor:version:generator:negativePhrases:examplePhrases:assistantIntents:assistantIntentNegativePhrases:assistantEntities:", v4, v5, v6, v35, v10, v47, v34, v30, v32, v46, v45, v44, v43, v42);

  return v38;
}

- (NSDictionary)entities
{
  return self->_entities;
}

- (NSDictionary)actions
{
  return self->_actions;
}

- (NSString)autoShortcutProviderMangledName
{
  return self->_autoShortcutProviderMangledName;
}

- (NSDictionary)queries
{
  return self->_queries;
}

- (NSDictionary)enums
{
  return self->_enums;
}

- (NSArray)negativePhrases
{
  return self->_negativePhrases;
}

- (NSArray)autoShortcuts
{
  return self->_autoShortcuts;
}

- (int64_t)version
{
  return self->_version;
}

- (int64_t)shortcutTileColor
{
  return self->_shortcutTileColor;
}

- (LNBundleMetadataGeneratorDescription)generator
{
  return self->_generator;
}

- (LNBundleMetadata)initWithBundle:(id)a3 usingEffectiveBundleIdentifier:(id)a4 error:(id *)a5
{
  LNBundleMetadata *result;

  LNBundleMetadata.init(bundle:using:)(a3, a4);
  return result;
}

+ (int64_t)latestMetadataVersion
{
  return 1;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_assistantEntities, 0);
  objc_storeStrong((id *)&self->_assistantIntentNegativePhrases, 0);
  objc_storeStrong((id *)&self->_assistantIntents, 0);
  objc_storeStrong((id *)&self->_examplePhrases, 0);
  objc_storeStrong((id *)&self->_negativePhrases, 0);
  objc_storeStrong((id *)&self->_autoShortcutProviderMangledName, 0);
  objc_storeStrong((id *)&self->_autoShortcuts, 0);
  objc_storeStrong((id *)&self->_generator, 0);
  objc_storeStrong((id *)&self->_enums, 0);
  objc_storeStrong((id *)&self->_queries, 0);
  objc_storeStrong((id *)&self->_entities, 0);
  objc_storeStrong((id *)&self->_actions, 0);
}

- (id)_initWithMetadataFileURL:(id)a3 bundleURL:(id)a4 effectiveBundleIdentifier:(id)a5 error:(id *)a6
{
  uint64_t v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  uint64_t v12;
  id v13;
  id result;
  uint64_t v15;

  v8 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EDBA3F50);
  MEMORY[0x1E0C80A78](v8);
  v10 = (char *)&v15 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = sub_19AB824B8();
  MEMORY[0x1E0C80A78](v11);
  sub_19AB82488();
  if (a4)
  {
    sub_19AB82488();
    v12 = 0;
  }
  else
  {
    v12 = 1;
  }
  __swift_storeEnumTagSinglePayload((uint64_t)v10, v12, 1, v11);
  v13 = a5;
  LNBundleMetadata.init(metadataFileURL:bundleURL:effectiveBundleIdentifier:)();
  return result;
}

- (LNBundleMetadata)initWithActions:(id)a3 entities:(id)a4 queries:(id)a5 enums:(id)a6 autoShortcutProviderMangledName:(id)a7 autoShortcuts:(id)a8 shortcutTileColor:(int64_t)a9 version:(int64_t)a10 generator:(id)a11 negativePhrases:(id)a12 examplePhrases:(id)a13 assistantIntents:(id)a14 assistantIntentNegativePhrases:(id)a15 assistantEntities:(id)a16
{
  id v21;
  id v22;
  id v23;
  id v24;
  id v25;
  id v26;
  id v27;
  id v28;
  id v29;
  LNBundleMetadata *v30;
  uint64_t v31;
  NSDictionary *actions;
  uint64_t v33;
  NSString *autoShortcutProviderMangledName;
  uint64_t v35;
  NSArray *autoShortcuts;
  uint64_t v37;
  NSDictionary *entities;
  uint64_t v39;
  NSDictionary *queries;
  NSDictionary *v41;
  id v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t i;
  void *v47;
  void *v48;
  void *v49;
  NSDictionary *enums;
  uint64_t v51;
  LNBundleMetadataGeneratorDescription *generator;
  uint64_t v53;
  NSArray *negativePhrases;
  uint64_t v55;
  NSArray *examplePhrases;
  uint64_t v57;
  NSArray *assistantIntents;
  uint64_t v59;
  NSArray *assistantIntentNegativePhrases;
  uint64_t v61;
  NSArray *assistantEntities;
  LNBundleMetadata *v63;
  void *v65;
  void *v66;
  void *v67;
  void *v68;
  id v69;
  id v70;
  id v72;
  id v73;
  id v74;
  id v75;
  __int128 v76;
  __int128 v77;
  __int128 v78;
  __int128 v79;
  objc_super v80;
  _BYTE v81[128];
  uint64_t v82;

  v82 = *MEMORY[0x1E0C80C00];
  v21 = a3;
  v22 = a4;
  v75 = a5;
  v74 = a6;
  v23 = a7;
  v24 = a8;
  v25 = a11;
  v26 = a12;
  v27 = a13;
  v73 = a14;
  v28 = a15;
  v29 = a16;
  v80.receiver = self;
  v80.super_class = (Class)LNBundleMetadata;
  v30 = -[LNBundleMetadata init](&v80, sel_init);
  if (v30)
  {
    v65 = v29;
    v66 = v27;
    v67 = v26;
    v68 = v25;
    v72 = v21;
    v31 = objc_msgSend(v21, "copy");
    actions = v30->_actions;
    v30->_actions = (NSDictionary *)v31;

    v33 = objc_msgSend(v23, "copy");
    autoShortcutProviderMangledName = v30->_autoShortcutProviderMangledName;
    v30->_autoShortcutProviderMangledName = (NSString *)v33;

    v69 = v24;
    v35 = objc_msgSend(v24, "copy");
    autoShortcuts = v30->_autoShortcuts;
    v30->_autoShortcuts = (NSArray *)v35;

    v70 = v22;
    v37 = objc_msgSend(v22, "copy");
    entities = v30->_entities;
    v30->_entities = (NSDictionary *)v37;

    v39 = objc_msgSend(v75, "copy");
    queries = v30->_queries;
    v30->_queries = (NSDictionary *)v39;

    v41 = (NSDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    v76 = 0u;
    v77 = 0u;
    v78 = 0u;
    v79 = 0u;
    v42 = v74;
    v43 = objc_msgSend(v42, "countByEnumeratingWithState:objects:count:", &v76, v81, 16);
    if (v43)
    {
      v44 = v43;
      v45 = *(_QWORD *)v77;
      do
      {
        for (i = 0; i != v44; ++i)
        {
          if (*(_QWORD *)v77 != v45)
            objc_enumerationMutation(v42);
          v47 = *(void **)(*((_QWORD *)&v76 + 1) + 8 * i);
          objc_msgSend(v47, "identifier");
          v48 = (void *)objc_claimAutoreleasedReturnValue();

          if (v48)
          {
            objc_msgSend(v47, "identifier");
            v49 = (void *)objc_claimAutoreleasedReturnValue();
            -[NSDictionary setObject:forKeyedSubscript:](v41, "setObject:forKeyedSubscript:", v47, v49);

          }
        }
        v44 = objc_msgSend(v42, "countByEnumeratingWithState:objects:count:", &v76, v81, 16);
      }
      while (v44);
    }

    enums = v30->_enums;
    v30->_enums = v41;

    v30->_shortcutTileColor = a9;
    v30->_version = a10;
    v25 = v68;
    v51 = objc_msgSend(v68, "copy");
    generator = v30->_generator;
    v30->_generator = (LNBundleMetadataGeneratorDescription *)v51;

    v26 = v67;
    v53 = objc_msgSend(v67, "copy");
    negativePhrases = v30->_negativePhrases;
    v30->_negativePhrases = (NSArray *)v53;

    v27 = v66;
    v55 = objc_msgSend(v66, "copy");
    examplePhrases = v30->_examplePhrases;
    v30->_examplePhrases = (NSArray *)v55;

    v57 = objc_msgSend(v73, "copy");
    assistantIntents = v30->_assistantIntents;
    v30->_assistantIntents = (NSArray *)v57;

    v59 = objc_msgSend(v28, "copy");
    assistantIntentNegativePhrases = v30->_assistantIntentNegativePhrases;
    v30->_assistantIntentNegativePhrases = (NSArray *)v59;

    v29 = v65;
    v61 = objc_msgSend(v65, "copy");
    assistantEntities = v30->_assistantEntities;
    v30->_assistantEntities = (NSArray *)v61;

    v63 = v30;
    v22 = v70;
    v21 = v72;
    v24 = v69;
  }

  return v30;
}

- (void)applyAttributionBundleIdentifier:(id)a3 icon:(id)a4
{
  id v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  NSDictionary *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  void *v23;
  void *v24;
  NSDictionary *entities;
  id v26;
  id v27;
  id obj;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  _BYTE v37[128];
  _BYTE v38[128];
  uint64_t v39;

  v39 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v27 = a4;
  obj = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v33 = 0u;
  v34 = 0u;
  v35 = 0u;
  v36 = 0u;
  -[LNBundleMetadata actions](self, "actions");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v33, v38, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v34;
    do
    {
      v11 = 0;
      do
      {
        if (*(_QWORD *)v34 != v10)
          objc_enumerationMutation(v7);
        v12 = *(_QWORD *)(*((_QWORD *)&v33 + 1) + 8 * v11);
        -[LNBundleMetadata actions](self, "actions");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "objectForKeyedSubscript:", v12);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "actionMetadataWithAttributionBundleIdentifier:icon:", v6, v27);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(obj, "setObject:forKeyedSubscript:", v15, v12);

        ++v11;
      }
      while (v9 != v11);
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v33, v38, 16);
    }
    while (v9);
  }

  objc_storeStrong((id *)&self->_actions, obj);
  v16 = (NSDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
  v29 = 0u;
  v30 = 0u;
  v31 = 0u;
  v32 = 0u;
  -[LNBundleMetadata entities](self, "entities");
  v26 = (id)objc_claimAutoreleasedReturnValue();
  v17 = objc_msgSend(v26, "countByEnumeratingWithState:objects:count:", &v29, v37, 16);
  if (v17)
  {
    v18 = v17;
    v19 = *(_QWORD *)v30;
    do
    {
      v20 = 0;
      do
      {
        if (*(_QWORD *)v30 != v19)
          objc_enumerationMutation(v26);
        v21 = *(_QWORD *)(*((_QWORD *)&v29 + 1) + 8 * v20);
        -[LNBundleMetadata entities](self, "entities");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v22, "objectForKeyedSubscript:", v21);
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v23, "entityMetadataWithAttributionBundleIdentifier:", v6);
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSDictionary setObject:forKeyedSubscript:](v16, "setObject:forKeyedSubscript:", v24, v21);

        ++v20;
      }
      while (v18 != v20);
      v18 = objc_msgSend(v26, "countByEnumeratingWithState:objects:count:", &v29, v37, 16);
    }
    while (v18);
  }

  entities = self->_entities;
  self->_entities = v16;

}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;

  v4 = a3;
  -[LNBundleMetadata actions](self, "actions");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("actions"));

  -[LNBundleMetadata autoShortcutProviderMangledName](self, "autoShortcutProviderMangledName");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("autoShortcutProviderMangledName"));

  -[LNBundleMetadata autoShortcuts](self, "autoShortcuts");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v7, CFSTR("autoShortcuts"));

  objc_msgSend(v4, "encodeInteger:forKey:", -[LNBundleMetadata shortcutTileColor](self, "shortcutTileColor"), CFSTR("shortcutTileColor"));
  -[LNBundleMetadata entities](self, "entities");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v8, CFSTR("entities"));

  -[LNBundleMetadata queries](self, "queries");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v9, CFSTR("queries"));

  -[LNBundleMetadata enums](self, "enums");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v10, CFSTR("enums"));

  objc_msgSend(v4, "encodeInteger:forKey:", -[LNBundleMetadata version](self, "version"), CFSTR("version"));
  -[LNBundleMetadata generator](self, "generator");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v11, CFSTR("generator"));

  -[LNBundleMetadata negativePhrases](self, "negativePhrases");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v12, CFSTR("negativePhrases"));

  -[LNBundleMetadata examplePhrases](self, "examplePhrases");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v13, CFSTR("examplePhrases"));

  -[LNBundleMetadata assistantIntents](self, "assistantIntents");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v14, CFSTR("assistantIntents"));

  -[LNBundleMetadata assistantIntentNegativePhrases](self, "assistantIntentNegativePhrases");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v15, CFSTR("assistantIntentNegativePhrases"));

  -[LNBundleMetadata assistantEntities](self, "assistantEntities");
  v16 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v16, CFSTR("assistantEntities"));

}

- (LNBundleMetadata)initWithCoder:(id)a3
{
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  void *v21;
  uint64_t v22;
  void *v23;
  uint64_t v24;
  void *v25;
  uint64_t v26;
  void *v27;
  void *v28;
  uint64_t v29;
  void *v30;
  void *v31;
  uint64_t v32;
  void *v33;
  void *v34;
  uint64_t v35;
  void *v36;
  void *v37;
  void *v38;
  uint64_t v39;
  void *v40;
  uint64_t v41;
  LNBundleMetadata *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  LNBundleMetadata *v52;
  void *v54;
  uint64_t v55;
  uint64_t v56;
  void *v57;
  void *v58;
  uint64_t v59;
  uint64_t v60;
  void *v62;
  void *v63;
  void *v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;

  v3 = a3;
  v4 = (void *)MEMORY[0x1E0C99E60];
  v5 = objc_opt_class();
  v6 = objc_opt_class();
  objc_msgSend(v4, "setWithObjects:", v5, v6, objc_opt_class(), 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "decodeObjectOfClasses:forKey:", v7, CFSTR("actions"));
  v8 = objc_claimAutoreleasedReturnValue();

  v9 = (void *)MEMORY[0x1E0C99E60];
  v10 = objc_opt_class();
  objc_msgSend(v9, "setWithObjects:", v10, objc_opt_class(), 0);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "decodeObjectOfClasses:forKey:", v11, CFSTR("autoShortcuts"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  v56 = objc_msgSend(v3, "decodeIntegerForKey:", CFSTR("shortcutTileColor"));
  v13 = (void *)MEMORY[0x1E0C99E60];
  v14 = objc_opt_class();
  v15 = objc_opt_class();
  objc_msgSend(v13, "setWithObjects:", v14, v15, objc_opt_class(), 0);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "decodeObjectOfClasses:forKey:", v16, CFSTR("entities"));
  v67 = objc_claimAutoreleasedReturnValue();

  v17 = (void *)MEMORY[0x1E0C99E60];
  v18 = objc_opt_class();
  v19 = objc_opt_class();
  objc_msgSend(v17, "setWithObjects:", v18, v19, objc_opt_class(), 0);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "decodeObjectOfClasses:forKey:", v20, CFSTR("queries"));
  v65 = objc_claimAutoreleasedReturnValue();

  v21 = (void *)MEMORY[0x1E0C99E60];
  v22 = objc_opt_class();
  objc_msgSend(v21, "setWithObjects:", v22, objc_opt_class(), 0);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "decodeObjectOfClasses:forKey:", v23, CFSTR("enums"));
  v24 = objc_claimAutoreleasedReturnValue();

  v25 = (void *)MEMORY[0x1E0C99E60];
  v26 = objc_opt_class();
  objc_msgSend(v25, "setWithObjects:", v26, objc_opt_class(), 0);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "decodeObjectOfClasses:forKey:", v27, CFSTR("negativePhrases"));
  v60 = objc_claimAutoreleasedReturnValue();

  v28 = (void *)MEMORY[0x1E0C99E60];
  v29 = objc_opt_class();
  objc_msgSend(v28, "setWithObjects:", v29, objc_opt_class(), 0);
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "decodeObjectOfClasses:forKey:", v30, CFSTR("examplePhrases"));
  v66 = objc_claimAutoreleasedReturnValue();

  v31 = (void *)MEMORY[0x1E0C99E60];
  v32 = objc_opt_class();
  objc_msgSend(v31, "setWithObjects:", v32, objc_opt_class(), 0);
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "decodeObjectOfClasses:forKey:", v33, CFSTR("assistantIntents"));
  v59 = objc_claimAutoreleasedReturnValue();

  v34 = (void *)MEMORY[0x1E0C99E60];
  v35 = objc_opt_class();
  objc_msgSend(v34, "setWithObjects:", v35, objc_opt_class(), 0);
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "decodeObjectOfClasses:forKey:", v36, CFSTR("assistantIntentNegativePhrases"));
  v37 = (void *)objc_claimAutoreleasedReturnValue();

  v38 = (void *)MEMORY[0x1E0C99E60];
  v39 = objc_opt_class();
  objc_msgSend(v38, "setWithObjects:", v39, objc_opt_class(), 0);
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "decodeObjectOfClasses:forKey:", v40, CFSTR("assistantEntities"));
  v41 = objc_claimAutoreleasedReturnValue();

  v42 = 0;
  v63 = v3;
  v64 = (void *)v8;
  v62 = (void *)v24;
  if (!v8)
  {
    v51 = (void *)v60;
    v52 = self;
    v49 = (void *)v41;
    v43 = (void *)v66;
    v44 = (void *)v67;
    v46 = (void *)v65;
    v50 = (void *)v59;
    goto LABEL_11;
  }
  v57 = (void *)v41;
  v58 = v37;
  v43 = (void *)v66;
  if (!v12)
  {
    v52 = self;
    v44 = (void *)v67;
    goto LABEL_8;
  }
  v44 = (void *)v67;
  if (!v67)
    goto LABEL_7;
  v45 = (void *)v24;
  v46 = (void *)v65;
  if (!v65)
  {
    v52 = self;
    goto LABEL_10;
  }
  if (!v45)
  {
LABEL_7:
    v52 = self;
LABEL_8:
    v46 = (void *)v65;
LABEL_10:
    v50 = (void *)v59;
    v51 = (void *)v60;
    v49 = v57;
    v37 = v58;
    goto LABEL_11;
  }
  objc_msgSend(v3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("autoShortcutProviderMangledName"));
  v54 = (void *)objc_claimAutoreleasedReturnValue();
  v55 = objc_msgSend(v3, "decodeIntegerForKey:", CFSTR("version"));
  objc_msgSend(v3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("generator"));
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v45, "allValues");
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  v49 = v57;
  v37 = v58;
  v50 = (void *)v59;
  v51 = (void *)v60;
  v46 = (void *)v65;
  v52 = -[LNBundleMetadata initWithActions:entities:queries:enums:autoShortcutProviderMangledName:autoShortcuts:shortcutTileColor:version:generator:negativePhrases:examplePhrases:assistantIntents:assistantIntentNegativePhrases:assistantEntities:](self, "initWithActions:entities:queries:enums:autoShortcutProviderMangledName:autoShortcuts:shortcutTileColor:version:generator:negativePhrases:examplePhrases:assistantIntents:assistantIntentNegativePhrases:assistantEntities:", v8, v67, v65, v48, v54, v12, v56, v55, v47, v60, v66, v59, v58, v57);

  v43 = (void *)v66;
  v44 = (void *)v67;

  v42 = v52;
LABEL_11:

  return v42;
}

- (id)copyWithZone:(_NSZone *)a3
{
  void *v4;
  void *v5;
  int64_t v6;
  int64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  LNBundleMetadata *v18;
  LNBundleMetadata *v19;
  void *v20;
  void *v21;

  v18 = [LNBundleMetadata alloc];
  -[LNBundleMetadata actions](self, "actions");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  -[LNBundleMetadata entities](self, "entities");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[LNBundleMetadata queries](self, "queries");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[LNBundleMetadata enums](self, "enums");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "allValues");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  -[LNBundleMetadata autoShortcutProviderMangledName](self, "autoShortcutProviderMangledName");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  -[LNBundleMetadata autoShortcuts](self, "autoShortcuts");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[LNBundleMetadata shortcutTileColor](self, "shortcutTileColor");
  v7 = -[LNBundleMetadata version](self, "version");
  -[LNBundleMetadata generator](self, "generator");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[LNBundleMetadata negativePhrases](self, "negativePhrases");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[LNBundleMetadata examplePhrases](self, "examplePhrases");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[LNBundleMetadata assistantIntents](self, "assistantIntents");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[LNBundleMetadata assistantIntentNegativePhrases](self, "assistantIntentNegativePhrases");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[LNBundleMetadata assistantEntities](self, "assistantEntities");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = -[LNBundleMetadata initWithActions:entities:queries:enums:autoShortcutProviderMangledName:autoShortcuts:shortcutTileColor:version:generator:negativePhrases:examplePhrases:assistantIntents:assistantIntentNegativePhrases:assistantEntities:](v18, "initWithActions:entities:queries:enums:autoShortcutProviderMangledName:autoShortcuts:shortcutTileColor:version:generator:negativePhrases:examplePhrases:assistantIntents:assistantIntentNegativePhrases:assistantEntities:", v21, v4, v5, v17, v16, v15, v6, v7, v14, v8, v9, v10, v11, v12);

  return v19;
}

- (id)description
{
  objc_class *v3;
  int64_t v4;
  __CFString *v5;
  __CFString *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v17;
  uint64_t v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;

  v27 = (void *)MEMORY[0x1E0CB3940];
  v3 = (objc_class *)objc_opt_class();
  NSStringFromClass(v3);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  -[LNBundleMetadata actions](self, "actions");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = objc_msgSend(v30, "count");
  -[LNBundleMetadata entities](self, "entities");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = objc_msgSend(v29, "count");
  -[LNBundleMetadata queries](self, "queries");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = objc_msgSend(v28, "count");
  -[LNBundleMetadata enums](self, "enums");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = objc_msgSend(v26, "count");
  -[LNBundleMetadata autoShortcuts](self, "autoShortcuts");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = objc_msgSend(v24, "count");
  v4 = -[LNBundleMetadata version](self, "version");
  v5 = CFSTR("1.0");
  if (!v4)
    v5 = CFSTR("0.0");
  v6 = v5;
  -[LNBundleMetadata generator](self, "generator");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  -[LNBundleMetadata negativePhrases](self, "negativePhrases");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v19, "count");
  -[LNBundleMetadata examplePhrases](self, "examplePhrases");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "count");
  -[LNBundleMetadata assistantIntents](self, "assistantIntents");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "count");
  -[LNBundleMetadata assistantIntentNegativePhrases](self, "assistantIntentNegativePhrases");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "count");
  -[LNBundleMetadata assistantEntities](self, "assistantEntities");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "stringWithFormat:", CFSTR("<%@: %p, actions: %lu, entities: %lu, queries: %lu, enums: %lu, autoShortcuts: %lu, version: %@, generator: %@>, negativePhrases: %lu examplePhrases: %lu, assistantIntents: %lu, assistantIntentNegativePhrases: %lu, assistantEntities: %lu"), v25, self, v23, v22, v21, v20, v18, v6, v17, v7, v9, v11, v13, objc_msgSend(v14, "count"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  return v15;
}

- (id)verboseDescription
{
  objc_class *v3;
  void *v4;
  int64_t v5;
  __CFString *v6;
  __CFString *v7;
  int64_t v8;
  __CFString *v9;
  __CFString *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;

  v19 = (void *)MEMORY[0x1E0CB3940];
  v3 = (objc_class *)objc_opt_class();
  NSStringFromClass(v3);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  -[LNBundleMetadata actions](self, "actions");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  -[LNBundleMetadata entities](self, "entities");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  -[LNBundleMetadata queries](self, "queries");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  -[LNBundleMetadata enums](self, "enums");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  -[LNBundleMetadata autoShortcuts](self, "autoShortcuts");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[LNBundleMetadata shortcutTileColor](self, "shortcutTileColor");
  if ((unint64_t)(v5 - 1) > 0xD)
    v6 = CFSTR("red");
  else
    v6 = off_1E39A0B50[v5 - 1];
  v7 = v6;
  v8 = -[LNBundleMetadata version](self, "version");
  v9 = CFSTR("1.0");
  if (!v8)
    v9 = CFSTR("0.0");
  v10 = v9;
  -[LNBundleMetadata generator](self, "generator");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  -[LNBundleMetadata negativePhrases](self, "negativePhrases");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[LNBundleMetadata examplePhrases](self, "examplePhrases");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[LNBundleMetadata assistantIntents](self, "assistantIntents");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[LNBundleMetadata assistantIntentNegativePhrases](self, "assistantIntentNegativePhrases");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[LNBundleMetadata assistantEntities](self, "assistantEntities");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "stringWithFormat:", CFSTR("<%@: %p, actions: %@, entities: %@, queries: %@, enums: %@, autoShortcuts: %@, shortcutTileColor: %@, version: %@, generator: %@>, negativePhrases: %@ examplePhrases: %@, assistantIntents: %@, assistantIntentNegativePhrases: %@, assistantEntities: %@>"), v23, self, v18, v22, v24, v21, v4, v7, v10, v17, v11, v12, v13, v14, v15);
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  return v20;
}

- (unint64_t)hash
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  int64_t v10;
  int64_t v11;
  void *v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  void *v20;
  uint64_t v21;
  void *v22;
  unint64_t v23;
  void *v25;
  void *v26;
  void *v27;

  -[LNBundleMetadata actions](self, "actions");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v27, "hash");
  -[LNBundleMetadata entities](self, "entities");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v26, "hash") ^ v3;
  -[LNBundleMetadata queries](self, "queries");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v25, "hash");
  -[LNBundleMetadata enums](self, "enums");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v4 ^ v5 ^ objc_msgSend(v6, "hash");
  -[LNBundleMetadata autoShortcuts](self, "autoShortcuts");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "hash");
  v10 = v9 ^ -[LNBundleMetadata shortcutTileColor](self, "shortcutTileColor");
  v11 = v7 ^ v10 ^ -[LNBundleMetadata version](self, "version");
  -[LNBundleMetadata generator](self, "generator");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "hash");
  -[LNBundleMetadata negativePhrases](self, "negativePhrases");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = v13 ^ objc_msgSend(v14, "hash");
  -[LNBundleMetadata examplePhrases](self, "examplePhrases");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = v15 ^ objc_msgSend(v16, "hash");
  -[LNBundleMetadata assistantIntents](self, "assistantIntents");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = v11 ^ v17 ^ objc_msgSend(v18, "hash");
  -[LNBundleMetadata assistantIntentNegativePhrases](self, "assistantIntentNegativePhrases");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = objc_msgSend(v20, "hash");
  -[LNBundleMetadata assistantEntities](self, "assistantEntities");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = v19 ^ v21 ^ objc_msgSend(v22, "hash");

  return v23;
}

- (BOOL)isEqual:(id)a3
{
  LNBundleMetadata *v4;
  LNBundleMetadata *v5;
  LNBundleMetadata *v6;
  void *v7;
  void *v8;
  id v9;
  id v10;
  void *v11;
  int v12;
  void *v13;
  id v14;
  int v15;
  void *v16;
  void *v17;
  id v18;
  void *v19;
  id v20;
  int v21;
  void *v22;
  void *v23;
  id v24;
  void *v25;
  void *v26;
  void *v27;
  id v28;
  id v29;
  void *v30;
  int v31;
  int64_t v32;
  void *v33;
  void *v34;
  id v35;
  void *v36;
  int v37;
  void *v38;
  void *v39;
  id v40;
  id v41;
  void *v42;
  void *v43;
  int v44;
  int64_t v45;
  void *v46;
  void *v47;
  id v48;
  void *v49;
  int v50;
  void *v51;
  void *v52;
  id v53;
  id v54;
  void *v55;
  void *v56;
  int v57;
  void *v58;
  void *v59;
  id v60;
  id v61;
  void *v62;
  void *v63;
  void *v64;
  id v65;
  id v66;
  void *v67;
  void *v68;
  void *v69;
  id v70;
  void *v71;
  void *v72;
  void *v73;
  int v75;
  void *v76;
  void *v77;
  int v78;
  void *v79;
  void *v80;
  void *v81;
  void *v82;
  id v83;
  void *v84;
  id v85;
  id v86;
  id v87;
  void *v88;
  void *v89;
  id v90;
  void *v91;
  id v92;

  v4 = (LNBundleMetadata *)a3;
  v5 = v4;
  if (self != v4)
  {
    v6 = v4;
    if (!v6 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
    {
      LOBYTE(v12) = 0;
LABEL_98:

      goto LABEL_99;
    }
    -[LNBundleMetadata actions](self, "actions");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[LNBundleMetadata actions](v6, "actions");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = v7;
    v10 = v8;
    v11 = v10;
    if (v9 == v10)
    {

    }
    else
    {
      LOBYTE(v12) = 0;
      v13 = v10;
      v14 = v9;
      if (!v9 || !v10)
        goto LABEL_96;
      v15 = objc_msgSend(v9, "isEqualToDictionary:", v10);

      if (!v15)
      {
        LOBYTE(v12) = 0;
LABEL_97:

        goto LABEL_98;
      }
    }
    -[LNBundleMetadata entities](self, "entities");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[LNBundleMetadata entities](v6, "entities");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = v16;
    v18 = v17;
    v13 = v18;
    if (v14 == v18)
    {

    }
    else
    {
      LOBYTE(v12) = 0;
      v19 = v18;
      v20 = v14;
      if (!v14 || !v18)
        goto LABEL_95;
      v21 = objc_msgSend(v14, "isEqualToDictionary:", v18);

      if (!v21)
      {
        LOBYTE(v12) = 0;
LABEL_96:

        goto LABEL_97;
      }
    }
    -[LNBundleMetadata queries](self, "queries");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    -[LNBundleMetadata queries](v6, "queries");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = v22;
    v24 = v23;
    v19 = v24;
    v92 = v20;
    if (v20 == v24)
    {

    }
    else
    {
      LOBYTE(v12) = 0;
      v25 = v24;
      if (!v20 || !v24)
        goto LABEL_94;
      v12 = objc_msgSend(v20, "isEqualToDictionary:", v24);

      if (!v12)
        goto LABEL_95;
    }
    v91 = v19;
    -[LNBundleMetadata enums](self, "enums");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    -[LNBundleMetadata enums](v6, "enums");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v28 = v26;
    v29 = v27;
    v89 = v29;
    v90 = v28;
    if (v28 == v29)
    {

    }
    else
    {
      LOBYTE(v12) = 0;
      if (!v28)
      {
        v30 = v29;
        v19 = v91;
        goto LABEL_92;
      }
      v30 = v29;
      v19 = v91;
      if (!v29)
      {
LABEL_92:

        goto LABEL_93;
      }
      v31 = objc_msgSend(v28, "isEqualToDictionary:", v29);

      if (!v31)
        goto LABEL_36;
    }
    v32 = -[LNBundleMetadata version](self, "version");
    if (v32 != -[LNBundleMetadata version](v6, "version"))
    {
LABEL_36:
      LOBYTE(v12) = 0;
      v19 = v91;
LABEL_93:
      v20 = v90;
      v25 = v89;
LABEL_94:

      v20 = v92;
LABEL_95:

      goto LABEL_96;
    }
    -[LNBundleMetadata generator](self, "generator");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    -[LNBundleMetadata generator](v6, "generator");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    v28 = v33;
    v35 = v34;
    v87 = v28;
    v88 = v35;
    if (v28 == v35)
    {

    }
    else
    {
      LOBYTE(v12) = 0;
      if (!v28)
      {
        v36 = v35;
        v19 = v91;
        goto LABEL_91;
      }
      v36 = v35;
      v19 = v91;
      if (!v35)
      {
LABEL_91:

        v28 = v87;
        v30 = v88;
        goto LABEL_92;
      }
      v37 = objc_msgSend(v28, "isEqual:", v35);

      if (!v37)
      {
        LOBYTE(v12) = 0;
        v19 = v91;
        v30 = v88;
        goto LABEL_92;
      }
    }
    -[LNBundleMetadata autoShortcuts](self, "autoShortcuts");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    -[LNBundleMetadata autoShortcuts](v6, "autoShortcuts");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    v28 = v38;
    v40 = v39;
    v41 = v40;
    v86 = v28;
    if (v28 == v40)
    {
      v85 = v40;

    }
    else
    {
      LOBYTE(v12) = 0;
      v42 = v40;
      if (!v28)
      {
        v19 = v91;
        goto LABEL_90;
      }
      v19 = v91;
      if (!v40)
      {
LABEL_90:
        v72 = v28;
        v73 = v41;

        v36 = v73;
        v28 = v86;
        goto LABEL_91;
      }
      v43 = v40;
      v44 = objc_msgSend(v28, "isEqualToArray:", v40);
      v85 = v43;

      if (!v44)
        goto LABEL_51;
    }
    v45 = -[LNBundleMetadata shortcutTileColor](self, "shortcutTileColor");
    if (v45 != -[LNBundleMetadata shortcutTileColor](v6, "shortcutTileColor"))
    {
LABEL_51:
      LOBYTE(v12) = 0;
      v19 = v91;
      v36 = v85;
      goto LABEL_91;
    }
    -[LNBundleMetadata negativePhrases](self, "negativePhrases");
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    -[LNBundleMetadata negativePhrases](v6, "negativePhrases");
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    v28 = v46;
    v48 = v47;
    v83 = v28;
    v84 = v48;
    if (v28 != v48)
    {
      LOBYTE(v12) = 0;
      if (v28)
      {
        v49 = v48;
        v19 = v91;
        if (v48)
        {
          v50 = objc_msgSend(v28, "isEqualToArray:", v48);

          if (!v50)
          {
            LOBYTE(v12) = 0;
            v19 = v91;
            v42 = v84;
            v41 = v85;
            goto LABEL_90;
          }
LABEL_55:
          -[LNBundleMetadata examplePhrases](self, "examplePhrases");
          v51 = (void *)objc_claimAutoreleasedReturnValue();
          -[LNBundleMetadata examplePhrases](v6, "examplePhrases");
          v52 = (void *)objc_claimAutoreleasedReturnValue();
          v53 = v51;
          v54 = v52;
          v81 = v54;
          v82 = v53;
          if (v53 != v54)
          {
            LOBYTE(v12) = 0;
            if (v53)
            {
              v55 = v54;
              v56 = v53;
              v19 = v91;
              if (v54)
              {
                v57 = objc_msgSend(v82, "isEqualToArray:", v54);

                if (!v57)
                {
                  LOBYTE(v12) = 0;
                  v19 = v91;
LABEL_88:
                  v49 = v81;
                  v28 = v82;
                  goto LABEL_89;
                }
LABEL_61:
                -[LNBundleMetadata assistantIntents](self, "assistantIntents");
                v58 = (void *)objc_claimAutoreleasedReturnValue();
                -[LNBundleMetadata assistantIntents](v6, "assistantIntents");
                v59 = (void *)objc_claimAutoreleasedReturnValue();
                v60 = v58;
                v61 = v59;
                v79 = v61;
                v80 = v60;
                if (v60 != v61)
                {
                  LOBYTE(v12) = 0;
                  if (v60)
                  {
                    v62 = v61;
                    v77 = v60;
                    v19 = v91;
                    if (v61)
                    {
                      v78 = objc_msgSend(v80, "isEqualToArray:", v61);

                      if (!v78)
                      {
                        LOBYTE(v12) = 0;
                        v19 = v91;
LABEL_86:
                        v55 = v79;
                        v56 = v80;
                        goto LABEL_87;
                      }
LABEL_68:
                      -[LNBundleMetadata assistantIntentNegativePhrases](self, "assistantIntentNegativePhrases");
                      v63 = (void *)objc_claimAutoreleasedReturnValue();
                      -[LNBundleMetadata assistantIntentNegativePhrases](v6, "assistantIntentNegativePhrases");
                      v64 = (void *)objc_claimAutoreleasedReturnValue();
                      v65 = v63;
                      v66 = v64;
                      v76 = v66;
                      v77 = v65;
                      if (v65 != v66)
                      {
                        LOBYTE(v12) = 0;
                        if (v65)
                        {
                          v67 = v66;
                          if (v66)
                          {
                            v75 = objc_msgSend(v65, "isEqualToArray:", v66);

                            if (!v75)
                            {
                              LOBYTE(v12) = 0;
LABEL_84:
                              v19 = v91;
                              v62 = v76;
                              goto LABEL_85;
                            }
                            goto LABEL_75;
                          }
                        }
                        else
                        {
                          v67 = v66;
                        }
LABEL_83:

                        goto LABEL_84;
                      }

LABEL_75:
                      -[LNBundleMetadata assistantEntities](self, "assistantEntities");
                      v68 = (void *)objc_claimAutoreleasedReturnValue();
                      -[LNBundleMetadata assistantEntities](v6, "assistantEntities");
                      v69 = (void *)objc_claimAutoreleasedReturnValue();
                      v65 = v68;
                      v70 = v69;
                      v71 = v70;
                      if (v65 == v70)
                      {
                        LOBYTE(v12) = 1;
                      }
                      else
                      {
                        LOBYTE(v12) = 0;
                        if (v65 && v70)
                          LOBYTE(v12) = objc_msgSend(v65, "isEqualToArray:", v70);
                      }

                      v67 = v71;
                      goto LABEL_83;
                    }
                  }
                  else
                  {
                    v62 = v61;
                    v77 = 0;
                    v19 = v91;
                  }
LABEL_85:

                  goto LABEL_86;
                }

                goto LABEL_68;
              }
            }
            else
            {
              v55 = v54;
              v56 = 0;
              v19 = v91;
            }
LABEL_87:

            goto LABEL_88;
          }

          goto LABEL_61;
        }
      }
      else
      {
        v49 = v48;
        v19 = v91;
      }
LABEL_89:

      v42 = v84;
      v41 = v85;
      v28 = v83;
      goto LABEL_90;
    }

    goto LABEL_55;
  }
  LOBYTE(v12) = 1;
LABEL_99:

  return v12;
}

- (NSArray)examplePhrases
{
  return self->_examplePhrases;
}

- (NSArray)assistantIntents
{
  return self->_assistantIntents;
}

- (NSArray)assistantIntentNegativePhrases
{
  return self->_assistantIntentNegativePhrases;
}

- (NSArray)assistantEntities
{
  return self->_assistantEntities;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (LNBundleMetadata)initWithActions:(id)a3 entities:(id)a4 queries:(id)a5 enums:(id)a6 autoShortcutProviderMangledName:(id)a7 autoShortcuts:(id)a8 shortcutTileColor:(int64_t)a9 version:(int64_t)a10 generator:(id)a11 negativePhrases:(id)a12 examplePhrases:(id)a13 assistantIntents:(id)a14 assistantIntentNegativePhrases:(id)a15
{
  return -[LNBundleMetadata initWithActions:entities:queries:enums:autoShortcutProviderMangledName:autoShortcuts:shortcutTileColor:version:generator:negativePhrases:examplePhrases:assistantIntents:assistantIntentNegativePhrases:assistantEntities:](self, "initWithActions:entities:queries:enums:autoShortcutProviderMangledName:autoShortcuts:shortcutTileColor:version:generator:negativePhrases:examplePhrases:assistantIntents:assistantIntentNegativePhrases:assistantEntities:", a3, a4, a5, a6, a7, a8, a9, a10, a11, a12, a13, a14, a15, 0);
}

- (LNBundleMetadata)initWithActions:(id)a3 entities:(id)a4 queries:(id)a5 enums:(id)a6 autoShortcutProviderMangledName:(id)a7 autoShortcuts:(id)a8 shortcutTileColor:(int64_t)a9 version:(int64_t)a10 generator:(id)a11 negativePhrases:(id)a12 examplePhrases:(id)a13
{
  return -[LNBundleMetadata initWithActions:entities:queries:enums:autoShortcutProviderMangledName:autoShortcuts:shortcutTileColor:version:generator:negativePhrases:examplePhrases:assistantIntents:assistantIntentNegativePhrases:assistantEntities:](self, "initWithActions:entities:queries:enums:autoShortcutProviderMangledName:autoShortcuts:shortcutTileColor:version:generator:negativePhrases:examplePhrases:assistantIntents:assistantIntentNegativePhrases:assistantEntities:", a3, a4, a5, a6, a7, a8, a9, a10, a11, a12, a13, 0, 0, 0);
}

- (LNBundleMetadata)initWithActions:(id)a3 entities:(id)a4 queries:(id)a5 enums:(id)a6 autoShortcutProviderMangledName:(id)a7 autoShortcuts:(id)a8 shortcutTileColor:(int64_t)a9 version:(int64_t)a10 generator:(id)a11
{
  return -[LNBundleMetadata initWithActions:entities:queries:enums:autoShortcutProviderMangledName:autoShortcuts:shortcutTileColor:version:generator:negativePhrases:examplePhrases:assistantIntents:assistantIntentNegativePhrases:assistantEntities:](self, "initWithActions:entities:queries:enums:autoShortcutProviderMangledName:autoShortcuts:shortcutTileColor:version:generator:negativePhrases:examplePhrases:assistantIntents:assistantIntentNegativePhrases:assistantEntities:", a3, a4, a5, a6, a7, a8, a9, a10, a11, 0, 0, 0, 0, 0);
}

- (LNBundleMetadata)initWithActions:(id)a3 entities:(id)a4 queries:(id)a5 enums:(id)a6 autoShortcutProviderMangledName:(id)a7 autoShortcuts:(id)a8 version:(int64_t)a9 generator:(id)a10
{
  return -[LNBundleMetadata initWithActions:entities:queries:enums:autoShortcutProviderMangledName:autoShortcuts:shortcutTileColor:version:generator:](self, "initWithActions:entities:queries:enums:autoShortcutProviderMangledName:autoShortcuts:shortcutTileColor:version:generator:", a3, a4, a5, a6, a7, a8, 14, a9, a10);
}

- (LNBundleMetadata)initWithActions:(id)a3 entities:(id)a4 queries:(id)a5 enums:(id)a6 autoShortcuts:(id)a7 version:(int64_t)a8 generator:(id)a9
{
  return -[LNBundleMetadata initWithActions:entities:queries:enums:autoShortcutProviderMangledName:autoShortcuts:version:generator:](self, "initWithActions:entities:queries:enums:autoShortcutProviderMangledName:autoShortcuts:version:generator:", a3, a4, a5, a6, 0, a7, a8, a9);
}

- (LNBundleMetadata)initWithActions:(id)a3 entities:(id)a4 queries:(id)a5 enums:(id)a6 version:(int64_t)a7 generator:(id)a8
{
  return -[LNBundleMetadata initWithActions:entities:queries:enums:autoShortcuts:version:generator:](self, "initWithActions:entities:queries:enums:autoShortcuts:version:generator:", a3, a4, a5, a6, MEMORY[0x1E0C9AA60], a7, a8);
}

- (LNBundleMetadata)initWithActions:(id)a3 entities:(id)a4 queries:(id)a5 enums:(id)a6 version:(int64_t)a7
{
  return -[LNBundleMetadata initWithActions:entities:queries:enums:autoShortcuts:version:generator:](self, "initWithActions:entities:queries:enums:autoShortcuts:version:generator:", a3, a4, a5, a6, MEMORY[0x1E0C9AA60], a7, 0);
}

- (LNBundleMetadata)initWithActions:(id)a3 entities:(id)a4 queries:(id)a5 enums:(id)a6
{
  return -[LNBundleMetadata initWithActions:entities:queries:enums:autoShortcuts:version:generator:](self, "initWithActions:entities:queries:enums:autoShortcuts:version:generator:", a3, a4, a5, a6, MEMORY[0x1E0C9AA60], 0, 0);
}

@end
