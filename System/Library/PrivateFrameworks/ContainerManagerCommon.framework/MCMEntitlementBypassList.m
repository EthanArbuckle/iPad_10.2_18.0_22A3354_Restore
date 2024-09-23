@implementation MCMEntitlementBypassList

+ (id)sharedBypassList
{
  if (sharedBypassList_onceToken != -1)
    dispatch_once(&sharedBypassList_onceToken, &__block_literal_global_1290);
  return (id)sharedBypassList_sharedInstance;
}

- (BOOL)isLookupAllowedToBypassEntitlementFromCodeSignIdentifier:(id)a3 forContainerClass:(unint64_t)a4 containerIdentifier:(id)a5
{
  id v8;
  char v9;
  void *v10;
  void *v11;
  char v12;
  void *v13;
  void *v14;
  void *v15;
  char v16;

  v8 = a5;
  if (a4 <= 0xE)
  {
    -[NSDictionary objectForKeyedSubscript:](self->_bypassListedLookupByCodeSignIdentifier, "objectForKeyedSubscript:", a3);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (v10)
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = objc_msgSend(v10, "isEqual:", v11);

      if ((v12 & 1) != 0)
      {
        v13 = 0;
LABEL_9:
        v9 = 1;
LABEL_11:

        goto LABEL_12;
      }
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", a4);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "objectForKeyedSubscript:", v14);
      v13 = (void *)objc_claimAutoreleasedReturnValue();

      if (v13)
      {
        objc_msgSend(MEMORY[0x1E0C99E38], "null");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v16 = objc_msgSend(v13, "isEqual:", v15);

        if ((v16 & 1) == 0)
        {
          v9 = objc_msgSend(v13, "containsObject:", v8);
          goto LABEL_11;
        }
        goto LABEL_9;
      }
    }
    else
    {
      v13 = 0;
    }
    v9 = 0;
    goto LABEL_11;
  }
  v9 = 0;
LABEL_12:

  return v9;
}

- (BOOL)systemContainerIdIsWellknown:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  -[MCMEntitlementBypassList systemEntitlementBypassList](self, "systemEntitlementBypassList");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "valueForKey:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6 != 0;
}

- (BOOL)systemGroupContainerIdIsWellknown:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  -[MCMEntitlementBypassList systemGroupEntitlementBypassList](self, "systemGroupEntitlementBypassList");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "valueForKey:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6 != 0;
}

- (NSDictionary)systemGroupEntitlementBypassList
{
  return self->_systemGroupEntitlementBypassList;
}

- (NSDictionary)systemEntitlementBypassList
{
  return self->_systemEntitlementBypassList;
}

- (MCMEntitlementBypassList)initWithSystemContainerMapping:(id)a3 systemGroupContainerMapping:(id)a4 bypassListedCodeSignIdentifierMapping:(id)a5
{
  id v8;
  id v9;
  id v10;
  MCMEntitlementBypassList *v11;
  MCMEntitlementBypassList *v12;
  uint64_t v13;
  NSDictionary *bypassListedLookupByCodeSignIdentifier;
  objc_super v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  v16.receiver = self;
  v16.super_class = (Class)MCMEntitlementBypassList;
  v11 = -[MCMEntitlementBypassList init](&v16, sel_init);
  v12 = v11;
  if (v11)
  {
    -[MCMEntitlementBypassList setSystemEntitlementBypassList:](v11, "setSystemEntitlementBypassList:", v8);
    -[MCMEntitlementBypassList setSystemGroupEntitlementBypassList:](v12, "setSystemGroupEntitlementBypassList:", v9);
    -[MCMEntitlementBypassList _convertArraysToSetsInNestedDictionary:](v12, "_convertArraysToSetsInNestedDictionary:", v10);
    v13 = objc_claimAutoreleasedReturnValue();
    bypassListedLookupByCodeSignIdentifier = v12->_bypassListedLookupByCodeSignIdentifier;
    v12->_bypassListedLookupByCodeSignIdentifier = (NSDictionary *)v13;

  }
  return v12;
}

- (id)wellknownSystemContainerForId:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  -[MCMEntitlementBypassList systemEntitlementBypassList](self, "systemEntitlementBypassList");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "valueForKey:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)wellknownSystemContainers
{
  void *v2;
  void *v3;

  -[MCMEntitlementBypassList systemEntitlementBypassList](self, "systemEntitlementBypassList");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "allKeys");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)wellknownSystemGroupContainerForId:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  -[MCMEntitlementBypassList systemGroupEntitlementBypassList](self, "systemGroupEntitlementBypassList");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "valueForKey:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)wellknownSystemGroupContainers
{
  void *v2;
  void *v3;

  -[MCMEntitlementBypassList systemGroupEntitlementBypassList](self, "systemGroupEntitlementBypassList");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "allKeys");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (BOOL)containerIdIsWellknown:(id)a3 class:(unint64_t)a4
{
  id v6;
  BOOL v7;
  BOOL v8;

  v6 = a3;
  if (a4 == 13)
  {
    v7 = -[MCMEntitlementBypassList systemGroupContainerIdIsWellknown:](self, "systemGroupContainerIdIsWellknown:", v6);
  }
  else
  {
    if (a4 != 12)
    {
      v8 = 0;
      goto LABEL_7;
    }
    v7 = -[MCMEntitlementBypassList systemContainerIdIsWellknown:](self, "systemContainerIdIsWellknown:", v6);
  }
  v8 = v7;
LABEL_7:

  return v8;
}

- (id)wellknownContainerForId:(id)a3 class:(unint64_t)a4
{
  id v6;
  uint64_t v7;
  void *v8;

  v6 = a3;
  if (a4 == 13)
  {
    -[MCMEntitlementBypassList wellknownSystemGroupContainerForId:](self, "wellknownSystemGroupContainerForId:", v6);
    v7 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    if (a4 != 12)
    {
      v8 = 0;
      goto LABEL_7;
    }
    -[MCMEntitlementBypassList wellknownSystemContainerForId:](self, "wellknownSystemContainerForId:", v6);
    v7 = objc_claimAutoreleasedReturnValue();
  }
  v8 = (void *)v7;
LABEL_7:

  return v8;
}

- (id)_convertArraysToSetsInNestedDictionary:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v21;
  void *v22;
  _BYTE v23[128];
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", objc_msgSend(v3, "count"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = v3;
  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithObject:", v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithObject:", v4);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "count"))
  {
    do
    {
      objc_msgSend(v5, "lastObject");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = v5;
      objc_msgSend(v5, "removeLastObject");
      objc_msgSend(v22, "lastObject");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "removeLastObject");
      v26 = 0u;
      v27 = 0u;
      v24 = 0u;
      v25 = 0u;
      v9 = v6;
      v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v24, v23, 16);
      if (v10)
      {
        v11 = v10;
        v12 = *(_QWORD *)v25;
        do
        {
          for (i = 0; i != v11; ++i)
          {
            if (*(_QWORD *)v25 != v12)
              objc_enumerationMutation(v9);
            v14 = *(_QWORD *)(*((_QWORD *)&v24 + 1) + 8 * i);
            objc_msgSend(v9, "objectForKeyedSubscript:", v14);
            v15 = (void *)objc_claimAutoreleasedReturnValue();
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0)
            {
              objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", objc_msgSend(v15, "count"));
              v16 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v8, "setObject:forKeyedSubscript:", v16, v14);

              objc_msgSend(v7, "addObject:", v15);
              objc_msgSend(v8, "objectForKeyedSubscript:", v14);
              v17 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v22, "addObject:", v17);

            }
            else
            {
              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) != 0)
              {
                objc_msgSend(MEMORY[0x1E0C99E60], "setWithArray:", v15);
                v18 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v8, "setObject:forKeyedSubscript:", v18, v14);

              }
              else
              {
                objc_msgSend(v8, "setObject:forKeyedSubscript:", v15, v14);
              }
            }

          }
          v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v24, v23, 16);
        }
        while (v11);
      }

      v5 = v7;
    }
    while (objc_msgSend(v7, "count"));
  }
  v19 = (void *)objc_msgSend(v4, "copy");

  return v19;
}

- (id)wellKnownContainerIdentifiersForSandboxPushDownCompatibilitySet
{
  if (wellKnownContainerIdentifiersForSandboxPushDownCompatibilitySet_onceToken != -1)
    dispatch_once(&wellKnownContainerIdentifiersForSandboxPushDownCompatibilitySet_onceToken, &__block_literal_global_68);
  return (id)wellKnownContainerIdentifiersForSandboxPushDownCompatibilitySet_set;
}

- (void)setSystemEntitlementBypassList:(id)a3
{
  objc_storeStrong((id *)&self->_systemEntitlementBypassList, a3);
}

- (void)setSystemGroupEntitlementBypassList:(id)a3
{
  objc_storeStrong((id *)&self->_systemGroupEntitlementBypassList, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_systemGroupEntitlementBypassList, 0);
  objc_storeStrong((id *)&self->_systemEntitlementBypassList, 0);
  objc_storeStrong((id *)&self->_bypassListedLookupByCodeSignIdentifier, 0);
}

void __91__MCMEntitlementBypassList_wellKnownContainerIdentifiersForSandboxPushDownCompatibilitySet__block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:", CFSTR("com.apple.facetime"), CFSTR("com.apple.iBooks"), CFSTR("com.apple.Maps"), CFSTR("com.apple.mobilenotes"), CFSTR("com.apple.mobilesafari"), CFSTR("com.apple.podcasts"), 0);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)wellKnownContainerIdentifiersForSandboxPushDownCompatibilitySet_set;
  wellKnownContainerIdentifiersForSandboxPushDownCompatibilitySet_set = v0;

}

void __44__MCMEntitlementBypassList_sharedBypassList__block_invoke()
{
  void *v0;
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  MCMEntitlementBypassList *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  _QWORD v21[9];
  _QWORD v22[11];

  v22[9] = *MEMORY[0x1E0C80C00];
  v21[0] = CFSTR("com.apple.mobile.MobileHouseArrest");
  objc_msgSend(MEMORY[0x1E0C99E38], "null");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v22[0] = v14;
  v21[1] = CFSTR("com.apple.accountsd");
  v19 = &unk_1E8CD5F70;
  v20 = &unk_1E8CD69D8;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v20, &v19, 1);
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v22[1] = v0;
  v21[2] = CFSTR("com.apple.itunescloudd");
  objc_msgSend(MEMORY[0x1E0C99E38], "null");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v22[2] = v1;
  v21[3] = CFSTR("com.apple.CacheDeleteDaily");
  objc_msgSend(MEMORY[0x1E0C99E38], "null");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v22[3] = v2;
  v21[4] = CFSTR("com.apple.Safari.History");
  v17 = &unk_1E8CD5F88;
  v18 = &unk_1E8CD69F0;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v18, &v17, 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v22[4] = v3;
  v21[5] = CFSTR("com.apple.mobile_installation_proxy");
  objc_msgSend(MEMORY[0x1E0C99E38], "null");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v22[5] = v4;
  v21[6] = CFSTR("com.apple.AppPredictionWidget.extension");
  objc_msgSend(MEMORY[0x1E0C99E38], "null");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v22[6] = v5;
  v21[7] = CFSTR("com.apple.Maps.Widget");
  v15 = &unk_1E8CD5F88;
  v16 = &unk_1E8CD6A08;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v16, &v15, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v22[7] = v6;
  v21[8] = CFSTR("com.apple.filecoordinationd");
  objc_msgSend(MEMORY[0x1E0C99E38], "null");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v22[8] = v7;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v22, v21, 9);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = containermanager_copy_global_configuration();
  LODWORD(v0) = objc_msgSend(v9, "isInternalImage");

  if ((_DWORD)v0)
  {
    v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithDictionary:", &unk_1E8CD5538);
    objc_msgSend(v10, "setValue:forKey:", CFSTR("systemgroup.com.apple.codecoveragedata"), CFSTR("systemgroup.com.apple.codecoveragedata"));
    v11 = (void *)objc_msgSend(v10, "copy");

  }
  else
  {
    v11 = &unk_1E8CD5538;
  }
  v12 = -[MCMEntitlementBypassList initWithSystemContainerMapping:systemGroupContainerMapping:bypassListedCodeSignIdentifierMapping:]([MCMEntitlementBypassList alloc], "initWithSystemContainerMapping:systemGroupContainerMapping:bypassListedCodeSignIdentifierMapping:", &unk_1E8CD5510, v11, v8);
  v13 = (void *)sharedBypassList_sharedInstance;
  sharedBypassList_sharedInstance = (uint64_t)v12;

}

@end
