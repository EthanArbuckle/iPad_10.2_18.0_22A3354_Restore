@implementation AXSwitchRecipe

+ (id)recipeWithDictionaryRepresentation:(id)a3
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  _BYTE v27[128];
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = objc_alloc_init((Class)a1);
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("Name"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setName:", v6);

  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("UnlocalizedName"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setUnlocalizedName:", v7);

  v8 = objc_alloc(MEMORY[0x1E0CB3A28]);
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("UUID"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)objc_msgSend(v8, "initWithUUIDString:", v9);

  objc_msgSend(v5, "setUuid:", v10);
  v11 = (void *)MEMORY[0x1E0C99DE8];
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("Mappings"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "arrayWithCapacity:", objc_msgSend(v12, "count"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  v25 = 0u;
  v26 = 0u;
  v23 = 0u;
  v24 = 0u;
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("Mappings"), 0);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
  if (v15)
  {
    v16 = v15;
    v17 = *(_QWORD *)v24;
    do
    {
      v18 = 0;
      do
      {
        if (*(_QWORD *)v24 != v17)
          objc_enumerationMutation(v14);
        +[AXSwitchRecipeMapping recipeMappingWithDictionaryRepresentation:](AXSwitchRecipeMapping, "recipeMappingWithDictionaryRepresentation:", *(_QWORD *)(*((_QWORD *)&v23 + 1) + 8 * v18));
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "addObject:", v19);

        ++v18;
      }
      while (v16 != v18);
      v16 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
    }
    while (v16);
  }

  objc_msgSend(v5, "setMappings:", v13);
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("Timeout"));
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "doubleValue");
  objc_msgSend(v5, "setTimeout:");

  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("MenuIconIdentifier"));
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setMenuIconIdentifier:", v21);

  return v5;
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;
  void *v5;
  const __CFString *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t i;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  _BYTE v30[128];
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", 2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[AXSwitchRecipe unlocalizedName](self, "unlocalizedName");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[AXSwitchRecipe unlocalizedName](self, "unlocalizedName");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = CFSTR("UnlocalizedName");
  }
  else
  {
    -[AXSwitchRecipe name](self, "name");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v7)
      goto LABEL_6;
    -[AXSwitchRecipe name](self, "name");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = CFSTR("Name");
  }
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, v6);

LABEL_6:
  -[AXSwitchRecipe uuid](self, "uuid");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v8)
    _AXAssert();
  -[AXSwitchRecipe uuid](self, "uuid");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    -[AXSwitchRecipe uuid](self, "uuid");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "UUIDString");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v11, CFSTR("UUID"));

  }
  v12 = (void *)MEMORY[0x1E0C99DE8];
  -[AXSwitchRecipe mappings](self, "mappings");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "arrayWithCapacity:", objc_msgSend(v13, "count"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  v28 = 0u;
  v29 = 0u;
  v26 = 0u;
  v27 = 0u;
  -[AXSwitchRecipe mappings](self, "mappings", 0);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v26, v30, 16);
  if (v16)
  {
    v17 = v16;
    v18 = *(_QWORD *)v27;
    do
    {
      for (i = 0; i != v17; ++i)
      {
        if (*(_QWORD *)v27 != v18)
          objc_enumerationMutation(v15);
        objc_msgSend(*(id *)(*((_QWORD *)&v26 + 1) + 8 * i), "dictionaryRepresentation");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "addObject:", v20);

      }
      v17 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v26, v30, 16);
    }
    while (v17);
  }

  objc_msgSend(v3, "setObject:forKeyedSubscript:", v14, CFSTR("Mappings"));
  v21 = (void *)MEMORY[0x1E0CB37E8];
  -[AXSwitchRecipe timeout](self, "timeout");
  objc_msgSend(v21, "numberWithDouble:");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v22, CFSTR("Timeout"));

  -[AXSwitchRecipe menuIconIdentifier](self, "menuIconIdentifier");
  v23 = (void *)objc_claimAutoreleasedReturnValue();

  if (v23)
  {
    -[AXSwitchRecipe menuIconIdentifier](self, "menuIconIdentifier");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v24, CFSTR("MenuIconIdentifier"));

  }
  return v3;
}

- (AXSwitchRecipe)init
{
  AXSwitchRecipe *v2;
  void *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)AXSwitchRecipe;
  v2 = -[AXSwitchRecipe init](&v5, sel_init);
  if (v2)
  {
    objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    -[AXSwitchRecipe setUuid:](v2, "setUuid:", v3);

  }
  return v2;
}

- (BOOL)shouldContinueScanning
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t i;
  void *v7;
  void *v8;
  void *v9;
  char v10;
  BOOL v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  -[AXSwitchRecipe mappings](self, "mappings", 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v14;
    while (2)
    {
      for (i = 0; i != v4; ++i)
      {
        if (*(_QWORD *)v14 != v5)
          objc_enumerationMutation(v2);
        v7 = *(void **)(*((_QWORD *)&v13 + 1) + 8 * i);
        objc_msgSend(v7, "action");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v8, "isEqualToString:", CFSTR("Select")))
        {

LABEL_13:
          v11 = 1;
          goto LABEL_14;
        }
        objc_msgSend(v7, "longPressAction");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v10 = objc_msgSend(v9, "isEqualToString:", CFSTR("Select"));

        if ((v10 & 1) != 0)
          goto LABEL_13;
      }
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
      v11 = 0;
      if (v4)
        continue;
      break;
    }
  }
  else
  {
    v11 = 0;
  }
LABEL_14:

  return v11;
}

- (NSString)name
{
  NSString *name;
  NSString *v3;
  void *v5;
  void *v6;

  name = self->_name;
  if (!name)
  {
    -[AXSwitchRecipe unlocalizedName](self, "unlocalizedName");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    if (v5)
    {
      -[AXSwitchRecipe unlocalizedName](self, "unlocalizedName");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      AXLocalizedString(v6);
      v3 = (NSString *)objc_claimAutoreleasedReturnValue();

      return v3;
    }
    name = self->_name;
  }
  v3 = name;
  return v3;
}

- (void)setName:(id)a3
{
  NSString *v5;
  NSString *v6;

  v5 = (NSString *)a3;
  if (self->_name != v5)
  {
    v6 = v5;
    objc_storeStrong((id *)&self->_name, a3);
    -[AXSwitchRecipe setUnlocalizedName:](self, "setUnlocalizedName:", 0);
    v5 = v6;
  }

}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)AXSwitchRecipe;
  -[AXSwitchRecipe description](&v11, sel_description);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[AXSwitchRecipe name](self, "name");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[AXSwitchRecipe uuid](self, "uuid");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[AXSwitchRecipe mappings](self, "mappings");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)MEMORY[0x1E0CB37E8];
  -[AXSwitchRecipe timeout](self, "timeout");
  objc_msgSend(v7, "numberWithDouble:");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringByAppendingFormat:", CFSTR("\nName: %@\nUUID: %@\nMappings: %@\nTimeout: %@"), v4, v5, v6, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (NSUUID)uuid
{
  return self->_uuid;
}

- (void)setUuid:(id)a3
{
  objc_storeStrong((id *)&self->_uuid, a3);
}

- (NSArray)mappings
{
  return self->_mappings;
}

- (void)setMappings:(id)a3
{
  objc_storeStrong((id *)&self->_mappings, a3);
}

- (double)timeout
{
  return self->_timeout;
}

- (void)setTimeout:(double)a3
{
  self->_timeout = a3;
}

- (NSString)unlocalizedName
{
  return self->_unlocalizedName;
}

- (void)setUnlocalizedName:(id)a3
{
  objc_storeStrong((id *)&self->_unlocalizedName, a3);
}

- (NSString)menuIconIdentifier
{
  return self->_menuIconIdentifier;
}

- (void)setMenuIconIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_menuIconIdentifier, 0);
  objc_storeStrong((id *)&self->_unlocalizedName, 0);
  objc_storeStrong((id *)&self->_mappings, 0);
  objc_storeStrong((id *)&self->_uuid, 0);
  objc_storeStrong((id *)&self->_name, 0);
}

@end
