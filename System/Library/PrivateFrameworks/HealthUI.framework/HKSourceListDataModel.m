@implementation HKSourceListDataModel

- (HKSourceListDataModel)initWithSources:(id)a3
{
  void *v4;
  HKSourceListDataModel *v5;

  objc_msgSend(a3, "hk_map:", &__block_literal_global_50);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[HKSourceListDataModel initWithSourceModels:](self, "initWithSourceModels:", v4);

  return v5;
}

HKSourceDataModel *__41__HKSourceListDataModel_initWithSources___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  HKSourceDataModel *v3;

  v2 = a2;
  v3 = -[HKSourceDataModel initWithSource:]([HKSourceDataModel alloc], "initWithSource:", v2);

  -[HKSourceDataModel setInstalled:](v3, "setInstalled:", 1);
  return v3;
}

- (HKSourceListDataModel)initWithSourceModels:(id)a3
{
  id v4;
  HKSourceListDataModel *v5;
  HKSourceListDataModel *v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)HKSourceListDataModel;
  v5 = -[HKSourceListDataModel init](&v8, sel_init);
  v6 = v5;
  if (v5)
    -[HKSourceListDataModel _sortSources:](v5, "_sortSources:", v4);

  return v6;
}

- (id)copyWithZone:(_NSZone *)a3
{
  void *v4;
  void *v5;
  HKSourceListDataModel *v6;

  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E60]), "initWithSet:copyItems:", self->_allSources, 1);
  objc_msgSend(v4, "allObjects");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = -[HKSourceListDataModel initWithSourceModels:](+[HKSourceListDataModel allocWithZone:](HKSourceListDataModel, "allocWithZone:", a3), "initWithSourceModels:", v5);
  return v6;
}

- (void)_sortSources:(id)a3
{
  id v3;
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  char v15;
  void *v16;
  NSSet *v17;
  NSSet *allSources;
  NSArray *v19;
  NSArray *orderedAppSources;
  NSArray *v21;
  NSArray *orderedUninstalledAppSources;
  NSArray *v23;
  NSArray *orderedDeviceSources;
  NSArray *v25;
  NSArray *orderedResearchStudySources;
  NSArray *v27;
  NSArray *orderedClinicalSources;
  void *context;
  void *v31;
  id v32;
  id v33;
  id v34;
  id v35;
  id v36;
  uint64_t v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  _BYTE v42[128];
  uint64_t v43;

  v43 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  context = (void *)MEMORY[0x1D829F904]();
  v31 = v3;
  v4 = (void *)objc_msgSend(v3, "mutableCopy");
  objc_msgSend(v4, "sortUsingComparator:", &__block_literal_global_229_0);
  v36 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v35 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v33 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v34 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v32 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v38 = 0u;
  v39 = 0u;
  v40 = 0u;
  v41 = 0u;
  v5 = v4;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v38, v42, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v39;
    v9 = *MEMORY[0x1E0CB7578];
    v37 = *MEMORY[0x1E0CB7580];
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v39 != v8)
          objc_enumerationMutation(v5);
        v11 = *(void **)(*((_QWORD *)&v38 + 1) + 8 * i);
        objc_msgSend(v11, "source");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        if ((objc_msgSend(v12, "_isHidden") & 1) == 0)
        {
          objc_msgSend(v12, "bundleIdentifier");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          if (objc_msgSend(v13, "isEqualToString:", v9))
          {

          }
          else
          {
            objc_msgSend(v12, "bundleIdentifier");
            v14 = (void *)objc_claimAutoreleasedReturnValue();
            v15 = objc_msgSend(v14, "isEqualToString:", v37);

            if ((v15 & 1) == 0)
            {
              if (objc_msgSend(v12, "_isApplication"))
              {
                if (objc_msgSend(v11, "installed"))
                  v16 = v36;
                else
                  v16 = v35;
              }
              else if (objc_msgSend(v12, "_isResearchStudy"))
              {
                v16 = v34;
              }
              else if (objc_msgSend(v12, "_isClinicalSource"))
              {
                v16 = v32;
              }
              else
              {
                v16 = v33;
              }
              objc_msgSend(v16, "addObject:", v11);
            }
          }
        }

      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v38, v42, 16);
    }
    while (v7);
  }

  objc_msgSend(MEMORY[0x1E0C99E60], "setWithArray:", v5);
  v17 = (NSSet *)objc_claimAutoreleasedReturnValue();
  allSources = self->_allSources;
  self->_allSources = v17;

  v19 = (NSArray *)objc_msgSend(v36, "copy");
  orderedAppSources = self->_orderedAppSources;
  self->_orderedAppSources = v19;

  v21 = (NSArray *)objc_msgSend(v35, "copy");
  orderedUninstalledAppSources = self->_orderedUninstalledAppSources;
  self->_orderedUninstalledAppSources = v21;

  v23 = (NSArray *)objc_msgSend(v33, "copy");
  orderedDeviceSources = self->_orderedDeviceSources;
  self->_orderedDeviceSources = v23;

  v25 = (NSArray *)objc_msgSend(v34, "copy");
  orderedResearchStudySources = self->_orderedResearchStudySources;
  self->_orderedResearchStudySources = v25;

  v27 = (NSArray *)objc_msgSend(v32, "copy");
  orderedClinicalSources = self->_orderedClinicalSources;
  self->_orderedClinicalSources = v27;

  objc_autoreleasePoolPop(context);
}

uint64_t __38__HKSourceListDataModel__sortSources___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;

  v4 = a3;
  objc_msgSend(a2, "source");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "name");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "source");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "name");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v6, "localizedCaseInsensitiveCompare:", v8);

  return v9;
}

- (NSSet)allSources
{
  return self->_allSources;
}

- (NSArray)orderedAppSources
{
  return self->_orderedAppSources;
}

- (NSArray)orderedUninstalledAppSources
{
  return self->_orderedUninstalledAppSources;
}

- (NSArray)orderedResearchStudySources
{
  return self->_orderedResearchStudySources;
}

- (NSArray)orderedDeviceSources
{
  return self->_orderedDeviceSources;
}

- (NSArray)orderedClinicalSources
{
  return self->_orderedClinicalSources;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_orderedClinicalSources, 0);
  objc_storeStrong((id *)&self->_orderedDeviceSources, 0);
  objc_storeStrong((id *)&self->_orderedResearchStudySources, 0);
  objc_storeStrong((id *)&self->_orderedUninstalledAppSources, 0);
  objc_storeStrong((id *)&self->_orderedAppSources, 0);
  objc_storeStrong((id *)&self->_allSources, 0);
}

@end
