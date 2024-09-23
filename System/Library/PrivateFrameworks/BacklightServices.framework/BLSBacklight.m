@implementation BLSBacklight

- (int64_t)backlightState
{
  return -[BLSBacklightProxy backlightState](self->_backlightProxy, "backlightState");
}

+ (id)sharedBacklight
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __31__BLSBacklight_sharedBacklight__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (sharedBacklight_onceToken != -1)
    dispatch_once(&sharedBacklight_onceToken, block);
  return (id)sharedBacklight___sharedBacklight;
}

- (BOOL)isAlwaysOnEnabled
{
  return -[BLSBacklightProxy isAlwaysOnEnabled](self->_backlightProxy, "isAlwaysOnEnabled");
}

void __31__BLSBacklight_sharedBacklight__block_invoke(uint64_t a1)
{
  id v1;
  void *v2;

  v1 = objc_alloc_init(*(Class *)(a1 + 32));
  v2 = (void *)sharedBacklight___sharedBacklight;
  sharedBacklight___sharedBacklight = (uint64_t)v1;

}

- (BLSBacklight)init
{
  BLSBacklight *v2;
  uint64_t v3;
  BLSBacklightProxy *backlightProxy;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)BLSBacklight;
  v2 = -[BLSBacklight init](&v6, sel_init);
  if (v2)
  {
    +[BLSBacklight defaultBacklightProxy]();
    v3 = objc_claimAutoreleasedReturnValue();
    backlightProxy = v2->_backlightProxy;
    v2->_backlightProxy = (BLSBacklightProxy *)v3;

  }
  return v2;
}

+ (id)defaultBacklightProxy
{
  id v0;
  _BOOL4 v1;
  __objc2_class **v2;
  id v3;
  void *v4;

  objc_opt_self();
  os_unfair_lock_lock((os_unfair_lock_t)&_classLock_0);
  v0 = (id)_defaultBacklightProxy;
  if (!v0)
  {
    v1 = +[BLSRuntime isHostProcess](BLSRuntime, "isHostProcess");
    v2 = off_1E6219988;
    if (!v1)
      v2 = off_1E62199F0;
    v3 = objc_alloc_init(*v2);
    v4 = (void *)_defaultBacklightProxy;
    _defaultBacklightProxy = (uint64_t)v3;

    v0 = v3;
  }
  os_unfair_lock_unlock((os_unfair_lock_t)&_classLock_0);
  return v0;
}

- (int64_t)flipbookState
{
  return -[BLSBacklightProxy flipbookState](self->_backlightProxy, "flipbookState");
}

- (BOOL)isTransitioning
{
  return -[BLSBacklightProxy isTransitioning](self->_backlightProxy, "isTransitioning");
}

- (BOOL)deviceSupportsAlwaysOn
{
  return -[BLSBacklightProxy deviceSupportsAlwaysOn](self->_backlightProxy, "deviceSupportsAlwaysOn");
}

- (id)performChangeRequest:(id)a3
{
  return (id)-[BLSBacklightProxy performChangeRequest:](self->_backlightProxy, "performChangeRequest:", a3);
}

- (void)addObserver:(id)a3
{
  -[BLSBacklightProxy addObserver:](self->_backlightProxy, "addObserver:", a3);
}

- (void)removeObserver:(id)a3
{
  -[BLSBacklightProxy removeObserver:](self->_backlightProxy, "removeObserver:", a3);
}

+ (void)setDefaultBacklightProxy:(id)a3
{
  id v4;
  id v5;
  NSObject *v6;
  uint8_t buf[16];

  v4 = a3;
  os_unfair_lock_lock((os_unfair_lock_t)&_classLock_0);
  v5 = (id)_defaultBacklightProxy;
  if (!v5)
  {
    bls_backlight_log();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
      +[BLSBacklight setDefaultBacklightProxy:].cold.1(v6);
    goto LABEL_10;
  }
  if (!v4)
  {
    bls_backlight_log();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1B0C75000, v6, OS_LOG_TYPE_DEFAULT, "BLSBacklightProxy defaultBacklightProxy reset - should only occur during unit testing", buf, 2u);
    }
LABEL_10:

    objc_storeStrong((id *)&_defaultBacklightProxy, a3);
    os_unfair_lock_unlock((os_unfair_lock_t)&_classLock_0);
    goto LABEL_11;
  }
  objc_storeStrong((id *)&_defaultBacklightProxy, a3);
  os_unfair_lock_unlock((os_unfair_lock_t)&_classLock_0);
  if ((objc_opt_respondsToSelector() & 1) == 0)
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99768], CFSTR("attempting to replace backlightProxy:%@ which does not respond to replaceWithBacklightProxy:"), v5);
  objc_msgSend(v5, "replaceWithBacklightProxy:", v4);
LABEL_11:

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_backlightProxy, 0);
}

+ (void)setDefaultBacklightProxy:(os_log_t)log .cold.1(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_debug_impl(&dword_1B0C75000, log, OS_LOG_TYPE_DEBUG, "BLSBacklightProxy setDefaultBacklightProxy replacing nil - no backlight instances created prior to server bringup - yay", v1, 2u);
}

@end
