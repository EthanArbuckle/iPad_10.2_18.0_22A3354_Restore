@implementation CLKCComplicationBundleDataSource

+ (NSString)bundleIdentifier
{
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", a1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "bundleIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

+ (NSOrderedSet)complicationDescriptors
{
  return 0;
}

+ (BOOL)useComplicationDescriptorsOnCompanion
{
  return 0;
}

+ (BOOL)hasMigratedToWidgetForFamily:(int64_t)a3 device:(id)a4
{
  return 0;
}

+ (NSString)localizedAppName
{
  return 0;
}

+ (id)legacyNTKComplicationType
{
  return 0;
}

+ (id)appGroupIdentifier
{
  return 0;
}

+ (NSString)localizedComplicationName
{
  return 0;
}

- (CLKComplicationDescriptor)complicationDescriptor
{
  void *v2;
  void *v3;

  -[CLKCComplicationDataSource complication](self, "complication");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) == 0)
    goto LABEL_6;
  objc_msgSend(v2, "complicationDescriptor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {

LABEL_6:
    objc_msgSend(MEMORY[0x1E0C94148], "legacyComplicationDescriptor");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_7;
  }
  if (!v3)
    goto LABEL_6;
LABEL_7:

  return (CLKComplicationDescriptor *)v3;
}

+ (NSString)complicationApplicationIdentifier
{
  return 0;
}

- (id)complicationApplicationIdentifier
{
  return (id)objc_msgSend((id)objc_opt_class(), "appIdentifier");
}

- (void)getLaunchURLForTimelineEntryDate:(id)a3 timeTravelDate:(id)a4 withHandler:(id)a5
{
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void (**v11)(id, void *);

  v11 = (void (**)(id, void *))a5;
  objc_msgSend((id)objc_opt_class(), "appIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v6, "length"))
  {
    -[CLKCComplicationBundleDataSource complicationApplicationIdentifier](self, "complicationApplicationIdentifier");
    v7 = objc_claimAutoreleasedReturnValue();

    v6 = (void *)v7;
  }
  if (objc_msgSend(v6, "length"))
  {
    v8 = (void *)MEMORY[0x1E0C99E98];
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@://"), v6);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "URLWithString:", v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v10 = 0;
  }
  v11[2](v11, v10);

}

- (void)fetchWidgetMigrationForDescriptor:(id)a3 family:(int64_t)a4 completion:(id)a5
{
  -[CLKCComplicationBundleDataSource fetchWidgetMigrationForDescriptor:completion:](self, "fetchWidgetMigrationForDescriptor:completion:", a3, a5);
}

- (void)fetchWidgetMigrationForDescriptor:(id)a3 completion:(id)a4
{
  (*((void (**)(id, _QWORD))a4 + 2))(a4, 0);
}

@end
