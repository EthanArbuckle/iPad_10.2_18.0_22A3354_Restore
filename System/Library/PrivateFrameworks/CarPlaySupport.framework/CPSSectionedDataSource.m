@implementation CPSSectionedDataSource

- (CPSSectionedDataSource)initWithSections:(id)a3 templateEnvironment:(id)a4
{
  CPSSectionedDataSource *v4;
  NSMutableArray *v5;
  NSMutableArray *sections;
  id v7;
  uint64_t v8;
  CPSessionConfiguration *sessionConfiguration;
  CPSSectionedDataSource *v11;
  CPSSectionedDataSource *v13;
  objc_super v14;
  id v15;
  id location[2];
  CPSSectionedDataSource *v17;

  v17 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v15 = 0;
  objc_storeStrong(&v15, a4);
  v4 = v17;
  v17 = 0;
  v14.receiver = v4;
  v14.super_class = (Class)CPSSectionedDataSource;
  v13 = -[CPSDataSource init](&v14, sel_init);
  v17 = v13;
  objc_storeStrong((id *)&v17, v13);
  if (v13)
  {
    v5 = (NSMutableArray *)(id)objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithArray:", location[0]);
    sections = v17->_sections;
    v17->_sections = v5;

    v7 = objc_alloc(MEMORY[0x24BDB7A70]);
    v8 = objc_msgSend(v7, "initWithDelegate:templateEnvironment:", v17, v15);
    sessionConfiguration = v17->_sessionConfiguration;
    v17->_sessionConfiguration = (CPSessionConfiguration *)v8;

    objc_storeStrong((id *)&v17->_templateEnvironment, v15);
  }
  v11 = v17;
  objc_storeStrong(&v15, 0);
  objc_storeStrong(location, 0);
  objc_storeStrong((id *)&v17, 0);
  return v11;
}

- (id)sectionAtIndex:(int64_t)a3
{
  NSMutableArray *v4;
  id v5;

  if (self->_assistantCellIndexPath && !-[NSIndexPath section](self->_assistantCellIndexPath, "section"))
    --a3;
  v4 = -[CPSSectionedDataSource sections](self, "sections");
  v5 = (id)-[NSMutableArray objectAtIndexedSubscript:](v4, "objectAtIndexedSubscript:", a3);

  return v5;
}

- (id)sectionWithIdentifier:(id)a3
{
  void *v4;
  id v5;
  id v6;
  char v7;
  unint64_t v8;
  int v9;
  id v10;
  unint64_t i;
  id location[2];
  CPSSectionedDataSource *v13;
  id v14;

  v13 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  for (i = 0; ; ++i)
  {
    v8 = i;
    if (v8 >= -[CPSSectionedDataSource numberOfSections](v13, "numberOfSections"))
      break;
    v4 = (void *)objc_opt_class();
    v5 = (id)-[NSMutableArray objectAtIndexedSubscript:](v13->_sections, "objectAtIndexedSubscript:", i);
    v10 = CPSSafeCast_20(v4, v5);

    v6 = (id)objc_msgSend(v10, "identifier");
    v7 = objc_msgSend(v6, "isEqual:", location[0]);

    if ((v7 & 1) != 0)
    {
      v14 = v10;
      v9 = 1;
    }
    else
    {
      v9 = 0;
    }
    objc_storeStrong(&v10, 0);
    if (v9)
      goto LABEL_9;
  }
  v14 = 0;
LABEL_9:
  objc_storeStrong(location, 0);
  return v14;
}

- (BOOL)showingAssistantInLastPosition
{
  BOOL v3;

  v3 = 0;
  if (self->_assistantCellIndexPath)
    return -[NSIndexPath section](self->_assistantCellIndexPath, "section") != 0;
  return v3;
}

- (int64_t)numberOfEnhancedSections
{
  void *v3;
  id v4;
  unint64_t v5;
  id location;
  unint64_t i;
  int64_t v8;
  SEL v9;
  CPSSectionedDataSource *v10;

  v10 = self;
  v9 = a2;
  v8 = 0;
  for (i = 0; ; ++i)
  {
    v5 = i;
    if (v5 >= -[CPSSectionedDataSource numberOfSections](v10, "numberOfSections"))
      break;
    v3 = (void *)objc_opt_class();
    v4 = (id)-[NSMutableArray objectAtIndexedSubscript:](v10->_sections, "objectAtIndexedSubscript:", i);
    location = CPSSafeCast_20(v3, v4);

    if (objc_msgSend(location, "sectionHeaderStyle") == 2)
      ++v8;
    objc_storeStrong(&location, 0);
  }
  return v8;
}

- (int64_t)_filteredNumberOfItemsGivenSection:(int64_t)a3 numberOfItems:(int64_t)a4
{
  int64_t v6;

  if (self->_assistantCellIndexPath && -[NSIndexPath section](self->_assistantCellIndexPath, "section") == a3)
    return 1;
  if (self->_limitingWithSections)
  {
    if (a3 >= self->_maxVisibleSection)
    {
      if (a3 == self->_maxVisibleSection)
        return self->_numberOfVisibleItemsInLastSection;
      else
        return 0;
    }
    else
    {
      return a4;
    }
  }
  else
  {
    if (-[CPSSectionedDataSource isLimitingLists](self, "isLimitingLists"))
      v6 = 12;
    else
      v6 = a4;
    if (a4 >= v6)
      return v6;
    else
      return a4;
  }
}

- (int64_t)numberOfSections
{
  int64_t v3;
  uint64_t v4;
  NSMutableArray *v5;
  uint64_t v6;
  char v7;
  id v8;
  char v9;
  id v10;
  int64_t i;
  uint64_t v12;
  int64_t v13;

  v5 = -[CPSSectionedDataSource sections](self, "sections");
  v6 = -[NSMutableArray count](v5, "count");

  v13 = v6;
  self->_limitingWithSections = 0;
  if (self->_assistantCellIndexPath)
    v13 = v6 + 1;
  if (!-[CPSSectionedDataSource isLimitingLists](self, "isLimitingLists"))
    return v13;
  if (v13 <= 1)
    return v13;
  self->_limitingWithSections = 1;
  self->_maxVisibleSection = 0;
  v12 = 0;
  for (i = 0; ; ++i)
  {
    if (i >= v13)
    {
      self->_maxVisibleSection = 0x7FFFFFFFFFFFFFFFLL;
      return v13;
    }
    v9 = 0;
    v7 = 0;
    if (self->_assistantCellIndexPath && -[NSIndexPath section](self->_assistantCellIndexPath, "section") == i)
    {
      v4 = 1;
    }
    else
    {
      v10 = -[CPSSectionedDataSource sectionAtIndex:](self, "sectionAtIndex:", i);
      v9 = 1;
      v8 = (id)objc_msgSend(v10, "items");
      v7 = 1;
      v4 = objc_msgSend(v8, "count");
    }
    if ((v7 & 1) != 0)

    if ((v9 & 1) != 0)
    if (v12 + v4 == 12)
    {
      self->_maxVisibleSection = i;
      if (-[CPSSectionedDataSource showingAssistantInLastPosition](self, "showingAssistantInLastPosition"))
        v3 = 11 - v12;
      else
        v3 = v4;
      self->_numberOfVisibleItemsInLastSection = v3;
      if (-[CPSSectionedDataSource showingAssistantInLastPosition](self, "showingAssistantInLastPosition"))
        return i + 2;
      else
        return i + 1;
    }
    if ((unint64_t)(v12 + v4) > 0xC)
      break;
    v12 += v4;
  }
  self->_maxVisibleSection = i;
  self->_numberOfVisibleItemsInLastSection = 12 - v12;
  if (-[CPSSectionedDataSource showingAssistantInLastPosition](self, "showingAssistantInLastPosition"))
    --self->_numberOfVisibleItemsInLastSection;
  if (-[CPSSectionedDataSource showingAssistantInLastPosition](self, "showingAssistantInLastPosition"))
    return i + 2;
  else
    return i + 1;
}

- (int64_t)numberOfItems
{
  unint64_t i;
  int64_t v4;
  unint64_t v5;

  v5 = -[CPSSectionedDataSource numberOfSections](self, "numberOfSections");
  v4 = 0;
  for (i = 0; i < v5; ++i)
    v4 += -[CPSSectionedDataSource numberOfItemsInSection:](self, "numberOfItemsInSection:", i);
  return v4;
}

- (int64_t)numberOfItemsInSection:(int64_t)a3
{
  id v4;
  uint64_t v5;
  id v6;
  int64_t v7;
  SEL v8;
  CPSSectionedDataSource *v9;
  int64_t v10;

  v9 = self;
  v8 = a2;
  v7 = a3;
  if (self->_assistantCellIndexPath && -[NSIndexPath section](v9->_assistantCellIndexPath, "section") == v7)
    return 1;
  v6 = -[CPSSectionedDataSource sectionAtIndex:](v9, "sectionAtIndex:", v7);
  v4 = (id)objc_msgSend(v6, "items");
  v5 = objc_msgSend(v4, "count");

  v10 = -[CPSSectionedDataSource _filteredNumberOfItemsGivenSection:numberOfItems:](v9, "_filteredNumberOfItemsGivenSection:numberOfItems:", v7, v5);
  objc_storeStrong(&v6, 0);
  return v10;
}

- (id)firstItemIndexPath
{
  unint64_t i;

  for (i = 0; i < -[CPSSectionedDataSource numberOfSections](self, "numberOfSections"); ++i)
  {
    if (-[CPSSectionedDataSource numberOfItemsInSection:](self, "numberOfItemsInSection:", i) > 0)
      return (id)objc_msgSend(MEMORY[0x24BDD15D8], "indexPathForRow:inSection:", 0, i);
  }
  return 0;
}

- (id)itemAtIndexPath:(id)a3
{
  uint64_t v4;
  uint64_t v5;
  id v6;
  int v7;
  id location[2];
  CPSSectionedDataSource *v9;
  id v10;

  v9 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  if (v9->_assistantCellIndexPath
    && (-[NSIndexPath isEqual:](v9->_assistantCellIndexPath, "isEqual:", location[0]) & 1) != 0)
  {
    v10 = 0;
    v7 = 1;
  }
  else
  {
    v6 = -[CPSSectionedDataSource sectionAtIndex:](v9, "sectionAtIndex:", objc_msgSend(location[0], "section"));
    v5 = objc_msgSend(location[0], "section");
    if (v5 >= -[CPSSectionedDataSource numberOfSections](v9, "numberOfSections")
      || (v4 = objc_msgSend(location[0], "row"),
          v4 >= -[CPSSectionedDataSource numberOfItemsInSection:](v9, "numberOfItemsInSection:", objc_msgSend(location[0], "section"))))
    {
      v10 = 0;
      v7 = 1;
    }
    else
    {
      v10 = (id)objc_msgSend(v6, "itemAtIndex:", objc_msgSend(location[0], "row"));
      v7 = 1;
    }
    objc_storeStrong(&v6, 0);
  }
  objc_storeStrong(location, 0);
  return v10;
}

- (id)indexPathForItemWithIdentifier:(id)a3
{
  uint64_t v3;
  id v5;
  id v6;
  id v7;
  char v8;
  unint64_t v9;
  unint64_t j;
  id v11;
  int v12;
  unint64_t i;
  id location[2];
  CPSSectionedDataSource *v15;
  id v16;

  v15 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  for (i = 0; ; ++i)
  {
    v9 = i;
    if (v9 >= -[CPSSectionedDataSource numberOfSections](v15, "numberOfSections"))
      break;
    if (v15->_assistantCellIndexPath)
    {
      v3 = -[NSIndexPath section](v15->_assistantCellIndexPath, "section");
      if (v3 == i)
      {
        v16 = 0;
        v12 = 1;
        goto LABEL_15;
      }
    }
    v11 = -[CPSSectionedDataSource sectionAtIndex:](v15, "sectionAtIndex:", i);
    for (j = 0; j < -[CPSSectionedDataSource numberOfItemsInSection:](v15, "numberOfItemsInSection:", i); ++j)
    {
      v7 = (id)objc_msgSend(v11, "items");
      v6 = (id)objc_msgSend(v7, "objectAtIndexedSubscript:", j);
      v5 = CPListItemIdentifier_0(v6);
      v8 = objc_msgSend(v5, "isEqual:", location[0]);

      if ((v8 & 1) != 0)
      {
        v16 = (id)objc_msgSend(MEMORY[0x24BDD15D8], "indexPathForRow:inSection:", j, i);
        v12 = 1;
        goto LABEL_12;
      }
    }
    v12 = 0;
LABEL_12:
    objc_storeStrong(&v11, 0);
    if (v12)
      goto LABEL_15;
  }
  v16 = 0;
  v12 = 1;
LABEL_15:
  objc_storeStrong(location, 0);
  return v16;
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  UITableView *v5;
  objc_super v7;
  int v8;
  id v9;
  id v10;
  id location[2];
  CPSSectionedDataSource *v12;
  id v13;

  v12 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v10 = 0;
  objc_storeStrong(&v10, a4);
  if ((objc_msgSend(v10, "isEqual:", v12->_assistantCellIndexPath) & 1) != 0)
  {
    v5 = -[CPSDataSource tableView](v12, "tableView");
    v9 = +[_CPUIBaseTableCell cellForTableView:](CPSAssistantCell, "cellForTableView:");

    objc_msgSend(v9, "configureWithText:", v12->_assistantCellTitle);
    v13 = v9;
    v8 = 1;
    objc_storeStrong(&v9, 0);
  }
  else
  {
    v7.receiver = v12;
    v7.super_class = (Class)CPSSectionedDataSource;
    v13 = -[CPSDataSource tableView:cellForRowAtIndexPath:](&v7, sel_tableView_cellForRowAtIndexPath_, location[0], v10);
    v8 = 1;
  }
  objc_storeStrong(&v10, 0);
  objc_storeStrong(location, 0);
  return v13;
}

- (id)_sanitizedSectionIndexTitleForTitle:(id)a3
{
  uint64_t v3;
  uint64_t v4;
  id location[3];
  id v7;

  location[2] = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  if (objc_msgSend(location[0], "length"))
  {
    v3 = objc_msgSend(location[0], "rangeOfComposedCharacterSequenceAtIndex:", 0);
    v7 = (id)objc_msgSend(location[0], "substringWithRange:", v3, v4);
  }
  else
  {
    v7 = 0;
  }
  objc_storeStrong(location, 0);
  return v7;
}

- (id)sectionIndexTitlesForTableView:(id)a3
{
  uint64_t v3;
  id v5;
  CPSSectionedDataSource *v6;
  id v7;
  id v8;
  id v9;
  unint64_t i;
  unint64_t v11;
  id v12;
  id location[2];
  CPSSectionedDataSource *v14;

  v14 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v12 = (id)objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v11 = -[CPSSectionedDataSource numberOfSections](v14, "numberOfSections");
  for (i = 0; i < v11; ++i)
  {
    if (v14->_assistantCellIndexPath)
    {
      v3 = -[NSIndexPath section](v14->_assistantCellIndexPath, "section");
      if (v3 == i)
        continue;
    }
    v9 = -[CPSSectionedDataSource sectionAtIndex:](v14, "sectionAtIndex:", i);
    v6 = v14;
    v7 = (id)objc_msgSend(v9, "sectionIndexTitle");
    v8 = -[CPSSectionedDataSource _sanitizedSectionIndexTitleForTitle:](v6, "_sanitizedSectionIndexTitleForTitle:");

    if (v8)
      objc_msgSend(v12, "addObject:", v8);
    objc_storeStrong(&v8, 0);
    objc_storeStrong(&v9, 0);
  }
  v5 = v12;
  objc_storeStrong(&v12, 0);
  objc_storeStrong(location, 0);
  return v5;
}

- (int64_t)tableView:(id)a3 sectionForSectionIndexTitle:(id)a4 atIndex:(int64_t)a5
{
  int64_t v6;
  NSMutableArray *v9;
  uint64_t v10;
  uint64_t v11;
  int v12;
  int v13;
  uint64_t (*v14)(_QWORD *, void *, unint64_t);
  void *v15;
  id v16[2];
  int64_t v17;
  void *v18;
  int64_t v19;
  id v20;
  id location[2];
  CPSSectionedDataSource *v22;

  v22 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v20 = 0;
  objc_storeStrong(&v20, a4);
  v19 = a5;
  v18 = -[CPSSectionedDataSource numberOfSections](v22, "numberOfSections");
  v17 = 0;
  v9 = -[CPSSectionedDataSource sections](v22, "sections");
  v11 = MEMORY[0x24BDAC760];
  v12 = -1073741824;
  v13 = 0;
  v14 = __72__CPSSectionedDataSource_tableView_sectionForSectionIndexTitle_atIndex___block_invoke;
  v15 = &unk_24E2710D0;
  v16[1] = v18;
  v16[0] = v20;
  v10 = -[NSMutableArray indexOfObjectPassingTest:](v9, "indexOfObjectPassingTest:", &v11);

  v17 = v10;
  if (v22->_assistantCellIndexPath && !-[NSIndexPath section](v22->_assistantCellIndexPath, "section"))
    ++v17;
  v6 = v17;
  objc_storeStrong(v16, 0);
  objc_storeStrong(&v20, 0);
  objc_storeStrong(location, 0);
  return v6;
}

uint64_t __72__CPSSectionedDataSource_tableView_sectionForSectionIndexTitle_atIndex___block_invoke(_QWORD *a1, void *a2, unint64_t a3)
{
  char v6;
  char v7;
  id v8;
  id location[2];
  char v10;

  location[1] = a1;
  location[0] = 0;
  objc_storeStrong(location, a2);
  v7 = 0;
  v6 = 0;
  if (a3 < a1[5])
  {
    v8 = (id)objc_msgSend(location[0], "sectionIndexTitle");
    v7 = 1;
    v6 = objc_msgSend(v8, "isEqualToString:", a1[4]);
  }
  v10 = v6 & 1;
  if ((v7 & 1) != 0)

  objc_storeStrong(location, 0);
  return v10 & 1;
}

- (void)updateSections:(id)a3
{
  NSMutableArray *v3;
  NSMutableArray *sections;
  id location[2];
  CPSSectionedDataSource *v6;

  v6 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v3 = (NSMutableArray *)(id)objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithArray:", location[0]);
  sections = v6->_sections;
  v6->_sections = v3;

  -[CPSDataSource reloadData](v6, "reloadData");
  objc_storeStrong(location, 0);
}

- (void)reloadItems:(id)a3
{
  id v3;
  uint64_t v4;
  int v5;
  int v6;
  void (*v7)(uint64_t, void *, void *, void *);
  void *v8;
  CPSSectionedDataSource *v9;
  id v10[2];
  uint64_t v11;
  uint64_t *v12;
  int v13;
  int v14;
  char v15;
  id v16;
  id location[2];
  CPSSectionedDataSource *v18;

  v18 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v16 = (id)objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v11 = 0;
  v12 = &v11;
  v13 = 0x20000000;
  v14 = 32;
  v15 = 1;
  v3 = location[0];
  v4 = MEMORY[0x24BDAC760];
  v5 = -1073741824;
  v6 = 0;
  v7 = __38__CPSSectionedDataSource_reloadItems___block_invoke;
  v8 = &unk_24E2710F8;
  v9 = v18;
  v10[0] = v16;
  v10[1] = &v11;
  objc_msgSend(v3, "enumerateObjectsUsingBlock:", &v4);
  if ((v12[3] & 1) != 0 && objc_msgSend(v16, "count"))
    -[CPSDataSource reloadItemsAtIndexPaths:](v18, "reloadItemsAtIndexPaths:", v16);
  else
    -[CPSDataSource reloadData](v18, "reloadData");
  objc_storeStrong(v10, 0);
  objc_storeStrong((id *)&v9, 0);
  _Block_object_dispose(&v11, 8);
  objc_storeStrong(&v16, 0);
  objc_storeStrong(location, 0);
}

void __38__CPSSectionedDataSource_reloadItems___block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  uint64_t v4;
  id v5;
  os_log_t oslog;
  id v10;
  id v11;
  id v12[4];
  id location[2];
  uint8_t v14[24];
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  location[1] = (id)a1;
  location[0] = 0;
  objc_storeStrong(location, a2);
  v12[3] = a3;
  v12[2] = a4;
  v12[1] = (id)a1;
  v12[0] = CPListItemIdentifier_0(location[0]);
  v11 = (id)objc_msgSend(*(id *)(a1 + 32), "indexPathForItemWithIdentifier:", v12[0]);
  if (v11)
  {
    v10 = (id)objc_msgSend(*(id *)(a1 + 32), "sectionAtIndex:", objc_msgSend(v11, "section"));
    v5 = v10;
    v4 = objc_msgSend(v11, "row");
    objc_msgSend(v5, "replaceItemAtIndex:withItem:", v4, location[0]);
    objc_msgSend(*(id *)(a1 + 40), "addObject:", v11);
    objc_storeStrong(&v10, 0);
  }
  else
  {
    oslog = (os_log_t)CarPlaySupportGeneralLogging();
    if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEFAULT))
    {
      __os_log_helper_16_2_1_8_64((uint64_t)v14, (uint64_t)location[0]);
      _os_log_impl(&dword_21E389000, oslog, OS_LOG_TYPE_DEFAULT, "Unable to match an index path for %@", v14, 0xCu);
    }
    objc_storeStrong((id *)&oslog, 0);
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = 0;
  }
  objc_storeStrong(&v11, 0);
  objc_storeStrong(v12, 0);
  objc_storeStrong(location, 0);
}

- (BOOL)isLimitingLists
{
  CPSessionConfiguration *v3;
  BOOL v4;

  v3 = -[CPSSectionedDataSource sessionConfiguration](self, "sessionConfiguration");
  v4 = (-[CPSessionConfiguration limitedUserInterfaces](v3, "limitedUserInterfaces") & 2) == 2;

  return v4;
}

- (void)sessionConfiguration:(id)a3 limitedUserInterfacesChanged:(unint64_t)a4
{
  id v4;
  os_log_t oslog;
  unint64_t v7;
  id location[2];
  CPSSectionedDataSource *v9;
  uint8_t v10[24];
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  v9 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v7 = a4;
  oslog = (os_log_t)CarPlaySupportGeneralLogging();
  if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEFAULT))
  {
    v4 = (id)objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", v7);
    __os_log_helper_16_2_1_8_64((uint64_t)v10, (uint64_t)v4);
    _os_log_impl(&dword_21E389000, oslog, OS_LOG_TYPE_DEFAULT, "Limited user interface changed to %@", v10, 0xCu);

  }
  objc_storeStrong((id *)&oslog, 0);
  -[CPSSectionedDataSource updateIndexPathForAssistantItem](v9, "updateIndexPathForAssistantItem");
  -[CPSDataSource reloadData](v9, "reloadData");
  objc_storeStrong(location, 0);
}

- (void)setAssistantCellPosition:(int64_t)a3
{
  if (self->_assistantCellPosition != a3)
  {
    self->_assistantCellPosition = a3;
    -[CPSSectionedDataSource updateIndexPathForAssistantItem](self, "updateIndexPathForAssistantItem");
  }
}

- (void)setAssistantCellVisibility:(int64_t)a3
{
  if (self->_assistantCellVisibility != a3)
  {
    self->_assistantCellVisibility = a3;
    -[CPSSectionedDataSource updateIndexPathForAssistantItem](self, "updateIndexPathForAssistantItem");
  }
}

- (void)setAssistantCellTitle:(id)a3
{
  id location[2];
  CPSSectionedDataSource *v4;

  v4 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  if (!-[NSString isEqualToString:](v4->_assistantCellTitle, "isEqualToString:", location[0]))
    objc_storeStrong((id *)&v4->_assistantCellTitle, location[0]);
  objc_storeStrong(location, 0);
}

- (void)updateIndexPathForAssistantItem
{
  NSIndexPath *v2;
  NSIndexPath *assistantCellIndexPath;
  id location[2];
  CPSSectionedDataSource *v5;

  v5 = self;
  location[1] = (id)a2;
  location[0] = (id)-[NSIndexPath copy](self->_assistantCellIndexPath, "copy");
  if ((-[CPSTemplateEnvironment hasAudioEntitlement](v5->_templateEnvironment, "hasAudioEntitlement")
     || -[CPSTemplateEnvironment hasCommunicationEntitlement](v5->_templateEnvironment, "hasCommunicationEntitlement"))
    && (v5->_assistantCellVisibility == 2
     || v5->_assistantCellVisibility == 1 && -[CPSSectionedDataSource isLimitingLists](v5, "isLimitingLists")))
  {
    if (v5->_assistantCellPosition)
    {
      objc_storeStrong((id *)&v5->_assistantCellIndexPath, 0);
      v2 = (NSIndexPath *)(id)objc_msgSend(MEMORY[0x24BDD15D8], "indexPathForRow:inSection:", 0, -[CPSSectionedDataSource numberOfSections](v5, "numberOfSections"));
    }
    else
    {
      v2 = (NSIndexPath *)(id)objc_msgSend(MEMORY[0x24BDD15D8], "indexPathForRow:inSection:", 0);
    }
    assistantCellIndexPath = v5->_assistantCellIndexPath;
    v5->_assistantCellIndexPath = v2;

  }
  else
  {
    objc_storeStrong((id *)&v5->_assistantCellIndexPath, 0);
  }
  if ((-[NSIndexPath isEqual:](v5->_assistantCellIndexPath, "isEqual:", location[0]) & 1) == 0)
    -[CPSDataSource reloadData](v5, "reloadData");
  objc_storeStrong(location, 0);
}

- (NSIndexPath)assistantCellIndexPath
{
  return self->_assistantCellIndexPath;
}

- (CPSTemplateEnvironment)templateEnvironment
{
  return self->_templateEnvironment;
}

- (int64_t)assistantCellVisibility
{
  return self->_assistantCellVisibility;
}

- (int64_t)assistantCellPosition
{
  return self->_assistantCellPosition;
}

- (NSString)assistantCellTitle
{
  return self->_assistantCellTitle;
}

- (NSMutableArray)sections
{
  return self->_sections;
}

- (void)setSections:(id)a3
{
  objc_storeStrong((id *)&self->_sections, a3);
}

- (CPSessionConfiguration)sessionConfiguration
{
  return self->_sessionConfiguration;
}

- (void)setSessionConfiguration:(id)a3
{
  objc_storeStrong((id *)&self->_sessionConfiguration, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sessionConfiguration, 0);
  objc_storeStrong((id *)&self->_sections, 0);
  objc_storeStrong((id *)&self->_assistantCellTitle, 0);
  objc_storeStrong((id *)&self->_templateEnvironment, 0);
  objc_storeStrong((id *)&self->_assistantCellIndexPath, 0);
}

@end
