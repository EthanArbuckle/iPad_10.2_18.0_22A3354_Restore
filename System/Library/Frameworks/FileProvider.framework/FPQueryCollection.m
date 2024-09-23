@implementation FPQueryCollection

- (void)dataSource:(id)a3 didChangeItemsOrigin:(unint64_t)a4
{
  FPQueryCollection *v6;
  id v7;

  v7 = a3;
  v6 = self;
  objc_sync_enter(v6);
  if (v6->_itemsOrigin != a4)
  {
    -[FPQueryCollection willChangeValueForKey:](v6, "willChangeValueForKey:", CFSTR("itemsOrigin"));
    v6->_itemsOrigin = a4;
    -[FPQueryCollection didChangeValueForKey:](v6, "didChangeValueForKey:", CFSTR("itemsOrigin"));
  }
  objc_sync_exit(v6);

}

+ (void)enableMountPointQueries
{
  id v2;

  +[FPSpotlightCollectorManager sharedInstance](FPSpotlightCollectorManager, "sharedInstance");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "enableMountPointQueries");

}

- (unint64_t)itemsOrigin
{
  return self->_itemsOrigin;
}

uint64_t __50__FPQueryCollection__enumerationSettingsPredicate__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  uint64_t v11;
  void *v12;
  void *v13;
  char v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  int v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t j;
  uint64_t v25;
  void *v26;
  void *v27;
  char v28;
  void *v30;
  void *v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  _BYTE v40[128];
  _BYTE v41[128];
  uint64_t v42;

  v42 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[FPQueryCollection _enumerationSettingsPredicate]_block_invoke");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v30, "handleFailureInFunction:file:lineNumber:description:", v31, CFSTR("FPQueryCollection.m"), 246, CFSTR("Only items are allowed to be evaluated."));

    }
  }
  v4 = v3;
  v5 = *(void **)(a1 + 32);
  if (v5 && !objc_msgSend(v5, "evaluateWithObject:", v4))
    goto LABEL_28;
  v38 = 0u;
  v39 = 0u;
  v36 = 0u;
  v37 = 0u;
  objc_msgSend(*(id *)(a1 + 40), "excludedFileTypes");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v36, v41, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v37;
    while (2)
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v37 != v9)
          objc_enumerationMutation(v6);
        v11 = *(_QWORD *)(*((_QWORD *)&v36 + 1) + 8 * i);
        objc_msgSend(v4, "contentType");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CEC3F8], "fp_cachedTypeWithIdentifier:", v11);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v14 = objc_msgSend(v12, "conformsToType:", v13);

        if ((v14 & 1) != 0)
        {
          v22 = 0;
          goto LABEL_27;
        }
      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v36, v41, 16);
      if (v8)
        continue;
      break;
    }
  }

  objc_msgSend(*(id *)(a1 + 40), "allowedProviders");
  v15 = objc_claimAutoreleasedReturnValue();
  if (!v15)
    goto LABEL_16;
  v16 = (void *)v15;
  objc_msgSend(*(id *)(a1 + 40), "allowedProviders");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "providerID");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = objc_msgSend(v17, "containsObject:", v18);

  if (!v19)
  {
LABEL_28:
    v22 = 0;
  }
  else
  {
LABEL_16:
    objc_msgSend(*(id *)(a1 + 40), "allowedFileTypes");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = objc_msgSend(v20, "count");

    if (v21)
    {
      v34 = 0u;
      v35 = 0u;
      v32 = 0u;
      v33 = 0u;
      objc_msgSend(*(id *)(a1 + 40), "allowedFileTypes", 0);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v22 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v32, v40, 16);
      if (v22)
      {
        v23 = *(_QWORD *)v33;
        while (2)
        {
          for (j = 0; j != v22; ++j)
          {
            if (*(_QWORD *)v33 != v23)
              objc_enumerationMutation(v6);
            v25 = *(_QWORD *)(*((_QWORD *)&v32 + 1) + 8 * j);
            objc_msgSend(v4, "contentType");
            v26 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(MEMORY[0x1E0CEC3F8], "fp_cachedTypeWithIdentifier:", v25);
            v27 = (void *)objc_claimAutoreleasedReturnValue();
            v28 = objc_msgSend(v26, "conformsToType:", v27);

            if ((v28 & 1) != 0)
            {
              v22 = 1;
              goto LABEL_27;
            }
          }
          v22 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v32, v40, 16);
          if (v22)
            continue;
          break;
        }
      }
LABEL_27:

    }
    else
    {
      v22 = 1;
    }
  }

  return v22;
}

- (void)setDescriptionName:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 272);
}

- (FPQueryCollection)initWithQueryDescriptorClass:(Class)a3 predicate:(id)a4
{
  return -[FPQueryCollection initWithQueryDescriptorClass:predicate:paced:](self, "initWithQueryDescriptorClass:predicate:paced:", a3, a4, 1);
}

- (id)createDataSourceWithSortDescriptors:(id)a3
{
  id v4;
  FPQueryCollection *v5;
  void *v6;
  void *v7;
  FPSpotlightDataSource *v8;

  v4 = a3;
  v5 = self;
  objc_sync_enter(v5);
  -[FPQueryCollection _enumerationSettingsPredicate](v5, "_enumerationSettingsPredicate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[FPItemCollection setAdditionalItemFilteringPredicate:](v5, "setAdditionalItemFilteringPredicate:", v6);

  -[FPQueryCollection _createDescriptorWithSortDescriptors:](v5, "_createDescriptorWithSortDescriptors:", v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = -[FPSpotlightDataSource initWithQueryDescriptor:predicate:]([FPSpotlightDataSource alloc], "initWithQueryDescriptor:predicate:", v7, v5->_predicate);

  objc_sync_exit(v5);
  return v8;
}

- (id)_enumerationSettingsPredicate
{
  FPQueryCollection *v2;
  FPQueryEnumerationSettings *v3;
  NSPredicate *v4;
  void *v5;
  NSPredicate *v6;
  FPQueryEnumerationSettings *v7;
  void *v8;
  _QWORD v10[4];
  NSPredicate *v11;
  FPQueryEnumerationSettings *v12;

  v2 = self;
  objc_sync_enter(v2);
  v3 = v2->_settings;
  v4 = v2->_predicate;
  v5 = (void *)MEMORY[0x1E0CB3880];
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __50__FPQueryCollection__enumerationSettingsPredicate__block_invoke;
  v10[3] = &unk_1E444B460;
  v6 = v4;
  v11 = v6;
  v7 = v3;
  v12 = v7;
  objc_msgSend(v5, "predicateWithBlock:", v10);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_sync_exit(v2);
  return v8;
}

- (id)_createDescriptorWithSortDescriptors:(id)a3
{
  id v4;
  FPQueryCollection *v5;
  void *v6;
  void *v7;

  v4 = a3;
  v5 = self;
  objc_sync_enter(v5);
  v6 = (void *)-[FPQueryEnumerationSettings copy](v5->_settings, "copy");
  objc_msgSend(v6, "setSortDescriptors:", v4);
  v7 = (void *)objc_msgSend(objc_alloc(v5->_descriptorClass), "initWithSettings:", v6);

  objc_sync_exit(v5);
  return v7;
}

- (FPQueryCollection)initWithQueryDescriptorClass:(Class)a3 predicate:(id)a4 paced:(BOOL)a5
{
  _BOOL8 v5;
  id v9;
  FPQueryCollection *v10;
  uint64_t v11;
  FPQueryEnumerationSettings *settings;
  objc_super v14;

  v5 = a5;
  v9 = a4;
  v14.receiver = self;
  v14.super_class = (Class)FPQueryCollection;
  v10 = -[FPItemCollection initWithPacing:](&v14, sel_initWithPacing_, v5);
  if (v10)
  {
    v11 = objc_opt_new();
    settings = v10->_settings;
    v10->_settings = (FPQueryEnumerationSettings *)v11;

    v10->_descriptorClass = a3;
    objc_storeStrong((id *)&v10->_predicate, a4);
  }

  return v10;
}

- (void)setDesiredNumberOfItems:(id)a3
{
  FPQueryCollection *v4;
  id v5;

  v5 = a3;
  v4 = self;
  objc_sync_enter(v4);
  -[FPQueryEnumerationSettings setDesiredNumberOfItems:](v4->_settings, "setDesiredNumberOfItems:", v5);
  objc_sync_exit(v4);

}

- (void)setExcludedFileTypes:(id)a3
{
  FPQueryCollection *v4;
  void *v5;
  id v6;

  v6 = a3;
  v4 = self;
  objc_sync_enter(v4);
  v5 = (void *)objc_msgSend(v6, "copy");
  -[FPQueryEnumerationSettings setExcludedFileTypes:](v4->_settings, "setExcludedFileTypes:", v5);

  objc_sync_exit(v4);
}

- (void)setAllowedFileTypes:(id)a3
{
  FPQueryCollection *v4;
  void *v5;
  id v6;

  v6 = a3;
  v4 = self;
  objc_sync_enter(v4);
  v5 = (void *)objc_msgSend(v6, "copy");
  -[FPQueryEnumerationSettings setAllowedFileTypes:](v4->_settings, "setAllowedFileTypes:", v5);

  objc_sync_exit(v4);
}

- (FPQueryCollection)initWithQueryDescriptorClass:(Class)a3
{
  return -[FPQueryCollection initWithQueryDescriptorClass:predicate:paced:](self, "initWithQueryDescriptorClass:predicate:paced:", a3, 0, 1);
}

- (id)description
{
  FPQueryCollection *v2;
  void *v3;

  v2 = self;
  objc_sync_enter(v2);
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("<%@:%p %@ %@>"), objc_opt_class(), v2, v2->_descriptionName, v2->_settings);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_sync_exit(v2);

  return v3;
}

- (id)scopedSearchQuery
{
  FPQueryCollection *v2;
  void *v3;
  NSFileProviderSearchQuery *v4;
  NSFileProviderDomain *v5;
  void *v6;
  NSFileProviderDomain *v7;
  FPProviderDomain *v8;
  void *v9;
  FPProviderDomain *v10;
  void *v11;
  void *v12;

  v2 = self;
  objc_sync_enter(v2);
  -[FPQueryCollection _createDescriptorWithSortDescriptors:](v2, "_createDescriptorWithSortDescriptors:", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = -[NSFileProviderSearchQuery initWithSearchScope:]([NSFileProviderSearchQuery alloc], "initWithSearchScope:", 0);
  v5 = [NSFileProviderDomain alloc];
  -[FPItemCollection domainIdentifier](v2, "domainIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[NSFileProviderDomain initWithIdentifier:displayName:pathRelativeToDocumentStorage:](v5, "initWithIdentifier:displayName:pathRelativeToDocumentStorage:", v6, &stru_1E4450B40, &stru_1E4450B40);

  v8 = [FPProviderDomain alloc];
  -[FPItemCollection providerIdentifier](v2, "providerIdentifier");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = -[FPProviderDomain initWithProviderID:domain:](v8, "initWithProviderID:domain:", v9, v7);

  -[FPProviderDomain spotlightMountPoint](v10, "spotlightMountPoint");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "queryStringForMountPoint:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSFileProviderSearchQuery setScopeFragment:](v4, "setScopeFragment:", v12);

  objc_sync_exit(v2);
  return v4;
}

+ (void)suspendAllQueries
{
  id v2;

  +[FPSpotlightCollectorManager sharedInstance](FPSpotlightCollectorManager, "sharedInstance");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "suspendCollectors");

}

+ (void)resumeAllQueries
{
  id v2;

  +[FPSpotlightCollectorManager sharedInstance](FPSpotlightCollectorManager, "sharedInstance");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "resumeCollectors");

}

+ (void)disableMountPointQueries
{
  id v2;

  +[FPSpotlightCollectorManager sharedInstance](FPSpotlightCollectorManager, "sharedInstance");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "disableMountPointQueries");

}

- (NSNumber)desiredNumberOfItems
{
  FPQueryCollection *v2;
  void *v3;

  v2 = self;
  objc_sync_enter(v2);
  -[FPQueryEnumerationSettings desiredNumberOfItems](v2->_settings, "desiredNumberOfItems");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_sync_exit(v2);

  return (NSNumber *)v3;
}

- (NSArray)allowedFileTypes
{
  FPQueryCollection *v2;
  void *v3;

  v2 = self;
  objc_sync_enter(v2);
  -[FPQueryEnumerationSettings allowedFileTypes](v2->_settings, "allowedFileTypes");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_sync_exit(v2);

  return (NSArray *)v3;
}

- (NSArray)excludedFileTypes
{
  FPQueryCollection *v2;
  void *v3;

  v2 = self;
  objc_sync_enter(v2);
  -[FPQueryEnumerationSettings excludedFileTypes](v2->_settings, "excludedFileTypes");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_sync_exit(v2);

  return (NSArray *)v3;
}

- (void)setExcludedParentOIDs:(id)a3
{
  FPQueryCollection *v4;
  void *v5;
  id v6;

  v6 = a3;
  v4 = self;
  objc_sync_enter(v4);
  v5 = (void *)objc_msgSend(v6, "copy");
  -[FPQueryEnumerationSettings setExcludedParentOIDs:](v4->_settings, "setExcludedParentOIDs:", v5);

  objc_sync_exit(v4);
}

- (NSArray)excludedParentOIDs
{
  FPQueryCollection *v2;
  void *v3;

  v2 = self;
  objc_sync_enter(v2);
  -[FPQueryEnumerationSettings excludedParentOIDs](v2->_settings, "excludedParentOIDs");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_sync_exit(v2);

  return (NSArray *)v3;
}

- (void)setAllowedProviderIdentifiers:(id)a3
{
  FPQueryCollection *v4;
  void *v5;
  id v6;

  v6 = a3;
  v4 = self;
  objc_sync_enter(v4);
  v5 = (void *)objc_msgSend(v6, "copy");
  -[FPQueryEnumerationSettings setAllowedProviders:](v4->_settings, "setAllowedProviders:", v5);

  objc_sync_exit(v4);
}

- (NSArray)allowedProviderIdentifiers
{
  FPQueryCollection *v2;
  void *v3;

  v2 = self;
  objc_sync_enter(v2);
  -[FPQueryEnumerationSettings allowedProviders](v2->_settings, "allowedProviders");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_sync_exit(v2);

  return (NSArray *)v3;
}

- (id)underlyingQueryStringForMountPoint:(id)a3
{
  id v4;
  FPQueryCollection *v5;
  void *v6;
  void *v7;

  v4 = a3;
  v5 = self;
  objc_sync_enter(v5);
  -[FPQueryCollection _createDescriptorWithSortDescriptors:](v5, "_createDescriptorWithSortDescriptors:", 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "queryStringForMountPoint:", v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_sync_exit(v5);
  return v7;
}

- (void)setTagIdentifier:(id)a3
{
  FPQueryCollection *v4;
  void *v5;
  void *v6;
  id v7;

  v7 = a3;
  v4 = self;
  objc_sync_enter(v4);
  v5 = (void *)objc_msgSend(v7, "copy");
  -[FPQueryCollection settings](v4, "settings");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setTagIdentifier:", v5);

  objc_sync_exit(v4);
}

- (NSString)tagIdentifier
{
  FPQueryCollection *v2;
  void *v3;
  void *v4;

  v2 = self;
  objc_sync_enter(v2);
  -[FPQueryCollection settings](v2, "settings");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "tagIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_sync_exit(v2);
  return (NSString *)v4;
}

- (NSString)descriptionName
{
  return (NSString *)objc_getProperty(self, a2, 272, 1);
}

- (FPQueryEnumerationSettings)settings
{
  return (FPQueryEnumerationSettings *)objc_getProperty(self, a2, 232, 1);
}

- (NSPredicate)predicate
{
  return (NSPredicate *)objc_getProperty(self, a2, 248, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_descriptionName, 0);
  objc_storeStrong((id *)&self->_predicate, 0);
  objc_storeStrong((id *)&self->_settings, 0);
}

@end
