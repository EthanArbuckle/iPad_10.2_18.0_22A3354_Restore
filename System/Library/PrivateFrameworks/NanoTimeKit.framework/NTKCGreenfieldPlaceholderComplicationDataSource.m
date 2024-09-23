@implementation NTKCGreenfieldPlaceholderComplicationDataSource

- (NTKCGreenfieldPlaceholderComplicationDataSource)initWithComplication:(id)a3 family:(int64_t)a4 forDevice:(id)a5
{
  id v9;
  id v10;
  NTKCGreenfieldPlaceholderComplicationDataSource *v11;
  NTKCGreenfieldPlaceholderComplicationDataSource *v12;
  NSObject *v13;
  NTKCGreenfieldPlaceholderComplicationDataSource *v14;
  NSObject *v15;
  objc_super v17;
  uint8_t buf[4];
  id v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v10 = a5;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v17.receiver = self;
    v17.super_class = (Class)NTKCGreenfieldPlaceholderComplicationDataSource;
    v11 = -[CLKCComplicationDataSource initWithComplication:family:forDevice:](&v17, sel_initWithComplication_family_forDevice_, v9, a4, v10);
    v12 = v11;
    if (v11)
    {
      objc_storeStrong((id *)&v11->_placeholderComplication, a3);
      _NTKLoggingObjectForDomain(43, (uint64_t)"NTKLoggingDomainGreenfield");
      v13 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        v19 = v9;
        _os_log_impl(&dword_1B72A3000, v13, OS_LOG_TYPE_DEFAULT, "NTKCGreenfieldPlaceholderComplicationDataSource: Created for complication: %@", buf, 0xCu);
      }

    }
    self = v12;
    v14 = self;
  }
  else
  {
    _NTKLoggingObjectForDomain(43, (uint64_t)"NTKLoggingDomainGreenfield");
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      -[NTKCGreenfieldPlaceholderComplicationDataSource initWithComplication:family:forDevice:].cold.1((uint64_t)v9, v15);

    v14 = 0;
  }

  return v14;
}

- (void)pause
{
  objc_super v2;

  v2.receiver = self;
  v2.super_class = (Class)NTKCGreenfieldPlaceholderComplicationDataSource;
  -[CLKCComplicationDataSource pause](&v2, sel_pause);
}

- (void)resume
{
  objc_super v2;

  v2.receiver = self;
  v2.super_class = (Class)NTKCGreenfieldPlaceholderComplicationDataSource;
  -[CLKCComplicationDataSource resume](&v2, sel_resume);
}

- (Class)richComplicationDisplayViewClassForDevice:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  objc_class *v11;
  id v12;
  void *v13;
  int64_t v14;
  void *v15;

  v4 = a3;
  -[CLKCComplicationDataSource complication](self, "complication");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "complicationType") == 48)
    goto LABEL_8;
  -[CLKCComplicationDataSource complication](self, "complication");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v6, "complicationType") == 55)
  {

    goto LABEL_8;
  }
  -[CLKCComplicationDataSource complication](self, "complication");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "complicationType");

  if (v8 != 31)
  {
    -[CLKCComplicationDataSource complication](self, "complication");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = +[NTKLocalTimelineComplicationController complicationDataSourceClassForComplication:family:device:](NTKLocalTimelineComplicationController, "complicationDataSourceClassForComplication:family:device:", v10, -[CLKCComplicationDataSource family](self, "family"), v4);

    v12 = [v11 alloc];
    -[CLKCComplicationDataSource complication](self, "complication");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = -[CLKCComplicationDataSource family](self, "family");
    -[CLKCComplicationDataSource context](self, "context");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = (void *)objc_msgSend(v12, "initWithComplication:family:forDevice:context:", v13, v14, v4, v15);

    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      objc_msgSend(v5, "richComplicationDisplayViewClassForDevice:", v4);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_9:

      goto LABEL_10;
    }
LABEL_8:
    v9 = 0;
    goto LABEL_9;
  }
  v9 = 0;
LABEL_10:

  return (Class)v9;
}

+ (BOOL)acceptsComplicationType:(unint64_t)a3 forDevice:(id)a4
{
  return a3 == 55;
}

+ (BOOL)acceptsComplicationFamily:(int64_t)a3 forDevice:(id)a4
{
  return ((unint64_t)a3 < 0xD) & (0x1FDFu >> a3);
}

- (id)currentSwitcherTemplate
{
  void *v2;
  void *v3;

  -[NTKCGreenfieldPlaceholderComplicationDataSource _currentTimelineEntry](self, "_currentTimelineEntry");
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
  -[NTKCGreenfieldPlaceholderComplicationDataSource _currentTimelineEntry](self, "_currentTimelineEntry");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  (*((void (**)(id, id))a3 + 2))(v5, v6);

}

- (id)_currentTimelineEntry
{
  CLKComplicationTimelineEntry *cachedTimelineEntry;
  CLKComplicationTimelineEntry *v3;
  void *v5;
  void *v6;
  double v7;
  void *v8;
  CLKComplicationTimelineEntry *v9;
  CLKComplicationTimelineEntry *v10;

  cachedTimelineEntry = self->_cachedTimelineEntry;
  if (cachedTimelineEntry)
  {
    v3 = cachedTimelineEntry;
  }
  else
  {
    -[NTKGreenfieldPlaceholderComplication appStoreItemId](self->_placeholderComplication, "appStoreItemId");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    if (v5)
    {
      -[NTKGreenfieldPlaceholderComplication appName](self->_placeholderComplication, "appName");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      LODWORD(v7) = 1.0;
      +[NTKGreenfieldPlaceholderTimelineEntryModel entryModelWithAppIcon:appName:installationProgress:](NTKGreenfieldPlaceholderTimelineEntryModel, "entryModelWithAppIcon:appName:installationProgress:", 0, v6, v7);
      v8 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      +[NTKGreenfieldPlaceholderTimelineEntryModel entryModelWithNullState](NTKGreenfieldPlaceholderTimelineEntryModel, "entryModelWithNullState");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(v8, "entryForComplicationFamily:", -[CLKCComplicationDataSource family](self, "family"));
    v9 = (CLKComplicationTimelineEntry *)objc_claimAutoreleasedReturnValue();
    v10 = self->_cachedTimelineEntry;
    self->_cachedTimelineEntry = v9;

    v3 = self->_cachedTimelineEntry;
  }
  return v3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cachedTimelineEntry, 0);
  objc_storeStrong((id *)&self->_placeholderComplication, 0);
}

- (void)initWithComplication:(uint64_t)a1 family:(NSObject *)a2 forDevice:.cold.1(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v2 = 138412290;
  v3 = a1;
  _os_log_error_impl(&dword_1B72A3000, a2, OS_LOG_TYPE_ERROR, "NTKCGreenfieldPlaceholderComplicationDataSource: invalid complication type: %@", (uint8_t *)&v2, 0xCu);
}

@end
