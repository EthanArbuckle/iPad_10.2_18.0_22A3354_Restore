@implementation DNDSClientConnectionDetails

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_activeAssertionUpdateClientIdentifiers, 0);
  objc_storeStrong((id *)&self->_assertionUpdateClientIdentifiers, 0);
  objc_storeStrong((id *)&self->_interruptionInvalidationAssertionUUID, 0);
}

- (id)_initWithDetails:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  char v10;
  char v11;
  char v12;
  id v13;
  uint64_t v15;
  unsigned int v16;

  v4 = a3;
  -[DNDSClientConnectionDetails interruptionInvalidationAssertionUUID](self, "interruptionInvalidationAssertionUUID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "assertionUpdateClientIdentifiers");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "activeAssertionUpdateClientIdentifiers");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = objc_msgSend(v4, "wantsStateUpdates");
  v8 = objc_msgSend(v4, "wantsSettingsUpdates");
  v9 = objc_msgSend(v4, "wantsModeUpdates");
  v10 = objc_msgSend(v4, "wantsActiveModeUpdates");
  v11 = objc_msgSend(v4, "wantsGlobalConfigurationUpdates");
  v12 = objc_msgSend(v4, "wantsMeDeviceStateUpdates");

  BYTE2(v15) = v12;
  BYTE1(v15) = v11;
  LOBYTE(v15) = v10;
  v13 = -[DNDSClientConnectionDetails _initWithInterruptionInvalidationAssertionUUID:assertionUpdateClientIdentifiers:activeAssertionUpdateClientIdentifiers:wantsStateUpdates:wantsSettingsUpdates:wantsModeUpdates:wantsActiveModeUpdates:wantsGlobalConfigurationUpdates:wantsMeDeviceStateUpdates:](self, "_initWithInterruptionInvalidationAssertionUUID:assertionUpdateClientIdentifiers:activeAssertionUpdateClientIdentifiers:wantsStateUpdates:wantsSettingsUpdates:wantsModeUpdates:wantsActiveModeUpdates:wantsGlobalConfigurationUpdates:wantsMeDeviceStateUpdates:", v5, v6, v7, v16, v8, v9, v15);

  return v13;
}

- (NSUUID)interruptionInvalidationAssertionUUID
{
  return self->_interruptionInvalidationAssertionUUID;
}

- (id)_initWithInterruptionInvalidationAssertionUUID:(id)a3 assertionUpdateClientIdentifiers:(id)a4 activeAssertionUpdateClientIdentifiers:(id)a5 wantsStateUpdates:(BOOL)a6 wantsSettingsUpdates:(BOOL)a7 wantsModeUpdates:(BOOL)a8 wantsActiveModeUpdates:(BOOL)a9 wantsGlobalConfigurationUpdates:(BOOL)a10 wantsMeDeviceStateUpdates:(BOOL)a11
{
  id v17;
  id v18;
  id v19;
  DNDSClientConnectionDetails *v20;
  uint64_t v21;
  NSUUID *interruptionInvalidationAssertionUUID;
  void *v23;
  void *v24;
  NSSet *v25;
  NSSet *assertionUpdateClientIdentifiers;
  void *v27;
  void *v28;
  NSSet *v29;
  NSSet *activeAssertionUpdateClientIdentifiers;
  objc_super v32;

  v17 = a3;
  v18 = a4;
  v19 = a5;
  v32.receiver = self;
  v32.super_class = (Class)DNDSClientConnectionDetails;
  v20 = -[DNDSClientConnectionDetails init](&v32, sel_init);
  if (v20)
  {
    v21 = objc_msgSend(v17, "copy");
    interruptionInvalidationAssertionUUID = v20->_interruptionInvalidationAssertionUUID;
    v20->_interruptionInvalidationAssertionUUID = (NSUUID *)v21;

    v23 = (void *)objc_msgSend(v18, "copy");
    v24 = v23;
    if (v23)
    {
      v25 = v23;
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E60], "set");
      v25 = (NSSet *)objc_claimAutoreleasedReturnValue();
    }
    assertionUpdateClientIdentifiers = v20->_assertionUpdateClientIdentifiers;
    v20->_assertionUpdateClientIdentifiers = v25;

    v27 = (void *)objc_msgSend(v19, "copy");
    v28 = v27;
    if (v27)
    {
      v29 = v27;
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E60], "set");
      v29 = (NSSet *)objc_claimAutoreleasedReturnValue();
    }
    activeAssertionUpdateClientIdentifiers = v20->_activeAssertionUpdateClientIdentifiers;
    v20->_activeAssertionUpdateClientIdentifiers = v29;

    v20->_wantsStateUpdates = a6;
    v20->_wantsSettingsUpdates = a7;
    v20->_wantsModeUpdates = a8;
    v20->_wantsActiveModeUpdates = a9;
    v20->_wantsGlobalConfigurationUpdates = a10;
    v20->_wantsMeDeviceStateUpdates = a11;
  }

  return v20;
}

- (BOOL)wantsStateUpdates
{
  return self->_wantsStateUpdates;
}

- (BOOL)wantsSettingsUpdates
{
  return self->_wantsSettingsUpdates;
}

- (BOOL)wantsModeUpdates
{
  return self->_wantsModeUpdates;
}

- (BOOL)wantsMeDeviceStateUpdates
{
  return self->_wantsMeDeviceStateUpdates;
}

- (BOOL)wantsGlobalConfigurationUpdates
{
  return self->_wantsGlobalConfigurationUpdates;
}

- (BOOL)wantsActiveModeUpdates
{
  return self->_wantsActiveModeUpdates;
}

- (id)mutableCopyWithZone:(_NSZone *)a3
{
  return -[DNDSClientConnectionDetails _initWithDetails:]([DNDSMutableClientConnectionDetails alloc], "_initWithDetails:", self);
}

- (DNDSClientConnectionDetails)init
{
  return (DNDSClientConnectionDetails *)-[DNDSClientConnectionDetails _initWithDetails:](self, "_initWithDetails:", 0);
}

- (NSSet)assertionUpdateClientIdentifiers
{
  return self->_assertionUpdateClientIdentifiers;
}

- (NSSet)activeAssertionUpdateClientIdentifiers
{
  return self->_activeAssertionUpdateClientIdentifiers;
}

@end
