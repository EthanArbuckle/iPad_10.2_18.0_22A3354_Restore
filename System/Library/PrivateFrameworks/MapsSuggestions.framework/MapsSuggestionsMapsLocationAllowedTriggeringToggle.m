@implementation MapsSuggestionsMapsLocationAllowedTriggeringToggle

- (void)didAddFirstObserver
{
  id v3;
  CLLocationManager *v4;
  CLLocationManager *locationManager;
  NSObject *v6;
  id v7;

  -[MapsSuggestionsBaseTrigger dispatchQueue](self, "dispatchQueue");
  v6 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v6);

  if (!self->_locationManager)
  {
    v3 = objc_alloc(MEMORY[0x1E0C9E3C8]);
    -[MapsSuggestionsBaseTrigger dispatchQueue](self, "dispatchQueue");
    v7 = (id)objc_claimAutoreleasedReturnValue();
    v4 = (CLLocationManager *)objc_msgSend(v3, "initWithEffectiveBundleIdentifier:delegate:onQueue:", CFSTR("com.apple.Maps"), self);
    locationManager = self->_locationManager;
    self->_locationManager = v4;

  }
}

- (void)didRemoveLastObserver
{
  NSObject *v3;
  CLLocationManager *locationManager;

  -[MapsSuggestionsBaseTrigger dispatchQueue](self, "dispatchQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v3);

  locationManager = self->_locationManager;
  self->_locationManager = 0;

}

- (void)dealloc
{
  NSObject *v3;
  const char *label;
  void *v5;
  CLLocationManager *locationManager;
  objc_super v7;
  _QWORD block[5];

  -[MapsSuggestionsBaseTrigger dispatchQueue](self, "dispatchQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __61__MapsSuggestionsMapsLocationAllowedTriggeringToggle_dealloc__block_invoke;
  block[3] = &unk_1E4BCE640;
  block[4] = self;
  label = dispatch_queue_get_label(v3);
  if (label == dispatch_queue_get_label(0))
  {
    v5 = (void *)MEMORY[0x1A859CDD8]();
    locationManager = self->_locationManager;
    self->_locationManager = 0;

    objc_autoreleasePoolPop(v5);
  }
  else
  {
    dispatch_sync(v3, block);
  }

  v7.receiver = self;
  v7.super_class = (Class)MapsSuggestionsMapsLocationAllowedTriggeringToggle;
  -[MapsSuggestionsMapsLocationAllowedTriggeringToggle dealloc](&v7, sel_dealloc);
}

void __61__MapsSuggestionsMapsLocationAllowedTriggeringToggle_dealloc__block_invoke(uint64_t a1)
{
  uint64_t v1;
  void *v2;

  v1 = *(_QWORD *)(a1 + 32);
  v2 = *(void **)(v1 + 56);
  *(_QWORD *)(v1 + 56) = 0;

}

- (BOOL)isTrue
{
  objc_super v4;

  if (!-[MapsSuggestionsTriggeringToggle timesUpdated](self, "timesUpdated"))
    -[MapsSuggestionsTriggeringToggle setState:](self, "setState:", MapsSuggestionsMapsAppIsAllowedLocations());
  v4.receiver = self;
  v4.super_class = (Class)MapsSuggestionsMapsLocationAllowedTriggeringToggle;
  return -[MapsSuggestionsTriggeringToggle isTrue](&v4, sel_isTrue);
}

- (void)locationManagerDidChangeAuthorization:(id)a3
{
  id v4;
  int v5;
  NSObject *v6;
  int v7;
  const char *v8;
  __int16 v9;
  int v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = objc_msgSend(v4, "authorizationStatus");
  GEOFindOrCreateLog();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
  {
    v7 = 136315394;
    v8 = "-[MapsSuggestionsMapsLocationAllowedTriggeringToggle locationManagerDidChangeAuthorization:]";
    v9 = 1024;
    v10 = v5;
    _os_log_impl(&dword_1A427D000, v6, OS_LOG_TYPE_DEBUG, "%s status=%d", (uint8_t *)&v7, 0x12u);
  }

  -[MapsSuggestionsTriggeringToggle setState:](self, "setState:", (v5 - 3) < 2);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_locationManager, 0);
}

@end
