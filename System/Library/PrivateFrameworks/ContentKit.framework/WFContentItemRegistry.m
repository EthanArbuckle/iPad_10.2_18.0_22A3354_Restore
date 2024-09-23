@implementation WFContentItemRegistry

- (void)rediscoverContentItemClassesIfNeeded
{
  void *v3;
  _QWORD v4[5];

  if (rediscoverContentItemClassesIfNeeded_onceToken != -1)
    dispatch_once(&rediscoverContentItemClassesIfNeeded_onceToken, &__block_literal_global_339);
  v3 = (void *)objc_opt_class();
  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = __61__WFContentItemRegistry_rediscoverContentItemClassesIfNeeded__block_invoke_2;
  v4[3] = &unk_24C4DB6F8;
  v4[4] = self;
  WFRegisterClassesFromClassVendingMethodsIfNeeded(v3, CFSTR("allContentItemClassesIn"), &self->_discoveryLock, WFShouldRediscoverContentItemClasses, (void *)rediscoverContentItemClassesIfNeeded_calledContentItemVendingSelectors, v4);
}

- (WFContentItemRegistry)init
{
  WFContentItemRegistry *v2;
  NSMutableDictionary *v3;
  NSMutableDictionary *contentItemClassesByType;
  uint64_t v5;
  NSMutableSet *allItemClasses;
  WFContentItemRegistry *v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)WFContentItemRegistry;
  v2 = -[WFContentItemRegistry init](&v9, sel_init);
  if (v2)
  {
    v3 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x24BDBCED8]);
    contentItemClassesByType = v2->_contentItemClassesByType;
    v2->_contentItemClassesByType = v3;

    v5 = objc_opt_new();
    allItemClasses = v2->_allItemClasses;
    v2->_allItemClasses = (NSMutableSet *)v5;

    *(_QWORD *)&v2->_discoveryLock._os_unfair_lock_opaque = 0;
    v7 = v2;
  }

  return v2;
}

- (void)registerContentItemClass:(Class)a3
{
  os_unfair_lock_s *p_registrationLock;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  _BYTE v26[128];
  _BYTE v27[128];
  uint64_t v28;

  v28 = *MEMORY[0x24BDAC8D0];
  if (-[objc_class isSubclassOfClass:](a3, "isSubclassOfClass:", objc_opt_class()))
  {
    p_registrationLock = &self->_registrationLock;
    os_unfair_lock_lock(&self->_registrationLock);
    -[WFContentItemRegistry contentItemClassesByType](self, "contentItemClassesByType");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[WFContentItemRegistry allItemClasses](self, "allItemClasses");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "addObject:", a3);
    v24 = 0u;
    v25 = 0u;
    v22 = 0u;
    v23 = 0u;
    -[objc_class ownedTypes](a3, "ownedTypes");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v22, v27, 16);
    if (v9)
    {
      v10 = v9;
      v11 = *(_QWORD *)v23;
      do
      {
        v12 = 0;
        do
        {
          if (*(_QWORD *)v23 != v11)
            objc_enumerationMutation(v8);
          WFRegisterTypeForItemClass(*(void **)(*((_QWORD *)&v22 + 1) + 8 * v12++), a3, v6);
        }
        while (v10 != v12);
        v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v22, v27, 16);
      }
      while (v10);
    }

    v20 = 0u;
    v21 = 0u;
    v18 = 0u;
    v19 = 0u;
    -[objc_class ownedPasteboardTypes](a3, "ownedPasteboardTypes", 0);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v18, v26, 16);
    if (v14)
    {
      v15 = v14;
      v16 = *(_QWORD *)v19;
      do
      {
        v17 = 0;
        do
        {
          if (*(_QWORD *)v19 != v16)
            objc_enumerationMutation(v13);
          WFRegisterTypeForItemClass(*(void **)(*((_QWORD *)&v18 + 1) + 8 * v17++), a3, v6);
        }
        while (v15 != v17);
        v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v18, v26, 16);
      }
      while (v15);
    }

    os_unfair_lock_unlock(p_registrationLock);
  }
}

- (NSSet)allOwnedTypes
{
  id v3;
  void *v4;
  void *v5;
  void *v6;

  -[WFContentItemRegistry rediscoverContentItemClassesIfNeeded](self, "rediscoverContentItemClassesIfNeeded");
  v3 = objc_alloc(MEMORY[0x24BDBCF20]);
  -[WFContentItemRegistry contentItemClassesByType](self, "contentItemClassesByType");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "allKeys");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v3, "initWithArray:", v5);

  return (NSSet *)v6;
}

- (NSSet)contentItemClasses
{
  void *v3;
  void *v4;

  -[WFContentItemRegistry rediscoverContentItemClassesIfNeeded](self, "rediscoverContentItemClassesIfNeeded");
  -[WFContentItemRegistry allItemClasses](self, "allItemClasses");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(v3, "copy");

  return (NSSet *)v4;
}

- (Class)contentItemClassForType:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t i;
  void *v16;
  void *v17;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  -[WFContentItemRegistry rediscoverContentItemClassesIfNeeded](self, "rediscoverContentItemClassesIfNeeded");
  if (v4)
  {
    -[WFContentItemRegistry contentItemClassesByType](self, "contentItemClassesByType");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = (void *)objc_msgSend(v5, "copy");

    v7 = (void *)objc_msgSend(v6, "objectForKey:", v4);
    if (v7)
    {
      v8 = v7;
    }
    else
    {
      v21 = 0u;
      v22 = 0u;
      v19 = 0u;
      v20 = 0u;
      v9 = v6;
      v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
      if (v10)
      {
        v11 = v10;
        v12 = *(_QWORD *)v20;
        v13 = *MEMORY[0x24BDF8350];
        v14 = *MEMORY[0x24BDF8348];
        while (2)
        {
          for (i = 0; i != v11; ++i)
          {
            if (*(_QWORD *)v20 != v12)
              objc_enumerationMutation(v9);
            v16 = *(void **)(*((_QWORD *)&v19 + 1) + 8 * i);
            if ((objc_msgSend(v16, "isEqualToUTType:", v13, (_QWORD)v19) & 1) == 0
              && (objc_msgSend(v16, "isEqualToUTType:", v14) & 1) == 0
              && (objc_msgSend(v4, "conformsToType:", v16) & 1) != 0)
            {
              objc_msgSend(v9, "objectForKey:", v16);
              v8 = (id)objc_claimAutoreleasedReturnValue();

              goto LABEL_21;
            }
          }
          v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
          if (v11)
            continue;
          break;
        }
      }

      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0
        && ((objc_msgSend(v4, "isDeclared") & 1) != 0 || objc_msgSend(v4, "isDynamic")))
      {
        objc_msgSend(MEMORY[0x24BEC14A0], "typeWithUTType:", *MEMORY[0x24BDF8350], (_QWORD)v19);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "objectForKey:", v17);
        v8 = (id)objc_claimAutoreleasedReturnValue();

      }
      else
      {
        v8 = 0;
      }
    }
LABEL_21:

  }
  else
  {
    v8 = 0;
  }

  return (Class)v8;
}

- (id)contentItemClassesSupportingType:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  _QWORD v11[4];
  id v12;

  -[objc_class ownedTypes](-[WFContentItemRegistry contentItemClassForType:](self, "contentItemClassForType:", a3), "ownedTypes");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFContentItemRegistry allItemClasses](self, "allItemClasses");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)MEMORY[0x24BDD1758];
  v11[0] = MEMORY[0x24BDAC760];
  v11[1] = 3221225472;
  v11[2] = __58__WFContentItemRegistry_contentItemClassesSupportingType___block_invoke;
  v11[3] = &unk_24C4DB720;
  v12 = v4;
  v7 = v4;
  objc_msgSend(v6, "predicateWithBlock:", v11);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "filteredSetUsingPredicate:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (NSMutableDictionary)contentItemClassesByType
{
  return self->_contentItemClassesByType;
}

- (NSMutableSet)allItemClasses
{
  return self->_allItemClasses;
}

- (os_unfair_lock_s)discoveryLock
{
  return self->_discoveryLock;
}

- (os_unfair_lock_s)registrationLock
{
  return self->_registrationLock;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_allItemClasses, 0);
  objc_storeStrong((id *)&self->_contentItemClassesByType, 0);
}

uint64_t __58__WFContentItemRegistry_contentItemClassesSupportingType___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;

  objc_msgSend(a2, "supportedTypes");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "intersectsOrderedSet:", *(_QWORD *)(a1 + 32));

  return v4;
}

uint64_t __61__WFContentItemRegistry_rediscoverContentItemClassesIfNeeded__block_invoke_2(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "registerContentItemClass:", a2);
}

uint64_t __61__WFContentItemRegistry_rediscoverContentItemClassesIfNeeded__block_invoke()
{
  uint64_t v0;
  void *v1;

  v0 = objc_opt_new();
  v1 = (void *)rediscoverContentItemClassesIfNeeded_calledContentItemVendingSelectors;
  rediscoverContentItemClassesIfNeeded_calledContentItemVendingSelectors = v0;

  return _dyld_register_for_bulk_image_loads();
}

+ (WFContentItemRegistry)sharedRegistry
{
  _QWORD block[5];

  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __39__WFContentItemRegistry_sharedRegistry__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (sharedRegistry_onceToken != -1)
    dispatch_once(&sharedRegistry_onceToken, block);
  return (WFContentItemRegistry *)(id)sharedRegistry_sharedRegistry;
}

void __39__WFContentItemRegistry_sharedRegistry__block_invoke(uint64_t a1)
{
  id v1;
  void *v2;

  v1 = objc_alloc_init(*(Class *)(a1 + 32));
  v2 = (void *)sharedRegistry_sharedRegistry;
  sharedRegistry_sharedRegistry = (uint64_t)v1;

}

- (id)contentItemClassesForShareSheetWithExtensionMatchingDictionaries:(id)a3
{
  id v3;
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  id v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t i;
  uint64_t v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  id v31;
  id v32;
  void *v33;
  uint64_t v36;
  id v37;
  uint64_t v38;
  void *v39;
  uint64_t v40;
  uint64_t v41;
  id v42;
  uint64_t v43;
  _QWORD v44[4];
  id v45;
  id v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  _BYTE v59[128];
  _BYTE v60[128];
  _BYTE v61[128];
  uint64_t v62;

  v62 = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  v4 = (void *)objc_opt_new();
  v55 = 0u;
  v56 = 0u;
  v57 = 0u;
  v58 = 0u;
  v5 = v3;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v55, v61, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v56;
    v36 = *(_QWORD *)v56;
    v37 = v5;
    do
    {
      v9 = 0;
      v38 = v7;
      do
      {
        if (*(_QWORD *)v56 != v8)
          objc_enumerationMutation(v5);
        v10 = *(void **)(*((_QWORD *)&v55 + 1) + 8 * v9);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v40 = v9;
          NSStringFromSelector(sel_attachments);
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v10, "objectForKey:", v11);
          v12 = (void *)objc_claimAutoreleasedReturnValue();

          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            v53 = 0u;
            v54 = 0u;
            v51 = 0u;
            v52 = 0u;
            v39 = v12;
            v13 = v12;
            v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v51, v60, 16);
            if (v14)
            {
              v15 = v14;
              v16 = *(_QWORD *)v52;
              v41 = *(_QWORD *)v52;
              v42 = v13;
              do
              {
                v17 = 0;
                v43 = v15;
                do
                {
                  if (*(_QWORD *)v52 != v16)
                    objc_enumerationMutation(v13);
                  v18 = *(void **)(*((_QWORD *)&v51 + 1) + 8 * v17);
                  objc_opt_class();
                  if ((objc_opt_isKindOfClass() & 1) != 0)
                  {
                    NSStringFromSelector(sel_registeredTypeIdentifiers);
                    v19 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v18, "objectForKey:", v19);
                    v20 = (void *)objc_claimAutoreleasedReturnValue();

                    objc_opt_class();
                    if ((objc_opt_isKindOfClass() & 1) != 0)
                    {
                      v49 = 0u;
                      v50 = 0u;
                      v47 = 0u;
                      v48 = 0u;
                      v21 = v20;
                      v22 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v47, v59, 16);
                      if (v22)
                      {
                        v23 = v22;
                        v24 = *(_QWORD *)v48;
                        do
                        {
                          for (i = 0; i != v23; ++i)
                          {
                            if (*(_QWORD *)v48 != v24)
                              objc_enumerationMutation(v21);
                            v26 = *(_QWORD *)(*((_QWORD *)&v47 + 1) + 8 * i);
                            objc_opt_class();
                            if ((objc_opt_isKindOfClass() & 1) != 0)
                            {
                              objc_msgSend(MEMORY[0x24BEC14A0], "typeWithString:", v26);
                              v27 = (void *)objc_claimAutoreleasedReturnValue();
                              objc_msgSend(v4, "addObject:", v27);

                            }
                          }
                          v23 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v47, v59, 16);
                        }
                        while (v23);
                      }

                      v16 = v41;
                      v13 = v42;
                    }

                    v15 = v43;
                  }
                  ++v17;
                }
                while (v17 != v15);
                v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v51, v60, 16);
              }
              while (v15);
            }

            v8 = v36;
            v5 = v37;
            v7 = v38;
            v12 = v39;
          }

          v9 = v40;
        }
        ++v9;
      }
      while (v9 != v7);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v55, v61, 16);
    }
    while (v7);
  }

  -[WFContentItemRegistry allOwnedTypes](self, "allOwnedTypes");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "if_compactMap:", &__block_literal_global_3898);
  v29 = (void *)objc_claimAutoreleasedReturnValue();

  -[WFContentItemRegistry contentItemClasses](self, "contentItemClasses");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  v44[0] = MEMORY[0x24BDAC760];
  v44[1] = 3221225472;
  v44[2] = __107__WFContentItemRegistry_NSExtensionItem__contentItemClassesForShareSheetWithExtensionMatchingDictionaries___block_invoke_2;
  v44[3] = &unk_24C4DCA90;
  v45 = v29;
  v46 = v4;
  v31 = v4;
  v32 = v29;
  objc_msgSend(v30, "objectsPassingTest:", v44);
  v33 = (void *)objc_claimAutoreleasedReturnValue();

  return v33;
}

- (id)contentItemClassesForShareSheetWithExtensionMatchingDictionaries:(id)a3 hostBundleIdentifier:(id)a4
{
  id v6;
  void *v7;
  void *v8;

  v6 = a4;
  -[WFContentItemRegistry contentItemClassesForShareSheetWithExtensionMatchingDictionaries:](self, "contentItemClassesForShareSheetWithExtensionMatchingDictionaries:", a3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)objc_opt_class(), "shortcutInputClassesMatchingInputContentItemsOfClasses:hostBundleIdentifier:", v7, v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

uint64_t __107__WFContentItemRegistry_NSExtensionItem__contentItemClassesForShareSheetWithExtensionMatchingDictionaries___block_invoke_2(uint64_t a1, void *a2)
{
  void *v4;
  id v5;
  id v6;
  void *v7;
  void *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  id v18;
  id v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  v4 = *(void **)(a1 + 32);
  v18 = 0;
  v19 = 0;
  WFExtractTypeIdentifiersReadableByItemClass(a2, v4, &v19, &v18);
  v5 = v19;
  v6 = v18;
  objc_msgSend(v5, "arrayByAddingObjectsFromArray:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "if_compactMap:", &__block_literal_global_105_3900);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v16 = 0u;
  v17 = 0u;
  v14 = 0u;
  v15 = 0u;
  v9 = *(id *)(a1 + 40);
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v14, v20, 16);
  if (v10)
  {
    v11 = *(_QWORD *)v15;
    while (2)
    {
      for (i = 0; i != v10; ++i)
      {
        if (*(_QWORD *)v15 != v11)
          objc_enumerationMutation(v9);
        if ((objc_msgSend(*(id *)(*((_QWORD *)&v14 + 1) + 8 * i), "conformsToUTTypes:", v8, (_QWORD)v14) & 1) != 0)
        {
          v10 = 1;
          goto LABEL_11;
        }
      }
      v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v14, v20, 16);
      if (v10)
        continue;
      break;
    }
  }
LABEL_11:

  return v10;
}

uint64_t __107__WFContentItemRegistry_NSExtensionItem__contentItemClassesForShareSheetWithExtensionMatchingDictionaries___block_invoke_3(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(MEMORY[0x24BDF8238], "typeWithIdentifier:", a2);
}

id __107__WFContentItemRegistry_NSExtensionItem__contentItemClassesForShareSheetWithExtensionMatchingDictionaries___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  void *v3;

  v2 = a2;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v2, "string");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = 0;
  }

  return v3;
}

+ (id)shortcutInputClassesMatchingInputContentItemsOfClasses:(id)a3 hostBundleIdentifier:(id)a4
{
  id v7;
  id v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  uint64_t v23;
  void *v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  _QWORD v30[2];
  _QWORD v31[3];
  _BYTE v32[128];
  uint64_t v33;

  v33 = *MEMORY[0x24BDAC8D0];
  v7 = a3;
  v8 = a4;
  if (!v7)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("WFContentItemRegistry+ShortcutInput.m"), 16, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("itemClasses"));

  }
  if (objc_msgSend(v7, "containsObject:", objc_opt_class()))
  {
    v28 = 0u;
    v29 = 0u;
    v26 = 0u;
    v27 = 0u;
    +[WFURLContentItem URLCoercions](WFURLContentItem, "URLCoercions");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v26, v32, 16);
    if (v10)
    {
      v11 = v10;
      v12 = *(_QWORD *)v27;
      do
      {
        v13 = 0;
        do
        {
          if (*(_QWORD *)v27 != v12)
            objc_enumerationMutation(v9);
          objc_msgSend(*(id *)(*((_QWORD *)&v26 + 1) + 8 * v13), "urlItem_sharingItemClassesByBundleIdentifier");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          v15 = objc_msgSend(v14, "objectForKey:", v8);

          if (v15)
          {
            objc_msgSend(v7, "setByAddingObject:", v15);
            v16 = objc_claimAutoreleasedReturnValue();

            v7 = (id)v16;
          }
          ++v13;
        }
        while (v11 != v13);
        v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v26, v32, 16);
      }
      while (v11);
    }

    objc_msgSend(v7, "setByAddingObject:", objc_opt_class());
    v17 = objc_claimAutoreleasedReturnValue();

    v7 = (id)v17;
  }
  if (objc_msgSend(v7, "containsObject:", objc_opt_class()))
  {
    objc_msgSend(v7, "setByAddingObject:", objc_opt_class());
    v18 = objc_claimAutoreleasedReturnValue();

    v7 = (id)v18;
  }
  if (objc_msgSend(v7, "containsObject:", objc_opt_class()))
  {
    v31[0] = objc_opt_class();
    v31[1] = objc_opt_class();
    v31[2] = objc_opt_class();
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v31, 3);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setByAddingObjectsFromArray:", v19);
    v20 = objc_claimAutoreleasedReturnValue();

    v7 = (id)v20;
  }
  if (objc_msgSend(v7, "containsObject:", objc_opt_class()))
  {
    objc_msgSend(v7, "setByAddingObject:", objc_opt_class());
    v21 = objc_claimAutoreleasedReturnValue();

    v7 = (id)v21;
  }
  if (objc_msgSend(v7, "containsObject:", objc_opt_class()))
  {
    v30[0] = objc_opt_class();
    v30[1] = objc_opt_class();
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v30, 2);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setByAddingObjectsFromArray:", v22);
    v23 = objc_claimAutoreleasedReturnValue();

    v7 = (id)v23;
  }

  return v7;
}

+ (id)inputContentItemClassesMatchingShortcutInputClasses:(id)a3
{
  id v5;
  void *v6;
  uint64_t v7;
  unint64_t v8;
  uint64_t v9;
  char v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t j;
  uint64_t v20;
  void *v21;
  uint64_t v22;
  void *v23;
  uint64_t v24;
  void *v25;
  uint64_t v26;
  uint64_t v27;
  void *v28;
  uint64_t v29;
  void *v30;
  uint64_t v31;
  void *v32;
  uint64_t v33;
  void *v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  _BYTE v44[128];
  _BYTE v45[128];
  uint64_t v46;

  v46 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v35, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("WFContentItemRegistry+ShortcutInput.m"), 57, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("shortcutInputClasses"));

  }
  v42 = 0u;
  v43 = 0u;
  v40 = 0u;
  v41 = 0u;
  +[WFURLContentItem URLCoercions](WFURLContentItem, "URLCoercions");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v40, v45, 16);
  v8 = 0x24BDBC000uLL;
  if (!v7)
  {

LABEL_25:
    v21 = *(void **)(v8 + 3872);
    v22 = objc_opt_class();
    objc_msgSend(v21, "setWithObjects:", v22, objc_opt_class(), 0);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v22) = objc_msgSend(v5, "intersectsSet:", v23);

    if ((_DWORD)v22)
    {
      objc_msgSend(v5, "setByAddingObject:", objc_opt_class());
      v6 = v5;
      v5 = (id)objc_claimAutoreleasedReturnValue();
LABEL_27:

    }
    goto LABEL_28;
  }
  v9 = v7;
  v10 = 0;
  v11 = *(_QWORD *)v41;
  while (2)
  {
    for (i = 0; i != v9; ++i)
    {
      if (*(_QWORD *)v41 != v11)
        objc_enumerationMutation(v6);
      if ((v10 & 1) != 0)
      {
        v8 = 0x24BDBC000;
        goto LABEL_27;
      }
      v13 = *(void **)(*((_QWORD *)&v40 + 1) + 8 * i);
      v36 = 0u;
      v37 = 0u;
      v38 = 0u;
      v39 = 0u;
      objc_msgSend(v13, "urlItem_sharingItemClassesByBundleIdentifier");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "allValues");
      v15 = (void *)objc_claimAutoreleasedReturnValue();

      v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v36, v44, 16);
      if (v16)
      {
        v17 = v16;
        v18 = *(_QWORD *)v37;
        while (2)
        {
          for (j = 0; j != v17; ++j)
          {
            if (*(_QWORD *)v37 != v18)
              objc_enumerationMutation(v15);
            if (objc_msgSend(v5, "containsObject:", *(_QWORD *)(*((_QWORD *)&v36 + 1) + 8 * j)))
            {
              objc_msgSend(v5, "setByAddingObject:", objc_opt_class());
              v20 = objc_claimAutoreleasedReturnValue();

              v10 = 1;
              v5 = (id)v20;
              goto LABEL_19;
            }
          }
          v17 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v36, v44, 16);
          if (v17)
            continue;
          break;
        }
      }
      v10 = 0;
LABEL_19:

    }
    v9 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v40, v45, 16);
    if (v9)
      continue;
    break;
  }

  v8 = 0x24BDBC000;
  if ((v10 & 1) == 0)
    goto LABEL_25;
LABEL_28:
  if (objc_msgSend(v5, "containsObject:", objc_opt_class()))
  {
    objc_msgSend(v5, "setByAddingObject:", objc_opt_class());
    v24 = objc_claimAutoreleasedReturnValue();

    v5 = (id)v24;
  }
  v25 = *(void **)(v8 + 3872);
  v26 = objc_opt_class();
  v27 = objc_opt_class();
  objc_msgSend(v25, "setWithObjects:", v26, v27, objc_opt_class(), 0);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v26) = objc_msgSend(v5, "intersectsSet:", v28);

  if ((_DWORD)v26)
  {
    objc_msgSend(v5, "setByAddingObject:", objc_opt_class());
    v29 = objc_claimAutoreleasedReturnValue();

    v5 = (id)v29;
  }
  v30 = *(void **)(v8 + 3872);
  v31 = objc_opt_class();
  objc_msgSend(v30, "setWithObjects:", v31, objc_opt_class(), 0);
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v31) = objc_msgSend(v5, "intersectsSet:", v32);

  if ((_DWORD)v31)
  {
    objc_msgSend(v5, "setByAddingObject:", objc_opt_class());
    v33 = objc_claimAutoreleasedReturnValue();

    v5 = (id)v33;
  }
  return v5;
}

+ (id)allContentItemClassesInContentKit
{
  _QWORD v3[43];

  v3[42] = *MEMORY[0x24BDAC8D0];
  v3[0] = objc_opt_class();
  v3[1] = objc_opt_class();
  v3[2] = objc_opt_class();
  v3[3] = objc_opt_class();
  v3[4] = objc_opt_class();
  v3[5] = objc_opt_class();
  v3[6] = objc_opt_class();
  v3[7] = objc_opt_class();
  v3[8] = objc_opt_class();
  v3[9] = objc_opt_class();
  v3[10] = objc_opt_class();
  v3[11] = objc_opt_class();
  v3[12] = objc_opt_class();
  v3[13] = objc_opt_class();
  v3[14] = objc_opt_class();
  v3[15] = objc_opt_class();
  v3[16] = objc_opt_class();
  v3[17] = objc_opt_class();
  v3[18] = objc_opt_class();
  v3[19] = objc_opt_class();
  v3[20] = objc_opt_class();
  v3[21] = objc_opt_class();
  v3[22] = objc_opt_class();
  v3[23] = objc_opt_class();
  v3[24] = objc_opt_class();
  v3[25] = objc_opt_class();
  v3[26] = objc_opt_class();
  v3[27] = objc_opt_class();
  v3[28] = objc_opt_class();
  v3[29] = objc_opt_class();
  v3[30] = objc_opt_class();
  v3[31] = objc_opt_class();
  v3[32] = objc_opt_class();
  v3[33] = objc_opt_class();
  v3[34] = objc_opt_class();
  v3[35] = objc_opt_class();
  v3[36] = objc_opt_class();
  v3[37] = objc_opt_class();
  v3[38] = objc_opt_class();
  v3[39] = objc_opt_class();
  v3[40] = objc_opt_class();
  v3[41] = objc_opt_class();
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v3, 42);
  return (id)objc_claimAutoreleasedReturnValue();
}

@end
