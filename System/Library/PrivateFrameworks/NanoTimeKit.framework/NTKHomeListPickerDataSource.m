@implementation NTKHomeListPickerDataSource

- (NTKHomeListPickerDataSource)initWithTableView:(id)a3 detailConfiguration:(id)a4
{
  id v7;
  id v8;
  NTKHomeListPickerDataSource *v9;
  NTKHomeListPickerDataSource *v10;
  void *v11;
  NTKCFaceDetailComplicationCellProvider *v12;
  NTKCFaceDetailComplicationCellProvider *pickerCellProvider;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  NSArray *upperComplicationsItems;
  void *v18;
  objc_super v20;

  v7 = a3;
  v8 = a4;
  v20.receiver = self;
  v20.super_class = (Class)NTKHomeListPickerDataSource;
  v9 = -[NTKHomeListPickerDataSource init](&v20, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_tableView, a3);
    objc_storeStrong((id *)&v10->_configuration, a4);
    objc_msgSend(v8, "listProvider");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = -[NTKCFaceDetailComplicationCellProvider initWithTableView:listProvider:]([NTKCFaceDetailComplicationCellProvider alloc], "initWithTableView:listProvider:", v7, v11);
    pickerCellProvider = v10->_pickerCellProvider;
    v10->_pickerCellProvider = v12;

    v14 = objc_msgSend(v11, "pickerComplicationFamily");
    +[NTKHomeListPickerDataSource _titleForHeaderSectionType:](NTKHomeListPickerDataSource, "_titleForHeaderSectionType:", 0);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    +[NTKHomeListPickerDataSource topLevelItemsForComplicationFamily:sectionIdentifier:](NTKHomeListPickerDataSource, "topLevelItemsForComplicationFamily:sectionIdentifier:", v14, v15);
    v16 = objc_claimAutoreleasedReturnValue();
    upperComplicationsItems = v10->_upperComplicationsItems;
    v10->_upperComplicationsItems = (NSArray *)v16;

    -[NTKHomeListPickerDataSource _refreshHomeList](v10, "_refreshHomeList");
    objc_msgSend(MEMORY[0x1E0D31430], "sharedDispatcher");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "addHomeManagerObserver:", v10);

  }
  return v10;
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  objc_msgSend(MEMORY[0x1E0D31430], "sharedDispatcher");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeHomeManagerObserver:", self);

  v4.receiver = self;
  v4.super_class = (Class)NTKHomeListPickerDataSource;
  -[NTKHomeListPickerDataSource dealloc](&v4, sel_dealloc);
}

+ (id)topLevelItemsForComplicationFamily:(int64_t)a3 sectionIdentifier:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  v5 = a4;
  v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", 3);
  if (objc_msgSend(MEMORY[0x1E0D515C0], "currentLocationEnergyForecastEnabled"))
  {
    +[NTKNanoHomeWidgetItemFactory currentLocationEnergyWidgetItemWithComplicationFamily:sectionIdentifier:](_TtC11NanoTimeKit28NTKNanoHomeWidgetItemFactory, "currentLocationEnergyWidgetItemWithComplicationFamily:sectionIdentifier:", a3, v5);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (v7)
      objc_msgSend(v6, "addObject:", v7);

  }
  +[NTKNanoHomeWidgetItemFactory smartStackWidgetItemWithComplicationFamily:sectionIdentifier:](_TtC11NanoTimeKit28NTKNanoHomeWidgetItemFactory, "smartStackWidgetItemWithComplicationFamily:sectionIdentifier:", a3, v5);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
    objc_msgSend(v6, "addObject:", v8);
  +[NTKNanoHomeWidgetItemFactory launcherWidgetItemWithComplicationFamily:sectionIdentifier:](_TtC11NanoTimeKit28NTKNanoHomeWidgetItemFactory, "launcherWidgetItemWithComplicationFamily:sectionIdentifier:", a3, v5);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (v9)
    objc_msgSend(v6, "addObject:", v9);

  return v6;
}

+ (BOOL)shouldShowTopLevelMoreButton
{
  void *v2;
  void *v3;
  void *v4;
  BOOL v5;

  objc_msgSend(MEMORY[0x1E0D31430], "sharedDispatcher");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "homeManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "homes");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "count") != 0;

  return v5;
}

- (id)pickerItemForIndexPath:(id)a3
{
  void *v3;
  id v5;
  int64_t v6;
  uint64_t v7;

  v5 = a3;
  v6 = -[NTKHomeListPickerDataSource _sectionTypeForSectionIndex:](self, "_sectionTypeForSectionIndex:", objc_msgSend(v5, "section"));
  if (!v6)
  {
    v7 = 8;
    goto LABEL_5;
  }
  if (v6 == 1)
  {
    v7 = 16;
LABEL_5:
    objc_msgSend(*(id *)((char *)&self->super.isa + v7), "objectAtIndexedSubscript:", objc_msgSend(v5, "row"));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v3;
}

- (int64_t)_numberOfItemsInSection:(int64_t)a3
{
  int64_t result;
  uint64_t v5;

  result = -[NTKHomeListPickerDataSource _sectionTypeForSectionIndex:](self, "_sectionTypeForSectionIndex:", a3);
  if (result)
  {
    if (result != 1)
      return result;
    v5 = 16;
  }
  else
  {
    v5 = 8;
  }
  return objc_msgSend(*(id *)((char *)&self->super.isa + v5), "count");
}

- (int64_t)_totalSectionCount
{
  _BOOL4 v3;
  _BOOL4 v4;
  int64_t v5;

  v3 = -[NTKHomeListPickerDataSource _upperComplicationsSectionIsDisplayable](self, "_upperComplicationsSectionIsDisplayable");
  v4 = -[NTKHomeListPickerDataSource _homesSectionIsDisplayable](self, "_homesSectionIsDisplayable");
  v5 = 1;
  if (v3)
    v5 = 2;
  if (v4)
    return v5;
  else
    return v3;
}

+ (id)_titleForHeaderSectionType:(int64_t)a3
{
  if (a3 != 1)
    return 0;
  NTKClockFaceLocalizedString(CFSTR("COMPLICATION_PICKER_NANOHOME_HOMES_SECTION_NAME"), CFSTR("Homes"));
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)_titleForHeaderInSection:(int64_t)a3
{
  return +[NTKHomeListPickerDataSource _titleForHeaderSectionType:](NTKHomeListPickerDataSource, "_titleForHeaderSectionType:", -[NTKHomeListPickerDataSource _sectionTypeForSectionIndex:](self, "_sectionTypeForSectionIndex:", a3));
}

- (BOOL)_itemIsSelectedAtIndexPath:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v4 = a3;
  -[NTKHomeListPickerDataSource configuration](self, "configuration");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "listProvider");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "pickerSelectedItem");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  -[NTKHomeListPickerDataSource pickerItemForIndexPath:](self, "pickerItemForIndexPath:", v4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  LOBYTE(v4) = objc_msgSend(v7, "isEqual:", v8);
  return (char)v4;
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  return -[NTKHomeListPickerDataSource _numberOfItemsInSection:](self, "_numberOfItemsInSection:", a4);
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  _BOOL8 v9;

  v5 = a4;
  -[NTKHomeListPickerDataSource pickerItemForIndexPath:](self, "pickerItemForIndexPath:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[NTKHomeListPickerDataSource pickerCellProvider](self, "pickerCellProvider");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "cellForItem:atIndexPath:", v6, v5);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = -[NTKHomeListPickerDataSource _itemIsSelectedAtIndexPath:](self, "_itemIsSelectedAtIndexPath:", v5);
  objc_msgSend(v8, "ntk_setPickerSelected:", v9);

  return v8;
}

- (id)tableView:(id)a3 titleForHeaderInSection:(int64_t)a4
{
  return -[NTKHomeListPickerDataSource _titleForHeaderInSection:](self, "_titleForHeaderInSection:", a4);
}

- (void)_refreshHomeList
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  uint64_t v12;
  void *v13;
  NSArray *v14;
  void *v15;
  id v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t i;
  void *v21;
  NTKHomeListItem *v22;
  void *v23;
  void *v24;
  NSArray *homeComplicationsItems;
  NSArray *v26;
  void *v27;
  NTKHomeListPickerDataSource *v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  _QWORD v33[4];
  id v34;
  _BYTE v35[128];
  uint64_t v36;

  v36 = *MEMORY[0x1E0C80C00];
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

  if (v8)
  {
    objc_msgSend(v3, "home");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "uniqueIdentifier");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    v33[0] = MEMORY[0x1E0C809B0];
    v33[1] = 3221225472;
    v33[2] = __47__NTKHomeListPickerDataSource__refreshHomeList__block_invoke;
    v33[3] = &unk_1E6BD67C0;
    v34 = v10;
    v11 = v10;
    v12 = objc_msgSend(v7, "indexOfObjectPassingTest:", v33);

    if (v12 != 0x7FFFFFFFFFFFFFFFLL)
    {
      objc_msgSend(v7, "objectAtIndex:", v12);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "removeObjectAtIndex:", v12);
      objc_msgSend(v7, "insertObject:atIndex:", v13, 0);

    }
  }
  if (objc_msgSend(v7, "count"))
  {
    v28 = self;
    v14 = (NSArray *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(v7, "count"));
    +[NTKHomeListPickerDataSource _titleForHeaderSectionType:](NTKHomeListPickerDataSource, "_titleForHeaderSectionType:", 1);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v29 = 0u;
    v30 = 0u;
    v31 = 0u;
    v32 = 0u;
    v27 = v7;
    v16 = v7;
    v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v29, v35, 16);
    if (v17)
    {
      v18 = v17;
      v19 = *(_QWORD *)v30;
      do
      {
        for (i = 0; i != v18; ++i)
        {
          if (*(_QWORD *)v30 != v19)
            objc_enumerationMutation(v16);
          v21 = *(void **)(*((_QWORD *)&v29 + 1) + 8 * i);
          v22 = -[NTKHomeListItem initWithSectionIdentifier:]([NTKHomeListItem alloc], "initWithSectionIdentifier:", v15);
          objc_msgSend(v21, "uniqueIdentifier");
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          -[NTKHomeListItem setHomeID:](v22, "setHomeID:", v23);

          objc_msgSend(v21, "name");
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          -[NTKHomeListItem setHomeLocalizedName:](v22, "setHomeLocalizedName:", v24);

          -[NSArray addObject:](v14, "addObject:", v22);
        }
        v18 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v29, v35, 16);
      }
      while (v18);
    }

    self = v28;
    homeComplicationsItems = v28->_homeComplicationsItems;
    v28->_homeComplicationsItems = v14;

    v7 = v27;
  }
  else
  {
    v26 = self->_homeComplicationsItems;
    self->_homeComplicationsItems = 0;

  }
  -[UITableView reloadData](self->_tableView, "reloadData");

}

uint64_t __47__NTKHomeListPickerDataSource__refreshHomeList__block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;

  objc_msgSend(a2, "uniqueIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isEqual:", *(_QWORD *)(a1 + 32));

  return v4;
}

- (BOOL)_upperComplicationsSectionIsDisplayable
{
  return -[NSArray count](self->_upperComplicationsItems, "count") != 0;
}

- (BOOL)_homesSectionIsDisplayable
{
  return -[NSArray count](self->_homeComplicationsItems, "count") != 0;
}

- (int64_t)_upperComplicationsSectionIndex
{
  if (-[NTKHomeListPickerDataSource _upperComplicationsSectionIsDisplayable](self, "_upperComplicationsSectionIsDisplayable"))
  {
    return 0;
  }
  else
  {
    return 0x7FFFFFFFFFFFFFFFLL;
  }
}

- (int64_t)_sectionTypeForSectionIndex:(int64_t)a3
{
  return -[NTKHomeListPickerDataSource _upperComplicationsSectionIndex](self, "_upperComplicationsSectionIndex") != a3;
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
  objc_storeStrong((id *)&self->_homeComplicationsItems, 0);
  objc_storeStrong((id *)&self->_upperComplicationsItems, 0);
}

@end
