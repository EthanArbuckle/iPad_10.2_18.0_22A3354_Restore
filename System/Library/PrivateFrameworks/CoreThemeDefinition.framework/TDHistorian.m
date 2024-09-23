@implementation TDHistorian

- (id)_updateRecordsWithName:(id)a3 sinceDate:(id)a4
{
  return -[CoreThemeDocument objectsForEntity:withPredicate:sortDescriptors:](self->document, "objectsForEntity:withPredicate:sortDescriptors:", a3, objc_msgSend(MEMORY[0x24BDD1758], "predicateWithFormat:", CFSTR("dateOfLastChange > %@"), a4), 0);
}

- (void)_updateEntryForManagedObject:(id)a3
{
  void *v4;
  uint64_t v5;
  double v6;

  v4 = (void *)objc_msgSend(MEMORY[0x24BDBCE60], "date");
  v5 = objc_msgSend(a3, "dateOfLastChange");
  if (!v5 || (objc_msgSend(v4, "timeIntervalSinceDate:", v5), v6 > 5.0))
  {
    objc_msgSend(a3, "setDateOfLastChange:", v4);
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      objc_msgSend((id)objc_msgSend(a3, "production"), "setDateOfLastChange:", v4);
  }
}

- (void)updateEntriesForManagedObjects:(id)a3
{
  unint64_t v5;
  uint64_t v6;

  if (objc_msgSend(a3, "count"))
  {
    v5 = 0;
    do
    {
      v6 = objc_msgSend(a3, "objectAtIndex:", v5);
      if ((objc_opt_respondsToSelector() & 1) != 0)
        -[TDHistorian _updateEntryForManagedObject:](self, "_updateEntryForManagedObject:", v6);
      ++v5;
    }
    while (v5 < objc_msgSend(a3, "count"));
  }
}

- (BOOL)foundDataChangesSinceDate:(id)a3
{
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v5 = -[CoreThemeDocument allObjectsForEntity:withSortDescriptors:](self->document, "allObjectsForEntity:withSortDescriptors:", CFSTR("ElementProduction"), 0);
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v12;
    while (2)
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v12 != v8)
          objc_enumerationMutation(v5);
        if (objc_msgSend(a3, "compare:", objc_msgSend(*(id *)(*((_QWORD *)&v11 + 1) + 8 * v9), "associatedFileModificationDateWithDocument:", self->document)) == -1)
        {
          LOBYTE(v6) = 1;
          return v6;
        }
        ++v9;
      }
      while (v7 != v9);
      v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
      v7 = v6;
      if (v6)
        continue;
      break;
    }
  }
  return v6;
}

- (id)productionsWithModifiedAssets
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  CTDPSDPreviewRef *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  unsigned int v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  unsigned int v22;
  unsigned int v23;
  uint64_t v24;
  uint64_t v25;
  void *v27;
  id obj;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  _BYTE v33[128];
  uint64_t v34;

  v34 = *MEMORY[0x24BDAC8D0];
  v27 = (void *)objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v3 = -[CoreThemeDocument allObjectsForEntity:withSortDescriptors:](self->document, "allObjectsForEntity:withSortDescriptors:", CFSTR("PhotoshopElementProduction"), 0);
  v29 = 0u;
  v30 = 0u;
  v31 = 0u;
  v32 = 0u;
  obj = v3;
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v29, v33, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v30;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v30 != v6)
          objc_enumerationMutation(obj);
        v8 = *(void **)(*((_QWORD *)&v29 + 1) + 8 * v7);
        v9 = (void *)objc_msgSend(v8, "associatedFileModificationDateWithDocument:", self->document);
        if (v9 && objc_msgSend(v9, "compare:", objc_msgSend(v8, "dateOfLastChange")) == 1)
        {
          v10 = -[CTDPSDPreviewRef initWithPath:]([CTDPSDPreviewRef alloc], "initWithPath:", objc_msgSend((id)objc_msgSend((id)objc_msgSend(v8, "asset"), "fileURLWithDocument:", self->document), "path"));
          v11 = (void *)objc_msgSend(v8, "valueForKey:", CFSTR("renditions"));
          if (objc_msgSend(v11, "count"))
          {
            v12 = objc_msgSend(MEMORY[0x24BDD17C0], "sortDescriptorWithKey:ascending:", CFSTR("layer"), 1);
            v13 = (void *)objc_msgSend(v11, "allObjects");
            v14 = (void *)objc_msgSend(v13, "sortedArrayUsingDescriptors:", objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObject:", v12));
            v15 = objc_msgSend((id)objc_msgSend((id)objc_msgSend(v14, "lastObject"), "valueForKey:", CFSTR("layer")), "integerValue");
          }
          else
          {
            v14 = 0;
            v15 = -1;
          }
          v16 = -[CUIPSDImageRef numberOfLayers](v10, "numberOfLayers") - 1;
          if (v14 && v15 == v16)
          {
            v17 = objc_msgSend((id)objc_msgSend(v14, "filteredArrayUsingPredicate:", objc_msgSend(MEMORY[0x24BDD1758], "predicateWithFormat:", CFSTR("layer == %d"), 0)), "count");
            v18 = objc_msgSend((id)objc_msgSend(v8, "renditionType"), "identifier");
            if (v18 == 8 || v18 == 5)
            {
              v19 = -[CTDPSDPreviewRef sliceRowCount](v10, "sliceRowCount");
              if (!(v19 % (int)objc_msgSend((id)objc_msgSend(v8, "rowCount"), "intValue")))
              {
                v20 = -[CTDPSDPreviewRef sliceColumnCount](v10, "sliceColumnCount");
                if (!(v20 % (int)objc_msgSend((id)objc_msgSend(v8, "columnCount"), "intValue")))
                  goto LABEL_20;
              }
            }
            else
            {
              v21 = v18;
              -[CTDPSDPreviewRef evaluateSliceGrid](v10, "evaluateSliceGrid");
              if ((_DWORD)v21 == 6)
              {
                v22 = 1;
                v23 = 1;
              }
              else
              {
                v22 = +[TDPhotoshopElementProduction sliceRowsPerRendition:](TDPhotoshopElementProduction, "sliceRowsPerRendition:", v21);
                v23 = +[TDPhotoshopElementProduction sliceColumnsPerRendition:](TDPhotoshopElementProduction, "sliceColumnsPerRendition:", v21);
              }
              v24 = (uint64_t)(double)(-[CTDPSDPreviewRef sliceRowCount](v10, "sliceRowCount") / v22);
              if (v17 == (uint64_t)(double)(-[CTDPSDPreviewRef sliceColumnCount](v10, "sliceColumnCount") / v23) * v24)
                goto LABEL_20;
            }
LABEL_19:
            NSLog(CFSTR("Need to update production with modified asset: %@"), objc_msgSend((id)objc_msgSend(v8, "asset"), "path"));
            objc_msgSend(v27, "addObject:", v8);
          }
          else if (v15 != v16)
          {
            goto LABEL_19;
          }
LABEL_20:

        }
        ++v7;
      }
      while (v5 != v7);
      v25 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v29, v33, 16);
      v5 = v25;
    }
    while (v25);
  }
  return v27;
}

- (id)productionsChangedSinceDate:(id)a3 uuidNeedsReset:(BOOL *)a4
{
  void *v7;
  id v8;
  BOOL v9;
  void *v10;
  uint64_t v11;
  void *v12;
  id v13;
  void *v14;
  double v15;
  double v16;
  double v17;

  v7 = (void *)objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v8 = objc_alloc_init(MEMORY[0x24BDD1460]);
  objc_msgSend(v7, "addObjectsFromArray:", -[TDHistorian _updateRecordsWithName:sinceDate:](self, "_updateRecordsWithName:sinceDate:", CFSTR("ElementProduction"), a3));
  if (a4)
  {
    v9 = *a4 || objc_msgSend(v7, "count") != 0;
    *a4 = v9;
  }
  v10 = (void *)objc_msgSend(-[CoreThemeDocument allObjectsForEntity:withSortDescriptors:](self->document, "allObjectsForEntity:withSortDescriptors:", CFSTR("ElementProduction"), 0), "objectEnumerator");
  v11 = objc_msgSend(v10, "nextObject");
  if (v11)
  {
    v12 = (void *)v11;
    do
    {
      if ((objc_msgSend(v7, "containsObject:", v12) & 1) != 0)
        break;
      v13 = objc_alloc_init(MEMORY[0x24BDD1460]);
      v14 = (void *)objc_msgSend(v12, "associatedFileModificationDateWithDocument:", self->document);
      objc_msgSend(a3, "timeIntervalSinceReferenceDate");
      if (v14)
      {
        v16 = v15;
        objc_msgSend(v14, "timeIntervalSinceReferenceDate");
        if (v17 > v16)
          objc_msgSend(v7, "addObject:", v12);
      }
      objc_msgSend(v13, "drain");
      v12 = (void *)objc_msgSend(v10, "nextObject");
    }
    while (v12);
  }
  objc_msgSend(v8, "drain");
  return v7;
}

- (id)colorsChangedSinceDate:(id)a3
{
  return -[TDHistorian _updateRecordsWithName:sinceDate:](self, "_updateRecordsWithName:sinceDate:", CFSTR("ColorDefinition"), a3);
}

- (id)fontsChangedSinceDate:(id)a3
{
  return -[TDHistorian _updateRecordsWithName:sinceDate:](self, "_updateRecordsWithName:sinceDate:", CFSTR("FontDefinition"), a3);
}

- (id)fontSizesChangedSinceDate:(id)a3
{
  return -[TDHistorian _updateRecordsWithName:sinceDate:](self, "_updateRecordsWithName:sinceDate:", CFSTR("FontSizeDefinition"), a3);
}

- (id)namedElementsChangedSinceDate:(id)a3
{
  return -[TDHistorian _updateRecordsWithName:sinceDate:](self, "_updateRecordsWithName:sinceDate:", CFSTR("NamedElement"), a3);
}

- (id)facetDefinitionsChangedSinceDate:(id)a3
{
  return -[TDHistorian _updateRecordsWithName:sinceDate:](self, "_updateRecordsWithName:sinceDate:", CFSTR("FacetDefinition"), a3);
}

- (id)keySpecsForRenditionsRemovedSinceDate:(id)a3
{
  return (id)objc_msgSend(-[TDHistorian _updateRecordsWithName:sinceDate:](self, "_updateRecordsWithName:sinceDate:", CFSTR("RenditionSpec"), a3), "valueForKey:", CFSTR("keySpec"));
}

- (TDHistorian)initWithDocument:(id)a3
{
  TDHistorian *result;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)TDHistorian;
  result = -[TDHistorian init](&v5, sel_init);
  result->document = (CoreThemeDocument *)a3;
  return result;
}

@end
