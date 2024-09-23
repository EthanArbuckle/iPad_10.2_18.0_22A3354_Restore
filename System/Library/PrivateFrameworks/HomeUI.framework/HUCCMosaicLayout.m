@implementation HUCCMosaicLayout

- (HUCCMosaicLayout)initWithLayoutType:(unint64_t)a3
{
  HUCCMosaicLayout *v4;
  HUCCMosaicLayout *v5;
  NSString *layoutDescription;
  const __CFString *v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)HUCCMosaicLayout;
  v4 = -[HUCCMosaicLayout init](&v9, sel_init);
  v5 = v4;
  if (v4)
  {
    v4->_layoutType = a3;
    switch(a3)
    {
      case 1uLL:
        v4->_scenesNeeded = 0;
        v4->_accessoriesNeeded = 0;
        v4->_priority = 1;
        goto LABEL_5;
      case 2uLL:
        v4->_accessoriesNeeded = 4;
        *(_OWORD *)&v4->_priority = xmmword_1B9441E10;
        layoutDescription = v4->_layoutDescription;
        v7 = CFSTR("HUCCLayoutPortraitOneSceneFourAccessories");
        break;
      case 3uLL:
        v4->_accessoriesNeeded = 2;
        *(int64x2_t *)&v4->_priority = vdupq_n_s64(2uLL);
        layoutDescription = v4->_layoutDescription;
        v7 = CFSTR("HUCCLayoutPortraitTwoScenesTwoAccessories");
        break;
      case 4uLL:
        v4->_accessoriesNeeded = 6;
        *(_OWORD *)&v4->_priority = xmmword_1B943DC60;
        layoutDescription = v4->_layoutDescription;
        v7 = CFSTR("HUCCLayoutPortraitSixAccessories");
        break;
      case 5uLL:
        v4->_accessoriesNeeded = 0;
        *(_OWORD *)&v4->_priority = xmmword_1B9441E20;
        layoutDescription = v4->_layoutDescription;
        v7 = CFSTR("HUCCLayoutPortraitThreeScenes");
        break;
      case 6uLL:
        v4->_scenesNeeded = 0;
        v4->_accessoriesNeeded = 0;
        v4->_priority = 1;
        layoutDescription = v4->_layoutDescription;
        v7 = CFSTR("HUCCLayoutLandscapeHomeOnly");
        break;
      case 7uLL:
        v4->_accessoriesNeeded = 0;
        *(int64x2_t *)&v4->_priority = vdupq_n_s64(2uLL);
        layoutDescription = v4->_layoutDescription;
        v7 = CFSTR("HUCCLayoutLandscapeTwoScenes");
        break;
      case 8uLL:
        v4->_accessoriesNeeded = 4;
        *(_OWORD *)&v4->_priority = xmmword_1B943DC60;
        layoutDescription = v4->_layoutDescription;
        v7 = CFSTR("HUCCLayoutLandscapeFourAccessories");
        break;
      case 9uLL:
        v4->_accessoriesNeeded = 2;
        *(_OWORD *)&v4->_priority = xmmword_1B9441E10;
        layoutDescription = v4->_layoutDescription;
        v7 = CFSTR("HUCCLayoutLandscapeOneSceneTwoAccessories");
        break;
      default:
        NSLog(CFSTR("Unknown Grid Layout type %lu"), a3);
        v5->_scenesNeeded = 0;
        v5->_accessoriesNeeded = 0;
        *(int64x2_t *)&v5->_layoutType = vdupq_n_s64(1uLL);
LABEL_5:
        layoutDescription = v5->_layoutDescription;
        v7 = CFSTR("HUCCLayoutPortraitHomeOnly");
        break;
    }
    v5->_layoutDescription = &v7->isa;

    v5->_numberOfFilledItems = v5->_accessoriesNeeded + v5->_scenesNeeded;
    v5->_numberOfMisses = 0;
  }
  return v5;
}

- (id)description
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)MEMORY[0x1E0CB3940];
  -[HUCCMosaicLayout layoutDescription](self, "layoutDescription");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stringWithFormat:", CFSTR("HUCCMosaicLayout - %@"), v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (NSMutableArray)scenes
{
  NSMutableArray *scenes;
  NSMutableArray *v4;
  NSMutableArray *v5;

  scenes = self->_scenes;
  if (!scenes)
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v4 = (NSMutableArray *)objc_claimAutoreleasedReturnValue();
    v5 = self->_scenes;
    self->_scenes = v4;

    scenes = self->_scenes;
  }
  return scenes;
}

- (NSMutableArray)accessories
{
  NSMutableArray *accessories;
  NSMutableArray *v4;
  NSMutableArray *v5;

  accessories = self->_accessories;
  if (!accessories)
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v4 = (NSMutableArray *)objc_claimAutoreleasedReturnValue();
    v5 = self->_accessories;
    self->_accessories = v4;

    accessories = self->_accessories;
  }
  return accessories;
}

- (NSMutableArray)fillers
{
  NSMutableArray *fillers;
  NSMutableArray *v4;
  NSMutableArray *v5;

  fillers = self->_fillers;
  if (!fillers)
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v4 = (NSMutableArray *)objc_claimAutoreleasedReturnValue();
    v5 = self->_fillers;
    self->_fillers = v4;

    fillers = self->_fillers;
  }
  return fillers;
}

- (void)addItem:(id)a3
{
  id v4;

  v4 = a3;
  switch(objc_msgSend(v4, "itemType"))
  {
    case 0:
      -[HUCCMosaicLayout setHomeItem:](self, "setHomeItem:", v4);
      break;
    case 1:
      -[HUCCMosaicLayout _addSceneItem:](self, "_addSceneItem:", v4);
      break;
    case 2:
      -[HUCCMosaicLayout _addAccessoryItem:](self, "_addAccessoryItem:", v4);
      break;
    case 3:
      -[HUCCMosaicLayout _addFillerItem:](self, "_addFillerItem:", v4);
      break;
    default:
      break;
  }

}

- (void)_addSceneItem:(id)a3
{
  void *v4;
  id v5;

  v5 = a3;
  if (-[HUCCMosaicLayout scenesNeeded](self, "scenesNeeded"))
  {
    -[HUCCMosaicLayout scenes](self, "scenes");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "addObject:", v5);

    -[HUCCMosaicLayout setScenesNeeded:](self, "setScenesNeeded:", -[HUCCMosaicLayout scenesNeeded](self, "scenesNeeded") - 1);
  }
  else
  {
    -[HUCCMosaicLayout _registerPossibleMiss](self, "_registerPossibleMiss");
  }

}

- (void)_addAccessoryItem:(id)a3
{
  void *v4;
  id v5;

  v5 = a3;
  if (-[HUCCMosaicLayout accessoriesNeeded](self, "accessoriesNeeded"))
  {
    -[HUCCMosaicLayout accessories](self, "accessories");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "addObject:", v5);

    -[HUCCMosaicLayout setAccessoriesNeeded:](self, "setAccessoriesNeeded:", -[HUCCMosaicLayout accessoriesNeeded](self, "accessoriesNeeded") - 1);
  }
  else
  {
    -[HUCCMosaicLayout _registerPossibleMiss](self, "_registerPossibleMiss");
  }

}

- (void)_addFillerItem:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  -[HUCCMosaicLayout fillers](self, "fillers");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addObject:", v4);

  -[HUCCMosaicLayout setAccessoriesNeeded:](self, "setAccessoriesNeeded:", -[HUCCMosaicLayout accessoriesNeeded](self, "accessoriesNeeded") - 1);
}

- (void)_registerPossibleMiss
{
  if (!-[HUCCMosaicLayout isComplete](self, "isComplete"))
    -[HUCCMosaicLayout setNumberOfMisses:](self, "setNumberOfMisses:", -[HUCCMosaicLayout numberOfMisses](self, "numberOfMisses") + 1);
}

- (BOOL)isComplete
{
  void *v3;
  BOOL v4;

  -[HUCCMosaicLayout homeItem](self, "homeItem");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3
    && !-[HUCCMosaicLayout scenesNeeded](self, "scenesNeeded")
    && -[HUCCMosaicLayout accessoriesNeeded](self, "accessoriesNeeded") == 0;

  return v4;
}

- (void)_sizeAllItems
{
  unint64_t v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  unint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  unint64_t v18;
  void *v19;
  uint64_t v20;
  unint64_t v21;
  void *v22;
  void *v23;
  void *v24;
  unint64_t v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  _BYTE v30[128];
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v3 = -[HUCCMosaicLayout layoutType](self, "layoutType");
  if (v3 == 6)
  {
    -[HUCCMosaicLayout homeItem](self, "homeItem");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = v4;
    v6 = 4;
  }
  else if (v3 == 1)
  {
    -[HUCCMosaicLayout homeItem](self, "homeItem");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = v4;
    v6 = 3;
  }
  else
  {
    -[HUCCMosaicLayout homeItem](self, "homeItem");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = v4;
    v6 = 2;
  }
  objc_msgSend(v4, "setItemSize:", v6);

  v28 = 0u;
  v29 = 0u;
  v26 = 0u;
  v27 = 0u;
  -[HUCCMosaicLayout scenes](self, "scenes", 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v26, v30, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v27;
    do
    {
      v11 = 0;
      do
      {
        if (*(_QWORD *)v27 != v10)
          objc_enumerationMutation(v7);
        objc_msgSend(*(id *)(*((_QWORD *)&v26 + 1) + 8 * v11++), "setItemSize:", 2);
      }
      while (v9 != v11);
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v26, v30, 16);
    }
    while (v9);
  }

  -[HUCCMosaicLayout accessories](self, "accessories");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "count");

  if (v13)
  {
    v14 = 0;
    do
    {
      -[HUCCMosaicLayout accessories](self, "accessories");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "objectAtIndexedSubscript:", v14);
      v16 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v16, "setItemSize:", 1);
      ++v14;
      -[HUCCMosaicLayout accessories](self, "accessories");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = objc_msgSend(v17, "count");

    }
    while (v14 < v18);
  }
  -[HUCCMosaicLayout fillers](self, "fillers");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = objc_msgSend(v19, "count");

  if (v20)
  {
    v21 = 0;
    do
    {
      -[HUCCMosaicLayout fillers](self, "fillers");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "objectAtIndexedSubscript:", v21);
      v23 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v23, "setItemSize:", 1);
      ++v21;
      -[HUCCMosaicLayout fillers](self, "fillers");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      v25 = objc_msgSend(v24, "count");

    }
    while (v21 < v25);
  }
}

- (NSArray)arrangedItems
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  -[HUCCMosaicLayout _sizeAllItems](self, "_sizeAllItems");
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUCCMosaicLayout homeItem](self, "homeItem");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "na_safeAddObject:", v4);

  -[HUCCMosaicLayout scenes](self, "scenes");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "na_safeAddObjectsFromArray:", v5);

  -[HUCCMosaicLayout accessories](self, "accessories");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "na_safeAddObjectsFromArray:", v6);

  -[HUCCMosaicLayout fillers](self, "fillers");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "na_safeAddObjectsFromArray:", v7);

  return (NSArray *)v3;
}

+ (id)sortDescriptors
{
  void *v2;
  void *v3;
  void *v4;
  _QWORD v6[3];

  v6[2] = *MEMORY[0x1E0C80C00];
  v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3928]), "initWithKey:ascending:comparator:", 0, 0, &__block_literal_global_5);
  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3928]), "initWithKey:ascending:comparator:", 0, 0, &__block_literal_global_24);
  v6[0] = v2;
  v6[1] = v3;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v6, 2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

uint64_t __35__HUCCMosaicLayout_sortDescriptors__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4;
  id v5;
  unint64_t v6;
  uint64_t v7;
  unint64_t v8;

  v4 = a2;
  v5 = a3;
  v6 = objc_msgSend(v4, "numberOfFilledItems");
  if (v6 >= objc_msgSend(v5, "numberOfFilledItems"))
  {
    v8 = objc_msgSend(v4, "numberOfFilledItems");
    v7 = v8 > objc_msgSend(v5, "numberOfFilledItems");
  }
  else
  {
    v7 = -1;
  }

  return v7;
}

uint64_t __35__HUCCMosaicLayout_sortDescriptors__block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v4;
  id v5;
  unint64_t v6;
  uint64_t v7;
  unint64_t v8;

  v4 = a2;
  v5 = a3;
  v6 = objc_msgSend(v4, "numberOfMisses");
  if (v6 >= objc_msgSend(v5, "numberOfMisses"))
  {
    v8 = objc_msgSend(v4, "numberOfMisses");
    if (v8 <= objc_msgSend(v5, "numberOfMisses"))
      v7 = 0;
    else
      v7 = -1;
  }
  else
  {
    v7 = 1;
  }

  return v7;
}

+ (id)allPortraitLayouts
{
  void *v2;
  HUCCMosaicLayout *v3;
  HUCCMosaicLayout *v4;
  HUCCMosaicLayout *v5;
  HUCCMosaicLayout *v6;
  HUCCMosaicLayout *v7;

  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = -[HUCCMosaicLayout initWithLayoutType:]([HUCCMosaicLayout alloc], "initWithLayoutType:", 4);
  objc_msgSend(v2, "addObject:", v3);

  v4 = -[HUCCMosaicLayout initWithLayoutType:]([HUCCMosaicLayout alloc], "initWithLayoutType:", 2);
  objc_msgSend(v2, "addObject:", v4);

  v5 = -[HUCCMosaicLayout initWithLayoutType:]([HUCCMosaicLayout alloc], "initWithLayoutType:", 3);
  objc_msgSend(v2, "addObject:", v5);

  v6 = -[HUCCMosaicLayout initWithLayoutType:]([HUCCMosaicLayout alloc], "initWithLayoutType:", 5);
  objc_msgSend(v2, "addObject:", v6);

  v7 = -[HUCCMosaicLayout initWithLayoutType:]([HUCCMosaicLayout alloc], "initWithLayoutType:", 1);
  objc_msgSend(v2, "addObject:", v7);

  return v2;
}

+ (unint64_t)maxItemsNeededForPortrait
{
  return 7;
}

+ (id)allLandscapeLayouts
{
  void *v2;
  HUCCMosaicLayout *v3;
  HUCCMosaicLayout *v4;
  HUCCMosaicLayout *v5;
  HUCCMosaicLayout *v6;

  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = -[HUCCMosaicLayout initWithLayoutType:]([HUCCMosaicLayout alloc], "initWithLayoutType:", 7);
  objc_msgSend(v2, "addObject:", v3);

  v4 = -[HUCCMosaicLayout initWithLayoutType:]([HUCCMosaicLayout alloc], "initWithLayoutType:", 8);
  objc_msgSend(v2, "addObject:", v4);

  v5 = -[HUCCMosaicLayout initWithLayoutType:]([HUCCMosaicLayout alloc], "initWithLayoutType:", 9);
  objc_msgSend(v2, "addObject:", v5);

  v6 = -[HUCCMosaicLayout initWithLayoutType:]([HUCCMosaicLayout alloc], "initWithLayoutType:", 6);
  objc_msgSend(v2, "addObject:", v6);

  return v2;
}

+ (unint64_t)maxItemsNeededForLandscape
{
  return 5;
}

- (unint64_t)layoutType
{
  return self->_layoutType;
}

- (unint64_t)priority
{
  return self->_priority;
}

- (unint64_t)scenesNeeded
{
  return self->_scenesNeeded;
}

- (void)setScenesNeeded:(unint64_t)a3
{
  self->_scenesNeeded = a3;
}

- (unint64_t)accessoriesNeeded
{
  return self->_accessoriesNeeded;
}

- (void)setAccessoriesNeeded:(unint64_t)a3
{
  self->_accessoriesNeeded = a3;
}

- (unint64_t)numberOfFilledItems
{
  return self->_numberOfFilledItems;
}

- (unint64_t)numberOfMisses
{
  return self->_numberOfMisses;
}

- (void)setNumberOfMisses:(unint64_t)a3
{
  self->_numberOfMisses = a3;
}

- (HUCCMosaicOrderable)homeItem
{
  return self->_homeItem;
}

- (void)setHomeItem:(id)a3
{
  objc_storeStrong((id *)&self->_homeItem, a3);
}

- (void)setScenes:(id)a3
{
  objc_storeStrong((id *)&self->_scenes, a3);
}

- (void)setAccessories:(id)a3
{
  objc_storeStrong((id *)&self->_accessories, a3);
}

- (void)setFillers:(id)a3
{
  objc_storeStrong((id *)&self->_fillers, a3);
}

- (NSString)layoutDescription
{
  return self->_layoutDescription;
}

- (void)setLayoutDescription:(id)a3
{
  objc_storeStrong((id *)&self->_layoutDescription, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_layoutDescription, 0);
  objc_storeStrong((id *)&self->_fillers, 0);
  objc_storeStrong((id *)&self->_accessories, 0);
  objc_storeStrong((id *)&self->_scenes, 0);
  objc_storeStrong((id *)&self->_homeItem, 0);
}

@end
