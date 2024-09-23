@implementation LSPlugInQueryAllUnits

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)sort:(BOOL)a3 pluginIDs:(id)a4 andYield:(id)a5 context:(LSContext *)a6
{
  id v8;
  id v9;
  LSPlugInQueryAllUnitsResult *v10;
  void *v11;
  LSPlugInQueryAllUnitsResult *v12;
  id v13;

  v8 = a5;
  v9 = a4;
  v10 = [LSPlugInQueryAllUnitsResult alloc];
  objc_msgSend(v9, "allObjects");
  v13 = (id)objc_claimAutoreleasedReturnValue();

  _LSDatabaseGetCacheGUID();
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = -[LSPlugInQueryAllUnitsResult initWithPlugInUnits:forDatabaseWithUUID:](v10, "initWithPlugInUnits:forDatabaseWithUUID:", v13, v11);
  (*((void (**)(id, LSPlugInQueryAllUnitsResult *, _QWORD))a5 + 2))(v8, v12, 0);

}

@end
