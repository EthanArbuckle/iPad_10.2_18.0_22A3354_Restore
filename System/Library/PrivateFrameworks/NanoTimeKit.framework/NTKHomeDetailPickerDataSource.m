@implementation NTKHomeDetailPickerDataSource

- (NTKHomeDetailPickerDataSource)initWithTableView:(id)a3 detailConfiguration:(id)a4 homeListItem:(id)a5
{
  id v9;
  id v10;
  id v11;
  NTKHomeDetailPickerDataSource *v12;
  NTKHomeDetailPickerDataSource *v13;
  void *v14;
  void *v15;
  NTKCFaceDetailComplicationCellProvider *v16;
  NTKCFaceDetailComplicationCellProvider *pickerCellProvider;
  objc_super v19;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v19.receiver = self;
  v19.super_class = (Class)NTKHomeDetailPickerDataSource;
  v12 = -[NTKHomeDetailPickerDataSource init](&v19, sel_init);
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_tableView, a3);
    objc_storeStrong((id *)&v13->_configuration, a4);
    objc_storeStrong((id *)&v13->_homeListItem, a5);
    -[NTKHomeDetailPickerDataSource _refreshHomeDetail](v13, "_refreshHomeDetail");
    objc_msgSend(MEMORY[0x1E0D31430], "sharedDispatcher");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "addHomeManagerObserver:", v13);

    objc_msgSend(v10, "listProvider");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = -[NTKCFaceDetailComplicationCellProvider initWithTableView:listProvider:]([NTKCFaceDetailComplicationCellProvider alloc], "initWithTableView:listProvider:", v9, v15);
    pickerCellProvider = v13->_pickerCellProvider;
    v13->_pickerCellProvider = v16;

  }
  return v13;
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  objc_msgSend(MEMORY[0x1E0D31430], "sharedDispatcher");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeHomeManagerObserver:", self);

  v4.receiver = self;
  v4.super_class = (Class)NTKHomeDetailPickerDataSource;
  -[NTKHomeDetailPickerDataSource dealloc](&v4, sel_dealloc);
}

- (id)pickerItemForIndexPath:(id)a3
{
  void *v3;
  id v5;
  int64_t v6;
  NSArray *scenesItems;
  uint64_t v8;

  v5 = a3;
  v6 = -[NTKHomeDetailPickerDataSource _sectionTypeForSectionIndex:](self, "_sectionTypeForSectionIndex:", objc_msgSend(v5, "section"));
  switch(v6)
  {
    case 2:
      -[NTKHomeDetailPickerDataSource _accessoryComplicationAtIndexPath:](self, "_accessoryComplicationAtIndexPath:", v5);
      v8 = objc_claimAutoreleasedReturnValue();
LABEL_8:
      v3 = (void *)v8;
      break;
    case 1:
      scenesItems = self->_scenesItems;
      goto LABEL_7;
    case 0:
      scenesItems = self->_energyItems;
LABEL_7:
      -[NSArray objectAtIndexedSubscript:](scenesItems, "objectAtIndexedSubscript:", objc_msgSend(v5, "row"));
      v8 = objc_claimAutoreleasedReturnValue();
      goto LABEL_8;
  }

  return v3;
}

- (int64_t)_numberOfItemsInSection:(int64_t)a3
{
  int64_t result;
  NSArray *scenesItems;

  result = -[NTKHomeDetailPickerDataSource _sectionTypeForSectionIndex:](self, "_sectionTypeForSectionIndex:");
  if (result == 2)
    return -[NTKHomeDetailPickerDataSource _numberOfAccessoriesAtRoomInSection:](self, "_numberOfAccessoriesAtRoomInSection:", a3);
  if (result == 1)
  {
    scenesItems = self->_scenesItems;
  }
  else
  {
    if (result)
      return result;
    scenesItems = self->_energyItems;
  }
  return -[NSArray count](scenesItems, "count");
}

- (int64_t)_totalSectionCount
{
  uint64_t v3;
  _BOOL4 v4;
  uint64_t v5;

  LODWORD(v3) = -[NTKHomeDetailPickerDataSource _energySectionIsDisplayable](self, "_energySectionIsDisplayable");
  v4 = -[NTKHomeDetailPickerDataSource _scenesSectionIsDisplayable](self, "_scenesSectionIsDisplayable");
  v5 = 1;
  if ((_DWORD)v3)
    v5 = 2;
  if (v4)
    v3 = v5;
  else
    v3 = v3;
  return -[NSArray count](self->_accessoryItemsByRoom, "count") + v3;
}

+ (id)_titleForHeaderSectionType:(int64_t)a3
{
  __CFString *v3;
  __CFString *v4;
  __CFString *v5;

  if (a3 == 1)
  {
    v3 = CFSTR("COMPLICATION_PICKER_NANOHOME_SCENES_SECTION_NAME");
    v4 = CFSTR("Scenes");
  }
  else
  {
    if (a3)
    {
      v5 = &stru_1E6BDC918;
      return v5;
    }
    v3 = CFSTR("COMPLICATION_PICKER_NANOHOME_ENERGY_SECTION_NAME");
    v4 = CFSTR("Energy");
  }
  NTKClockFaceLocalizedString(v3, v4);
  v5 = (__CFString *)objc_claimAutoreleasedReturnValue();
  return v5;
}

- (id)_titleForHeaderInSection:(int64_t)a3
{
  void *v5;

  v5 = -[NTKHomeDetailPickerDataSource _sectionTypeForSectionIndex:](self, "_sectionTypeForSectionIndex:");
  if ((unint64_t)v5 >= 2)
  {
    if (v5 == (void *)2)
    {
      -[NTKHomeDetailPickerDataSource _roomNameForSection:](self, "_roomNameForSection:", a3);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
    }
  }
  else
  {
    +[NTKHomeDetailPickerDataSource _titleForHeaderSectionType:](NTKHomeDetailPickerDataSource, "_titleForHeaderSectionType:", -[NTKHomeDetailPickerDataSource _sectionTypeForSectionIndex:](self, "_sectionTypeForSectionIndex:", a3));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v5;
}

- (BOOL)_itemIsSelectedAtIndexPath:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v4 = a3;
  -[NTKHomeDetailPickerDataSource configuration](self, "configuration");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "listProvider");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "pickerSelectedItem");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  -[NTKHomeDetailPickerDataSource pickerItemForIndexPath:](self, "pickerItemForIndexPath:", v4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  LOBYTE(v4) = objc_msgSend(v7, "isEqual:", v8);
  return (char)v4;
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  return -[NTKHomeDetailPickerDataSource _numberOfItemsInSection:](self, "_numberOfItemsInSection:", a4);
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  _BOOL8 v9;

  v5 = a4;
  -[NTKHomeDetailPickerDataSource pickerItemForIndexPath:](self, "pickerItemForIndexPath:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[NTKHomeDetailPickerDataSource pickerCellProvider](self, "pickerCellProvider");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "cellForItem:atIndexPath:", v6, v5);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = -[NTKHomeDetailPickerDataSource _itemIsSelectedAtIndexPath:](self, "_itemIsSelectedAtIndexPath:", v5);
  objc_msgSend(v8, "ntk_setPickerSelected:", v9);

  return v8;
}

- (id)tableView:(id)a3 titleForHeaderInSection:(int64_t)a4
{
  return -[NTKHomeDetailPickerDataSource _titleForHeaderInSection:](self, "_titleForHeaderInSection:", a4);
}

- (void)_refreshHomeDetail
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  HMHome *v10;
  NSArray *energyItems;
  NSArray *energyForecastItems;
  NSArray *electricityUsageItems;
  NSArray *electricityRatesItems;
  NSArray *v15;
  NSArray *v16;
  NSMutableArray *v17;
  HMHome *v18;
  HMHome *detailedHome;
  void *v20;
  void *v21;
  uint64_t v22;
  void *v23;
  void *v24;
  NSArray *v25;
  id v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t i;
  void *v31;
  NSArray *scenesItems;
  NSArray *v33;
  void *v34;
  NSMutableArray *v35;
  NSMutableArray *roomNames;
  void *v37;
  NSArray *v38;
  NSArray *accessoryItemsByRoom;
  NSArray *v40;
  void *v41;
  _QWORD v42[5];
  NSArray *v43;
  uint64_t v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  _QWORD v49[5];
  _BYTE v50[128];
  uint64_t v51;

  v51 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0D31430], "sharedDispatcher");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)MEMORY[0x1E0C99DE8];
  objc_msgSend(v3, "homeManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "hf_orderedHomes");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "arrayWithArray:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "home");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8
    && (v49[0] = MEMORY[0x1E0C809B0],
        v49[1] = 3221225472,
        v49[2] = __51__NTKHomeDetailPickerDataSource__refreshHomeDetail__block_invoke,
        v49[3] = &unk_1E6BD67C0,
        v49[4] = self,
        v9 = objc_msgSend(v7, "indexOfObjectPassingTest:", v49),
        v9 != 0x7FFFFFFFFFFFFFFFLL))
  {
    v41 = v3;
    objc_msgSend(v7, "objectAtIndex:", v9);
    v18 = (HMHome *)objc_claimAutoreleasedReturnValue();
    detailedHome = self->_detailedHome;
    self->_detailedHome = v18;

    -[NTKHomeDetailPickerDataSource configuration](self, "configuration");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "listProvider");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = objc_msgSend(v21, "pickerComplicationFamily");

    -[NTKHomeDetailPickerDataSource _generatePickableEnergyItemsForFamily:](self, "_generatePickableEnergyItemsForFamily:", v22);
    +[NHOIntentsUtilities pickableActionSetIntentsWithHome:](NHOIntentsUtilities, "pickableActionSetIntentsWithHome:", self->_detailedHome);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    +[NTKHomeDetailPickerDataSource _titleForHeaderSectionType:](NTKHomeDetailPickerDataSource, "_titleForHeaderSectionType:", 1);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v23, "count"));
    v25 = (NSArray *)objc_claimAutoreleasedReturnValue();
    v45 = 0u;
    v46 = 0u;
    v47 = 0u;
    v48 = 0u;
    v26 = v23;
    v27 = objc_msgSend(v26, "countByEnumeratingWithState:objects:count:", &v45, v50, 16);
    if (v27)
    {
      v28 = v27;
      v29 = *(_QWORD *)v46;
      do
      {
        for (i = 0; i != v28; ++i)
        {
          if (*(_QWORD *)v46 != v29)
            objc_enumerationMutation(v26);
          +[NTKNanoHomeWidgetItemFactory sceneWidgetItemWithSceneIntent:complicationFamily:sectionIdentifier:](_TtC11NanoTimeKit28NTKNanoHomeWidgetItemFactory, "sceneWidgetItemWithSceneIntent:complicationFamily:sectionIdentifier:", *(_QWORD *)(*((_QWORD *)&v45 + 1) + 8 * i), v22, v24);
          v31 = (void *)objc_claimAutoreleasedReturnValue();
          if (v31)
            -[NSArray addObject:](v25, "addObject:", v31);

        }
        v28 = objc_msgSend(v26, "countByEnumeratingWithState:objects:count:", &v45, v50, 16);
      }
      while (v28);
    }

    scenesItems = self->_scenesItems;
    self->_scenesItems = v25;
    v33 = v25;

    v34 = (void *)objc_opt_new();
    v35 = (NSMutableArray *)objc_opt_new();
    roomNames = self->_roomNames;
    self->_roomNames = v35;

    -[HMHome rooms](self->_detailedHome, "rooms");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    v42[0] = MEMORY[0x1E0C809B0];
    v42[1] = 3221225472;
    v42[2] = __51__NTKHomeDetailPickerDataSource__refreshHomeDetail__block_invoke_2;
    v42[3] = &unk_1E6BDC440;
    v42[4] = self;
    v44 = v22;
    v38 = v34;
    v43 = v38;
    objc_msgSend(v37, "enumerateObjectsUsingBlock:", v42);

    accessoryItemsByRoom = self->_accessoryItemsByRoom;
    self->_accessoryItemsByRoom = v38;
    v40 = v38;

    v3 = v41;
  }
  else
  {
    v10 = self->_detailedHome;
    self->_detailedHome = 0;

    energyItems = self->_energyItems;
    self->_energyItems = 0;

    energyForecastItems = self->_energyForecastItems;
    self->_energyForecastItems = 0;

    electricityUsageItems = self->_electricityUsageItems;
    self->_electricityUsageItems = 0;

    electricityRatesItems = self->_electricityRatesItems;
    self->_electricityRatesItems = 0;

    v15 = self->_scenesItems;
    self->_scenesItems = 0;

    v16 = self->_accessoryItemsByRoom;
    self->_accessoryItemsByRoom = 0;

    v17 = self->_roomNames;
    self->_roomNames = 0;

  }
  -[UITableView reloadData](self->_tableView, "reloadData");

}

uint64_t __51__NTKHomeDetailPickerDataSource__refreshHomeDetail__block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  uint64_t v5;

  objc_msgSend(a2, "uniqueIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "homeID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v3, "isEqual:", v4);

  return v5;
}

void __51__NTKHomeDetailPickerDataSource__refreshHomeDetail__block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id obj;
  void *v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  +[NHOIntentsUtilities pickableAccessoryIntentsWithHome:room:](NHOIntentsUtilities, "pickableAccessoryIntentsWithHome:room:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 16), v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "count"))
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v4, "count"));
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = 0u;
    v19 = 0u;
    v20 = 0u;
    v21 = 0u;
    v15 = v4;
    obj = v4;
    v5 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
    if (v5)
    {
      v6 = v5;
      v7 = *(_QWORD *)v19;
      do
      {
        for (i = 0; i != v6; ++i)
        {
          if (*(_QWORD *)v19 != v7)
            objc_enumerationMutation(obj);
          v9 = *(_QWORD *)(*((_QWORD *)&v18 + 1) + 8 * i);
          v10 = *(_QWORD *)(a1 + 48);
          objc_msgSend(v3, "name");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          +[NTKNanoHomeWidgetItemFactory accessoryWidgetItemWithAccessoryIntent:complicationFamily:sectionIdentifier:](_TtC11NanoTimeKit28NTKNanoHomeWidgetItemFactory, "accessoryWidgetItemWithAccessoryIntent:complicationFamily:sectionIdentifier:", v9, v10, v11);
          v12 = (void *)objc_claimAutoreleasedReturnValue();

          if (v12)
            objc_msgSend(v17, "addObject:", v12);

        }
        v6 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
      }
      while (v6);
    }

    if (objc_msgSend(v17, "count"))
    {
      objc_msgSend(*(id *)(a1 + 40), "addObject:", v17);
      v13 = *(void **)(*(_QWORD *)(a1 + 32) + 72);
      objc_msgSend(v3, "name");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "addObject:", v14);

    }
    v4 = v15;
  }

}

- (void)_generatePickableEnergyItemsForFamily:(int64_t)a3
{
  NSArray *energyItems;
  NSArray *energyForecastItems;
  NSArray *electricityUsageItems;
  NSArray *electricityRatesItems;
  void *v9;
  HMHome *detailedHome;
  uint64_t v11;
  id v12;
  HMHome *v13;
  id v14;
  HMHome *v15;
  id v16;
  _QWORD v17[4];
  id v18;
  id v19[2];
  _QWORD v20[4];
  id v21;
  id v22[2];
  _QWORD v23[4];
  id v24;
  id v25[2];
  id location[2];

  energyItems = self->_energyItems;
  self->_energyItems = 0;

  energyForecastItems = self->_energyForecastItems;
  self->_energyForecastItems = 0;

  electricityUsageItems = self->_electricityUsageItems;
  self->_electricityUsageItems = 0;

  electricityRatesItems = self->_electricityRatesItems;
  self->_electricityRatesItems = 0;

  if (self->_detailedHome)
  {
    +[NTKHomeDetailPickerDataSource _titleForHeaderSectionType:](NTKHomeDetailPickerDataSource, "_titleForHeaderSectionType:", 0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_initWeak(location, self);
    detailedHome = self->_detailedHome;
    v11 = MEMORY[0x1E0C809B0];
    v23[0] = MEMORY[0x1E0C809B0];
    v23[1] = 3221225472;
    v23[2] = __71__NTKHomeDetailPickerDataSource__generatePickableEnergyItemsForFamily___block_invoke;
    v23[3] = &unk_1E6BDC468;
    objc_copyWeak(v25, location);
    v25[1] = (id)a3;
    v12 = v9;
    v24 = v12;
    +[NHOIntentsUtilities pickableEnergyForecastIntentsWithHome:completionHandler:](NHOIntentsUtilities, "pickableEnergyForecastIntentsWithHome:completionHandler:", detailedHome, v23);
    v13 = self->_detailedHome;
    v20[0] = v11;
    v20[1] = 3221225472;
    v20[2] = __71__NTKHomeDetailPickerDataSource__generatePickableEnergyItemsForFamily___block_invoke_2;
    v20[3] = &unk_1E6BDC468;
    objc_copyWeak(v22, location);
    v22[1] = (id)a3;
    v14 = v12;
    v21 = v14;
    +[NHOIntentsUtilities pickableElectricityUsageIntentsWithHome:completionHandler:](NHOIntentsUtilities, "pickableElectricityUsageIntentsWithHome:completionHandler:", v13, v20);
    v15 = self->_detailedHome;
    v17[0] = v11;
    v17[1] = 3221225472;
    v17[2] = __71__NTKHomeDetailPickerDataSource__generatePickableEnergyItemsForFamily___block_invoke_3;
    v17[3] = &unk_1E6BDC468;
    objc_copyWeak(v19, location);
    v19[1] = (id)a3;
    v16 = v14;
    v18 = v16;
    +[NHOIntentsUtilities pickableElectricityRatesIntentsWithHome:completionHandler:](NHOIntentsUtilities, "pickableElectricityRatesIntentsWithHome:completionHandler:", v15, v17);

    objc_destroyWeak(v19);
    objc_destroyWeak(v22);

    objc_destroyWeak(v25);
    objc_destroyWeak(location);

  }
}

void __71__NTKHomeDetailPickerDataSource__generatePickableEnergyItemsForFamily___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id *WeakRetained;
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 40));
  v5 = (void *)objc_opt_new();
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v6 = v3;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v13;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v13 != v9)
          objc_enumerationMutation(v6);
        +[NTKNanoHomeWidgetItemFactory homeSpecificEnergyWidgetItemWithEnergyIntent:complicationFamily:sectionIdentifier:](_TtC11NanoTimeKit28NTKNanoHomeWidgetItemFactory, "homeSpecificEnergyWidgetItemWithEnergyIntent:complicationFamily:sectionIdentifier:", *(_QWORD *)(*((_QWORD *)&v12 + 1) + 8 * v10), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 32), (_QWORD)v12);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        if (v11)
          objc_msgSend(v5, "addObject:", v11);

        ++v10;
      }
      while (v8 != v10);
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v8);
  }

  if (WeakRetained)
  {
    objc_storeStrong(WeakRetained + 4, v5);
    objc_msgSend(WeakRetained, "_updateEnergyItems");
  }

}

void __71__NTKHomeDetailPickerDataSource__generatePickableEnergyItemsForFamily___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  id *WeakRetained;
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 40));
  v5 = (void *)objc_opt_new();
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v6 = v3;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v13;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v13 != v9)
          objc_enumerationMutation(v6);
        +[NTKNanoHomeWidgetItemFactory electricityUsageWidgetItemWithUsageIntent:complicationFamily:sectionIdentifier:](_TtC11NanoTimeKit28NTKNanoHomeWidgetItemFactory, "electricityUsageWidgetItemWithUsageIntent:complicationFamily:sectionIdentifier:", *(_QWORD *)(*((_QWORD *)&v12 + 1) + 8 * v10), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 32), (_QWORD)v12);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        if (v11)
          objc_msgSend(v5, "addObject:", v11);

        ++v10;
      }
      while (v8 != v10);
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v8);
  }

  if (WeakRetained)
  {
    objc_storeStrong(WeakRetained + 5, v5);
    objc_msgSend(WeakRetained, "_updateEnergyItems");
  }

}

void __71__NTKHomeDetailPickerDataSource__generatePickableEnergyItemsForFamily___block_invoke_3(uint64_t a1, void *a2)
{
  id v3;
  id *WeakRetained;
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 40));
  v5 = (void *)objc_opt_new();
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v6 = v3;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v13;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v13 != v9)
          objc_enumerationMutation(v6);
        +[NTKNanoHomeWidgetItemFactory electricityRatesWidgetItemWithRatesIntent:complicationFamily:sectionIdentifier:](_TtC11NanoTimeKit28NTKNanoHomeWidgetItemFactory, "electricityRatesWidgetItemWithRatesIntent:complicationFamily:sectionIdentifier:", *(_QWORD *)(*((_QWORD *)&v12 + 1) + 8 * v10), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 32), (_QWORD)v12);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        if (v11)
          objc_msgSend(v5, "addObject:", v11);

        ++v10;
      }
      while (v8 != v10);
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v8);
  }

  if (WeakRetained)
  {
    objc_storeStrong(WeakRetained + 6, v5);
    objc_msgSend(WeakRetained, "_updateEnergyItems");
  }

}

- (void)_updateEnergyItems
{
  NSArray *v3;
  NSArray *energyItems;
  id v5;

  v3 = (NSArray *)objc_opt_new();
  -[NSArray addObjectsFromArray:](v3, "addObjectsFromArray:", self->_energyForecastItems);
  -[NSArray addObjectsFromArray:](v3, "addObjectsFromArray:", self->_electricityUsageItems);
  -[NSArray addObjectsFromArray:](v3, "addObjectsFromArray:", self->_electricityRatesItems);
  energyItems = self->_energyItems;
  self->_energyItems = v3;

  -[NTKHomeDetailPickerDataSource tableView](self, "tableView");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "reloadData");

}

- (BOOL)_energySectionIsDisplayable
{
  return -[NSArray count](self->_energyItems, "count") != 0;
}

- (BOOL)_scenesSectionIsDisplayable
{
  return -[NSArray count](self->_scenesItems, "count") != 0;
}

- (int64_t)_energySectionIndex
{
  if (-[NTKHomeDetailPickerDataSource _energySectionIsDisplayable](self, "_energySectionIsDisplayable"))
    return 0;
  else
    return 0x7FFFFFFFFFFFFFFFLL;
}

- (int64_t)_scenesSectionIndex
{
  int64_t v3;
  int64_t v4;

  v3 = 0x7FFFFFFFFFFFFFFFLL;
  if (-[NTKHomeDetailPickerDataSource _scenesSectionIsDisplayable](self, "_scenesSectionIsDisplayable"))
  {
    v4 = -[NTKHomeDetailPickerDataSource _energySectionIndex](self, "_energySectionIndex");
    if (v4 == 0x7FFFFFFFFFFFFFFFLL)
      v4 = -[NTKHomeDetailPickerDataSource _energySectionIndex](self, "_energySectionIndex");
    if (v4 == 0x7FFFFFFFFFFFFFFFLL)
      return 0;
    else
      return v4 + 1;
  }
  return v3;
}

- (int64_t)_firstRoomSectionIndex
{
  int64_t v3;

  v3 = -[NTKHomeDetailPickerDataSource _scenesSectionIndex](self, "_scenesSectionIndex");
  if (v3 == 0x7FFFFFFFFFFFFFFFLL)
    v3 = -[NTKHomeDetailPickerDataSource _energySectionIndex](self, "_energySectionIndex");
  if (v3 == 0x7FFFFFFFFFFFFFFFLL)
    return 0;
  else
    return v3 + 1;
}

- (id)_roomAccessoriesIndexPathForTableIndexPath:(id)a3
{
  id v4;
  unint64_t v5;
  void *v6;
  uint64_t v7;

  v4 = a3;
  v5 = -[NTKHomeDetailPickerDataSource _roomIndexForSection:](self, "_roomIndexForSection:", objc_msgSend(v4, "section"));
  v6 = (void *)MEMORY[0x1E0CB36B0];
  v7 = objc_msgSend(v4, "row");

  return (id)objc_msgSend(v6, "indexPathForRow:inSection:", v7, v5);
}

- (int64_t)_sectionTypeForSectionIndex:(int64_t)a3
{
  if (-[NTKHomeDetailPickerDataSource _energySectionIndex](self, "_energySectionIndex") == a3)
    return 0;
  if (-[NTKHomeDetailPickerDataSource _scenesSectionIndex](self, "_scenesSectionIndex") == a3)
    return 1;
  return 2;
}

- (unint64_t)_roomIndexForSection:(int64_t)a3
{
  return a3 - -[NTKHomeDetailPickerDataSource _firstRoomSectionIndex](self, "_firstRoomSectionIndex");
}

- (id)_roomNameForSection:(int64_t)a3
{
  return (id)-[NSMutableArray objectAtIndexedSubscript:](self->_roomNames, "objectAtIndexedSubscript:", -[NTKHomeDetailPickerDataSource _roomIndexForSection:](self, "_roomIndexForSection:", a3));
}

- (id)_pickableAccessoriesAtRoomInSection:(int64_t)a3
{
  return -[NSArray objectAtIndexedSubscript:](self->_accessoryItemsByRoom, "objectAtIndexedSubscript:", -[NTKHomeDetailPickerDataSource _roomIndexForSection:](self, "_roomIndexForSection:", a3));
}

- (unint64_t)_numberOfAccessoriesAtRoomInSection:(unint64_t)a3
{
  void *v3;
  unint64_t v4;

  -[NTKHomeDetailPickerDataSource _pickableAccessoriesAtRoomInSection:](self, "_pickableAccessoriesAtRoomInSection:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "count");

  return v4;
}

- (id)_accessoryComplicationAtIndexPath:(id)a3
{
  void *v4;
  void *v5;
  void *v6;

  -[NTKHomeDetailPickerDataSource _roomAccessoriesIndexPathForTableIndexPath:](self, "_roomAccessoriesIndexPathForTableIndexPath:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSArray objectAtIndexedSubscript:](self->_accessoryItemsByRoom, "objectAtIndexedSubscript:", objc_msgSend(v4, "section"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectAtIndexedSubscript:", objc_msgSend(v4, "row"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (UITableView)tableView
{
  return self->_tableView;
}

- (NTKComplicationPickerDetailViewConfiguration)configuration
{
  return self->_configuration;
}

- (NTKCFaceDetailComplicationCellProvider)pickerCellProvider
{
  return self->_pickerCellProvider;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pickerCellProvider, 0);
  objc_storeStrong((id *)&self->_configuration, 0);
  objc_storeStrong((id *)&self->_tableView, 0);
  objc_storeStrong((id *)&self->_roomNames, 0);
  objc_storeStrong((id *)&self->_accessoryItemsByRoom, 0);
  objc_storeStrong((id *)&self->_scenesItems, 0);
  objc_storeStrong((id *)&self->_electricityRatesItems, 0);
  objc_storeStrong((id *)&self->_electricityUsageItems, 0);
  objc_storeStrong((id *)&self->_energyForecastItems, 0);
  objc_storeStrong((id *)&self->_energyItems, 0);
  objc_storeStrong((id *)&self->_detailedHome, 0);
  objc_storeStrong((id *)&self->_homeListItem, 0);
}

@end
