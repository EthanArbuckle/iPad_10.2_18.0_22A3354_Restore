@implementation HDWatchRemoteFeatureAvailabilityDataSource

- (HDWatchRemoteFeatureAvailabilityDataSource)initWithDevice:(id)a3
{
  id v5;
  HDWatchRemoteFeatureAvailabilityDataSource *v6;
  HDWatchRemoteFeatureAvailabilityDataSource *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)HDWatchRemoteFeatureAvailabilityDataSource;
  v6 = -[HDWatchRemoteFeatureAvailabilityDataSource init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_device, a3);

  return v7;
}

- ($9FE6E10C8CE45DBC9A88DFDEA39A390D)iOSVersion
{
  void *v5;
  int v6;
  $9FE6E10C8CE45DBC9A88DFDEA39A390D *result;
  void *v8;
  unsigned int v9;
  int64_t v10;
  void *v11;
  uint64_t v12;
  void *v13;

  objc_msgSend(MEMORY[0x1E0CB6F18], "sharedBehavior");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "isAppleWatch");

  if (v6)
  {
    result = ($9FE6E10C8CE45DBC9A88DFDEA39A390D *)self->_device;
    if (result)
    {
      -[$9FE6E10C8CE45DBC9A88DFDEA39A390D valueForProperty:](result, "valueForProperty:", *MEMORY[0x1E0D51778]);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = NRRawVersionFromString();

      retstr->var0 = HIWORD(v9);
      retstr->var1 = BYTE1(v9);
      v10 = v9;
    }
    else
    {
      v12 = MEMORY[0x1E0CB5650];
      *(_OWORD *)&retstr->var0 = *MEMORY[0x1E0CB5650];
      v10 = *(_QWORD *)(v12 + 16);
    }
    retstr->var2 = v10;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB6F18], "sharedBehavior");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (v11)
    {
      v13 = v11;
      objc_msgSend(v11, "currentOSVersionStruct");
      v11 = v13;
    }
    else
    {
      retstr->var0 = 0;
      retstr->var1 = 0;
      retstr->var2 = 0;
    }

  }
  return result;
}

- (id)iOSBuildVersion
{
  void *v3;
  int v4;
  NRDevice *device;
  void *v6;
  void *v7;

  objc_msgSend(MEMORY[0x1E0CB6F18], "sharedBehavior");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isAppleWatch");

  if (v4)
  {
    if (self)
      device = self->_device;
    else
      device = 0;
    -[NRDevice valueForProperty:](device, "valueForProperty:", *MEMORY[0x1E0D51760]);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB6F18], "sharedBehavior");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "currentOSBuild");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v6;
}

- ($9FE6E10C8CE45DBC9A88DFDEA39A390D)watchOSVersion
{
  void *v5;
  int v6;
  $9FE6E10C8CE45DBC9A88DFDEA39A390D *result;
  int64_t v8;
  uint64_t v9;

  objc_msgSend(MEMORY[0x1E0CB6F18], "sharedBehavior");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "isAppleWatch");

  if (v6)
  {
    result = ($9FE6E10C8CE45DBC9A88DFDEA39A390D *)NRWatchOSVersionForLocalDevice();
    if (!self)
    {
      retstr->var0 = 0;
      retstr->var1 = 0;
      retstr->var2 = 0;
      return result;
    }
  }
  else
  {
    if (!self || (result = ($9FE6E10C8CE45DBC9A88DFDEA39A390D *)self->_device) == 0)
    {
      v9 = MEMORY[0x1E0CB5650];
      *(_OWORD *)&retstr->var0 = *MEMORY[0x1E0CB5650];
      v8 = *(_QWORD *)(v9 + 16);
      goto LABEL_8;
    }
    result = ($9FE6E10C8CE45DBC9A88DFDEA39A390D *)NRWatchOSVersionForRemoteDevice();
  }
  retstr->var0 = result >> 16;
  retstr->var1 = BYTE1(result);
  v8 = result;
LABEL_8:
  retstr->var2 = v8;
  return result;
}

- (id)watchRegion
{
  void *v3;
  int v4;
  void *v5;
  void *v6;
  NRDevice *device;

  objc_msgSend(MEMORY[0x1E0CB6F18], "sharedBehavior");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isAppleWatch");

  if (v4)
  {
    objc_msgSend(MEMORY[0x1E0CB6F18], "sharedBehavior");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "currentDeviceRegionCode");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    if (self)
      device = self->_device;
    else
      device = 0;
    -[NRDevice valueForProperty:](device, "valueForProperty:", *MEMORY[0x1E0D51748]);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v6;
}

- (id)watchRegionInfo
{
  void *v3;
  int v4;
  void *v5;
  void *v6;
  NRDevice *device;

  objc_msgSend(MEMORY[0x1E0CB6F18], "sharedBehavior");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isAppleWatch");

  if (v4)
  {
    objc_msgSend(MEMORY[0x1E0CB6F18], "sharedBehavior");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "currentDeviceRegionInfo");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    if (self)
      device = self->_device;
    else
      device = 0;
    -[NRDevice valueForProperty:](device, "valueForProperty:", *MEMORY[0x1E0D51750]);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v6;
}

- (id)watchModelNumber
{
  void *v3;
  int v4;
  void *v5;
  NRDevice *device;

  objc_msgSend(MEMORY[0x1E0CB6F18], "sharedBehavior");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isAppleWatch");

  if (v4)
  {
    v5 = (void *)MGGetStringAnswer();
  }
  else
  {
    if (self)
      device = self->_device;
    else
      device = 0;
    -[NRDevice valueForProperty:](device, "valueForProperty:", *MEMORY[0x1E0D51720]);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v5;
}

- (id)watchBuildType
{
  void *v3;
  int v4;
  void *v5;
  NRDevice *device;

  objc_msgSend(MEMORY[0x1E0CB6F18], "sharedBehavior");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isAppleWatch");

  if (v4)
  {
    objc_msgSend(MEMORY[0x1E0CB6F18], "currentDeviceReleaseType");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    if (self)
      device = self->_device;
    else
      device = 0;
    -[NRDevice valueForProperty:](device, "valueForProperty:", *MEMORY[0x1E0D51640]);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v5;
}

- (id)watchProductType
{
  void *v3;
  int v4;
  void *v5;
  void *v6;
  NRDevice *device;

  objc_msgSend(MEMORY[0x1E0CB6F18], "sharedBehavior");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isAppleWatch");

  if (v4)
  {
    objc_msgSend(MEMORY[0x1E0CB6F18], "sharedBehavior");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "currentDeviceProductType");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    if (self)
      device = self->_device;
    else
      device = 0;
    -[NRDevice valueForProperty:](device, "valueForProperty:", *MEMORY[0x1E0D51738]);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v6;
}

- (id)watchOSBuildVersion
{
  void *v3;
  int v4;
  void *v5;
  void *v6;
  NRDevice *device;

  objc_msgSend(MEMORY[0x1E0CB6F18], "sharedBehavior");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isAppleWatch");

  if (v4)
  {
    objc_msgSend(MEMORY[0x1E0CB6F18], "sharedBehavior");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "currentOSBuild");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    if (self)
      device = self->_device;
    else
      device = 0;
    -[NRDevice valueForProperty:](device, "valueForProperty:", *MEMORY[0x1E0D51760]);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v6;
}

- (id)currentDeviceClass
{
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x1E0CB6F18], "sharedBehavior");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "currentDeviceClass");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- ($9FE6E10C8CE45DBC9A88DFDEA39A390D)watchAtrialFibrillationDetectionVersion
{
  void *v5;
  int v6;
  $9FE6E10C8CE45DBC9A88DFDEA39A390D *result;
  NRDevice *device;
  uint64_t v9;
  id v10;

  objc_msgSend(MEMORY[0x1E0CB6F18], "sharedBehavior");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "isCompanionCapable");

  if (v6)
  {
    if (self)
      device = self->_device;
    else
      device = 0;
    -[NRDevice valueForProperty:](device, "valueForProperty:", *MEMORY[0x1E0D51638]);
    v10 = (id)objc_claimAutoreleasedReturnValue();
    HKNSOperatingSystemVersionFromString();

  }
  else
  {
    v9 = MEMORY[0x1E0CB5E88];
    *(_OWORD *)&retstr->var0 = *MEMORY[0x1E0CB5E88];
    retstr->var2 = *(_QWORD *)(v9 + 16);
  }
  return result;
}

- (NSString)onboardingCountryCode
{
  return self->_onboardingCountryCode;
}

- (void)setOnboardingCountryCode:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_device, 0);
  objc_storeStrong((id *)&self->_onboardingCountryCode, 0);
}

@end
