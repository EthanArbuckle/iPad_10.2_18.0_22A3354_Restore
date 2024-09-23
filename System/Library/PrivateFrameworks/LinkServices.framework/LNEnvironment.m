@implementation LNEnvironment

- (LNEnvironment)initWithLocaleIdentifier:(id)a3
{
  id v5;
  LNEnvironment *v6;
  uint64_t v7;
  NSString *localeIdentifier;
  NSMutableDictionary *v9;
  NSMutableDictionary *locationAuthorizationStatus;
  LNEnvironment *v11;
  void *v13;
  objc_super v14;

  v5 = a3;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("LNEnvironment.m"), 28, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("localeIdentifier"));

  }
  v14.receiver = self;
  v14.super_class = (Class)LNEnvironment;
  v6 = -[LNEnvironment init](&v14, sel_init);
  if (v6)
  {
    v7 = objc_msgSend(v5, "copy");
    localeIdentifier = v6->_localeIdentifier;
    v6->_localeIdentifier = (NSString *)v7;

    v9 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    locationAuthorizationStatus = v6->_locationAuthorizationStatus;
    v6->_locationAuthorizationStatus = v9;

    v11 = v6;
  }

  return v6;
}

- (id)trimLocation:(id)a3 atKeyPath:(id)a4 againstTCCWithBundleIdentifier:(id)a5
{
  id v9;
  id v10;
  id v11;
  NSObject *v12;
  void *v13;
  NSObject *v14;
  void *v15;
  void *v16;
  id v17;
  void *v18;
  uint8_t buf[4];
  id v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v10 = a4;
  v11 = a5;
  if (!v10)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("LNEnvironment.m"), 53, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("keyPath"));

    if (v9)
      goto LABEL_3;
LABEL_17:
    v17 = 0;
    goto LABEL_18;
  }
  if (!v9)
    goto LABEL_17;
LABEL_3:
  getLNLogCategorySecurity();
  v12 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138543362;
    v21 = v10;
  }

  if (v11)
  {
    -[LNEnvironment locationAuthorizationStatus](self, "locationAuthorizationStatus");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "objectForKeyedSubscript:", v11);
    v14 = objc_claimAutoreleasedReturnValue();

    if (!v14)
    {
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[LNEnvironment locationAuthorizationStatusForBundleIdentifier:](self, "locationAuthorizationStatusForBundleIdentifier:", v11));
      v14 = objc_claimAutoreleasedReturnValue();
      -[LNEnvironment locationAuthorizationStatus](self, "locationAuthorizationStatus");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "setObject:forKeyedSubscript:", v14, v11);

    }
    if (-[NSObject BOOLValue](v14, "BOOLValue"))
      v16 = v9;
    else
      v16 = 0;
    v17 = v16;
  }
  else
  {
    getLNLogCategorySecurity();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1A18F6000, v14, OS_LOG_TYPE_ERROR, "Removing location because the bundle identifier is not defined", buf, 2u);
    }
    v17 = 0;
  }

LABEL_18:
  return v17;
}

- (BOOL)locationAuthorizationStatusForBundleIdentifier:(id)a3
{
  char v3;
  id v4;
  unsigned int v5;
  NSObject *v6;
  const char *v7;
  NSObject *v8;
  os_log_type_t v9;
  int v11;
  id v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (!+[LNEntitlementsValidator validateEntitlement:forCurrentTaskWithValidator:](LNEntitlementsValidator, "validateEntitlement:forCurrentTaskWithValidator:", CFSTR("com.apple.locationd.effective_bundle"), &__block_literal_global_17)|| !+[LNEntitlementsValidator validateEntitlement:forCurrentTaskWithValidator:](LNEntitlementsValidator, "validateEntitlement:forCurrentTaskWithValidator:", CFSTR("com.apple.security.exception.mach-lookup.global-name"), &__block_literal_global_20))
  {
    getLNLogCategorySecurity();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      LOWORD(v11) = 0;
      v8 = v6;
      v9 = OS_LOG_TYPE_ERROR;
      goto LABEL_8;
    }
LABEL_9:
    v3 = 0;
    goto LABEL_10;
  }
  v5 = objc_msgSend(MEMORY[0x1E0C9E3C8], "authorizationStatusForBundleIdentifier:", v4);
  if (v5 < 3)
  {
    getLNLogCategorySecurity();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
    {
      LOWORD(v11) = 0;
      v7 = "Removing location value because of TCC";
      v8 = v6;
      v9 = OS_LOG_TYPE_DEBUG;
LABEL_8:
      _os_log_impl(&dword_1A18F6000, v8, v9, v7, (uint8_t *)&v11, 2u);
      goto LABEL_9;
    }
    goto LABEL_9;
  }
  if (v5 - 3 > 1)
    goto LABEL_11;
  getLNLogCategorySecurity();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
  {
    v11 = 138543362;
    v12 = v4;
    _os_log_impl(&dword_1A18F6000, v6, OS_LOG_TYPE_DEBUG, "%{public}@ is authorized to access location", (uint8_t *)&v11, 0xCu);
  }
  v3 = 1;
LABEL_10:

LABEL_11:
  return v3 & 1;
}

- (id)copyWithZone:(_NSZone *)a3
{
  LNEnvironment *v4;
  void *v5;
  LNEnvironment *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;

  v4 = [LNEnvironment alloc];
  -[LNEnvironment localeIdentifier](self, "localeIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[LNEnvironment initWithLocaleIdentifier:](v4, "initWithLocaleIdentifier:", v5);

  -[LNEnvironment timeZone](self, "timeZone");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[LNEnvironment setTimeZone:](v6, "setTimeZone:", v7);

  -[LNEnvironment currentLocation](self, "currentLocation");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[LNEnvironment setCurrentLocation:](v6, "setCurrentLocation:", v8);

  -[LNEnvironment calendar](self, "calendar");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[LNEnvironment setCalendar:](v6, "setCalendar:", v9);

  -[LNEnvironment locationAuthorizationStatus](self, "locationAuthorizationStatus");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (void *)objc_msgSend(v10, "mutableCopy");
  -[LNEnvironment setLocationAuthorizationStatus:](v6, "setLocationAuthorizationStatus:", v11);

  return v6;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;

  v4 = a3;
  -[LNEnvironment localeIdentifier](self, "localeIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("localeIdentifier"));

  -[LNEnvironment timeZone](self, "timeZone");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("timeZone"));

  -[LNEnvironment calendar](self, "calendar");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v7, CFSTR("calendar"));

  v16 = v4;
  if (v16)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v8 = v16;
    else
      v8 = 0;
  }
  else
  {
    v8 = 0;
  }
  v9 = v8;

  objc_msgSend(v9, "userInfo");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (v10)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v11 = v10;
    else
      v11 = 0;
  }
  else
  {
    v11 = 0;
  }
  v12 = v11;

  -[LNEnvironment currentLocation](self, "currentLocation");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if (v9)
  {
    objc_msgSend(v12, "objectForKeyedSubscript:", CFSTR("bundleIdentifier"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[LNEnvironment trimLocation:atKeyPath:againstTCCWithBundleIdentifier:](self, "trimLocation:atKeyPath:againstTCCWithBundleIdentifier:", v13, CFSTR("currentLocation"), v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "encodeObject:forKey:", v15, CFSTR("currentLocation"));

  }
  else
  {
    objc_msgSend(v16, "encodeObject:forKey:", v13, CFSTR("currentLocation"));
  }

}

- (LNEnvironment)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  LNEnvironment *v9;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("localeIdentifier"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("timeZone"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("currentLocation"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("calendar"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    self = -[LNEnvironment initWithLocaleIdentifier:](self, "initWithLocaleIdentifier:", v5);
    -[LNEnvironment setTimeZone:](self, "setTimeZone:", v6);
    -[LNEnvironment setCurrentLocation:](self, "setCurrentLocation:", v7);
    -[LNEnvironment setCalendar:](self, "setCalendar:", v8);

    v9 = self;
  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (NSString)localeIdentifier
{
  return self->_localeIdentifier;
}

- (NSTimeZone)timeZone
{
  return self->_timeZone;
}

- (void)setTimeZone:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (CLLocation)currentLocation
{
  return self->_currentLocation;
}

- (void)setCurrentLocation:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (NSCalendar)calendar
{
  return self->_calendar;
}

- (void)setCalendar:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (NSMutableDictionary)locationAuthorizationStatus
{
  return self->_locationAuthorizationStatus;
}

- (void)setLocationAuthorizationStatus:(id)a3
{
  objc_storeStrong((id *)&self->_locationAuthorizationStatus, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_locationAuthorizationStatus, 0);
  objc_storeStrong((id *)&self->_calendar, 0);
  objc_storeStrong((id *)&self->_currentLocation, 0);
  objc_storeStrong((id *)&self->_timeZone, 0);
  objc_storeStrong((id *)&self->_localeIdentifier, 0);
}

uint64_t __64__LNEnvironment_locationAuthorizationStatusForBundleIdentifier___block_invoke_2(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  id v4;
  uint64_t v5;

  v2 = a2;
  if (v2)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v3 = v2;
    else
      v3 = 0;
  }
  else
  {
    v3 = 0;
  }
  v4 = v3;
  v5 = objc_msgSend(v4, "containsObject:", CFSTR("com.apple.locationd.synchronous"));

  return v5;
}

BOOL __64__LNEnvironment_locationAuthorizationStatusForBundleIdentifier___block_invoke(uint64_t a1, uint64_t a2)
{
  return a2 != 0;
}

+ (LNEnvironment)defaultEnvironment
{
  if (defaultEnvironment_onceToken != -1)
    dispatch_once(&defaultEnvironment_onceToken, &__block_literal_global_2890);
  return (LNEnvironment *)(id)defaultEnvironment_defaultEnvironment;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

void __35__LNEnvironment_defaultEnvironment__block_invoke()
{
  LNEnvironment *v0;
  void *v1;

  v0 = -[LNEnvironment initWithLocaleIdentifier:]([LNEnvironment alloc], "initWithLocaleIdentifier:", CFSTR("en"));
  v1 = (void *)defaultEnvironment_defaultEnvironment;
  defaultEnvironment_defaultEnvironment = (uint64_t)v0;

}

@end
