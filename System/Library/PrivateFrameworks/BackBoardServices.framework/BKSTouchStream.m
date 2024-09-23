@implementation BKSTouchStream

- (void)setEventDispatchMode:(unsigned __int8)a3 ambiguityRecommendation:(unsigned __int8)a4 lastTouchTimestamp:(double)a5
{
  mach_port_t v9;

  v9 = _BKSServerPortHelper("com.apple.backboard.hid.services", BKSHIDServerPort, &BKSHIDServerMachPort, (void (__cdecl *)(CFMachPortRef, void *))_InvalidateHIDServicesPort);
  _BKSHIDTouchStreamSetEventDispatchMode(v9, -[BKSTouchStream reference](self, "reference"), a3, a4, a5);
}

- (unsigned)reference
{
  return self->_reference;
}

- (BKSTouchStream)initWithContextID:(unsigned int)a3 displayUUID:(id)a4 identifier:(unsigned __int8)a5 policy:(id)a6
{
  int v7;
  __CFString *v10;
  id v11;
  BKSTouchStream *v12;
  mach_port_name_t v13;
  int v14;
  BKSTouchStream *v15;
  NSObject *v16;
  objc_super v18;
  uint8_t buf[4];
  const char *v20;
  __int16 v21;
  int v22;
  char buffer[16];
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  uint64_t v55;

  v7 = a5;
  v55 = *MEMORY[0x1E0C80C00];
  v10 = (__CFString *)a4;
  v11 = a6;
  v18.receiver = self;
  v18.super_class = (Class)BKSTouchStream;
  v12 = -[BKSTouchStream init](&v18, sel_init);
  if (!v12)
    goto LABEL_6;
  v53 = 0u;
  v54 = 0u;
  if (!v10)
    v10 = &stru_1E1EA2860;
  v51 = 0uLL;
  v52 = 0uLL;
  v49 = 0uLL;
  v50 = 0uLL;
  v47 = 0uLL;
  v48 = 0uLL;
  v45 = 0uLL;
  v46 = 0uLL;
  v43 = 0uLL;
  v44 = 0uLL;
  v41 = 0uLL;
  v42 = 0uLL;
  v39 = 0uLL;
  v40 = 0uLL;
  v37 = 0uLL;
  v38 = 0uLL;
  v35 = 0uLL;
  v36 = 0uLL;
  v33 = 0uLL;
  v34 = 0uLL;
  v31 = 0uLL;
  v32 = 0uLL;
  v29 = 0uLL;
  v30 = 0uLL;
  v27 = 0uLL;
  v28 = 0uLL;
  v25 = 0uLL;
  v26 = 0uLL;
  *(_OWORD *)buffer = 0uLL;
  v24 = 0uLL;
  if (CFStringGetCString(v10, buffer, 1024, 0x8000100u))
  {
    v13 = _BKSServerPortHelper("com.apple.backboard.hid.services", BKSHIDServerPort, &BKSHIDServerMachPort, (void (__cdecl *)(CFMachPortRef, void *))_InvalidateHIDServicesPort);
    v14 = _BKSHIDTouchStreamCreate(v13, a3, buffer, v7, objc_msgSend(v11, "shouldSendAmbiguityRecommendations"), &v12->_reference);
    if (!v14)
    {
LABEL_6:
      v15 = v12;
      goto LABEL_11;
    }
  }
  else
  {
    v14 = 10;
  }
  BKLogCommon();
  v16 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 136315394;
    v20 = "-[BKSTouchStream initWithContextID:displayUUID:identifier:policy:]";
    v21 = 1024;
    v22 = v14;
    _os_log_error_impl(&dword_18A0F0000, v16, OS_LOG_TYPE_ERROR, "%s failed to create touch stream:%d", buf, 0x12u);
  }

  v15 = 0;
LABEL_11:

  return v15;
}

- (void)setEventDispatchMode:(unsigned __int8)a3 lastTouchTimestamp:(double)a4
{
  -[BKSTouchStream setEventDispatchMode:ambiguityRecommendation:lastTouchTimestamp:](self, "setEventDispatchMode:ambiguityRecommendation:lastTouchTimestamp:", a3, 0, a4);
}

- (void)invalidate
{
  int v3;

  v3 = _BKSServerPortHelper("com.apple.backboard.hid.services", BKSHIDServerPort, &BKSHIDServerMachPort, (void (__cdecl *)(CFMachPortRef, void *))_InvalidateHIDServicesPort);
  _BKSHIDTouchStreamInvalidate(v3, -[BKSTouchStream reference](self, "reference"));
}

- (void)setReference:(unsigned int)a3
{
  self->_reference = a3;
}

@end
