@implementation HDHRElectrocardiogramRecordingV1RegionAvailabilityProvider

- (HDHRElectrocardiogramRecordingV1RegionAvailabilityProvider)initWithRegionAvailabilityProvider:(id)a3 pairedDeviceCapabilityProvider:(id)a4
{
  id v7;
  id v8;
  HDHRElectrocardiogramRecordingV1RegionAvailabilityProvider *v9;
  HDHRElectrocardiogramRecordingV1RegionAvailabilityProvider *v10;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)HDHRElectrocardiogramRecordingV1RegionAvailabilityProvider;
  v9 = -[HDHRElectrocardiogramRecordingV1RegionAvailabilityProvider init](&v12, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_backingProvider, a3);
    objc_storeStrong((id *)&v10->_capabilityProvider, a4);
  }

  return v10;
}

- (id)onboardingEligibilityForCountryCode:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;

  v4 = a3;
  -[HDPairedDeviceCapabilityProviding activePairedDevice](self->_capabilityProvider, "activePairedDevice");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    -[HDHRElectrocardiogramRecordingV1RegionAvailabilityProvider onboardingEligibilityForCountryCode:device:](self, "onboardingEligibilityForCountryCode:device:", v4, v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v7 = objc_alloc(MEMORY[0x1E0CB66D0]);
    objc_msgSend(MEMORY[0x1E0CB6F18], "sharedBehavior");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "currentOSBuild");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = (void *)objc_msgSend(v7, "initWithIneligibilityReasons:countryAvailabilityVersion:", 2, v9);

  }
  return v6;
}

- (id)onboardingEligibilityForCountryCode:(id)a3 device:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  int v18;
  uint64_t v19;
  void *v20;
  int v21;
  id v22;
  uint64_t v23;
  void *v24;
  id v25;
  uint64_t v26;
  void *v27;
  id v28;
  uint64_t v29;
  unint64_t v30;
  void *v31;

  v6 = a3;
  v7 = a4;
  -[HDObservableRegionAvailabilityProviding regionAvailabilityForDevice:](self->_backingProvider, "regionAvailabilityForDevice:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "allowedCountries");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "remoteState");

  if (v10 == 4)
  {
    v11 = (void *)MEMORY[0x1E0CB3940];
    objc_msgSend(MEMORY[0x1E0CB6F18], "sharedBehavior");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "currentOSBuild");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "version");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "stringWithFormat:", CFSTR("%@.%@"), v13, v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v6)
    {
      v28 = objc_alloc(MEMORY[0x1E0CB66D0]);
      v29 = 1;
LABEL_21:
      v27 = (void *)objc_msgSend(v28, "initWithIneligibilityReasons:countryAvailabilityVersion:", v29, v15);

      goto LABEL_22;
    }
    objc_msgSend(v8, "allowedCountries");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "localCountrySet");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = objc_msgSend(v17, "containsCountryCode:", v6);

    if (v18)
      v19 = 0;
    else
      v19 = 8;
    objc_msgSend(MEMORY[0x1E0CB6F18], "sharedBehavior");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = objc_msgSend(v20, "isAppleWatch");

    v22 = v6;
    objc_msgSend(v7, "valueForProperty:", *MEMORY[0x1E0D51778]);
    v23 = objc_claimAutoreleasedReturnValue();
    v24 = (void *)v23;
    if (v21)
    {
      if (v23)
      {
        v25 = v22;
        NRRawVersionFromString();
        v26 = HKElectrocardiogramSupportedStatedForGeolocatedCountryCodeAndIOSVersion();
        goto LABEL_13;
      }
      _HKInitializeLogging();
      v31 = (void *)*MEMORY[0x1E0CB52F0];
      if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB52F0], OS_LOG_TYPE_ERROR))
        goto LABEL_19;
    }
    else
    {
      if (v23)
      {
        v25 = v22;
        NRRawVersionFromString();
        v26 = HKElectrocardiogramSupportedStatedForGeolocatedCountryCodeAndWatchOSVersion();
LABEL_13:
        v30 = v26;

        if (v30 < 2)
        {

LABEL_20:
          v28 = objc_alloc(MEMORY[0x1E0CB66D0]);
          v29 = v19;
          goto LABEL_21;
        }
LABEL_19:

        v19 |= 0x20uLL;
        goto LABEL_20;
      }
      _HKInitializeLogging();
      v31 = (void *)*MEMORY[0x1E0CB52F0];
      if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB52F0], OS_LOG_TYPE_ERROR))
        goto LABEL_19;
    }
    -[HDHRElectrocardiogramRecordingV1RegionAvailabilityProvider onboardingEligibilityForCountryCode:device:].cold.1(v31);
    goto LABEL_19;
  }
  -[HDObservableRegionAvailabilityProviding onboardingEligibilityForCountryCode:device:](self->_backingProvider, "onboardingEligibilityForCountryCode:device:", v6, v7);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_22:

  return v27;
}

- (id)regionAvailability
{
  return (id)-[HDObservableRegionAvailabilityProviding regionAvailability](self->_backingProvider, "regionAvailability");
}

- (id)regionAvailabilityForDevice:(id)a3
{
  return (id)-[HDObservableRegionAvailabilityProviding regionAvailabilityForDevice:](self->_backingProvider, "regionAvailabilityForDevice:", a3);
}

- (HDRegionAvailabilityProvidingDelegate)delegate
{
  return (HDRegionAvailabilityProvidingDelegate *)objc_loadWeakRetained((id *)&self->delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->delegate, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->delegate);
  objc_storeStrong((id *)&self->_capabilityProvider, 0);
  objc_storeStrong((id *)&self->_backingProvider, 0);
}

- (void)onboardingEligibilityForCountryCode:(void *)a1 device:.cold.1(void *a1)
{
  void *v1;
  id v2;
  void *v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint8_t v11;

  v2 = a1;
  v3 = (void *)OUTLINED_FUNCTION_9();
  v4 = OUTLINED_FUNCTION_7(v3);
  OUTLINED_FUNCTION_4(&dword_1CC29C000, v5, v6, "[%{public}@] Watch version is nil", v7, v8, v9, v10, v11);

  OUTLINED_FUNCTION_8();
}

@end
