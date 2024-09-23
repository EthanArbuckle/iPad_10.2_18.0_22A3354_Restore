@implementation NTKAstronomyComplicationDataSource

- (NTKAstronomyComplicationDataSource)initWithComplication:(id)a3 family:(int64_t)a4 forDevice:(id)a5
{
  id v8;
  NTKAstronomyComplicationDataSource *v9;
  void *v10;
  uint64_t v11;
  CLLocation *currentLocation;
  uint64_t v13;
  CLLocation *anyLocation;
  objc_super v16;

  v8 = a3;
  v16.receiver = self;
  v16.super_class = (Class)NTKAstronomyComplicationDataSource;
  v9 = -[CLKCComplicationDataSource initWithComplication:family:forDevice:](&v16, sel_initWithComplication_family_forDevice_, v8, a4, a5);
  if (v9)
  {
    v9->_vista = objc_msgSend(v8, "vista");
    +[NTKLocationManager sharedLocationManager](NTKLocationManager, "sharedLocationManager");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "currentLocation");
    v11 = objc_claimAutoreleasedReturnValue();
    currentLocation = v9->_currentLocation;
    v9->_currentLocation = (CLLocation *)v11;

    objc_msgSend(v10, "anyLocation");
    v13 = objc_claimAutoreleasedReturnValue();
    anyLocation = v9->_anyLocation;
    v9->_anyLocation = (CLLocation *)v13;

    -[NTKAstronomyComplicationDataSource _startObserving](v9, "_startObserving");
  }

  return v9;
}

- (void)dealloc
{
  objc_super v3;

  -[NTKAstronomyComplicationDataSource _stopObserving](self, "_stopObserving");
  v3.receiver = self;
  v3.super_class = (Class)NTKAstronomyComplicationDataSource;
  -[NTKAstronomyComplicationDataSource dealloc](&v3, sel_dealloc);
}

- (void)_startObserving
{
  id v3;

  if (!self->_listeningForNotifications)
  {
    self->_listeningForNotifications = 1;
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v3 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "addObserver:selector:name:object:", self, sel__invalidate, *MEMORY[0x1E0DC4838], 0);
    objc_msgSend(v3, "addObserver:selector:name:object:", self, sel__invalidate, *MEMORY[0x1E0C99690], 0);
    objc_msgSend(v3, "addObserver:selector:name:object:", self, sel__invalidate, *MEMORY[0x1E0C99720], 0);

  }
}

- (void)_stopObserving
{
  id v3;

  self->_listeningForNotifications = 0;
  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:name:object:", self, *MEMORY[0x1E0DC4838], 0);
  objc_msgSend(v3, "removeObserver:name:object:", self, *MEMORY[0x1E0C99690], 0);
  objc_msgSend(v3, "removeObserver:name:object:", self, *MEMORY[0x1E0C99720], 0);

}

- (BOOL)alwaysShowIdealizedTemplateInSwitcher
{
  return 1;
}

- (Class)richComplicationDisplayViewClassForDevice:(id)a3
{
  int64_t v4;
  void *v5;
  void *v6;
  uint64_t v7;

  v4 = -[CLKCComplicationDataSource family](self, "family", a3);
  v5 = 0;
  switch(v4)
  {
    case 8:
      -[CLKCComplicationDataSource complication](self, "complication");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = objc_msgSend(v6, "complicationType");

      if (v7 == 40)
        goto LABEL_3;
      v5 = 0;
      break;
    case 9:
    case 10:
    case 12:
LABEL_3:
      v5 = (void *)objc_opt_class();
      break;
    default:
      return (Class)v5;
  }
  return (Class)v5;
}

- (BOOL)supportsTapAction
{
  int v3;

  v3 = _os_feature_enabled_impl();
  if (v3)
    LOBYTE(v3) = self->_vista == 0;
  return v3;
}

- (void)getLaunchURLForTimelineEntryDate:(id)a3 timeTravelDate:(id)a4 withHandler:(id)a5
{
  void *v6;
  void (**v7)(id, void *);

  v7 = (void (**)(id, void *))a5;
  if (_os_feature_enabled_impl() && !self->_vista)
  {
    objc_msgSend(MEMORY[0x1E0C99E98], "nwcCurrentLocationURLForLocation:", self->_currentLocation);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v6 = 0;
  }
  v7[2](v7, v6);

}

- (id)complicationApplicationIdentifier
{
  __CFString *v3;

  if (_os_feature_enabled_impl() && !self->_vista)
    v3 = CFSTR("com.apple.NanoWorldClock");
  else
    v3 = 0;
  return v3;
}

- (void)_handleLocationUpdate:(id)a3 anyLocation:(id)a4
{
  CLLocation *v6;
  CLLocation *v7;
  CLLocation *currentLocation;
  CLLocation *v9;
  CLLocation *anyLocation;

  v6 = (CLLocation *)a3;
  v7 = (CLLocation *)a4;
  currentLocation = self->_currentLocation;
  self->_currentLocation = v6;
  v9 = v6;

  anyLocation = self->_anyLocation;
  self->_anyLocation = v7;

  -[NTKAstronomyComplicationDataSource _invalidate](self, "_invalidate");
}

- (void)becomeActive
{
  void *v3;
  NSString *v4;
  NSString *token;
  _QWORD v6[4];
  id v7;
  id location;

  +[NTKLocationManager sharedLocationManager](NTKLocationManager, "sharedLocationManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_initWeak(&location, self);
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __50__NTKAstronomyComplicationDataSource_becomeActive__block_invoke;
  v6[3] = &unk_1E6BD0A28;
  objc_copyWeak(&v7, &location);
  objc_msgSend(v3, "startLocationUpdatesWithIdentifier:handler:", CFSTR("ntk.astronomyComplicationDataSource"), v6);
  v4 = (NSString *)objc_claimAutoreleasedReturnValue();
  token = self->_token;
  self->_token = v4;

  objc_destroyWeak(&v7);
  objc_destroyWeak(&location);

}

void __50__NTKAstronomyComplicationDataSource_becomeActive__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id *v4;
  id v5;
  id v6;
  id WeakRetained;

  v4 = (id *)(a1 + 32);
  v5 = a3;
  v6 = a2;
  WeakRetained = objc_loadWeakRetained(v4);
  objc_msgSend(WeakRetained, "_handleLocationUpdate:anyLocation:", v6, v5);

}

- (void)becomeInactive
{
  void *v3;
  NSString *token;

  if (self->_token)
  {
    +[NTKLocationManager sharedLocationManager](NTKLocationManager, "sharedLocationManager");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "stopLocationUpdatesForToken:", self->_token);

    token = self->_token;
    self->_token = 0;

  }
}

- (id)_currentTimelineEntryWithIdealizedDate:(BOOL)a3
{
  void *v5;
  void *v6;
  id v7;
  void *v8;
  NTKAstronomyTimelineEntryModel *v9;
  void *v10;

  +[CLKDate complicationDate](NTKDate, "complicationDate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (a3)
  {
    NTKIdealizedDate();
    v7 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v7 = v5;
  }
  v8 = v7;
  v9 = -[NTKAstronomyTimelineEntryModel initWithVista:entryDate:currentDate:currentLocation:anyLocation:]([NTKAstronomyTimelineEntryModel alloc], "initWithVista:entryDate:currentDate:currentLocation:anyLocation:", self->_vista, v7, v6, self->_currentLocation, self->_anyLocation);
  -[NTKTimelineEntryModel entryForComplicationFamily:](v9, "entryForComplicationFamily:", -[CLKCComplicationDataSource family](self, "family"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (unint64_t)timelineAnimationBehavior
{
  return 0;
}

- (id)currentSwitcherTemplate
{
  void *v2;
  void *v3;

  -[NTKAstronomyComplicationDataSource _currentTimelineEntryWithIdealizedDate:](self, "_currentTimelineEntryWithIdealizedDate:", 1);
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
  -[NTKAstronomyComplicationDataSource _currentTimelineEntryWithIdealizedDate:](self, "_currentTimelineEntryWithIdealizedDate:", 0);
  v6 = (id)objc_claimAutoreleasedReturnValue();
  (*((void (**)(id, id))a3 + 2))(v5, v6);

}

- (void)resume
{
  -[NTKAstronomyComplicationDataSource _startObserving](self, "_startObserving");
  -[NTKAstronomyComplicationDataSource _invalidate](self, "_invalidate");
}

+ (BOOL)acceptsComplicationType:(unint64_t)a3 forDevice:(id)a4
{
  return a3 - 39 < 3;
}

+ (BOOL)acceptsComplicationFamily:(int64_t)a3 forDevice:(id)a4
{
  char v5;

  v5 = _os_feature_enabled_impl();
  if (a3 == 11 && (v5 & 1) != 0)
    return 1;
  return a3 == 12 || (unint64_t)(a3 - 8) < 3;
}

- (void)_invalidate
{
  id v2;

  -[CLKCComplicationDataSource delegate](self, "delegate");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "invalidateEntries");

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_anyLocation, 0);
  objc_storeStrong((id *)&self->_currentLocation, 0);
  objc_storeStrong((id *)&self->_token, 0);
}

@end
