@implementation MPUQueryDataSource

- (MPUQueryDataSource)initWithEntityType:(int64_t)a3
{
  return -[MPUQueryDataSource initWithQuery:entityType:](self, "initWithQuery:entityType:", 0, a3);
}

- (MPUQueryDataSource)initWithQuery:(id)a3 entityType:(int64_t)a4
{
  id v7;
  MPUQueryDataSource *v8;
  MPUQueryDataSource *v9;
  void *v10;
  objc_super v12;

  v7 = a3;
  v12.receiver = self;
  v12.super_class = (Class)MPUQueryDataSource;
  v8 = -[MPUDataSource initWithEntityType:](&v12, sel_initWithEntityType_, a4);
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_query, a3);
    objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "addObserver:selector:name:object:", v9, sel__applicationWillEnterForeground_, *MEMORY[0x24BDF75D0], 0);
    objc_msgSend(v10, "addObserver:selector:name:object:", v9, sel__applicationDidEnterBackground_, *MEMORY[0x24BDF7528], 0);
    objc_msgSend(v10, "addObserver:selector:name:object:", v9, sel__defaultMediaLibraryDidChangeNotification_, *MEMORY[0x24BDDBCE8], 0);
    objc_msgSend(v10, "addObserver:selector:name:object:", v9, sel__mediaLibraryDidChangeNotification_, *MEMORY[0x24BDDBCF0], 0);
    objc_msgSend(v10, "addObserver:selector:name:object:", v9, sel__mediaLibraryDisplayValuesDidChangeNotification_, *MEMORY[0x24BDDBCF8], 0);
    objc_msgSend(v10, "addObserver:selector:name:object:", v9, sel__mediaLibraryDynamicPropertiesDidChangeNotification_, *MEMORY[0x24BDDBD00], 0);

  }
  return v9;
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:name:object:", self, *MEMORY[0x24BDF75D0], 0);
  objc_msgSend(v3, "removeObserver:name:object:", self, *MEMORY[0x24BDF7528], 0);
  objc_msgSend(v3, "removeObserver:name:object:", self, *MEMORY[0x24BDDBCE8], 0);
  objc_msgSend(v3, "removeObserver:name:object:", self, *MEMORY[0x24BDDBCF0], 0);
  objc_msgSend(v3, "removeObserver:name:object:", self, *MEMORY[0x24BDDBCF8], 0);
  objc_msgSend(v3, "removeObserver:name:object:", self, *MEMORY[0x24BDDBD00], 0);

  v4.receiver = self;
  v4.super_class = (Class)MPUQueryDataSource;
  -[MPUQueryDataSource dealloc](&v4, sel_dealloc);
}

- (MPUQueryDataSource)initWithCoder:(id)a3
{
  id v4;
  MPUQueryDataSource *v5;
  uint64_t v6;
  MPMediaQuery *query;
  void *v8;
  uint64_t v9;
  NSMutableSet *additionalUniqueItemPropertiesToFetch;
  objc_super v12;

  v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)MPUQueryDataSource;
  v5 = -[MPUDataSource initWithCoder:](&v12, sel_initWithCoder_, v4);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("query"));
    v6 = objc_claimAutoreleasedReturnValue();
    query = v5->_query;
    v5->_query = (MPMediaQuery *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("additionalUniqueItemPropertiesToFetch"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v8, "count"))
    {
      v9 = objc_msgSend(objc_alloc(MEMORY[0x24BDBCEF0]), "initWithArray:", v8);
      additionalUniqueItemPropertiesToFetch = v5->_additionalUniqueItemPropertiesToFetch;
      v5->_additionalUniqueItemPropertiesToFetch = (NSMutableSet *)v9;

    }
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  objc_super v6;

  v4 = a3;
  v6.receiver = self;
  v6.super_class = (Class)MPUQueryDataSource;
  -[MPUDataSource encodeWithCoder:](&v6, sel_encodeWithCoder_, v4);
  objc_msgSend(v4, "encodeObject:forKey:", self->_query, CFSTR("query"));
  -[NSMutableSet allObjects](self->_additionalUniqueItemPropertiesToFetch, "allObjects");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "count"))
    objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("additionalUniqueItemPropertiesToFetch"));

}

- (unint64_t)hash
{
  int64_t v3;
  _BOOL4 v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  v3 = -[MPUDataSource entityType](self, "entityType");
  v4 = -[MPUDataSource isIgnoringInvalidation](self, "isIgnoringInvalidation");
  v5 = 5;
  if (v4)
    v5 = 0;
  v6 = v5 ^ v3;
  v7 = -[MPMediaQuery hash](self->_query, "hash");
  v8 = 100;
  if (self->_invalidateWhenEnteringForeground)
    v8 = 0;
  return v6 ^ (10 * v7) ^ v8 ^ (1000 * -[NSMutableSet hash](self->_additionalUniqueItemPropertiesToFetch, "hash"));
}

- (BOOL)isEqual:(id)a3
{
  MPUQueryDataSource *v4;
  MPUQueryDataSource *v5;
  int64_t v6;
  _BOOL4 v7;
  MPMediaQuery *query;
  char v9;
  NSMutableSet *additionalUniqueItemPropertiesToFetch;

  v4 = (MPUQueryDataSource *)a3;
  if (self == v4)
  {
    v9 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v5 = v4;
      v6 = -[MPUDataSource entityType](self, "entityType");
      if (v6 == -[MPUDataSource entityType](v5, "entityType")
        && (v7 = -[MPUDataSource isIgnoringInvalidation](self, "isIgnoringInvalidation"),
            v7 == -[MPUDataSource isIgnoringInvalidation](v5, "isIgnoringInvalidation"))
        && ((query = self->_query, query == v5->_query) || -[MPMediaQuery isEqual:](query, "isEqual:"))
        && !self->_invalidateWhenEnteringForeground
        && !v5->_invalidateWhenEnteringForeground)
      {
        additionalUniqueItemPropertiesToFetch = self->_additionalUniqueItemPropertiesToFetch;
        if (additionalUniqueItemPropertiesToFetch == v5->_additionalUniqueItemPropertiesToFetch)
          v9 = 1;
        else
          v9 = -[NSMutableSet isEqualToSet:](additionalUniqueItemPropertiesToFetch, "isEqualToSet:");
      }
      else
      {
        v9 = 0;
      }

    }
    else
    {
      v9 = 0;
    }
  }

  return v9;
}

- (BOOL)canEditEntityAtIndex:(unint64_t)a3
{
  void *v5;
  int v6;

  objc_msgSend(MEMORY[0x24BDDCB98], "sharedRestrictionsMonitor");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "allowsDeletion");

  return v6 && -[MPUQueryDataSource count](self, "count") > a3;
}

- (BOOL)canSelectEntityAtIndex:(unint64_t)a3
{
  char v5;
  char v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  int v14;
  void *v15;
  void *v16;

  if (!-[MPUDataSource entityType](self, "entityType"))
  {
    -[MPUDataSource entityAtIndex:](self, "entityAtIndex:", a3);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      v5 = 1;
      v6 = 1;
LABEL_19:

      return v6 & v5;
    }
    v8 = *MEMORY[0x24BDDBBE0];
    objc_msgSend(v7, "valueForProperty:", *MEMORY[0x24BDDBBE0]);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v9, "BOOLValue") & 1) == 0)
    {
      objc_msgSend(v7, "valueForProperty:", *MEMORY[0x24BDDBC00]);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v10, "BOOLValue"))
      {

      }
      else
      {
        v11 = *MEMORY[0x24BDDBB58];
        objc_msgSend(v7, "valueForProperty:", *MEMORY[0x24BDDBB58]);
        v12 = (void *)objc_claimAutoreleasedReturnValue();

        if (v12
          || (objc_msgSend(v7, "valueForProperty:", *MEMORY[0x24BDDBC38]),
              v13 = (void *)objc_claimAutoreleasedReturnValue(),
              v14 = objc_msgSend(v13, "BOOLValue"),
              v13,
              !v14))
        {
          v6 = 1;
          goto LABEL_15;
        }
        objc_msgSend(v7, "valueForProperty:", v11);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v9, "length"))
        {
          v6 = objc_msgSend(v9, "isEqualToString:", CFSTR("0"));
          goto LABEL_8;
        }
      }
    }
    v6 = 1;
LABEL_8:

LABEL_15:
    objc_msgSend(MEMORY[0x24BDDC708], "sharedCloudController");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v15, "hasProperNetworkConditionsToPlayMedia") & 1) != 0)
    {
      v5 = 1;
    }
    else
    {
      objc_msgSend(v7, "valueForProperty:", v8);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v5 = objc_msgSend(v16, "BOOLValue");

    }
    goto LABEL_19;
  }
  v5 = 1;
  v6 = 1;
  return v6 & v5;
}

- (unint64_t)count
{
  int64_t v3;
  NSArray *entities;

  v3 = -[MPUDataSource entityType](self, "entityType");
  entities = self->_entities;
  if (v3)
  {
    if (!entities)
      return -[MPMediaQuery _countOfCollections](self->_query, "_countOfCollections");
    return -[NSArray count](entities, "count");
  }
  if (entities)
    return -[NSArray count](entities, "count");
  return -[MPMediaQuery _countOfItems](self->_query, "_countOfItems");
}

- (void)deleteEntityAtIndex:(unint64_t)a3
{
  void *v4;
  void *v5;
  void *v6;
  int v7;
  uint64_t v8;
  void *v9;
  void *v10;
  _QWORD v11[2];

  v11[1] = *MEMORY[0x24BDAC8D0];
  -[MPUDataSource entityAtIndex:](self, "entityAtIndex:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
    goto LABEL_12;
  objc_msgSend(v4, "mediaLibrary");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDDC7F0], "deviceMediaLibrary");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v5, "isEqual:", v6);

  if (!v7)
    goto LABEL_12;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v11[0] = v4;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v11, 1);
    v8 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      v9 = 0;
      goto LABEL_9;
    }
    objc_msgSend(v4, "items");
    v8 = objc_claimAutoreleasedReturnValue();
  }
  v9 = (void *)v8;
LABEL_9:
  if (objc_msgSend(v9, "count"))
  {
    objc_msgSend(v4, "mediaLibrary");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "removeItems:", v9);

    -[MPUQueryDataSource _invalidateCalculatedEntities](self, "_invalidateCalculatedEntities");
  }

LABEL_12:
}

- (int64_t)editingTypeForEntityAtIndex:(unint64_t)a3
{
  void *v5;
  int v6;
  void *v7;
  void *v8;
  void *v9;
  int v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  int64_t v17;
  void *v18;
  void *v19;
  uint64_t v20;
  void *v21;
  char v22;

  objc_msgSend(MEMORY[0x24BDDCB98], "sharedRestrictionsMonitor");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "allowsDeletion");

  if (v6 && -[MPUQueryDataSource count](self, "count") > a3)
  {
    -[MPUDataSource entityAtIndex:](self, "entityAtIndex:", a3);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "mediaLibrary");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDDC7F0], "deviceMediaLibrary");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v8, "isEqual:", v9);

    if (v10)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v11 = v7;
        v12 = *MEMORY[0x24BDDBBC0];
        v13 = *MEMORY[0x24BDDBBE8];
        objc_msgSend(MEMORY[0x24BDBCF20], "setWithObjects:", *MEMORY[0x24BDDBBC0], *MEMORY[0x24BDDBBE8], 0);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "valuesForProperties:", v14);
        v15 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v15, "objectForKey:", v12);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v16, "BOOLValue"))
        {

LABEL_12:
          v17 = 1;
          goto LABEL_13;
        }
        objc_msgSend(v15, "objectForKey:", v13);
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        v22 = objc_msgSend(v21, "BOOLValue");

        if ((v22 & 1) == 0)
          goto LABEL_12;
      }
      else
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          objc_msgSend(v7, "itemsQuery");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          v19 = (void *)objc_msgSend(v18, "copy");
          objc_msgSend(MEMORY[0x24BDDC810], "predicateWithValue:forProperty:", MEMORY[0x24BDBD1C8], *MEMORY[0x24BDDBBC0]);
          v20 = objc_claimAutoreleasedReturnValue();
          objc_msgSend(v19, "addFilterPredicate:", v20);

          LOBYTE(v20) = objc_msgSend(v19, "_hasItems");
          if ((v20 & 1) != 0)
            goto LABEL_12;
        }
      }
    }
    v17 = 0;
LABEL_13:

    return v17;
  }
  return 0;
}

- (id)entities
{
  NSArray *entities;
  int64_t v4;
  MPMediaQuery *query;
  NSArray *v6;
  NSArray *v7;

  entities = self->_entities;
  if (!entities)
  {
    v4 = -[MPUDataSource entityType](self, "entityType");
    query = self->_query;
    if (v4)
      -[MPMediaQuery collections](query, "collections");
    else
      -[MPMediaQuery items](query, "items");
    v6 = (NSArray *)objc_claimAutoreleasedReturnValue();
    v7 = self->_entities;
    self->_entities = v6;

    entities = self->_entities;
    if (!entities)
    {
      self->_entities = (NSArray *)MEMORY[0x24BDBD1A8];

      entities = self->_entities;
    }
  }
  return entities;
}

- (id)queryForEntityAtIndex:(unint64_t)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  -[MPUDataSource entityAtIndex:](self, "entityAtIndex:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v4, "itemsQuery");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    -[MPUQueryDataSource query](self, "query");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = (void *)objc_msgSend(v6, "copy");

    v7 = (void *)MEMORY[0x24BDDC810];
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", objc_msgSend(v4, "persistentID"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "predicateWithValue:forProperty:", v8, *MEMORY[0x24BDDBAD8]);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "addFilterPredicate:", v9);

  }
  return v5;
}

- (id)queryForEntityAtIndexPath:(id)a3
{
  return -[MPUQueryDataSource queryForEntityAtIndex:](self, "queryForEntityAtIndex:", -[MPUDataSource _globalIndexForIndexPath:](self, "_globalIndexForIndexPath:", a3));
}

- (void)_invalidateCalculatedEntities
{
  MPMediaItemCollection *representativeCollection;
  MPMediaQuerySectionInfo *sectionInfo;
  NSArray *entities;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)MPUQueryDataSource;
  -[MPUDataSource _invalidateCalculatedEntities](&v6, sel__invalidateCalculatedEntities);
  self->_hasValidRepresentativeCollection = 0;
  representativeCollection = self->_representativeCollection;
  self->_representativeCollection = 0;

  sectionInfo = self->_sectionInfo;
  self->_sectionInfo = 0;

  entities = self->_entities;
  self->_entities = 0;

  self->_hasValidEmpty = 0;
}

- (BOOL)isEmpty
{
  BOOL result;
  int64_t v4;
  NSArray *entities;
  char v6;

  if (self->_hasValidEmpty)
    return self->_isEmpty;
  self->_hasValidEmpty = 1;
  v4 = -[MPUDataSource entityType](self, "entityType");
  entities = self->_entities;
  if (v4)
  {
    if (!entities)
    {
      v6 = -[MPMediaQuery _hasCollections](self->_query, "_hasCollections");
LABEL_9:
      result = v6 ^ 1;
      goto LABEL_10;
    }
  }
  else if (!entities)
  {
    v6 = -[MPMediaQuery _hasItems](self->_query, "_hasItems");
    goto LABEL_9;
  }
  result = -[NSArray count](entities, "count") == 0;
LABEL_10:
  self->_isEmpty = result;
  return result;
}

- (BOOL)showsIndexBar
{
  return -[MPUDataSource entityType](self, "entityType") == 1 && -[MPUQueryDataSource count](self, "count") > 0x32;
}

- (unint64_t)numberOfSections
{
  void *v3;
  void *v4;
  unint64_t v5;

  if (!-[MPUDataSource usesSections](self, "usesSections"))
    return -[MPUQueryDataSource count](self, "count") != 0;
  -[MPUQueryDataSource _sectionInfo](self, "_sectionInfo");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "sections");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "count");

  return v5;
}

- (id)localizedSectionIndexTitles
{
  void *v2;
  void *v3;

  -[MPUQueryDataSource _sectionInfo](self, "_sectionInfo");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "sectionIndexTitles");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)localizedSectionTitleAtIndex:(unint64_t)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  -[MPUQueryDataSource _sectionInfo](self, "_sectionInfo");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "sections");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectAtIndex:", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "title");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (unint64_t)indexOfSectionForSectionTitleAtIndex:(unint64_t)a3
{
  void *v4;
  unint64_t v5;

  -[MPUQueryDataSource _sectionInfo](self, "_sectionInfo");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "indexOfSectionForSectionIndexTitleAtIndex:", a3);

  return v5;
}

- (_NSRange)rangeOfSectionAtIndex:(unint64_t)a3
{
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  NSUInteger v9;
  NSUInteger v10;
  NSUInteger v11;
  NSUInteger v12;
  _NSRange result;

  if (-[MPUDataSource usesSections](self, "usesSections"))
  {
    -[MPUQueryDataSource _sectionInfo](self, "_sectionInfo");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "sections");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "objectAtIndex:", a3);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    v8 = objc_msgSend(v7, "range");
    v10 = v9;

    v11 = v8;
    v12 = v10;
  }
  else
  {
    v12 = -[MPUQueryDataSource count](self, "count");
    v11 = 0;
  }
  result.length = v12;
  result.location = v11;
  return result;
}

- (BOOL)showsEntityCountFooter
{
  return 0;
}

- (void)addAdditionalMediaEntityPropertiesToFetch:(id)a3
{
  NSMutableSet *additionalUniqueItemPropertiesToFetch;
  NSMutableSet *v5;
  NSMutableSet *v6;
  id v7;

  v7 = a3;
  if (objc_msgSend(v7, "count"))
  {
    additionalUniqueItemPropertiesToFetch = self->_additionalUniqueItemPropertiesToFetch;
    if (!additionalUniqueItemPropertiesToFetch)
    {
      v5 = (NSMutableSet *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCEF0]), "initWithCapacity:", objc_msgSend(v7, "count") + 2);
      v6 = self->_additionalUniqueItemPropertiesToFetch;
      self->_additionalUniqueItemPropertiesToFetch = v5;

      -[NSMutableSet addObject:](self->_additionalUniqueItemPropertiesToFetch, "addObject:", *MEMORY[0x24BDDBBC0]);
      -[NSMutableSet addObject:](self->_additionalUniqueItemPropertiesToFetch, "addObject:", *MEMORY[0x24BDDBBE0]);
      additionalUniqueItemPropertiesToFetch = self->_additionalUniqueItemPropertiesToFetch;
    }
    -[NSMutableSet unionSet:](additionalUniqueItemPropertiesToFetch, "unionSet:", v7);
  }

}

- (void)removeAdditionalMediaEntityPropertiesToFetch:(id)a3
{
  NSMutableSet *additionalUniqueItemPropertiesToFetch;
  id v5;

  v5 = a3;
  if (objc_msgSend(v5, "count"))
  {
    -[NSMutableSet minusSet:](self->_additionalUniqueItemPropertiesToFetch, "minusSet:", v5);
    if (!-[NSMutableSet count](self->_additionalUniqueItemPropertiesToFetch, "count"))
    {
      additionalUniqueItemPropertiesToFetch = self->_additionalUniqueItemPropertiesToFetch;
      self->_additionalUniqueItemPropertiesToFetch = 0;

    }
  }

}

- (void)setIgnoringInvalidationDueToBackgroundApplicationState:(BOOL)a3
{
  if (self->_ignoringInvalidationDueToBackgroundApplicationState != a3)
  {
    self->_ignoringInvalidationDueToBackgroundApplicationState = a3;
    if (self->_invalidateWhenEnteringForeground && !a3)
      -[MPUDataSource invalidate](self, "invalidate");
  }
}

- (void)_invalidateIfNeeded
{
  if (-[MPUQueryDataSource ignoringInvalidationDueToBackgroundApplicationState](self, "ignoringInvalidationDueToBackgroundApplicationState"))
  {
    self->_invalidateWhenEnteringForeground = 1;
  }
  else
  {
    -[MPUDataSource invalidate](self, "invalidate");
  }
}

- (id)_representativeCollection
{
  MPMediaItemCollection *v3;
  MPMediaItemCollection *representativeCollection;

  if (!self->_hasValidRepresentativeCollection)
  {
    self->_hasValidRepresentativeCollection = 1;
    -[MPMediaQuery _representativeCollection](self->_query, "_representativeCollection");
    v3 = (MPMediaItemCollection *)objc_claimAutoreleasedReturnValue();
    representativeCollection = self->_representativeCollection;
    self->_representativeCollection = v3;

  }
  return self->_representativeCollection;
}

- (void)_applicationWillEnterForeground:(id)a3
{
  -[MPUQueryDataSource setIgnoringInvalidationDueToBackgroundApplicationState:](self, "setIgnoringInvalidationDueToBackgroundApplicationState:", 0);
}

- (void)_applicationDidEnterBackground:(id)a3
{
  -[MPUQueryDataSource setIgnoringInvalidationDueToBackgroundApplicationState:](self, "setIgnoringInvalidationDueToBackgroundApplicationState:", 1);
}

- (void)_defaultMediaLibraryDidChangeNotification:(id)a3
{
  MPMediaQuery *query;
  void *v5;

  query = self->_query;
  objc_msgSend(MEMORY[0x24BDDC7F0], "defaultMediaLibrary", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[MPMediaQuery setMediaLibrary:](query, "setMediaLibrary:", v5);

  -[MPUQueryDataSource _invalidateIfNeeded](self, "_invalidateIfNeeded");
}

- (BOOL)_deleteHidesFromCloudForIndex:(unint64_t)a3 hidesAll:(BOOL *)a4
{
  void *v5;
  void *v6;
  void *v7;
  int v8;
  uint64_t isKindOfClass;
  int v10;
  BOOL v11;
  id v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _BYTE v25[128];
  uint64_t v26;

  v26 = *MEMORY[0x24BDAC8D0];
  if (a4)
    *a4 = 0;
  -[MPUDataSource entityAtIndex:](self, "entityAtIndex:", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "mediaLibrary");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDDC7F0], "deviceMediaLibrary");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v6, "isEqual:", v7);

  if (!v8)
    goto LABEL_22;
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();
  if ((isKindOfClass & 1) != 0)
  {
    v10 = __61__MPUQueryDataSource__deleteHidesFromCloudForIndex_hidesAll___block_invoke(isKindOfClass, v5);
    v11 = v10;
    if (a4 && v10)
    {
      v11 = 1;
      *a4 = 1;
    }
    goto LABEL_23;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
LABEL_22:
    v11 = 0;
    goto LABEL_23;
  }
  v12 = v5;
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  objc_msgSend(v12, "items", 0);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
  if (!v14)
  {

LABEL_21:
    goto LABEL_22;
  }
  v15 = v14;
  v16 = 0;
  v17 = *(_QWORD *)v22;
  do
  {
    v18 = 0;
    do
    {
      if (*(_QWORD *)v22 != v17)
        objc_enumerationMutation(v13);
      v14 = __61__MPUQueryDataSource__deleteHidesFromCloudForIndex_hidesAll___block_invoke(v14, *(void **)(*((_QWORD *)&v21 + 1) + 8 * v18));
      v16 += v14;
      ++v18;
    }
    while (v15 != v18);
    v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
    v15 = v14;
  }
  while (v14);

  if (!v16)
    goto LABEL_21;
  if (a4)
  {
    objc_msgSend(v12, "items");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    *a4 = v16 == objc_msgSend(v19, "count");

  }
  v11 = 1;
LABEL_23:

  return v11;
}

uint64_t __61__MPUQueryDataSource__deleteHidesFromCloudForIndex_hidesAll___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  uint64_t v3;
  void *v4;
  uint64_t v5;

  objc_msgSend(a2, "valueForProperty:", *MEMORY[0x24BDDBC70]);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "longLongValue");

  if (!v3)
    return 0;
  objc_msgSend(MEMORY[0x24BDDC708], "sharedCloudController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "hasPurchaseHistoryAccount");

  return v5;
}

- (void)_invalidateForDisplayValuesChangeIfNeeded
{
  id v3;

  if (-[MPUQueryDataSource ignoringInvalidationDueToBackgroundApplicationState](self, "ignoringInvalidationDueToBackgroundApplicationState"))
  {
    self->_invalidateWhenEnteringForeground = 1;
  }
  else
  {
    v3 = objc_alloc_init((Class)objc_msgSend((id)objc_opt_class(), "invalidationContextClass"));
    -[MPUDataSource invalidateWithContext:](self, "invalidateWithContext:", v3);

  }
}

- (id)_sectionInfo
{
  int64_t v3;
  MPMediaQuery *query;
  MPMediaQuerySectionInfo *v5;
  MPMediaQuerySectionInfo *sectionInfo;

  if (!self->_sectionInfo)
  {
    v3 = -[MPUDataSource entityType](self, "entityType");
    query = self->_query;
    if (v3)
      -[MPMediaQuery collectionSectionInfo](query, "collectionSectionInfo");
    else
      -[MPMediaQuery itemSectionInfo](query, "itemSectionInfo");
    v5 = (MPMediaQuerySectionInfo *)objc_claimAutoreleasedReturnValue();
    sectionInfo = self->_sectionInfo;
    self->_sectionInfo = v5;

  }
  return self->_sectionInfo;
}

- (MPMediaQuery)query
{
  return self->_query;
}

- (BOOL)ignoringInvalidationDueToBackgroundApplicationState
{
  return self->_ignoringInvalidationDueToBackgroundApplicationState;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_query, 0);
  objc_storeStrong((id *)&self->_sectionInfo, 0);
  objc_storeStrong((id *)&self->_representativeCollection, 0);
  objc_storeStrong((id *)&self->_additionalUniqueItemPropertiesToFetch, 0);
  objc_storeStrong((id *)&self->_entities, 0);
}

@end
