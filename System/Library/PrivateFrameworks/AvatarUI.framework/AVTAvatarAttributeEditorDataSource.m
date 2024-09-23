@implementation AVTAvatarAttributeEditorDataSource

+ (id)sectionControllerForSection:(id)a3 renderingScheduler:(id)a4 environment:(id)a5
{
  id v7;
  id v8;
  id v9;
  AVTAvatarAttributeEditorSectionColorController *v10;
  AVTAvatarAttributeEditorSectionController *v11;
  AVTOrderedIndexBasedTaskScheduler *v12;
  void *v13;
  AVTOrderedIndexBasedTaskScheduler *v14;

  v7 = a3;
  v8 = a4;
  v9 = a5;
  if (objc_msgSend(v7, "conformsToProtocol:", &unk_1F03D9670))
  {
    v10 = -[AVTAvatarAttributeEditorSectionColorController initWithEnvironment:]([AVTAvatarAttributeEditorSectionColorController alloc], "initWithEnvironment:", v9);
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      v12 = [AVTOrderedIndexBasedTaskScheduler alloc];
      objc_msgSend(v9, "coreEnvironment");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = -[AVTOrderedIndexBasedTaskScheduler initWithEnvironment:](v12, "initWithEnvironment:", v13);

      v11 = -[AVTAvatarAttributeEditorSectionController initWithThumbnailScheduler:renderingScheduler:environment:]([AVTAvatarAttributeEditorSectionController alloc], "initWithThumbnailScheduler:renderingScheduler:environment:", v14, v8, v9);
      goto LABEL_7;
    }
    v10 = objc_alloc_init(AVTAvatarAttributeEditorMulticolorSectionPickerController);
  }
  v11 = (AVTAvatarAttributeEditorSectionController *)v10;
LABEL_7:

  return v11;
}

+ (unint64_t)indexForCurrentCategoryGivenPreferredIdentifier:(id)a3 categories:(id)a4
{
  id v5;
  id v6;
  uint64_t v7;
  unint64_t v8;
  _QWORD v10[4];
  id v11;

  v5 = a3;
  v6 = a4;
  if (objc_msgSend(v6, "count"))
  {
    if (v5)
    {
      v10[0] = MEMORY[0x1E0C809B0];
      v10[1] = 3221225472;
      v10[2] = __97__AVTAvatarAttributeEditorDataSource_indexForCurrentCategoryGivenPreferredIdentifier_categories___block_invoke;
      v10[3] = &unk_1EA51D8A8;
      v11 = v5;
      v7 = objc_msgSend(v6, "indexOfObjectPassingTest:", v10);
      if (v7 == 0x7FFFFFFFFFFFFFFFLL)
        v8 = 0;
      else
        v8 = v7;

    }
    else
    {
      v8 = 0;
    }
  }
  else
  {
    v8 = 0x7FFFFFFFFFFFFFFFLL;
  }

  return v8;
}

uint64_t __97__AVTAvatarAttributeEditorDataSource_indexForCurrentCategoryGivenPreferredIdentifier_categories___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  uint64_t v5;

  objc_msgSend(a2, "modelGroup");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "name");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "isEqual:", *(_QWORD *)(a1 + 32));

  return v5;
}

- (AVTAvatarAttributeEditorDataSource)initWithCategories:(id)a3 currentCategoryIdentifier:(id)a4 renderingScheduler:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  AVTAvatarAttributeEditorDataSource *v12;

  v8 = a5;
  v9 = a4;
  v10 = a3;
  +[AVTUIEnvironment defaultEnvironment](AVTUIEnvironment, "defaultEnvironment");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = -[AVTAvatarAttributeEditorDataSource initWithCategories:currentCategoryIdentifier:renderingScheduler:environment:](self, "initWithCategories:currentCategoryIdentifier:renderingScheduler:environment:", v10, v9, v8, v11);

  return v12;
}

- (AVTAvatarAttributeEditorDataSource)initWithCategories:(id)a3 currentCategoryIdentifier:(id)a4 renderingScheduler:(id)a5 environment:(id)a6
{
  id v11;
  id v12;
  id v13;
  id v14;
  AVTAvatarAttributeEditorDataSource *v15;
  AVTAvatarAttributeEditorDataSource *v16;
  uint64_t v17;
  NSMutableDictionary *sectionControllers;
  uint64_t v19;
  NSMutableDictionary *sectionCoordinatorsByProvider;
  objc_super v22;

  v11 = a3;
  v12 = a4;
  v13 = a5;
  v14 = a6;
  v22.receiver = self;
  v22.super_class = (Class)AVTAvatarAttributeEditorDataSource;
  v15 = -[AVTAvatarAttributeEditorDataSource init](&v22, sel_init);
  v16 = v15;
  if (v15)
  {
    objc_storeStrong((id *)&v15->_categories, a3);
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v17 = objc_claimAutoreleasedReturnValue();
    sectionControllers = v16->_sectionControllers;
    v16->_sectionControllers = (NSMutableDictionary *)v17;

    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v19 = objc_claimAutoreleasedReturnValue();
    sectionCoordinatorsByProvider = v16->_sectionCoordinatorsByProvider;
    v16->_sectionCoordinatorsByProvider = (NSMutableDictionary *)v19;

    objc_storeStrong((id *)&v16->_environment, a6);
    objc_storeStrong((id *)&v16->_renderingScheduler, a5);
    v16->_currentCategoryIndex = objc_msgSend((id)objc_opt_class(), "indexForCurrentCategoryGivenPreferredIdentifier:categories:", v12, v11);
  }

  return v16;
}

- (void)reloadWithCategories:(id)a3 currentCategoryIndex:(unint64_t)a4
{
  void *v6;
  void *v7;
  id v8;

  v8 = a3;
  if (objc_msgSend(v8, "count"))
  {
    objc_msgSend(v8, "objectAtIndexedSubscript:", a4);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[AVTAvatarAttributeEditorDataSource sectionCoordinatorsByProvider](self, "sectionCoordinatorsByProvider");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[AVTAvatarAttributeEditorDataSource updateCoordinatorsFromCategory:currentCoordinators:](self, "updateCoordinatorsFromCategory:currentCoordinators:", v6, v7);

  }
  -[AVTAvatarAttributeEditorDataSource setCategories:](self, "setCategories:", v8);
  -[AVTAvatarAttributeEditorDataSource setCurrentCategoryIndex:](self, "setCurrentCategoryIndex:", a4);
  -[AVTAvatarAttributeEditorDataSource discardControllersForNonCurrentCategory](self, "discardControllersForNonCurrentCategory");

}

- (void)updateCoordinatorsFromCategory:(id)a3 currentCoordinators:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
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
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t i;
  void *v27;
  void *v28;
  id v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t j;
  void *v34;
  void *v35;
  void *v36;
  unint64_t v37;
  AVTAvatarAttributeEditorSectionCoordinator *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  id v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  _BYTE v52[128];
  _BYTE v53[128];
  uint64_t v54;

  v54 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  v7 = v6;
  if (v5)
  {
    objc_msgSend(v6, "allKeys");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = (void *)objc_msgSend(v8, "mutableCopy");

    objc_msgSend(v5, "sectionProviders");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "avt_map:", &__block_literal_global_6);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v11, "differenceFromArray:", v9);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "removals");
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    if (v13)
    {
      objc_msgSend(v12, "removals");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "avt_map:", &__block_literal_global_100);
      v15 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v7, "removeObjectsForKeys:", v15);
    }
    objc_msgSend(v12, "insertions");
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    if (v16)
    {
      v41 = v11;
      v42 = v9;
      objc_msgSend(v12, "insertions");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "avt_map:", &__block_literal_global_101);
      v18 = (void *)objc_claimAutoreleasedReturnValue();

      v19 = (void *)MEMORY[0x1E0C99E08];
      objc_msgSend(v5, "sectionProviders");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "dictionaryWithCapacity:", objc_msgSend(v20, "count"));
      v21 = (void *)objc_claimAutoreleasedReturnValue();

      v50 = 0u;
      v51 = 0u;
      v48 = 0u;
      v49 = 0u;
      v43 = v5;
      objc_msgSend(v5, "sectionProviders");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v23 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v48, v53, 16);
      if (v23)
      {
        v24 = v23;
        v25 = *(_QWORD *)v49;
        do
        {
          for (i = 0; i != v24; ++i)
          {
            if (*(_QWORD *)v49 != v25)
              objc_enumerationMutation(v22);
            v27 = *(void **)(*((_QWORD *)&v48 + 1) + 8 * i);
            objc_msgSend(v27, "identifier");
            v28 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v21, "setObject:forKeyedSubscript:", v27, v28);

          }
          v24 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v48, v53, 16);
        }
        while (v24);
      }
      v40 = v12;

      v46 = 0u;
      v47 = 0u;
      v44 = 0u;
      v45 = 0u;
      v29 = v18;
      v30 = objc_msgSend(v29, "countByEnumeratingWithState:objects:count:", &v44, v52, 16);
      if (v30)
      {
        v31 = v30;
        v32 = *(_QWORD *)v45;
        do
        {
          for (j = 0; j != v31; ++j)
          {
            if (*(_QWORD *)v45 != v32)
              objc_enumerationMutation(v29);
            objc_msgSend(v21, "objectForKeyedSubscript:", *(_QWORD *)(*((_QWORD *)&v44 + 1) + 8 * j), v40);
            v34 = (void *)objc_claimAutoreleasedReturnValue();
            v35 = v34;
            if (v34)
            {
              objc_msgSend(v34, "sections");
              v36 = (void *)objc_claimAutoreleasedReturnValue();
              v37 = objc_msgSend(v36, "count");

              if (v37 >= 2)
              {
                v38 = objc_alloc_init(AVTAvatarAttributeEditorSectionCoordinator);
                objc_msgSend(v35, "identifier");
                v39 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v7, "setObject:forKeyedSubscript:", v38, v39);

              }
            }

          }
          v31 = objc_msgSend(v29, "countByEnumeratingWithState:objects:count:", &v44, v52, 16);
        }
        while (v31);
      }

      v9 = v42;
      v5 = v43;
      v12 = v40;
      v11 = v41;
    }

  }
}

uint64_t __89__AVTAvatarAttributeEditorDataSource_updateCoordinatorsFromCategory_currentCoordinators___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "identifier");
}

uint64_t __89__AVTAvatarAttributeEditorDataSource_updateCoordinatorsFromCategory_currentCoordinators___block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "object");
}

uint64_t __89__AVTAvatarAttributeEditorDataSource_updateCoordinatorsFromCategory_currentCoordinators___block_invoke_3(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "object");
}

- (void)discardControllersForNonCurrentCategory
{
  void *v3;
  uint64_t v4;
  unint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  unint64_t v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  -[AVTAvatarAttributeEditorDataSource categories](self, "categories");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "count");

  if (v4)
  {
    v5 = 0;
    do
    {
      if (v5 != -[AVTAvatarAttributeEditorDataSource currentCategoryIndex](self, "currentCategoryIndex"))
      {
        v20 = 0u;
        v21 = 0u;
        v18 = 0u;
        v19 = 0u;
        -[AVTAvatarAttributeEditorDataSource categories](self, "categories", 0);
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "objectAtIndexedSubscript:", v5);
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "sections");
        v8 = (void *)objc_claimAutoreleasedReturnValue();

        v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
        if (v9)
        {
          v10 = v9;
          v11 = *(_QWORD *)v19;
          do
          {
            v12 = 0;
            do
            {
              if (*(_QWORD *)v19 != v11)
                objc_enumerationMutation(v8);
              v13 = *(void **)(*((_QWORD *)&v18 + 1) + 8 * v12);
              -[AVTAvatarAttributeEditorDataSource sectionControllers](self, "sectionControllers");
              v14 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v13, "identifier");
              v15 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v14, "setObject:forKeyedSubscript:", 0, v15);

              ++v12;
            }
            while (v10 != v12);
            v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
          }
          while (v10);
        }

      }
      ++v5;
      -[AVTAvatarAttributeEditorDataSource categories](self, "categories");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = objc_msgSend(v16, "count");

    }
    while (v5 < v17);
  }
}

- (int64_t)numberOfCategories
{
  void *v2;
  int64_t v3;

  -[AVTAvatarAttributeEditorDataSource categories](self, "categories");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "count");

  return v3;
}

- (id)groupPickerItemsForCategories
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  AVTGroupPickerItem *v12;
  void *v13;
  void *v14;
  AVTGroupPickerItem *v15;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v3 = (void *)MEMORY[0x1E0C99DE8];
  -[AVTAvatarAttributeEditorDataSource categories](self, "categories");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "arrayWithCapacity:", objc_msgSend(v4, "count"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v19 = 0u;
  v20 = 0u;
  v17 = 0u;
  v18 = 0u;
  -[AVTAvatarAttributeEditorDataSource categories](self, "categories", 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v18;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v18 != v9)
          objc_enumerationMutation(v6);
        v11 = *(void **)(*((_QWORD *)&v17 + 1) + 8 * v10);
        v12 = [AVTGroupPickerItem alloc];
        objc_msgSend(v11, "localizedName");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "symbolNameProvider");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v15 = -[AVTGroupPickerItem initWithLocalizedName:symbolNameProvider:](v12, "initWithLocalizedName:symbolNameProvider:", v13, v14);

        objc_msgSend(v5, "addObject:", v15);
        ++v10;
      }
      while (v8 != v10);
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    }
    while (v8);
  }

  return v5;
}

- (id)categoryAtIndex:(int64_t)a3
{
  void *v4;
  void *v5;

  -[AVTAvatarAttributeEditorDataSource categories](self, "categories");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectAtIndexedSubscript:", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)sectionProviderForSectionAtIndex:(int64_t)a3 inCategoryAtIndex:(int64_t)a4
{
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  void *v13;
  unint64_t v14;
  void *v15;
  id v16;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  -[AVTAvatarAttributeEditorDataSource categoryAtIndex:](self, "categoryAtIndex:", a4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  objc_msgSend(v5, "sectionProviders", 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
  if (v7)
  {
    v8 = v7;
    v9 = 0;
    v10 = *(_QWORD *)v19;
    while (2)
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v19 != v10)
          objc_enumerationMutation(v6);
        v12 = *(void **)(*((_QWORD *)&v18 + 1) + 8 * i);
        objc_msgSend(v12, "sections");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v14 = objc_msgSend(v13, "count") + v9;

        if (v14 >= a3)
        {
          v16 = v12;
          goto LABEL_11;
        }
        objc_msgSend(v12, "sections");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v9 += objc_msgSend(v15, "count");

      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
      if (v8)
        continue;
      break;
    }
  }
  v16 = 0;
LABEL_11:

  return v16;
}

- (int64_t)numberOfSectionsForCategoryAtIndex:(int64_t)a3
{
  void *v4;
  void *v5;
  void *v6;
  int64_t v7;

  -[AVTAvatarAttributeEditorDataSource categories](self, "categories");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectAtIndexedSubscript:", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "sections");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "count");

  return v7;
}

- (id)sectionControllerForSectionIndex:(int64_t)a3 inCategoryAtIndex:(int64_t)a4
{
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;

  -[AVTAvatarAttributeEditorDataSource sectionForIndex:inCategoryAtIndex:](self, "sectionForIndex:inCategoryAtIndex:");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[AVTAvatarAttributeEditorDataSource sectionControllerForSection:](self, "sectionControllerForSection:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[AVTAvatarAttributeEditorDataSource sectionProviderForSectionAtIndex:inCategoryAtIndex:](self, "sectionProviderForSectionAtIndex:inCategoryAtIndex:", a3, a4);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[AVTAvatarAttributeEditorDataSource sectionCoordinatorsByProvider](self, "sectionCoordinatorsByProvider");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "identifier");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "objectForKeyedSubscript:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (v12)
    objc_msgSend(v12, "addSectionController:", v8);

  return v8;
}

- (id)sectionCoordinatorForSectionAtIndex:(int64_t)a3 inCategoryAtIndex:(int64_t)a4
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  -[AVTAvatarAttributeEditorDataSource sectionProviderForSectionAtIndex:inCategoryAtIndex:](self, "sectionProviderForSectionAtIndex:inCategoryAtIndex:", a3, a4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[AVTAvatarAttributeEditorDataSource sectionCoordinatorsByProvider](self, "sectionCoordinatorsByProvider");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "identifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKeyedSubscript:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (id)sectionControllerForSection:(id)a3
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

  v4 = a3;
  -[AVTAvatarAttributeEditorDataSource sectionControllers](self, "sectionControllers");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "identifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v7)
  {
    v8 = (void *)objc_opt_class();
    -[AVTAvatarAttributeEditorDataSource renderingScheduler](self, "renderingScheduler");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[AVTAvatarAttributeEditorDataSource environment](self, "environment");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "sectionControllerForSection:renderingScheduler:environment:", v4, v9, v10);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

  }
  objc_msgSend(v7, "updateWithSection:", v4);
  -[AVTAvatarAttributeEditorDataSource sectionControllers](self, "sectionControllers");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "identifier");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setObject:forKeyedSubscript:", v7, v12);

  return v7;
}

- (id)sectionForIndex:(int64_t)a3 inCategoryAtIndex:(int64_t)a4
{
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  unint64_t v11;
  void *v12;
  void *v13;
  void *v14;

  -[AVTAvatarAttributeEditorDataSource categories](self, "categories");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v7, "count") <= (unint64_t)a4)
  {
    v14 = 0;
  }
  else
  {
    -[AVTAvatarAttributeEditorDataSource categories](self, "categories");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "objectAtIndexedSubscript:", a4);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "sections");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "count");

    if (v11 <= a3)
    {
      v14 = 0;
      return v14;
    }
    -[AVTAvatarAttributeEditorDataSource categories](self, "categories");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "objectAtIndexedSubscript:", a4);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "sections");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "objectAtIndexedSubscript:", a3);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v14;
}

- (int64_t)indexForSection:(id)a3 inCategoryAtIndex:(int64_t)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  int64_t v10;

  v6 = a3;
  -[AVTAvatarAttributeEditorDataSource categories](self, "categories");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectAtIndexedSubscript:", a4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "sections");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "indexOfObject:", v6);

  return v10;
}

- (id)indexesForSectionsExcludingSectionsWithIdentifiers:(id)a3 inCategoryAtIndex:(int64_t)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  _QWORD v12[4];
  id v13;

  v6 = a3;
  -[AVTAvatarAttributeEditorDataSource categories](self, "categories");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectAtIndexedSubscript:", a4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "sections");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v9, "count"))
  {
    v12[0] = MEMORY[0x1E0C809B0];
    v12[1] = 3221225472;
    v12[2] = __107__AVTAvatarAttributeEditorDataSource_indexesForSectionsExcludingSectionsWithIdentifiers_inCategoryAtIndex___block_invoke;
    v12[3] = &unk_1EA51D970;
    v13 = v6;
    objc_msgSend(v9, "indexesOfObjectsPassingTest:", v12);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB36B8], "indexSet");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v10;
}

uint64_t __107__AVTAvatarAttributeEditorDataSource_indexesForSectionsExcludingSectionsWithIdentifiers_inCategoryAtIndex___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  uint64_t v4;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(a2, "identifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v2, "containsObject:", v3) ^ 1;

  return v4;
}

- (id)indexesForSectionsPresentIn:(id)a3 butNotIn:(id)a4
{
  id v5;
  id v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  _QWORD v15[4];
  id v16;

  v5 = a3;
  v6 = a4;
  objc_msgSend(v5, "sections");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "count");

  if (v8)
  {
    objc_msgSend(v6, "sections");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "avt_map:", &__block_literal_global_108);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v5, "sections");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v15[0] = MEMORY[0x1E0C809B0];
    v15[1] = 3221225472;
    v15[2] = __75__AVTAvatarAttributeEditorDataSource_indexesForSectionsPresentIn_butNotIn___block_invoke_2;
    v15[3] = &unk_1EA51D9D8;
    v16 = v10;
    v12 = v10;
    objc_msgSend(v11, "indexesOfObjectsPassingTest:", v15);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB36B8], "indexSet");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v13;
}

uint64_t __75__AVTAvatarAttributeEditorDataSource_indexesForSectionsPresentIn_butNotIn___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "identifier");
}

uint64_t __75__AVTAvatarAttributeEditorDataSource_indexesForSectionsPresentIn_butNotIn___block_invoke_2(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  uint64_t v4;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(a2, "identifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v2, "containsObject:", v3) ^ 1;

  return v4;
}

- (id)currentCategoryIdentifier
{
  void *v2;
  void *v3;
  void *v4;

  -[AVTAvatarAttributeEditorDataSource categoryAtIndex:](self, "categoryAtIndex:", -[AVTAvatarAttributeEditorDataSource currentCategoryIndex](self, "currentCategoryIndex"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "modelGroup");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "name");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (BOOL)shouldDisplaySectionWithDisplayCondition:(id)a3 inCategoryAtIndex:(unint64_t)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  char v10;

  v6 = a3;
  -[AVTAvatarAttributeEditorDataSource sectionForIndex:inCategoryAtIndex:](self, "sectionForIndex:inCategoryAtIndex:", objc_msgSend(v6, "targetSectionIndex"), a4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    -[AVTAvatarAttributeEditorDataSource sectionControllerForSection:](self, "sectionControllerForSection:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = v8;
    if (v8)
      v10 = objc_msgSend(v8, "evaluateDisplayCondition:", v6);
    else
      v10 = 0;

  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (unint64_t)currentCategoryIndex
{
  return self->_currentCategoryIndex;
}

- (void)setCurrentCategoryIndex:(unint64_t)a3
{
  self->_currentCategoryIndex = a3;
}

- (NSArray)categories
{
  return self->_categories;
}

- (void)setCategories:(id)a3
{
  objc_storeStrong((id *)&self->_categories, a3);
}

- (NSMutableDictionary)sectionControllers
{
  return self->_sectionControllers;
}

- (void)setSectionControllers:(id)a3
{
  objc_storeStrong((id *)&self->_sectionControllers, a3);
}

- (NSMutableDictionary)sectionCoordinatorsByProvider
{
  return self->_sectionCoordinatorsByProvider;
}

- (void)setSectionCoordinatorsByProvider:(id)a3
{
  objc_storeStrong((id *)&self->_sectionCoordinatorsByProvider, a3);
}

- (AVTUIEnvironment)environment
{
  return self->_environment;
}

- (AVTTaskScheduler)renderingScheduler
{
  return self->_renderingScheduler;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_renderingScheduler, 0);
  objc_storeStrong((id *)&self->_environment, 0);
  objc_storeStrong((id *)&self->_sectionCoordinatorsByProvider, 0);
  objc_storeStrong((id *)&self->_sectionControllers, 0);
  objc_storeStrong((id *)&self->_categories, 0);
}

@end
