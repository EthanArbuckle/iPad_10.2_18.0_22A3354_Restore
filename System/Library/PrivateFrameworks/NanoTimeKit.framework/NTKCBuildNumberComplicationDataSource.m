@implementation NTKCBuildNumberComplicationDataSource

- (NTKCBuildNumberComplicationDataSource)initWithComplication:(id)a3 family:(int64_t)a4 forDevice:(id)a5
{
  NTKCBuildNumberComplicationDataSource *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  NRDevice *nrDevice;
  uint64_t v11;
  NSString *companionBuild;
  NTKCBuildNumberComplicationDataSource *v13;
  objc_super v15;

  v15.receiver = self;
  v15.super_class = (Class)NTKCBuildNumberComplicationDataSource;
  v5 = -[CLKCComplicationDataSource initWithComplication:family:forDevice:](&v15, sel_initWithComplication_family_forDevice_, a3, a4, a5);
  if (v5)
  {
    objc_msgSend(MEMORY[0x1E0D51838], "sharedInstance");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0D51838], "activeDeviceSelectorBlock");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "getAllDevicesWithArchivedDevicesMatching:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "firstObject");
    v9 = objc_claimAutoreleasedReturnValue();
    nrDevice = v5->nrDevice;
    v5->nrDevice = (NRDevice *)v9;

    -[NRDevice valueForProperty:](v5->nrDevice, "valueForProperty:", *MEMORY[0x1E0D51760]);
    v11 = objc_claimAutoreleasedReturnValue();
    companionBuild = v5->companionBuild;
    v5->companionBuild = (NSString *)v11;

    v13 = v5;
  }

  return v5;
}

- (id)_currentTimelineEntry
{
  void *v3;
  void *v4;

  +[NTKCBuildNumberComplicationEntryModel modelWithBuildNum:](NTKCBuildNumberComplicationEntryModel, "modelWithBuildNum:", self->companionBuild);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "entryForComplicationFamily:", -[CLKCComplicationDataSource family](self, "family"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)currentSwitcherTemplate
{
  void *v2;
  void *v3;

  -[NTKCBuildNumberComplicationDataSource _currentTimelineEntry](self, "_currentTimelineEntry");
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
  -[NTKCBuildNumberComplicationDataSource _currentTimelineEntry](self, "_currentTimelineEntry");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  (*((void (**)(id, id))a3 + 2))(v5, v6);

}

+ (BOOL)acceptsComplicationType:(unint64_t)a3 forDevice:(id)a4
{
  if (a3 == 53)
    return NTKInternalBuild(a1, a2, 53, a4);
  else
    return 0;
}

+ (BOOL)acceptsComplicationFamily:(int64_t)a3 forDevice:(id)a4
{
  return (a3 & 0xFFFFFFFFFFFFFFFCLL) == 8 || (a3 & 0xFFFFFFFFFFFFFFFDLL) == 1 || a3 == 12;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->companionBuild, 0);
  objc_storeStrong((id *)&self->nrDevice, 0);
}

@end
