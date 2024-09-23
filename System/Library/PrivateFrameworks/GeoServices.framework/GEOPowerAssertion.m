@implementation GEOPowerAssertion

- (GEOPowerAssertion)initWithType:(int64_t)a3 identifier:(id)a4 timeout:(double)a5
{
  __CFString *v8;
  GEOPowerAssertion *v9;
  const __CFString *v10;
  NSObject *v11;
  const __CFString *v12;
  IOReturn v13;
  IOReturn v14;
  NSObject *v15;
  GEOPowerAssertion *v16;
  uint64_t v18;
  NSString *identifier;
  objc_super v20;
  uint8_t buf[4];
  const __CFString *v22;
  __int16 v23;
  __CFString *v24;
  __int16 v25;
  double v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v8 = (__CFString *)a4;
  v20.receiver = self;
  v20.super_class = (Class)GEOPowerAssertion;
  v9 = -[GEOPowerAssertion init](&v20, sel_init);
  if (!v9)
    goto LABEL_16;
  if (a3)
  {
    if (a3 != 1)
      goto LABEL_16;
    v10 = CFSTR("BackgroundTask");
  }
  else
  {
    v10 = CFSTR("PreventUserIdleSystemSleep");
  }
  GEOFindOrCreateLog("com.apple.GeoServices", "PowerAssertion");
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
  {
    v12 = CFSTR("<unknown>");
    if (a3 == 1)
      v12 = CFSTR("BackgroundTask");
    *(_DWORD *)buf = 138543875;
    if (!a3)
      v12 = CFSTR("PreventSystemSleep");
    v22 = v12;
    v23 = 2113;
    v24 = v8;
    v25 = 2048;
    v26 = a5;
    _os_log_impl(&dword_1885A9000, v11, OS_LOG_TYPE_INFO, "Creating power assertion of type %{public}@ for \"%{private}@\" (timeout = %f)", buf, 0x20u);
  }

  v13 = IOPMAssertionCreateWithDescription(v10, v8, v8, 0, 0, a5, CFSTR("TimeoutActionTurnOff"), &v9->_assertion);
  if (!v13)
  {
    v18 = -[__CFString copy](v8, "copy");
    identifier = v9->_identifier;
    v9->_identifier = (NSString *)v18;

    v9->_timeout = a5;
    v9->_type = a3;
    v16 = v9;
    goto LABEL_17;
  }
  v14 = v13;
  v9->_assertion = 0;
  GEOFindOrCreateLog("com.apple.GeoServices", "PowerAssertion");
  v15 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138543618;
    v22 = v8;
    v23 = 1024;
    LODWORD(v24) = v14;
    _os_log_impl(&dword_1885A9000, v15, OS_LOG_TYPE_ERROR, "Failed to create power assertion for \"%{public}@\" (%d)", buf, 0x12u);
  }

LABEL_16:
  v16 = 0;
LABEL_17:

  return v16;
}

- (void)dealloc
{
  NSObject *v3;
  NSString *identifier;
  IOReturn v5;
  IOReturn v6;
  NSObject *v7;
  NSString *v8;
  objc_super v9;
  uint8_t buf[4];
  NSString *v11;
  __int16 v12;
  IOReturn v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  if (self->_assertion)
  {
    GEOFindOrCreateLog("com.apple.GeoServices", "PowerAssertion");
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      identifier = self->_identifier;
      *(_DWORD *)buf = 138477827;
      v11 = identifier;
      _os_log_impl(&dword_1885A9000, v3, OS_LOG_TYPE_INFO, "Releasing power assertion with identifier: %{private}@", buf, 0xCu);
    }

    v5 = IOPMAssertionRelease(self->_assertion);
    if (v5)
    {
      v6 = v5;
      GEOFindOrCreateLog("com.apple.GeoServices", "PowerAssertion");
      v7 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      {
        v8 = self->_identifier;
        *(_DWORD *)buf = 138543618;
        v11 = v8;
        v12 = 1024;
        v13 = v6;
        _os_log_impl(&dword_1885A9000, v7, OS_LOG_TYPE_ERROR, "Failed to properly release power assertion for \"%{public}@\" (%d). Dropping it instead.", buf, 0x12u);
      }

    }
  }
  v9.receiver = self;
  v9.super_class = (Class)GEOPowerAssertion;
  -[GEOPowerAssertion dealloc](&v9, sel_dealloc);
}

- (id)description
{
  void *v3;
  uint64_t v4;
  void *v5;
  int64_t type;
  const __CFString *v7;
  const __CFString *v8;
  void *v9;
  objc_super v11;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v11.receiver = self;
  v11.super_class = (Class)GEOPowerAssertion;
  -[GEOPowerAssertion description](&v11, sel_description);
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = (void *)v4;
  type = self->_type;
  v7 = CFSTR("<unknown>");
  if (type == 1)
    v7 = CFSTR("BackgroundTask");
  if (type)
    v8 = v7;
  else
    v8 = CFSTR("PreventSystemSleep");
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ Type: %@, Identifier: %@, timeout: %f"), v4, v8, self->_identifier, *(_QWORD *)&self->_timeout);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_identifier, 0);
}

@end
