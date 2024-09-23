@implementation NTKLocalBundleTimelineComplicationController

+ (BOOL)acceptsComplication:(id)a3 family:(int64_t)a4 forDevice:(id)a5
{
  id v7;
  id v8;
  void *v9;
  BOOL v10;

  v7 = a3;
  v8 = a5;
  if (objc_msgSend(v7, "complicationType"))
  {
    +[NTKBundleComplicationManager sharedManager](NTKBundleComplicationManager, "sharedManager");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "dataSourceClassForBundleComplication:withFamily:andDevice:factorInMigration:", v7, a4, v8, 1) != 0;

  }
  else
  {
    v10 = 0;
  }

  return v10;
}

+ (BOOL)_acceptsComplicationType:(unint64_t)a3 family:(int64_t)a4 forDevice:(id)a5
{
  id v7;
  BOOL v8;
  void *v9;
  void *v10;

  v7 = a5;
  if (a3 <= 0x30 && ((1 << a3) & 0x1000080000001) != 0)
  {
    v8 = 0;
  }
  else
  {
    +[NTKComplication anyComplicationOfType:](NTKComplication, "anyComplicationOfType:", a3);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    +[NTKBundleComplicationManager sharedManager](NTKBundleComplicationManager, "sharedManager");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v10, "dataSourceClassForBundleComplication:withFamily:andDevice:factorInMigration:", v9, a4, v7, 1) != 0;

  }
  return v8;
}

+ (Class)dataSourceFromComplication:(id)a3 family:(int64_t)a4 forDevice:(id)a5
{
  id v7;
  id v8;
  void *v9;
  void *v10;

  v7 = a3;
  v8 = a5;
  if (objc_msgSend(v7, "complicationType"))
  {
    +[NTKBundleComplicationManager sharedManager](NTKBundleComplicationManager, "sharedManager");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "dataSourceClassForBundleComplication:withFamily:andDevice:factorInMigration:", v7, a4, v8, 1);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v10 = 0;
  }

  return (Class)v10;
}

+ (Class)complicationDataSourceClassForComplication:(id)a3 family:(int64_t)a4 device:(id)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  objc_super v15;

  v8 = a3;
  v9 = a5;
  +[NTKBundleComplicationManager sharedManager](NTKBundleComplicationManager, "sharedManager");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (void *)objc_msgSend(v10, "dataSourceClassForBundleComplication:withFamily:andDevice:factorInMigration:", v8, a4, v9, 1);

  if (v11)
  {
    v12 = v11;
  }
  else
  {
    v15.receiver = a1;
    v15.super_class = (Class)&OBJC_METACLASS___NTKLocalBundleTimelineComplicationController;
    objc_msgSendSuper2(&v15, sel_complicationDataSourceClassForComplication_family_device_, v8, a4, v9);
    v12 = (id)objc_claimAutoreleasedReturnValue();
  }
  v13 = v12;

  return (Class)v13;
}

+ (BOOL)_acceptsComplicationType:(unint64_t)a3 forDevice:(id)a4
{
  return 0;
}

@end
