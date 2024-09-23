@implementation NTKBuildNumberComplicationDataSource

- (NTKBuildNumberComplicationDataSource)initWithComplication:(id)a3 family:(int64_t)a4 forDevice:(id)a5
{
  NTKBuildNumberComplicationDataSource *v5;
  NTKBuildNumberComplicationDataSource *v6;
  NTKBuildNumberComplicationDataSource *v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)NTKBuildNumberComplicationDataSource;
  v5 = -[CLKCComplicationDataSource initWithComplication:family:forDevice:](&v9, sel_initWithComplication_family_forDevice_, a3, a4, a5);
  v6 = v5;
  if (v5)
    v7 = v5;

  return v6;
}

- (id)_currentTimelineEntry
{
  void *v3;
  void *v4;
  void *v5;

  NTKBuildVersion(self, a2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[NTKBuildNumberComplicationEntryModel modelWithBuildNum:](NTKBuildNumberComplicationEntryModel, "modelWithBuildNum:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "entryForComplicationFamily:", -[CLKCComplicationDataSource family](self, "family"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)currentSwitcherTemplate
{
  void *v2;
  void *v3;

  -[NTKBuildNumberComplicationDataSource _currentTimelineEntry](self, "_currentTimelineEntry");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "complicationTemplate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (void)getCurrentTimelineEntryWithHandler:(id)a3
{
  id v5;
  id v6;

  v5 = a3;
  -[NTKBuildNumberComplicationDataSource _currentTimelineEntry](self, "_currentTimelineEntry");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  (*((void (**)(id, id))a3 + 2))(v5, v6);

}

+ (BOOL)acceptsComplicationType:(unint64_t)a3 forDevice:(id)a4
{
  if (a3 == 52)
    return NTKInternalBuild(a1, a2, 52, a4);
  else
    return 0;
}

+ (BOOL)acceptsComplicationFamily:(int64_t)a3 forDevice:(id)a4
{
  return a3 == 12 || (a3 & 0xFFFFFFFFFFFFFFFCLL) == 8 || (a3 & 0xFFFFFFFFFFFFFFFDLL) == 1;
}

@end
