@implementation MapsSuggestionsFirstUnlockTrigger

- (MapsSuggestionsFirstUnlockTrigger)init
{
  MapsSuggestionsFirstUnlock *v3;
  MapsSuggestionsFirstUnlockTrigger *v4;

  v3 = objc_alloc_init(MapsSuggestionsFirstUnlock);
  v4 = -[MapsSuggestionsFirstUnlockTrigger initWithFirstLock:](self, "initWithFirstLock:", v3);

  return v4;
}

- (MapsSuggestionsFirstUnlockTrigger)initWithFirstLock:(id)a3
{
  id v5;
  MapsSuggestionsFirstUnlockTrigger *v6;
  MapsSuggestionsFirstUnlockTrigger *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)MapsSuggestionsFirstUnlockTrigger;
  v6 = -[MapsSuggestionsBaseTrigger initWithName:](&v9, sel_initWithName_, CFSTR("MapsSuggestionsFirstUnlockTrigger"));
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_firstUnlock, a3);

  return v7;
}

- (BOOL)isTrue
{
  return -[MapsSuggestionsFirstUnlockProtocol hasDeviceBeenUnlocked](self->_firstUnlock, "hasDeviceBeenUnlocked");
}

- (void)didAddFirstObserver
{
  -[MapsSuggestionsFirstUnlockProtocol registerObserver:](self->_firstUnlock, "registerObserver:", self);
}

- (void)didRemoveLastObserver
{
  -[MapsSuggestionsFirstUnlockProtocol unregisterObserver:](self->_firstUnlock, "unregisterObserver:", self);
}

- (id)objectForJSON
{
  return MSg::jsonFor((MSg *)-[MapsSuggestionsFirstUnlockTrigger isTrue](self, "isTrue"));
}

- (void)triggerFired:(id)a3
{
  NSObject *v4;
  uint8_t v5[16];

  GEOFindOrCreateLog();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)v5 = 0;
    _os_log_impl(&dword_1A427D000, v4, OS_LOG_TYPE_DEBUG, "Device First time Unlocked", v5, 2u);
  }

  -[MapsSuggestionsBaseTrigger triggerMyObservers](self, "triggerMyObservers");
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_firstUnlock, 0);
}

@end
