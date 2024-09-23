@implementation HFTriggerActionsSetsUISummary

- (HFTriggerActionsSetsUISummary)initWithSummaryText:(id)a3 summaryIconDescriptors:(id)a4
{
  id v6;
  id v7;
  HFTriggerActionsSetsUISummary *v8;
  uint64_t v9;
  NSString *summaryDescription;
  uint64_t v11;
  NSArray *summaryDescriptors;

  v6 = a3;
  v7 = a4;
  v8 = -[HFTriggerActionsSetsUISummary init](self, "init");
  if (v8)
  {
    v9 = objc_msgSend(v6, "copy");
    summaryDescription = v8->_summaryDescription;
    v8->_summaryDescription = (NSString *)v9;

    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithArray:", v7);
    v11 = objc_claimAutoreleasedReturnValue();
    summaryDescriptors = v8->_summaryDescriptors;
    v8->_summaryDescriptors = (NSArray *)v11;

    v8->_needsIconSort = 0;
  }

  return v8;
}

- (HFTriggerActionsSetsUISummary)initWithSummaryText:(id)a3 summaryIconNames:(id)a4
{
  id v6;
  id v7;
  HFTriggerActionsSetsUISummary *v8;
  uint64_t v9;
  NSString *summaryDescription;
  void *v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  HFImageIconDescriptor *v18;
  HFImageIconDescriptor *v19;
  uint64_t v20;
  NSArray *summaryDescriptors;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  _BYTE v27[128];
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v8 = -[HFTriggerActionsSetsUISummary init](self, "init");
  if (v8)
  {
    v9 = objc_msgSend(v6, "copy");
    summaryDescription = v8->_summaryDescription;
    v8->_summaryDescription = (NSString *)v9;

    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = 0u;
    v24 = 0u;
    v25 = 0u;
    v26 = 0u;
    v12 = v7;
    v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
    if (v13)
    {
      v14 = v13;
      v15 = *(_QWORD *)v24;
      do
      {
        v16 = 0;
        do
        {
          if (*(_QWORD *)v24 != v15)
            objc_enumerationMutation(v12);
          v17 = *(_QWORD *)(*((_QWORD *)&v23 + 1) + 8 * v16);
          v18 = [HFImageIconDescriptor alloc];
          v19 = -[HFImageIconDescriptor initWithImageIdentifier:](v18, "initWithImageIdentifier:", v17, (_QWORD)v23);
          objc_msgSend(v11, "addObject:", v19);

          ++v16;
        }
        while (v14 != v16);
        v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
      }
      while (v14);
    }

    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithArray:", v11);
    v20 = objc_claimAutoreleasedReturnValue();
    summaryDescriptors = v8->_summaryDescriptors;
    v8->_summaryDescriptors = (NSArray *)v20;

    v8->_needsIconSort = 0;
  }

  return v8;
}

- (HFTriggerActionsSetsUISummary)init
{
  HFTriggerActionsSetsUISummary *v2;
  HFTriggerActionsSetsUISummary *v3;
  NSString *firstSceneName;
  NSString *firstServiceName;
  NSString *mediaAccessoryName;
  uint64_t v7;
  NSMutableArray *icons;
  uint64_t v9;
  NSMutableArray *iconDescriptors;
  uint64_t v11;
  NSMutableDictionary *iconCounter;
  objc_super v14;

  v14.receiver = self;
  v14.super_class = (Class)HFTriggerActionsSetsUISummary;
  v2 = -[HFTriggerActionsSetsUISummary init](&v14, sel_init);
  v3 = v2;
  if (v2)
  {
    firstSceneName = v2->_firstSceneName;
    v2->_firstSceneName = (NSString *)&stru_1EA741FF8;

    firstServiceName = v3->_firstServiceName;
    v3->_firstServiceName = (NSString *)&stru_1EA741FF8;

    mediaAccessoryName = v3->_mediaAccessoryName;
    v3->_mediaAccessoryName = (NSString *)&stru_1EA741FF8;

    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v7 = objc_claimAutoreleasedReturnValue();
    icons = v3->_icons;
    v3->_icons = (NSMutableArray *)v7;

    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v9 = objc_claimAutoreleasedReturnValue();
    iconDescriptors = v3->_iconDescriptors;
    v3->_iconDescriptors = (NSMutableArray *)v9;

    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v11 = objc_claimAutoreleasedReturnValue();
    iconCounter = v3->_iconCounter;
    v3->_iconCounter = (NSMutableDictionary *)v11;

    v3->_needsIconSort = 0;
  }
  return v3;
}

- (BOOL)hasUniqueServiceGroup
{
  void *v2;
  BOOL v3;

  -[HFTriggerActionsSetsUISummary uniqueServiceGroupName](self, "uniqueServiceGroupName");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2 != 0;

  return v3;
}

- (unint64_t)totalStandaloneAndMediaAccessoriesCount
{
  unint64_t v3;

  v3 = -[HFTriggerActionsSetsUISummary numberOfStandaloneServices](self, "numberOfStandaloneServices");
  return -[HFTriggerActionsSetsUISummary numberOfMediaAccessories](self, "numberOfMediaAccessories") + v3;
}

- (id)summaryText
{
  return -[HFTriggerActionsSetsUISummary summaryText:](self, "summaryText:", 1);
}

- (id)summaryText:(BOOL)a3
{
  void *v4;
  void *v5;
  void *v6;
  __CFString *v7;
  uint64_t v8;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;

  if (!a3)
  {
    v7 = CFSTR("HFTriggerDescriptionDisabled");
    goto LABEL_5;
  }
  -[HFTriggerActionsSetsUISummary summaryDescription](self, "summaryDescription");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v4)
  {
    if (-[HFTriggerActionsSetsUISummary numberOfScenes](self, "numberOfScenes")
      || -[HFTriggerActionsSetsUISummary totalStandaloneAndMediaAccessoriesCount](self, "totalStandaloneAndMediaAccessoriesCount"))
    {
      if (-[HFTriggerActionsSetsUISummary totalStandaloneAndMediaAccessoriesCount](self, "totalStandaloneAndMediaAccessoriesCount"))
      {
        if (-[HFTriggerActionsSetsUISummary numberOfScenes](self, "numberOfScenes"))
        {
          v10 = -[HFTriggerActionsSetsUISummary totalStandaloneAndMediaAccessoriesCount](self, "totalStandaloneAndMediaAccessoriesCount");
          -[HFTriggerActionsSetsUISummary numberOfScenes](self, "numberOfScenes");
          HFLocalizedStringWithFormat(CFSTR("HFTriggerDescriptionManyScenesManyServices"), CFSTR("%lu%lu"), v11, v12, v13, v14, v15, v16, v10);
        }
        else
        {
          -[HFTriggerActionsSetsUISummary _descriptionForZeroScenes](self, "_descriptionForZeroScenes");
        }
        v8 = objc_claimAutoreleasedReturnValue();
      }
      else
      {
        -[HFTriggerActionsSetsUISummary _descriptionForZeroAccessories](self, "_descriptionForZeroAccessories");
        v8 = objc_claimAutoreleasedReturnValue();
      }
      goto LABEL_6;
    }
    v7 = CFSTR("HFTriggerDescriptionNoActions");
LABEL_5:
    _HFLocalizedStringWithDefaultValue(v7, v7, 1);
    v8 = objc_claimAutoreleasedReturnValue();
LABEL_6:
    v6 = (void *)v8;
    return v6;
  }
  -[HFTriggerActionsSetsUISummary summaryDescription](self, "summaryDescription");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v5, "copy");

  return v6;
}

- (id)_descriptionForZeroAccessories
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  if (-[HFTriggerActionsSetsUISummary numberOfScenes](self, "numberOfScenes") == 1)
  {
    -[HFTriggerActionsSetsUISummary firstSceneName](self, "firstSceneName");
  }
  else
  {
    v3 = -[HFTriggerActionsSetsUISummary numberOfScenes](self, "numberOfScenes");
    HFLocalizedStringWithFormat(CFSTR("HFTriggerDescriptionManyScenesZeroServices"), CFSTR("%lu"), v4, v5, v6, v7, v8, v9, v3);
  }
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)_descriptionForZeroScenes
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  if (-[HFTriggerActionsSetsUISummary numberOfStandaloneServices](self, "numberOfStandaloneServices") == 1
    && !-[HFTriggerActionsSetsUISummary numberOfMediaAccessories](self, "numberOfMediaAccessories"))
  {
    -[HFTriggerActionsSetsUISummary firstServiceName](self, "firstServiceName");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else if (-[HFTriggerActionsSetsUISummary numberOfStandaloneServices](self, "numberOfStandaloneServices")
         || -[HFTriggerActionsSetsUISummary numberOfMediaAccessories](self, "numberOfMediaAccessories") != 1)
  {
    if (-[HFTriggerActionsSetsUISummary hasUniqueServiceGroup](self, "hasUniqueServiceGroup")
      && !-[HFTriggerActionsSetsUISummary numberOfMediaAccessories](self, "numberOfMediaAccessories"))
    {
      -[HFTriggerActionsSetsUISummary uniqueServiceGroupName](self, "uniqueServiceGroupName");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v4 = -[HFTriggerActionsSetsUISummary totalStandaloneAndMediaAccessoriesCount](self, "totalStandaloneAndMediaAccessoriesCount");
      HFLocalizedStringWithFormat(CFSTR("HFTriggerDescriptionZeroScenesManyServices"), CFSTR("%lu"), v5, v6, v7, v8, v9, v10, v4);
      v3 = (void *)objc_claimAutoreleasedReturnValue();
    }
  }
  else
  {
    -[HFTriggerActionsSetsUISummary mediaAccessoryName](self, "mediaAccessoryName");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v3;
}

- (id)summaryIcons
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  -[HFTriggerActionsSetsUISummary summaryIconDescriptors](self, "summaryIconDescriptors", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v12;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v12 != v7)
          objc_enumerationMutation(v4);
        objc_msgSend(*(id *)(*((_QWORD *)&v11 + 1) + 8 * v8), "identifier");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v3, "addObject:", v9);

        ++v8;
      }
      while (v6 != v8);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v6);
  }

  return v3;
}

- (id)summaryIconDescriptors
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  -[HFTriggerActionsSetsUISummary summaryDescriptors](self, "summaryDescriptors");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[HFTriggerActionsSetsUISummary summaryDescriptors](self, "summaryDescriptors");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    if (-[HFTriggerActionsSetsUISummary needsIconSort](self, "needsIconSort"))
      -[HFTriggerActionsSetsUISummary _sortIconDescriptors](self, "_sortIconDescriptors");
    -[HFTriggerActionsSetsUISummary iconDescriptors](self, "iconDescriptors");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v5 = v4;
  v6 = (void *)objc_msgSend(v4, "copy");

  return v6;
}

- (unint64_t)numberOfIcons
{
  void *v2;
  unint64_t v3;

  -[HFTriggerActionsSetsUISummary iconDescriptors](self, "iconDescriptors");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "count");

  return v3;
}

- (void)addSceneNamed:(id)a3
{
  void *v4;
  id v5;

  v5 = a3;
  if (!-[HFTriggerActionsSetsUISummary numberOfScenes](self, "numberOfScenes"))
  {
    v4 = (void *)objc_msgSend(v5, "copy");
    -[HFTriggerActionsSetsUISummary setFirstSceneName:](self, "setFirstSceneName:", v4);

  }
  -[HFTriggerActionsSetsUISummary setNumberOfScenes:](self, "setNumberOfScenes:", -[HFTriggerActionsSetsUISummary numberOfScenes](self, "numberOfScenes") + 1);

}

- (void)addServiceNamed:(id)a3
{
  void *v4;
  id v5;

  v5 = a3;
  if (!-[HFTriggerActionsSetsUISummary numberOfStandaloneServices](self, "numberOfStandaloneServices"))
  {
    v4 = (void *)objc_msgSend(v5, "copy");
    -[HFTriggerActionsSetsUISummary setFirstServiceName:](self, "setFirstServiceName:", v4);

  }
  -[HFTriggerActionsSetsUISummary setNumberOfStandaloneServices:](self, "setNumberOfStandaloneServices:", -[HFTriggerActionsSetsUISummary numberOfStandaloneServices](self, "numberOfStandaloneServices") + 1);

}

- (void)addIconDescriptor:(id)a3
{
  void *v4;
  char v5;
  void *v6;
  id v7;

  v7 = a3;
  -[HFTriggerActionsSetsUISummary iconDescriptors](self, "iconDescriptors");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "containsObject:", v7);

  if ((v5 & 1) == 0)
  {
    -[HFTriggerActionsSetsUISummary iconDescriptors](self, "iconDescriptors");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "addObject:", v7);

  }
  -[HFTriggerActionsSetsUISummary _incrementIconCounter:](self, "_incrementIconCounter:", v7);
  -[HFTriggerActionsSetsUISummary setNeedsIconSort:](self, "setNeedsIconSort:", 1);

}

- (void)_incrementIconCounter:(id)a3
{
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  id v9;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", objc_msgSend(a3, "hash"));
  v9 = (id)objc_claimAutoreleasedReturnValue();
  -[HFTriggerActionsSetsUISummary iconCounter](self, "iconCounter");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", v9);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
    v6 = objc_msgSend(v5, "integerValue") + 1;
  else
    v6 = 1;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[HFTriggerActionsSetsUISummary iconCounter](self, "iconCounter");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setObject:forKeyedSubscript:", v7, v9);

}

- (void)_sortIconDescriptors
{
  void *v3;
  _QWORD v4[5];

  if (-[HFTriggerActionsSetsUISummary needsIconSort](self, "needsIconSort"))
  {
    -[HFTriggerActionsSetsUISummary iconDescriptors](self, "iconDescriptors");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4[0] = MEMORY[0x1E0C809B0];
    v4[1] = 3221225472;
    v4[2] = __53__HFTriggerActionsSetsUISummary__sortIconDescriptors__block_invoke;
    v4[3] = &unk_1EA73C970;
    v4[4] = self;
    objc_msgSend(v3, "sortUsingComparator:", v4);

    -[HFTriggerActionsSetsUISummary setNeedsIconSort:](self, "setNeedsIconSort:", 0);
  }
}

uint64_t __53__HFTriggerActionsSetsUISummary__sortIconDescriptors__block_invoke(uint64_t a1, void *a2, void *a3)
{
  void *v5;
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;

  v5 = (void *)MEMORY[0x1E0CB37E8];
  v6 = a3;
  objc_msgSend(v5, "numberWithInteger:", objc_msgSend(a2, "hash"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)MEMORY[0x1E0CB37E8];
  v9 = objc_msgSend(v6, "hash");

  objc_msgSend(v8, "numberWithInteger:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "iconCounter");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "objectForKeyedSubscript:", v7);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(a1 + 32), "iconCounter");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "objectForKeyedSubscript:", v10);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v12
    || !v14
    || ((v15 = objc_msgSend(v12, "integerValue"), v16 = objc_msgSend(v14, "integerValue"), v15 > v16)
      ? (v17 = -1)
      : (v17 = 1),
        v16 == v15))
  {
    v17 = objc_msgSend(v7, "compare:", v10);
  }

  return v17;
}

- (void)addMediaAccessoryNamed:(id)a3
{
  void *v4;
  id v5;

  v5 = a3;
  if (!-[HFTriggerActionsSetsUISummary numberOfMediaAccessories](self, "numberOfMediaAccessories"))
  {
    v4 = (void *)objc_msgSend(v5, "copy");
    -[HFTriggerActionsSetsUISummary setMediaAccessoryName:](self, "setMediaAccessoryName:", v4);

  }
  -[HFTriggerActionsSetsUISummary setNumberOfMediaAccessories:](self, "setNumberOfMediaAccessories:", -[HFTriggerActionsSetsUISummary numberOfMediaAccessories](self, "numberOfMediaAccessories") + 1);

}

- (NSString)uniqueServiceGroupName
{
  return self->_uniqueServiceGroupName;
}

- (void)setUniqueServiceGroupName:(id)a3
{
  objc_storeStrong((id *)&self->_uniqueServiceGroupName, a3);
}

- (unint64_t)numberOfScenes
{
  return self->_numberOfScenes;
}

- (void)setNumberOfScenes:(unint64_t)a3
{
  self->_numberOfScenes = a3;
}

- (unint64_t)numberOfStandaloneServices
{
  return self->_numberOfStandaloneServices;
}

- (void)setNumberOfStandaloneServices:(unint64_t)a3
{
  self->_numberOfStandaloneServices = a3;
}

- (unint64_t)numberOfMediaAccessories
{
  return self->_numberOfMediaAccessories;
}

- (void)setNumberOfMediaAccessories:(unint64_t)a3
{
  self->_numberOfMediaAccessories = a3;
}

- (void)setTotalStandaloneAndMediaAccessoriesCount:(unint64_t)a3
{
  self->_totalStandaloneAndMediaAccessoriesCount = a3;
}

- (NSString)firstSceneName
{
  return self->_firstSceneName;
}

- (void)setFirstSceneName:(id)a3
{
  objc_storeStrong((id *)&self->_firstSceneName, a3);
}

- (NSString)firstServiceName
{
  return self->_firstServiceName;
}

- (void)setFirstServiceName:(id)a3
{
  objc_storeStrong((id *)&self->_firstServiceName, a3);
}

- (NSString)mediaAccessoryName
{
  return self->_mediaAccessoryName;
}

- (void)setMediaAccessoryName:(id)a3
{
  objc_storeStrong((id *)&self->_mediaAccessoryName, a3);
}

- (NSMutableArray)icons
{
  return self->_icons;
}

- (void)setIcons:(id)a3
{
  objc_storeStrong((id *)&self->_icons, a3);
}

- (NSMutableArray)iconDescriptors
{
  return self->_iconDescriptors;
}

- (void)setIconDescriptors:(id)a3
{
  objc_storeStrong((id *)&self->_iconDescriptors, a3);
}

- (NSMutableDictionary)iconCounter
{
  return self->_iconCounter;
}

- (void)setIconCounter:(id)a3
{
  objc_storeStrong((id *)&self->_iconCounter, a3);
}

- (NSString)summaryDescription
{
  return self->_summaryDescription;
}

- (NSArray)summaryDescriptors
{
  return self->_summaryDescriptors;
}

- (BOOL)needsIconSort
{
  return self->_needsIconSort;
}

- (void)setNeedsIconSort:(BOOL)a3
{
  self->_needsIconSort = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_summaryDescriptors, 0);
  objc_storeStrong((id *)&self->_summaryDescription, 0);
  objc_storeStrong((id *)&self->_iconCounter, 0);
  objc_storeStrong((id *)&self->_iconDescriptors, 0);
  objc_storeStrong((id *)&self->_icons, 0);
  objc_storeStrong((id *)&self->_mediaAccessoryName, 0);
  objc_storeStrong((id *)&self->_firstServiceName, 0);
  objc_storeStrong((id *)&self->_firstSceneName, 0);
  objc_storeStrong((id *)&self->_uniqueServiceGroupName, 0);
}

@end
