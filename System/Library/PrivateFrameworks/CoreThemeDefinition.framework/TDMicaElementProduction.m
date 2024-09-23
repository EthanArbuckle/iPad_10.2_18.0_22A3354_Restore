@implementation TDMicaElementProduction

- (void)dealloc
{
  objc_super v2;

  v2.receiver = self;
  v2.super_class = (Class)TDMicaElementProduction;
  -[TDMicaElementProduction dealloc](&v2, sel_dealloc);
}

- (id)baseKeySpec
{
  void *v3;

  -[TDMicaElementProduction willAccessValueForKey:](self, "willAccessValueForKey:", CFSTR("baseKeySpec"));
  v3 = (void *)-[TDMicaElementProduction primitiveValueForKey:](self, "primitiveValueForKey:", CFSTR("baseKeySpec"));
  -[TDMicaElementProduction didAccessValueForKey:](self, "didAccessValueForKey:", CFSTR("baseKeySpec"));
  return v3;
}

- (id)relativePath
{
  return (id)objc_msgSend((id)-[TDMicaElementProduction asset](self, "asset"), "sourceRelativePath");
}

- (id)associatedFileURLWithDocument:(id)a3
{
  return (id)objc_msgSend((id)-[TDMicaElementProduction asset](self, "asset"), "fileURLWithDocument:", a3);
}

- (BOOL)generateRenditionsWithEntityName:(id)a3 document:(id)a4 errorDescription:(id *)a5
{
  return 1;
}

- (void)deleteRenditionsInDocument:(id)a3 shouldDeleteAssetFiles:(BOOL)a4
{
  _BOOL4 v4;
  void *v7;
  void *v8;
  void *v9;

  v4 = a4;
  objc_msgSend(a3, "deleteObjects:", objc_msgSend((id)-[TDMicaElementProduction renditions](self, "renditions"), "allObjects"));
  v7 = (void *)-[TDMicaElementProduction asset](self, "asset");
  v8 = v7;
  if (v4)
  {
    v9 = (void *)objc_msgSend(v7, "fileURLWithDocument:", a3);
    if (objc_msgSend(v9, "checkResourceIsReachableAndReturnError:", 0))
    {
      objc_msgSend(a3, "assetManagementDelegate");
      if ((objc_opt_respondsToSelector() & 1) != 0)
        objc_msgSend((id)objc_msgSend(a3, "assetManagementDelegate"), "willDeleteAsset:atURL:", v8, v9);
      objc_msgSend((id)objc_msgSend(MEMORY[0x24BDD1580], "defaultManager"), "removeItemAtURL:error:", v9, 0);
      objc_msgSend(a3, "assetManagementDelegate");
      if ((objc_opt_respondsToSelector() & 1) != 0)
        objc_msgSend((id)objc_msgSend(a3, "assetManagementDelegate"), "didDeleteAssetAtURL:", v9);
    }
  }
  objc_msgSend(a3, "deleteObject:", v8);
}

- (void)copyAttributesInto:(id)a3
{
  objc_msgSend(a3, "setRenditionType:", -[TDMicaElementProduction renditionType](self, "renditionType"));
  objc_msgSend(a3, "setValue:forKey:", -[TDMicaElementProduction valueForKey:](self, "valueForKey:", CFSTR("comment")), CFSTR("comment"));
}

- (id)dataFromAttributes
{
  void *v3;
  void *v4;

  v3 = (void *)objc_msgSend(MEMORY[0x24BDBCED8], "dictionaryWithCapacity:", 7);
  v4 = (void *)-[TDMicaElementProduction renditionType](self, "renditionType");
  if (v4)
    objc_msgSend(v3, "setObject:forKey:", objc_msgSend((id)objc_msgSend((id)objc_msgSend(v4, "objectID"), "URIRepresentation"), "absoluteString"), CFSTR("renditionType"));
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(-[TDMicaElementProduction baseKeySpec](self, "baseKeySpec"), "dataFromAttributes"), CFSTR("baseKeySpec"));
  return (id)objc_msgSend(MEMORY[0x24BDD1770], "dataWithPropertyList:format:options:error:", v3, 200, 0, 0);
}

- (void)setAttributesFromData:(id)a3
{
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;

  v4 = (void *)objc_msgSend(MEMORY[0x24BDD1770], "propertyListWithData:options:format:error:", a3, 0, 0, 0);
  v5 = (void *)-[TDMicaElementProduction managedObjectContext](self, "managedObjectContext");
  v6 = objc_msgSend(v4, "objectForKey:", CFSTR("baseKeySpec"));
  if (v6)
    objc_msgSend(-[TDMicaElementProduction baseKeySpec](self, "baseKeySpec"), "setAttributesFromData:", v6);
  v7 = objc_msgSend(v4, "objectForKey:", CFSTR("renditionType"));
  if (v7)
    -[TDMicaElementProduction setRenditionType:](self, "setRenditionType:", objc_msgSend(v5, "objectWithID:", objc_msgSend((id)objc_msgSend(v5, "persistentStoreCoordinator"), "managedObjectIDForURIRepresentation:", objc_msgSend(MEMORY[0x24BDBCF48], "URLWithString:", v7))));
}

- (id)copyDataFromAttributes
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  v3 = (void *)objc_msgSend(MEMORY[0x24BDBCED8], "dictionaryWithCapacity:", 14);
  v4 = -[TDMicaElementProduction valueForKey:](self, "valueForKey:", CFSTR("comment"));
  if (v4)
    objc_msgSend(v3, "setObject:forKey:", v4, CFSTR("comment"));
  v5 = -[TDMicaElementProduction valueForKey:](self, "valueForKey:", CFSTR("isExcludedFromFilter"));
  if (v5)
    objc_msgSend(v3, "setObject:forKey:", v5, CFSTR("isExcludedFromFilter"));
  v6 = (void *)-[TDMicaElementProduction valueForKey:](self, "valueForKey:", CFSTR("renditionType"));
  if (v6)
    objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", objc_msgSend(v6, "identifier")), CFSTR("renditionType"));
  v7 = (void *)-[TDMicaElementProduction valueForKey:](self, "valueForKey:", CFSTR("renditionSubtype"));
  if (v7)
    objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", objc_msgSend(v7, "identifier")), CFSTR("renditionSubtype"));
  v8 = (void *)-[TDMicaElementProduction valueForKey:](self, "valueForKey:", CFSTR("baseKeySpec"));
  if (v8)
    objc_msgSend(v3, "setObject:forKey:", (id)objc_msgSend(v8, "copyDataFromAttributes"), CFSTR("baseKeySpec"));
  v9 = (void *)-[TDMicaElementProduction asset](self, "asset");
  if (v9)
    objc_msgSend(v3, "setObject:forKey:", (id)objc_msgSend(v9, "copyDataFromAttributes"), CFSTR("asset"));
  v10 = (void *)-[TDMicaElementProduction mutableSetValueForKey:](self, "mutableSetValueForKey:", CFSTR("renditions"));
  if (objc_msgSend(v10, "count"))
  {
    v11 = (void *)objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithCapacity:", objc_msgSend(v10, "count"));
    v18 = 0u;
    v19 = 0u;
    v20 = 0u;
    v21 = 0u;
    v12 = (void *)objc_msgSend(v10, "allObjects", 0);
    v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
    if (v13)
    {
      v14 = v13;
      v15 = *(_QWORD *)v19;
      do
      {
        v16 = 0;
        do
        {
          if (*(_QWORD *)v19 != v15)
            objc_enumerationMutation(v12);
          objc_msgSend(v11, "addObject:", (id)objc_msgSend(*(id *)(*((_QWORD *)&v18 + 1) + 8 * v16++), "copyDataFromAttributes"));
        }
        while (v14 != v16);
        v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
      }
      while (v14);
    }
    objc_msgSend(v3, "setObject:forKey:", v11, CFSTR("renditions"));
  }
  return (id)objc_msgSend((id)objc_msgSend(MEMORY[0x24BDD1770], "dataWithPropertyList:format:options:error:", v3, 200, 0, 0), "copy");
}

- (void)setAttributesFromCopyData:(id)a3
{
  void *v4;
  uint64_t v5;
  uint64_t v6;

  v4 = (void *)objc_msgSend(MEMORY[0x24BDD1770], "propertyListWithData:options:format:error:", a3, 0, 0, 0);
  v5 = objc_msgSend(v4, "objectForKey:", CFSTR("comment"));
  if (v5)
    -[TDMicaElementProduction setValue:forKey:](self, "setValue:forKey:", v5, CFSTR("comment"));
  v6 = objc_msgSend(v4, "objectForKey:", CFSTR("isExcludedFromFilter"));
  if (v6)
    -[TDMicaElementProduction setValue:forKey:](self, "setValue:forKey:", v6, CFSTR("isExcludedFromFilter"));
}

@end
