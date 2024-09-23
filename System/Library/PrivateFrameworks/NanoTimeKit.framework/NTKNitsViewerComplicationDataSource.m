@implementation NTKNitsViewerComplicationDataSource

- (NTKNitsViewerComplicationDataSource)initWithComplication:(id)a3 family:(int64_t)a4 forDevice:(id)a5
{
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)NTKNitsViewerComplicationDataSource;
  return -[CLKCComplicationDataSource initWithComplication:family:forDevice:](&v6, sel_initWithComplication_family_forDevice_, a3, a4, a5);
}

- (void)dealloc
{
  objc_super v2;

  v2.receiver = self;
  v2.super_class = (Class)NTKNitsViewerComplicationDataSource;
  -[NTKNitsViewerComplicationDataSource dealloc](&v2, sel_dealloc);
}

- (id)currentSwitcherTemplate
{
  void *v2;
  void *v3;

  -[NTKNitsViewerComplicationDataSource _currentTimelineEntry](self, "_currentTimelineEntry");
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
  -[NTKNitsViewerComplicationDataSource _currentTimelineEntry](self, "_currentTimelineEntry");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  (*((void (**)(id, id))a3 + 2))(v5, v6);

}

+ (BOOL)acceptsComplicationType:(unint64_t)a3 forDevice:(id)a4
{
  if (a3 == 58)
    return NTKInternalBuild(a1, a2, 58, a4);
  else
    return 0;
}

+ (BOOL)acceptsComplicationFamily:(int64_t)a3 forDevice:(id)a4
{
  return (a3 & 0xFFFFFFFFFFFFFFFCLL) == 8;
}

- (void)resume
{
  id location;

  objc_initWeak(&location, self);
  objc_destroyWeak(&location);
}

- (id)alwaysOnTemplate
{
  void *v3;
  void *v4;
  void *v5;

  +[NTKNitsViewerComplicationEntryModel tritiumModel](NTKNitsViewerComplicationEntryModel, "tritiumModel");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "entryForComplicationFamily:", -[CLKCComplicationDataSource family](self, "family"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "complicationTemplate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)_currentTimelineEntry
{
  double v2;
  void *v4;
  void *v5;

  LODWORD(v2) = -1082130432;
  +[NTKNitsViewerComplicationEntryModel modelWithNits:](NTKNitsViewerComplicationEntryModel, "modelWithNits:", v2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "entryForComplicationFamily:", -[CLKCComplicationDataSource family](self, "family"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_updateTimer, 0);
}

@end
