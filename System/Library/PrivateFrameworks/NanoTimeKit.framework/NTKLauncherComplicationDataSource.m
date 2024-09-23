@implementation NTKLauncherComplicationDataSource

+ (BOOL)acceptsComplicationType:(unint64_t)a3 withFamily:(int64_t)a4 forDevice:(id)a5
{
  id v7;
  char v8;
  BOOL v9;
  BOOL v12;
  BOOL v13;

  v7 = a5;
  if (+[NTKWidgetComplicationMigrationDefines hasMigratedComplicationType:forDevice:](NTKWidgetComplicationMigrationDefines, "hasMigratedComplicationType:forDevice:", a3, v7))
  {
    goto LABEL_2;
  }
  if (a3 > 0x2E)
    goto LABEL_12;
  if (((1 << a3) & 0x1B200000) != 0)
  {
    if ((unint64_t)(a4 - 8) <= 2)
    {
      v8 = objc_msgSend(v7, "nrDeviceVersion") > 0x50100;
      goto LABEL_30;
    }
    goto LABEL_13;
  }
  if (a3 != 33)
  {
    if (a3 == 46)
    {
      if ((unint64_t)a4 <= 0xA && ((1 << a4) & 0x715) != 0
        || (*MEMORY[0x1E0C93E90] != a4 ? (v12 = a4 == 12) : (v12 = 1), !v12 ? (v13 = a4 == 7) : (v13 = 1), v13))
      {
        v8 = objc_msgSend(v7, "isEcgPhoneComplicationEnabled");
        goto LABEL_30;
      }
      goto LABEL_2;
    }
LABEL_12:
    if (a3 != 20)
    {
LABEL_2:
      v8 = 0;
      goto LABEL_30;
    }
LABEL_13:
    if ((unint64_t)a4 > 4 || ((1 << a4) & 0x15) == 0)
    {
      v9 = a4 == 7 || *MEMORY[0x1E0C93E90] == a4;
      goto LABEL_24;
    }
LABEL_20:
    v8 = 1;
    goto LABEL_30;
  }
  if ((unint64_t)a4 <= 4 && ((1 << a4) & 0x15) != 0)
    goto LABEL_20;
  v9 = (unint64_t)(a4 - 7) < 4 || *MEMORY[0x1E0C93E90] == a4;
LABEL_24:
  v8 = v9 || a4 == 12;
LABEL_30:

  return v8;
}

- (unint64_t)timelineAnimationBehavior
{
  return 0;
}

- (id)currentSwitcherTemplate
{
  void *v2;
  void *v3;

  -[NTKLauncherComplicationDataSource _currentTimelineEntry](self, "_currentTimelineEntry");
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
  -[NTKLauncherComplicationDataSource _currentTimelineEntry](self, "_currentTimelineEntry");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  (*((void (**)(id, id))a3 + 2))(v5, v6);

}

- (id)_currentTimelineEntry
{
  id v3;
  int64_t v4;
  uint64_t v5;
  NTKLauncherComplicationDataSource *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;

  v3 = objc_alloc_init(MEMORY[0x1E0C94490]);
  v4 = -[CLKCComplicationDataSource family](self, "family");
  if (v4 == 104)
  {
LABEL_2:
    -[NTKLauncherComplicationDataSource _utilitarianLargeTemplate](self, "_utilitarianLargeTemplate");
    v5 = objc_claimAutoreleasedReturnValue();
LABEL_6:
    v8 = (void *)v5;
    goto LABEL_7;
  }
  if (v4 == *MEMORY[0x1E0C93E90])
  {
    v6 = self;
    v7 = 1;
LABEL_5:
    -[NTKLauncherComplicationDataSource _circularTemplateMedium:](v6, "_circularTemplateMedium:", v7);
    v5 = objc_claimAutoreleasedReturnValue();
    goto LABEL_6;
  }
  v8 = 0;
  switch(v4)
  {
    case 0:
      -[NTKLauncherComplicationDataSource _modularSmallTemplate](self, "_modularSmallTemplate");
      v5 = objc_claimAutoreleasedReturnValue();
      goto LABEL_6;
    case 1:
      -[NTKLauncherComplicationDataSource _modularLargeTemplate](self, "_modularLargeTemplate");
      v5 = objc_claimAutoreleasedReturnValue();
      goto LABEL_6;
    case 2:
    case 6:
      -[NTKLauncherComplicationDataSource _utilitarianSmallTemplate](self, "_utilitarianSmallTemplate");
      v5 = objc_claimAutoreleasedReturnValue();
      goto LABEL_6;
    case 3:
      goto LABEL_2;
    case 4:
      v6 = self;
      v7 = 0;
      goto LABEL_5;
    case 7:
      -[NTKLauncherComplicationDataSource _extraLarge](self, "_extraLarge");
      v5 = objc_claimAutoreleasedReturnValue();
      goto LABEL_6;
    case 8:
      -[NTKLauncherComplicationDataSource _signatureCornerTemplate](self, "_signatureCornerTemplate");
      v5 = objc_claimAutoreleasedReturnValue();
      goto LABEL_6;
    case 9:
      -[NTKLauncherComplicationDataSource _signatureBezelTemplate](self, "_signatureBezelTemplate");
      v5 = objc_claimAutoreleasedReturnValue();
      goto LABEL_6;
    case 10:
      -[NTKLauncherComplicationDataSource _signatureCircularTemplate](self, "_signatureCircularTemplate");
      v5 = objc_claimAutoreleasedReturnValue();
      goto LABEL_6;
    case 12:
      -[NTKLauncherComplicationDataSource _graphicExtraLargeTemplate](self, "_graphicExtraLargeTemplate");
      v5 = objc_claimAutoreleasedReturnValue();
      goto LABEL_6;
    default:
      break;
  }
LABEL_7:
  -[NTKLauncherComplicationDataSource _appTintColor](self, "_appTintColor");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setTintColor:", v9);

  if (v8)
    objc_msgSend(v3, "setComplicationTemplate:", v8);
  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setDate:", v10);

  objc_msgSend(v3, "finalize");
  return v3;
}

- (void)getLaunchURLForTimelineEntryDate:(id)a3 timeTravelDate:(id)a4 withHandler:(id)a5
{
  id v7;
  id v8;

  v7 = a5;
  -[NTKLauncherComplicationDataSource _complicationLaunchURL](self, "_complicationLaunchURL");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  (*((void (**)(id, id))a5 + 2))(v7, v8);

}

- (id)_modularSmallTemplate
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  -[NTKLauncherComplicationDataSource _tintableAppImageProvider](self, "_tintableAppImageProvider");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    objc_msgSend(MEMORY[0x1E0C94438], "templateWithImageProvider:", v3);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v5 = (void *)MEMORY[0x1E0C94440];
    v6 = (void *)MEMORY[0x1E0C94530];
    -[NTKLauncherComplicationDataSource _appTitle](self, "_appTitle");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "textProviderWithText:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "templateWithTextProvider:", v8);
    v4 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v4;
}

- (id)_modularLargeTemplate
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  v3 = (void *)MEMORY[0x1E0C943F8];
  -[NTKLauncherComplicationDataSource _tintableAppImageProvider](self, "_tintableAppImageProvider");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)MEMORY[0x1E0C94530];
  -[NTKLauncherComplicationDataSource _appTitle](self, "_appTitle");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "textProviderWithText:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C94530], "textProviderWithText:", &stru_1E6BDC918);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "templateWithHeaderImageProvider:headerTextProvider:body1TextProvider:", v4, v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (id)_utilitarianSmallTemplate
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  -[NTKLauncherComplicationDataSource _tintableAppImageProvider](self, "_tintableAppImageProvider");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    objc_msgSend(MEMORY[0x1E0C94488], "templateWithImageProvider:", v3);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v5 = (void *)MEMORY[0x1E0C94468];
    v6 = (void *)MEMORY[0x1E0C94530];
    -[NTKLauncherComplicationDataSource _appTitle](self, "_appTitle");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "textProviderWithText:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "templateWithTextProvider:", v8);
    v4 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v4;
}

- (id)_utilitarianLargeTemplate
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v3 = (void *)MEMORY[0x1E0C94460];
  v4 = (void *)MEMORY[0x1E0C94530];
  -[NTKLauncherComplicationDataSource _appTitle](self, "_appTitle");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "textProviderWithText:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[NTKLauncherComplicationDataSource _tintableAppImageProvider](self, "_tintableAppImageProvider");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "templateWithTextProvider:imageProvider:", v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (id)_circularTemplateMedium:(BOOL)a3
{
  _BOOL4 v3;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id *v10;
  void *v11;

  v3 = a3;
  -[NTKLauncherComplicationDataSource _tintableAppImageProvider](self, "_tintableAppImageProvider");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    if (v3)
      v6 = (void *)MEMORY[0x1E0C94180];
    else
      v6 = (void *)MEMORY[0x1E0C941C0];
    objc_msgSend(v6, "templateWithImageProvider:", v5);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v7 = (void *)MEMORY[0x1E0C94530];
    -[NTKLauncherComplicationDataSource _appTitle](self, "_appTitle");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "textProviderWithText:", v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    v10 = (id *)0x1E0C94188;
    if (!v3)
      v10 = (id *)0x1E0C941C8;
    objc_msgSend(*v10, "templateWithTextProvider:", v9);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v11;
}

- (id)_extraLarge
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  -[NTKLauncherComplicationDataSource _tintableAppImageProvider](self, "_tintableAppImageProvider");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    objc_msgSend(MEMORY[0x1E0C94218], "templateWithImageProvider:", v3);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v5 = (void *)MEMORY[0x1E0C94530];
    -[NTKLauncherComplicationDataSource _appTitle](self, "_appTitle");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "textProviderWithText:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0C94220], "templateWithTextProvider:", v7);
    v4 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v4;
}

- (id)_signatureCornerTemplate
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  uint64_t v7;
  _QWORD v8[2];

  v8[1] = *MEMORY[0x1E0C80C00];
  v2 = (void *)MEMORY[0x1E0C942C0];
  -[NTKLauncherComplicationDataSource _fullColorImageProvider](self, "_fullColorImageProvider");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "templateWithImageProvider:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = *MEMORY[0x1E0C94118];
  v8[0] = MEMORY[0x1E0C9AAB0];
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v8, &v7, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setMetadata:", v5);

  return v4;
}

- (id)_signatureBezelTemplate
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  uint64_t v7;
  _QWORD v8[2];

  v8[1] = *MEMORY[0x1E0C80C00];
  v2 = (void *)MEMORY[0x1E0C94238];
  -[NTKLauncherComplicationDataSource _signatureCircularTemplate](self, "_signatureCircularTemplate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "templateWithCircularTemplate:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = *MEMORY[0x1E0C94118];
  v8[0] = MEMORY[0x1E0C9AAB0];
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v8, &v7, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setMetadata:", v5);

  return v4;
}

- (id)_signatureCircularTemplate
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  uint64_t v7;
  _QWORD v8[2];

  v8[1] = *MEMORY[0x1E0C80C00];
  v2 = (void *)MEMORY[0x1E0C94260];
  -[NTKLauncherComplicationDataSource _fullColorImageProvider](self, "_fullColorImageProvider");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "templateWithImageProvider:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = *MEMORY[0x1E0C94118];
  v8[0] = MEMORY[0x1E0C9AAB0];
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v8, &v7, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setMetadata:", v5);

  return v4;
}

- (id)_graphicExtraLargeTemplate
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  uint64_t v7;
  _QWORD v8[2];

  v8[1] = *MEMORY[0x1E0C80C00];
  v2 = (void *)MEMORY[0x1E0C94330];
  -[NTKLauncherComplicationDataSource _fullColorImageProvider](self, "_fullColorImageProvider");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "templateWithImageProvider:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = *MEMORY[0x1E0C94118];
  v8[0] = MEMORY[0x1E0C9AAB0];
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v8, &v7, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setMetadata:", v5);

  return v4;
}

- (id)_appTitle
{
  id v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = objc_alloc(MEMORY[0x1E0CA5870]);
  -[NTKLauncherComplicationDataSource _complicationApplicationIdentifier](self, "_complicationApplicationIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v3, "initWithBundleIdentifier:allowPlaceholder:error:", v4, 0, 0);

  objc_msgSend(v5, "localizedName");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)_symbolSizeforMapsApp
{
  id WeakRetained;
  void *v4;
  id v5;
  id v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;

  os_unfair_lock_lock((os_unfair_lock_t)&_symbolSizeforMapsApp___lock);
  WeakRetained = objc_loadWeakRetained(&_symbolSizeforMapsApp___cachedDevice);
  if (!WeakRetained)
    goto LABEL_5;
  v4 = WeakRetained;
  objc_msgSend(MEMORY[0x1E0C944B0], "currentDevice");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  v6 = objc_loadWeakRetained(&_symbolSizeforMapsApp___cachedDevice);
  if (v5 != v6)
  {

LABEL_5:
    objc_msgSend(MEMORY[0x1E0C944B0], "currentDevice");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_storeWeak(&_symbolSizeforMapsApp___cachedDevice, v10);

    v11 = objc_loadWeakRetained(&_symbolSizeforMapsApp___cachedDevice);
    _symbolSizeforMapsApp___previousCLKDeviceVersion = objc_msgSend(v11, "version");

    objc_msgSend(MEMORY[0x1E0C944B0], "currentDevice");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    __58__NTKLauncherComplicationDataSource__symbolSizeforMapsApp__block_invoke();

    goto LABEL_6;
  }
  objc_msgSend(MEMORY[0x1E0C944B0], "currentDevice");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "version");
  v9 = _symbolSizeforMapsApp___previousCLKDeviceVersion;

  if (v8 != v9)
    goto LABEL_5;
LABEL_6:
  os_unfair_lock_unlock((os_unfair_lock_t)&_symbolSizeforMapsApp___lock);
  v13 = (void *)_symbolSizeforMapsApp_allMapsSymbolSizes;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", -[CLKCComplicationDataSource family](self, "family"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "objectForKey:", v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  return v15;
}

void __58__NTKLauncherComplicationDataSource__symbolSizeforMapsApp__block_invoke()
{
  uint64_t v0;
  void *v1;
  void *v2;
  _QWORD v3[2];

  v3[1] = *MEMORY[0x1E0C80C00];
  v2 = &unk_1E6CA13B0;
  v3[0] = &unk_1E6CA55D8;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v3, &v2, 1);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)_symbolSizeforMapsApp_allMapsSymbolSizes;
  _symbolSizeforMapsApp_allMapsSymbolSizes = v0;

}

- (id)_symbolSizeforMailApp
{
  id WeakRetained;
  void *v4;
  id v5;
  id v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;

  os_unfair_lock_lock((os_unfair_lock_t)&_symbolSizeforMailApp___lock);
  WeakRetained = objc_loadWeakRetained(&_symbolSizeforMailApp___cachedDevice);
  if (!WeakRetained)
    goto LABEL_5;
  v4 = WeakRetained;
  objc_msgSend(MEMORY[0x1E0C944B0], "currentDevice");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  v6 = objc_loadWeakRetained(&_symbolSizeforMailApp___cachedDevice);
  if (v5 != v6)
  {

LABEL_5:
    objc_msgSend(MEMORY[0x1E0C944B0], "currentDevice");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_storeWeak(&_symbolSizeforMailApp___cachedDevice, v10);

    v11 = objc_loadWeakRetained(&_symbolSizeforMailApp___cachedDevice);
    _symbolSizeforMailApp___previousCLKDeviceVersion = objc_msgSend(v11, "version");

    objc_msgSend(MEMORY[0x1E0C944B0], "currentDevice");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    __58__NTKLauncherComplicationDataSource__symbolSizeforMailApp__block_invoke();

    goto LABEL_6;
  }
  objc_msgSend(MEMORY[0x1E0C944B0], "currentDevice");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "version");
  v9 = _symbolSizeforMailApp___previousCLKDeviceVersion;

  if (v8 != v9)
    goto LABEL_5;
LABEL_6:
  os_unfair_lock_unlock((os_unfair_lock_t)&_symbolSizeforMailApp___lock);
  v13 = (void *)_symbolSizeforMailApp_allMailSymbolSizes;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", -[CLKCComplicationDataSource family](self, "family"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "objectForKey:", v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  return v15;
}

void __58__NTKLauncherComplicationDataSource__symbolSizeforMailApp__block_invoke()
{
  void *v0;
  double v1;
  void *v2;
  uint64_t v3;
  void *v4;
  _QWORD v5[4];
  _QWORD v6[5];

  v6[4] = *MEMORY[0x1E0C80C00];
  v5[0] = &unk_1E6CA13C8;
  v5[1] = &unk_1E6CA13E0;
  v6[0] = &unk_1E6CA55E8;
  v6[1] = &unk_1E6CA55E8;
  v6[2] = &unk_1E6CA55F8;
  v5[2] = &unk_1E6CA13B0;
  v5[3] = &unk_1E6CA13F8;
  v0 = (void *)MEMORY[0x1E0CB37E8];
  CLKComplicationGraphicExtraLargeCircularScalingFactor();
  objc_msgSend(v0, "numberWithDouble:", v1 * 22.0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v6[3] = v2;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v6, v5, 4);
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = (void *)_symbolSizeforMailApp_allMailSymbolSizes;
  _symbolSizeforMailApp_allMailSymbolSizes = v3;

}

- (id)_symbolSizeforTinCanApp
{
  id WeakRetained;
  void *v4;
  id v5;
  id v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;

  os_unfair_lock_lock((os_unfair_lock_t)&_symbolSizeforTinCanApp___lock);
  WeakRetained = objc_loadWeakRetained(&_symbolSizeforTinCanApp___cachedDevice);
  if (!WeakRetained)
    goto LABEL_5;
  v4 = WeakRetained;
  objc_msgSend(MEMORY[0x1E0C944B0], "currentDevice");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  v6 = objc_loadWeakRetained(&_symbolSizeforTinCanApp___cachedDevice);
  if (v5 != v6)
  {

LABEL_5:
    objc_msgSend(MEMORY[0x1E0C944B0], "currentDevice");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_storeWeak(&_symbolSizeforTinCanApp___cachedDevice, v10);

    v11 = objc_loadWeakRetained(&_symbolSizeforTinCanApp___cachedDevice);
    _symbolSizeforTinCanApp___previousCLKDeviceVersion = objc_msgSend(v11, "version");

    objc_msgSend(MEMORY[0x1E0C944B0], "currentDevice");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    __60__NTKLauncherComplicationDataSource__symbolSizeforTinCanApp__block_invoke();

    goto LABEL_6;
  }
  objc_msgSend(MEMORY[0x1E0C944B0], "currentDevice");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "version");
  v9 = _symbolSizeforTinCanApp___previousCLKDeviceVersion;

  if (v8 != v9)
    goto LABEL_5;
LABEL_6:
  os_unfair_lock_unlock((os_unfair_lock_t)&_symbolSizeforTinCanApp___lock);
  v13 = (void *)_symbolSizeforTinCanApp_allTinCanSymbolSizes;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", -[CLKCComplicationDataSource family](self, "family"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "objectForKey:", v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  return v15;
}

void __60__NTKLauncherComplicationDataSource__symbolSizeforTinCanApp__block_invoke()
{
  void *v0;
  double v1;
  void *v2;
  uint64_t v3;
  void *v4;
  _QWORD v5[4];
  _QWORD v6[5];

  v6[4] = *MEMORY[0x1E0C80C00];
  v5[0] = &unk_1E6CA13C8;
  v5[1] = &unk_1E6CA13E0;
  v6[0] = &unk_1E6CA5608;
  v6[1] = &unk_1E6CA5608;
  v6[2] = &unk_1E6CA5618;
  v5[2] = &unk_1E6CA13B0;
  v5[3] = &unk_1E6CA13F8;
  v0 = (void *)MEMORY[0x1E0CB37E8];
  CLKComplicationGraphicExtraLargeCircularScalingFactor();
  objc_msgSend(v0, "numberWithDouble:", v1 * 26.5);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v6[3] = v2;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v6, v5, 4);
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = (void *)_symbolSizeforTinCanApp_allTinCanSymbolSizes;
  _symbolSizeforTinCanApp_allTinCanSymbolSizes = v3;

}

- (id)_symbolSize
{
  void *v3;
  uint64_t v4;
  void *v5;

  -[CLKCComplicationDataSource complication](self, "complication");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "complicationType");

  switch(v4)
  {
    case 33:
      -[NTKLauncherComplicationDataSource _symbolSizeforTinCanApp](self, "_symbolSizeforTinCanApp");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      break;
    case 27:
      -[NTKLauncherComplicationDataSource _symbolSizeforMailApp](self, "_symbolSizeforMailApp");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      break;
    case 25:
      -[NTKLauncherComplicationDataSource _symbolSizeforMapsApp](self, "_symbolSizeforMapsApp");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      break;
    default:
      v5 = 0;
      break;
  }
  return v5;
}

- (id)_symbolName
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  if (_symbolName_onceToken != -1)
    dispatch_once(&_symbolName_onceToken, &__block_literal_global_36);
  v3 = (void *)_symbolName_typeToSymbolNameComponentMapping;
  v4 = (void *)MEMORY[0x1E0CB37E8];
  -[CLKCComplicationDataSource complication](self, "complication");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "numberWithUnsignedInteger:", objc_msgSend(v5, "complicationType"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKeyedSubscript:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

void __48__NTKLauncherComplicationDataSource__symbolName__block_invoke()
{
  uint64_t v0;
  void *v1;
  _QWORD v2[5];
  _QWORD v3[6];

  v3[5] = *MEMORY[0x1E0C80C00];
  v2[0] = &unk_1E6CA1410;
  v2[1] = &unk_1E6CA1428;
  v3[0] = CFSTR("envelope.fill");
  v3[1] = CFSTR("walkietalkie.applewatch.case.fill");
  v2[2] = &unk_1E6CA1440;
  v2[3] = &unk_1E6CA1458;
  v3[2] = CFSTR("play.circle");
  v3[3] = CFSTR("phone.fill");
  v2[4] = &unk_1E6CA1470;
  v3[4] = CFSTR("location.fill");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v3, v2, 5);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)_symbolName_typeToSymbolNameComponentMapping;
  _symbolName_typeToSymbolNameComponentMapping = v0;

}

- (id)_symbolAppImageProviderIfSupported
{
  void *v3;
  void *v4;
  void *v5;

  -[NTKLauncherComplicationDataSource _symbolName](self, "_symbolName");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    objc_msgSend(MEMORY[0x1E0C94538], "_symbolImageProviderWithSystemName:", v3);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[NTKLauncherComplicationDataSource _symbolSize](self, "_symbolSize");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (v5)
      objc_msgSend(v4, "setOverridePointSize:", v5);
    objc_msgSend(v4, "setIgnoreHierarchicalLayers:", 1);

  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (id)_symbolAppFullColorImageProviderIfSupported
{
  void *v3;
  void *v4;
  void *v5;

  -[NTKLauncherComplicationDataSource _symbolName](self, "_symbolName");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    objc_msgSend(MEMORY[0x1E0C944E0], "_symbolImageProviderWithSystemName:", v3);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[NTKLauncherComplicationDataSource _symbolSize](self, "_symbolSize");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (v5)
      objc_msgSend(v4, "setOverridePointSize:", v5);
    objc_msgSend(v4, "setIgnoreHierarchicalLayers:", 1);

  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (id)_tintableAppImageProvider
{
  id v3;
  void *v4;
  char IsGreaterThanOrEqual;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;

  if (_tintableAppImageProvider_onceToken != -1)
    dispatch_once(&_tintableAppImageProvider_onceToken, &__block_literal_global_55);
  -[NTKLauncherComplicationDataSource _symbolAppImageProviderIfSupported](self, "_symbolAppImageProviderIfSupported");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C944B0], "currentDevice");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "nrDeviceVersion");
  IsGreaterThanOrEqual = NRVersionIsGreaterThanOrEqual();

  if (!v3 || (IsGreaterThanOrEqual & 1) == 0)
  {
    -[CLKCComplicationDataSource complication](self, "complication");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "complicationType");

    v8 = (void *)_tintableAppImageProvider_familyToImageNameComponentMapping;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", -[CLKCComplicationDataSource family](self, "family"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "objectForKeyedSubscript:", v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    v11 = (void *)_tintableAppImageProvider_typeToImageNameComponentMapping;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v7);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "objectForKeyedSubscript:", v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v10 || !v13)
    {

      v22 = 0;
      goto LABEL_14;
    }
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@%@"), v10, v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    NTKImageNamed(v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    if (v15)
    {
      objc_msgSend(MEMORY[0x1E0C944E8], "imageProviderWithOnePieceImage:", v15);
      v16 = (void *)objc_claimAutoreleasedReturnValue();

      v17 = (void *)_tintableAppImageProvider_typeToAccentSuffixNameComponentMapping;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v7);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "objectForKeyedSubscript:", v18);
      v19 = (void *)objc_claimAutoreleasedReturnValue();

      if (v19)
      {
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@%@"), v14, v19);
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        NTKImageNamed(v20);
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "setForegroundAccentImage:", v21);

      }
      v3 = v16;
    }

  }
  v3 = v3;
  v22 = v3;
LABEL_14:

  return v22;
}

void __62__NTKLauncherComplicationDataSource__tintableAppImageProvider__block_invoke()
{
  void *v0;
  uint64_t v1;
  void *v2;
  uint64_t v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  const __CFString *v8;
  _QWORD v9[8];
  _QWORD v10[8];
  _QWORD v11[7];
  _QWORD v12[8];

  v12[7] = *MEMORY[0x1E0C80C00];
  v11[0] = &unk_1E6CA1488;
  v11[1] = &unk_1E6CA14A0;
  v12[0] = CFSTR("Color");
  v12[1] = CFSTR("ModularSmall");
  v11[2] = &unk_1E6CA14B8;
  v11[3] = &unk_1E6CA14D0;
  v12[2] = CFSTR("Utility");
  v12[3] = CFSTR("Utility");
  v11[4] = &unk_1E6CA14E8;
  v11[5] = &unk_1E6CA1500;
  v12[4] = CFSTR("Utility");
  v12[5] = CFSTR("ExtraLarge");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", *MEMORY[0x1E0C93E90]);
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v11[6] = v0;
  v12[6] = CFSTR("VictoryNTK");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v12, v11, 7);
  v1 = objc_claimAutoreleasedReturnValue();
  v2 = (void *)_tintableAppImageProvider_familyToImageNameComponentMapping;
  _tintableAppImageProvider_familyToImageNameComponentMapping = v1;

  v9[0] = &unk_1E6CA1440;
  v9[1] = &unk_1E6CA1458;
  v10[0] = CFSTR("Remote");
  v10[1] = CFSTR("Phone");
  v9[2] = &unk_1E6CA1470;
  v9[3] = &unk_1E6CA1410;
  v10[2] = CFSTR("Maps");
  v10[3] = CFSTR("Mail");
  v9[4] = &unk_1E6CA1518;
  v9[5] = &unk_1E6CA1530;
  v10[4] = CFSTR("Home");
  v10[5] = CFSTR("Reminders");
  v9[6] = &unk_1E6CA1428;
  v9[7] = &unk_1E6CA1548;
  v10[6] = CFSTR("TinCan");
  v10[7] = CFSTR("ECG");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v10, v9, 8);
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = (void *)_tintableAppImageProvider_typeToImageNameComponentMapping;
  _tintableAppImageProvider_typeToImageNameComponentMapping = v3;

  v7 = &unk_1E6CA1530;
  v8 = CFSTR("Color");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v8, &v7, 1);
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = (void *)_tintableAppImageProvider_typeToAccentSuffixNameComponentMapping;
  _tintableAppImageProvider_typeToAccentSuffixNameComponentMapping = v5;

}

- (id)_fullColorImageProvider
{
  id v3;
  void *v4;
  uint64_t v5;
  void *v6;
  char IsGreaterThanOrEqual;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v28;
  void *v29;

  if (_fullColorImageProvider_onceToken != -1)
    dispatch_once(&_fullColorImageProvider_onceToken, &__block_literal_global_95_0);
  -[NTKLauncherComplicationDataSource _symbolAppFullColorImageProviderIfSupported](self, "_symbolAppFullColorImageProviderIfSupported");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  -[CLKCComplicationDataSource complication](self, "complication");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "complicationType");

  objc_msgSend(MEMORY[0x1E0C944B0], "currentDevice");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "nrDeviceVersion");
  IsGreaterThanOrEqual = NRVersionIsGreaterThanOrEqual();

  if (!v3 || (IsGreaterThanOrEqual & 1) == 0)
  {
    v8 = (void *)_fullColorImageProvider_familyToImageNameComponentMapping;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", -[CLKCComplicationDataSource family](self, "family"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "objectForKeyedSubscript:", v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    v11 = (void *)_fullColorImageProvider_typeToImageNameComponentMapping;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v5);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "objectForKeyedSubscript:", v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v10 || !v13)
    {

      v23 = 0;
      goto LABEL_19;
    }
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@%@"), v10, v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    NTKImageNamed(v14);
    v15 = objc_claimAutoreleasedReturnValue();
    if (v15)
    {
      v16 = (void *)v15;
      v29 = v14;
      v17 = (void *)_fullColorImageProvider_useAppTintColorList;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v5);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      LODWORD(v17) = objc_msgSend(v17, "containsObject:", v18);

      if ((_DWORD)v17)
      {
        objc_msgSend(v16, "imageWithRenderingMode:", 2);
        v19 = objc_claimAutoreleasedReturnValue();

        v16 = (void *)v19;
      }
      v14 = v29;
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@_Mono"), v29);
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      NTKImageNamed(v28);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      if (v20)
      {
        objc_msgSend(MEMORY[0x1E0C944E8], "imageProviderWithOnePieceImage:", v20);
        v21 = objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0C944D8], "providerWithFullColorImage:tintedImageProvider:applyScalingAndCircularMasking:", v16, v21, 0);
        v22 = objc_claimAutoreleasedReturnValue();

        v3 = (id)v21;
        v14 = v29;
      }
      else
      {
        objc_msgSend(MEMORY[0x1E0C944D8], "providerWithFullColorImage:monochromeFilterType:applyScalingAndCircularMasking:", v16, 1, 0);
        v22 = objc_claimAutoreleasedReturnValue();
      }

      v3 = (id)v22;
    }

  }
  v24 = (void *)_fullColorImageProvider_useAppTintColorList;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v5);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v24) = objc_msgSend(v24, "containsObject:", v25);

  if ((_DWORD)v24)
  {
    -[NTKLauncherComplicationDataSource _appTintColor](self, "_appTintColor");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setTintColor:", v26);

  }
  v3 = v3;
  v23 = v3;
LABEL_19:

  return v23;
}

void __60__NTKLauncherComplicationDataSource__fullColorImageProvider__block_invoke()
{
  uint64_t v0;
  void *v1;
  uint64_t v2;
  void *v3;
  void *v4;
  _QWORD v5[7];
  _QWORD v6[7];
  _QWORD v7[4];
  _QWORD v8[5];

  v8[4] = *MEMORY[0x1E0C80C00];
  v7[0] = &unk_1E6CA13E0;
  v7[1] = &unk_1E6CA13C8;
  v8[0] = CFSTR("SignatureCircular");
  v8[1] = CFSTR("SignatureCircular");
  v7[2] = &unk_1E6CA13B0;
  v7[3] = &unk_1E6CA13F8;
  v8[2] = CFSTR("SignatureCorner");
  v8[3] = CFSTR("SignatureXL");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v8, v7, 4);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)_fullColorImageProvider_familyToImageNameComponentMapping;
  _fullColorImageProvider_familyToImageNameComponentMapping = v0;

  v5[0] = &unk_1E6CA1440;
  v5[1] = &unk_1E6CA1458;
  v6[0] = CFSTR("Remote");
  v6[1] = CFSTR("Phone");
  v5[2] = &unk_1E6CA1470;
  v5[3] = &unk_1E6CA1410;
  v6[2] = CFSTR("Maps");
  v6[3] = CFSTR("Mail");
  v5[4] = &unk_1E6CA1518;
  v5[5] = &unk_1E6CA1428;
  v6[4] = CFSTR("Home");
  v6[5] = CFSTR("TinCan");
  v5[6] = &unk_1E6CA1548;
  v6[6] = CFSTR("ECG");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v6, v5, 7);
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = (void *)_fullColorImageProvider_typeToImageNameComponentMapping;
  _fullColorImageProvider_typeToImageNameComponentMapping = v2;

  v4 = (void *)_fullColorImageProvider_useAppTintColorList;
  _fullColorImageProvider_useAppTintColorList = (uint64_t)&unk_1E6CAA498;

}

- (id)_appTintColor
{
  void *v3;
  uint64_t v4;
  void *v5;

  -[CLKCComplicationDataSource complication](self, "complication");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "complicationType");

  v5 = 0;
  switch(v4)
  {
    case 21:
    case 25:
    case 27:
      objc_msgSend(MEMORY[0x1E0DC3658], "systemBlueColor");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      break;
    case 22:
    case 23:
    case 26:
    case 29:
    case 30:
    case 31:
    case 32:
      return v5;
    case 24:
      objc_msgSend(MEMORY[0x1E0DC3658], "systemGreenColor");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      break;
    case 28:
      objc_msgSend(MEMORY[0x1E0DC3658], "systemOrangeColor");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      break;
    case 33:
      -[NTKLauncherComplicationDataSource _tinCanAppTintColor](self, "_tinCanAppTintColor");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      break;
    default:
      if (v4 == 46)
      {
        objc_msgSend(MEMORY[0x1E0DC3658], "systemPinkColor");
        v5 = (void *)objc_claimAutoreleasedReturnValue();
      }
      break;
  }
  return v5;
}

- (id)_appBackgroundColor
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  double v7;
  uint64_t v8;
  void *v9;

  -[CLKCComplicationDataSource complication](self, "complication");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "complicationType");

  switch(v4)
  {
    case 21:
    case 25:
    case 27:
      goto LABEL_2;
    case 22:
    case 23:
    case 26:
    case 29:
    case 30:
    case 31:
    case 32:
      goto LABEL_4;
    case 24:
      objc_msgSend(MEMORY[0x1E0DC3658], "colorWithRed:green:blue:alpha:", 0.025, 0.65, 0.35, 0.2);
      v8 = objc_claimAutoreleasedReturnValue();
      goto LABEL_6;
    case 28:
      -[NTKLauncherComplicationDataSource _appTintColor](self, "_appTintColor");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = v5;
      v7 = 0.18;
      goto LABEL_9;
    case 33:
      -[NTKLauncherComplicationDataSource _appTintColor](self, "_appTintColor");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = v5;
      v7 = 0.14;
      goto LABEL_9;
    default:
      if (v4 == 46)
      {
LABEL_2:
        -[NTKLauncherComplicationDataSource _appTintColor](self, "_appTintColor");
        v5 = (void *)objc_claimAutoreleasedReturnValue();
        v6 = v5;
        v7 = 0.2;
LABEL_9:
        objc_msgSend(v5, "colorWithAlphaComponent:", v7);
        v9 = (void *)objc_claimAutoreleasedReturnValue();

      }
      else
      {
LABEL_4:
        CLKUIDefaultComplicationBackgroundColor();
        v8 = objc_claimAutoreleasedReturnValue();
LABEL_6:
        v9 = (void *)v8;
      }
      return v9;
  }
}

- (id)_complicationApplicationIdentifier
{
  void *v2;
  uint64_t v3;
  id result;

  -[CLKCComplicationDataSource complication](self, "complication");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "complicationType");

  result = 0;
  switch(v3)
  {
    case 20:
      result = CFSTR("com.apple.NanoReminders");
      break;
    case 21:
      result = CFSTR("com.apple.NanoRemote");
      break;
    case 22:
    case 23:
    case 26:
    case 29:
    case 30:
    case 31:
    case 32:
      return result;
    case 24:
      result = CFSTR("com.apple.NanoPhone");
      break;
    case 25:
      result = CFSTR("com.apple.NanoMaps");
      break;
    case 27:
      result = CFSTR("com.apple.NanoMail");
      break;
    case 28:
      result = CFSTR("com.apple.NanoHome");
      break;
    case 33:
      result = CFSTR("com.apple.tincan");
      break;
    default:
      if (v3 == 46)
        result = CFSTR("com.apple.NanoHeartRhythm");
      else
        result = 0;
      break;
  }
  return result;
}

- (id)_complicationLaunchURL
{
  void *v3;
  uint64_t v4;
  __CFString *v5;
  void *v6;
  void *v7;
  void *v8;

  -[CLKCComplicationDataSource complication](self, "complication");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "complicationType");

  if (v4 == 46)
  {
    v5 = CFSTR("NanoHeartRhythm://start?source=complication");
  }
  else
  {
    v6 = (void *)MEMORY[0x1E0CB3940];
    -[NTKLauncherComplicationDataSource complicationApplicationIdentifier](self, "complicationApplicationIdentifier");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "stringWithFormat:", CFSTR("%@://"), v7);
    v5 = (__CFString *)objc_claimAutoreleasedReturnValue();

  }
  objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:", v5);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (id)_tinCanAppTintColor
{
  if (_tinCanAppTintColor_onceToken != -1)
    dispatch_once(&_tinCanAppTintColor_onceToken, &__block_literal_global_127);
  return (id)_tinCanAppTintColor_tinCanAppTintColor;
}

void __56__NTKLauncherComplicationDataSource__tinCanAppTintColor__block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0DC3658], "colorWithRed:green:blue:alpha:", 0.968627451, 0.988235294, 0.368627451, 1.0);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)_tinCanAppTintColor_tinCanAppTintColor;
  _tinCanAppTintColor_tinCanAppTintColor = v0;

}

@end
