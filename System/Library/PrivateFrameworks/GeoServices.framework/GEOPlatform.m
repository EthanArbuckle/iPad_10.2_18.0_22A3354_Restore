@implementation GEOPlatform

+ (BOOL)isRunningInGeod
{
  return _sIsRunningInGeod;
}

- (BOOL)isInternalInstall
{
  if (qword_1ECDBC4C8 != -1)
    dispatch_once(&qword_1ECDBC4C8, &__block_literal_global_2_1);
  return _MergedGlobals_282;
}

+ (id)sharedPlatform
{
  if (qword_1ECDBC4B8 != -1)
    dispatch_once(&qword_1ECDBC4B8, &__block_literal_global_144);
  return (id)qword_1ECDBC4C0;
}

- (BOOL)supportsMultiUser
{
  if (qword_1ECDBC568 != -1)
    dispatch_once(&qword_1ECDBC568, &__block_literal_global_54_0);
  return byte_1ECDBC4AE;
}

void __34__GEOPlatform_supportsAdvancedMap__block_invoke()
{
  NSObject *v0;
  const __CFString *v1;
  int v2;
  const __CFString *v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  byte_1ECDBC4AB = MGGetBoolAnswer();
  GEOFindOrCreateLog("com.apple.GeoServices", "GEOPlatform");
  v0 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_INFO))
  {
    if (byte_1ECDBC4AB)
      v1 = CFSTR("YES");
    else
      v1 = CFSTR("NO");
    v2 = 138412290;
    v3 = v1;
    _os_log_impl(&dword_1885A9000, v0, OS_LOG_TYPE_INFO, "Advanced Map Support: %@", (uint8_t *)&v2, 0xCu);
  }

}

- (BOOL)supportsAdvancedMap
{
  if (qword_1ECDBC550 != -1)
    dispatch_once(&qword_1ECDBC550, &__block_literal_global_35_0);
  return byte_1ECDBC4AB;
}

- (BOOL)mapsFeatureFreedomEnabled
{
  void *v3;
  int v4;

  objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "BOOLForKey:", CFSTR("MapsFeatureFreedom"));

  return v4 && -[GEOPlatform isInternalInstall](self, "isInternalInstall");
}

- (id)deviceCountrySKUForServiceRequests
{
  void *v2;
  void *v3;
  id v4;

  -[GEOPlatform deviceCountrySKU](self, "deviceCountrySKU");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2)
  {
    _getValue(GeoServicesConfig_SKURegionsServiceAllowlist, (uint64_t)off_1EDF4DDC8, 1, 0, 0, 0);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = 0;
    if (objc_msgSend(v3, "containsObject:", v2))
      v4 = v2;

  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (id)deviceCountrySKU
{
  if (qword_1ECDBC538 != -1)
    dispatch_once(&qword_1ECDBC538, &__block_literal_global_23_1);
  return (id)qword_1ECDBC530;
}

void __32__GEOPlatform_deviceScreenScale__block_invoke()
{
  uint64_t v0;
  void *v1;
  void *v2;
  uint64_t v3;

  v0 = deviceScreenScale__deviceScreenScale;
  v1 = (void *)MGCopyAnswer();
  v2 = v1;
  if (v1)
  {
    objc_msgSend(v1, "doubleValue");
    v0 = v3;
  }

  deviceScreenScale__deviceScreenScale = v0;
}

- (id)hardwareIdentifier
{
  if (qword_1ECDBC518 != -1)
    dispatch_once(&qword_1ECDBC518, &__block_literal_global_15_0);
  return (id)qword_1ECDBC510;
}

- (id)productName
{
  if (qword_1ECDBC4D8 != -1)
    dispatch_once(&qword_1ECDBC4D8, &__block_literal_global_4_2);
  return (id)qword_1ECDBC4D0;
}

- (id)osAndBuildVersion
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __32__GEOPlatform_osAndBuildVersion__block_invoke;
  block[3] = &unk_1E1BFF6F8;
  block[4] = self;
  if (qword_1ECDBC508 != -1)
    dispatch_once(&qword_1ECDBC508, block);
  return (id)qword_1ECDBC500;
}

uint64_t __32__GEOPlatform_supportsMultiUser__block_invoke()
{
  uint64_t result;

  result = MGGetBoolAnswer();
  byte_1ECDBC4AE = result;
  return result;
}

void __32__GEOPlatform_osAndBuildVersion__block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  void *v5;
  id v6;

  v2 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend(*(id *)(a1 + 32), "osVersion");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "buildVersion");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stringWithFormat:", CFSTR("%@.%@"), v6, v3);
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = (void *)qword_1ECDBC500;
  qword_1ECDBC500 = v4;

}

- (id)osVersion
{
  if (qword_1ECDBC4E8 != -1)
    dispatch_once(&qword_1ECDBC4E8, &__block_literal_global_6_3);
  return (id)qword_1ECDBC4E0;
}

- (id)buildVersion
{
  if (qword_1ECDBC4F8 != -1)
    dispatch_once(&qword_1ECDBC4F8, &__block_literal_global_9_0);
  return (id)qword_1ECDBC4F0;
}

uint64_t __32__GEOPlatform_isInternalInstall__block_invoke()
{
  uint64_t result;

  result = os_variant_has_internal_diagnostics();
  _MergedGlobals_282 = result;
  return result;
}

+ (BOOL)isRunningInGeoAPd
{
  return _sIsRunningInGeoAPd;
}

- (double)deviceScreenScale
{
  if (deviceScreenScale_once != -1)
    dispatch_once(&deviceScreenScale_once, &__block_literal_global_77);
  return *(double *)&deviceScreenScale__deviceScreenScale;
}

void __29__GEOPlatform_sharedPlatform__block_invoke()
{
  GEOPlatform *v0;
  void *v1;

  v0 = objc_alloc_init(GEOPlatform);
  v1 = (void *)qword_1ECDBC4C0;
  qword_1ECDBC4C0 = (uint64_t)v0;

}

- (GEOPlatform)init
{
  GEOPlatform *v2;
  uint64_t v3;
  OS_dispatch_queue *coreTelephonyIsolationQueue;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)GEOPlatform;
  v2 = -[GEOPlatform init](&v6, sel_init);
  if (v2)
  {
    v3 = geo_dispatch_queue_create();
    coreTelephonyIsolationQueue = v2->_coreTelephonyIsolationQueue;
    v2->_coreTelephonyIsolationQueue = (OS_dispatch_queue *)v3;

  }
  return v2;
}

void __24__GEOPlatform_osVersion__block_invoke()
{
  uint64_t v0;
  void *v1;

  v0 = MGCopyAnswer();
  v1 = (void *)qword_1ECDBC4E0;
  qword_1ECDBC4E0 = v0;

}

void __31__GEOPlatform_deviceCountrySKU__block_invoke()
{
  uint64_t v0;
  void *v1;

  v0 = MGCopyAnswer();
  v1 = (void *)qword_1ECDBC530;
  qword_1ECDBC530 = v0;

}

void __27__GEOPlatform_buildVersion__block_invoke()
{
  uint64_t v0;
  void *v1;

  v0 = MGCopyAnswer();
  v1 = (void *)qword_1ECDBC4F0;
  qword_1ECDBC4F0 = v0;

}

void __26__GEOPlatform_productName__block_invoke()
{
  uint64_t v0;
  void *v1;

  v0 = MGCopyAnswer();
  v1 = (void *)qword_1ECDBC4D0;
  qword_1ECDBC4D0 = v0;

}

void __33__GEOPlatform_hardwareIdentifier__block_invoke()
{
  uint64_t v0;
  void *v1;
  void *v2;

  v0 = MGCopyAnswer();
  v1 = (void *)qword_1ECDBC510;
  qword_1ECDBC510 = v0;

  if (!objc_msgSend((id)qword_1ECDBC510, "length"))
  {
    v2 = (void *)qword_1ECDBC510;
    qword_1ECDBC510 = (uint64_t)CFSTR("unknown");

  }
}

+ (void)setIsRunningInGeod:(BOOL)a3
{
  _sIsRunningInGeod = 1;
}

+ (void)setIsRunningInGeoAPd:(BOOL)a3
{
  _sIsRunningInGeoAPd = 1;
}

- (id)hardwareClass
{
  if (qword_1ECDBC528 != -1)
    dispatch_once(&qword_1ECDBC528, &__block_literal_global_20);
  return (id)qword_1ECDBC520;
}

void __28__GEOPlatform_hardwareClass__block_invoke()
{
  uint64_t v0;
  void *v1;

  v0 = MGCopyAnswer();
  v1 = (void *)qword_1ECDBC520;
  qword_1ECDBC520 = v0;

}

uint64_t __40__GEOPlatform__deviceSupportsNavigation__block_invoke()
{
  uint64_t result;

  result = MGGetBoolAnswer();
  byte_1ECDBC4A9 = result;
  return result;
}

- (BOOL)supportsRealisticTiles
{
  if (self)
  {
    if (qword_1ECDBC540 != -1)
      dispatch_once(&qword_1ECDBC540, &__block_literal_global_26);
    LOBYTE(self) = byte_1ECDBC4A9 != 0;
  }
  return (char)self;
}

- (BOOL)supportsNavigation
{
  if (self)
  {
    if (qword_1ECDBC540 != -1)
      dispatch_once(&qword_1ECDBC540, &__block_literal_global_26);
    LOBYTE(self) = byte_1ECDBC4A9 != 0;
  }
  return (char)self;
}

- (BOOL)supportsForceTouch
{
  if (qword_1ECDBC548 != -1)
    dispatch_once(&qword_1ECDBC548, &__block_literal_global_32_0);
  return byte_1ECDBC4AA;
}

uint64_t __33__GEOPlatform_supportsForceTouch__block_invoke()
{
  uint64_t result;

  result = MGGetBoolAnswer();
  byte_1ECDBC4AA = result;
  return result;
}

- (BOOL)supportsASTC
{
  if (qword_1ECDBC558 != -1)
    dispatch_once(&qword_1ECDBC558, &__block_literal_global_43);
  return byte_1ECDBC4AC;
}

uint64_t __27__GEOPlatform_supportsASTC__block_invoke()
{
  uint64_t result;

  result = MGGetBoolAnswer();
  byte_1ECDBC4AC = result;
  return result;
}

- (BOOL)isCellDataPossible
{
  NSObject *coreTelephonyIsolationQueue;
  BOOL v4;
  _QWORD v6[6];
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  char v10;

  if (qword_1ECDBC560 != -1)
    dispatch_once(&qword_1ECDBC560, &__block_literal_global_49);
  if (!byte_1ECDBC4AD)
    return 0;
  v7 = 0;
  v8 = &v7;
  v9 = 0x2020000000;
  v10 = 0;
  coreTelephonyIsolationQueue = self->_coreTelephonyIsolationQueue;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __33__GEOPlatform_isCellDataPossible__block_invoke_2;
  v6[3] = &unk_1E1BFF920;
  v6[4] = self;
  v6[5] = &v7;
  dispatch_sync(coreTelephonyIsolationQueue, v6);
  v4 = *((_BYTE *)v8 + 24) != 0;
  _Block_object_dispose(&v7, 8);
  return v4;
}

uint64_t __33__GEOPlatform_isCellDataPossible__block_invoke()
{
  uint64_t result;

  result = MGGetBoolAnswer();
  byte_1ECDBC4AD = result;
  return result;
}

void __33__GEOPlatform_isCellDataPossible__block_invoke_2(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  id CellularDataIsEnabled;
  uint64_t v5;
  __CFString *v6;
  char *v7;
  const char *v8;
  NSObject *v9;
  int v10;
  const __CFString *v11;
  __int16 v12;
  int v13;
  __int16 v14;
  int v15;
  __int16 v16;
  const char *v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v2 = *(_QWORD *)(a1 + 32);
  if (v2)
  {
    dispatch_assert_queue_V2(*(dispatch_queue_t *)(v2 + 16));
    if (!*(_QWORD *)(v2 + 8))
    {
      if (CoreTelephonyLibraryCore())
        *(_QWORD *)(v2 + 8) = geo_CTServerConnectionCreateOnTargetQueue(0, (uint64_t)CFSTR("com.apple.GeoServices.GP"), *(void **)(v2 + 16), 0);
    }
  }
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  if (v3)
  {
    CellularDataIsEnabled = geo_CTServerConnectionGetCellularDataIsEnabled(v3, *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24);
    v5 = *(_QWORD *)(a1 + 32);
    v6 = CFSTR("Unable to retrieve CellularDataIsEnabled");
    if (!v5 || !(_DWORD)CellularDataIsEnabled)
    {
LABEL_17:

      return;
    }
    if ((_DWORD)CellularDataIsEnabled == 2)
    {
      v7 = mach_error_string(SHIDWORD(CellularDataIsEnabled));
    }
    else
    {
      if ((_DWORD)CellularDataIsEnabled != 1)
      {
        v8 = "Unknown";
        goto LABEL_14;
      }
      v7 = strerror(SHIDWORD(CellularDataIsEnabled));
    }
    v8 = v7;
LABEL_14:
    GEOFindOrCreateLog("com.apple.GeoServices", "GEOPlatform");
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      v10 = 138413058;
      v11 = CFSTR("Unable to retrieve CellularDataIsEnabled");
      v12 = 1024;
      v13 = (int)CellularDataIsEnabled;
      v14 = 1024;
      v15 = HIDWORD(CellularDataIsEnabled);
      v16 = 2082;
      v17 = v8;
      _os_log_impl(&dword_1885A9000, v9, OS_LOG_TYPE_ERROR, "%@. CTError: domain-%i, code-%i, errStr:(%{public}s)", (uint8_t *)&v10, 0x22u);
    }

    goto LABEL_17;
  }
}

- (BOOL)isMacSetupUser
{
  return 0;
}

- (BOOL)isGUIUser
{
  if (qword_1ECDBC570 != -1)
    dispatch_once(&qword_1ECDBC570, &__block_literal_global_57_0);
  return byte_1ECDBC4AF;
}

uint64_t __24__GEOPlatform_isGUIUser__block_invoke()
{
  uint64_t result;

  result = getuid();
  byte_1ECDBC4AF = result > 0x1F4;
  return result;
}

- (BOOL)shouldPrefetchVisualResources
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __44__GEOPlatform_shouldPrefetchVisualResources__block_invoke;
  block[3] = &unk_1E1BFF6F8;
  block[4] = self;
  if (qword_1ECDBC578 != -1)
    dispatch_once(&qword_1ECDBC578, block);
  return byte_1ECDBC4B0;
}

uint64_t __44__GEOPlatform_shouldPrefetchVisualResources__block_invoke(uint64_t a1)
{
  unsigned int v2;
  uint64_t result;

  v2 = MGGetSInt32Answer() + 1;
  if (v2 < 0xE && ((0x2B41u >> v2) & 1) != 0)
    result = 0;
  else
    result = objc_msgSend(*(id *)(a1 + 32), "isGUIUser");
  byte_1ECDBC4B0 = result;
  return result;
}

- (id)clientCapabilities
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  GEOWalkingSupportedFeatures *v11;
  void *v12;
  GEOLocalizationCapabilities *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t i;
  void *v19;
  void *v20;
  GEOAdvisoryClientCapabilities *v21;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  _QWORD block[5];
  _BYTE v28[128];
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __33__GEOPlatform_clientCapabilities__block_invoke;
  block[3] = &unk_1E1BFF6F8;
  block[4] = self;
  if (qword_1ECDBC588 != -1)
    dispatch_once(&qword_1ECDBC588, block);
  v2 = (void *)objc_msgSend((id)qword_1ECDBC580, "copy");
  objc_msgSend(MEMORY[0x1E0C99DC8], "preferredLanguages");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(v3, "mutableCopy");
  objc_msgSend(v2, "setDisplayLanguages:", v4);

  objc_msgSend(MEMORY[0x1E0C99DC8], "currentLocale");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKey:", *MEMORY[0x1E0C997B0]);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setDisplayRegion:", v6);

  +[GEOCountryConfiguration sharedConfiguration](GEOCountryConfiguration, "sharedConfiguration");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "countryCode");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setDeviceCountryCode:", v8);

  objc_msgSend(MEMORY[0x1E0C99E80], "defaultTimeZone");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "name");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setUserCurrentTimezone:", v10);

  objc_msgSend(v2, "setSupportsArrivalMapRegion:", GEOConfigGetBOOL(GeoServicesConfig_ShouldUseServerArrivalParameters, (uint64_t)off_1EDF4D6C8));
  objc_msgSend(v2, "setSupportsGuidanceEvents:", 1);
  objc_msgSend(v2, "setSupportsGuidanceEventsInlineShields:", 1);
  objc_msgSend(v2, "setSupportsJunctionView:", GEOConfigGetBOOL(GeoServicesConfig_NavdShouldRequestJunctionView, (uint64_t)off_1EDF4D668));
  objc_msgSend(v2, "setSupportsNaturalGuidance:", 1);
  objc_msgSend(v2, "setSupportsLicensePlateRestrictions:", 1);
  objc_msgSend(v2, "setSupportsCongestionZones:", 1);
  objc_msgSend(v2, "setSupportsElectricVehicleRoutes:", GEOConfigGetBOOL(MapsFeaturesConfig_EnableEVRouting, (uint64_t)off_1EDF4AF58));
  objc_msgSend(v2, "setSupportsWaypointRoutes:", 1);
  objc_msgSend(v2, "setSupportsTrafficCameras:", 1);
  objc_msgSend(v2, "setSupportsUserIncidentReports:", 1);
  objc_msgSend(v2, "setSupportsSpeedTrapAnnouncements:", 1);
  objc_msgSend(v2, "setSupportsAreaEventsEnhancements:", 1);
  objc_msgSend(v2, "setSupportsSilentRouteUpdates:", 1);
  objc_msgSend(v2, "setReplaceAccidentStringWithCrash:", 1);
  objc_msgSend(v2, "setSupportsGuidanceEventImportanceInfo:", 1);
  objc_msgSend(v2, "setSupportsRoadComplexities:", 1);
  objc_msgSend(v2, "setSupportsDisablingProgressBarFromBannerButtons:", 1);
  v11 = objc_alloc_init(GEOWalkingSupportedFeatures);
  objc_msgSend(v2, "setWalkingSupportedFeatures:", v11);

  objc_msgSend(v2, "walkingSupportedFeatures");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setSupportsWalkingExperience2022:", 1);

  objc_msgSend(v2, "setSupportsBannerQueuing:", GEOConfigGetBOOL(GeoServicesConfig_ETATrafficBannerRequestQueuing, (uint64_t)off_1EDF4E158));
  objc_msgSend(v2, "setSupportsBannerQueuingDirections:", GEOConfigGetBOOL(GeoServicesConfig_DirectionsTrafficBannerRequestQueuing, (uint64_t)off_1EDF4E168));
  objc_msgSend(v2, "setSupportsRouteNameRanges:", 1);
  objc_msgSend(v2, "setSupportsWalkingSuggestionsAfterParking:", 1);
  objc_msgSend(v2, "setSupportsEv2:", 1);
  objc_msgSend(v2, "setSupportsGenericCombinationsInstructionsForAllModes:", 1);
  objc_msgSend(v2, "setSupportsRouteCameraInputUpdates:", 1);
  if (GEOConfigGetBOOL(MapsFeaturesConfig_DrivingMultiWaypointRoutesEnabled, (uint64_t)off_1EDF4B0C8))
    objc_msgSend(v2, "addSupportsMultipointRouting:", 0);
  if (GEOConfigGetBOOL(MapsFeaturesConfig_Maps420, (uint64_t)off_1EDF4B0D8))
    objc_msgSend(v2, "addSupportsMultipointRouting:", 3);
  if (GEOConfigGetBOOL(MapsFeaturesConfig_Maps182, (uint64_t)off_1EDF4B2A8))
    objc_msgSend(v2, "addSupportsMultipointRouting:", 2);
  if (GEOConfigGetBOOL(GeoServicesConfig_NavdTransitTextInPlanningArtwork, (uint64_t)off_1EDF4DA08))
    objc_msgSend(v2, "addSupportedTransitFeature:", 1);
  if (GEOConfigGetBOOL(GeoServicesConfig_NavdTransitListInstructionTimeText, (uint64_t)off_1EDF4DA18))
    objc_msgSend(v2, "addSupportedTransitFeature:", 3);
  objc_msgSend(v2, "addSupportedTransitFeature:", 4);
  if (GEOConfigGetBOOL(MapsFeaturesConfig_TransitPayEnabled, (uint64_t)off_1EDF4B0E8))
    objc_msgSend(v2, "addSupportedTransitFeature:", 5);
  objc_msgSend(v2, "addSupportedTransitFeature:", 6);
  v13 = objc_alloc_init(GEOLocalizationCapabilities);
  -[GEOLocalizationCapabilities setSupportsLocalizedTrafficControlIcons:](v13, "setSupportsLocalizedTrafficControlIcons:", 1);
  _getValue(GeoServicesConfig_LocalizationCapabilitiesSupportedPhoneticTypes, (uint64_t)off_1EDF4DD48, 1, 0, 0, 0);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = 0u;
  v24 = 0u;
  v25 = 0u;
  v26 = 0u;
  v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v23, v28, 16);
  if (v15)
  {
    v16 = v15;
    v17 = *(_QWORD *)v24;
    do
    {
      for (i = 0; i != v16; ++i)
      {
        if (*(_QWORD *)v24 != v17)
          objc_enumerationMutation(v14);
        -[GEOLocalizationCapabilities addSupportedPhoneticType:](v13, "addSupportedPhoneticType:", objc_msgSend(*(id *)(*((_QWORD *)&v23 + 1) + 8 * i), "unsignedIntegerValue"));
      }
      v16 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v23, v28, 16);
    }
    while (v16);
  }
  objc_msgSend(v2, "setLocalizationCapabilities:", v13);
  +[GEOPlatform sharedPlatform](GEOPlatform, "sharedPlatform");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "deviceCountrySKUForServiceRequests");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setDeviceSku:", v20);

  objc_msgSend(v2, "setWillSendEvDirectionsFeedback:", 0);
  v21 = objc_alloc_init(GEOAdvisoryClientCapabilities);
  -[GEOAdvisoryClientCapabilities setDownloadOfflineMapActionSupported:](v21, "setDownloadOfflineMapActionSupported:", 1);
  objc_msgSend(v2, "setAdvisoryClientCapabilities:", v21);
  if (GEOConfigGetBOOL(GeoServicesConfig_ShouldRequestWGS84Elevations, (uint64_t)off_1EDF4E2A8))
    objc_msgSend(v2, "addSupportedElevationModel:", 1);
  objc_msgSend(v2, "addSupportedElevationModel:", 0);

  return v2;
}

void __33__GEOPlatform_clientCapabilities__block_invoke(uint64_t a1)
{
  GEOClientCapabilities *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  GEOFormattedStringClientCapabilities *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;

  v2 = objc_alloc_init(GEOClientCapabilities);
  v3 = (void *)qword_1ECDBC580;
  qword_1ECDBC580 = (uint64_t)v2;

  objc_msgSend(*(id *)(a1 + 32), "hardwareClass");
  v15 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)qword_1ECDBC580, "setHardwareClass:");
  if (GEOConfigGetBOOL(GeoServicesConfig_ShouldPopulateFakeHardwareIdentifier, (uint64_t)off_1EDF4E398))
  {
    objc_msgSend(v15, "stringByAppendingString:", CFSTR("0,0"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend((id)qword_1ECDBC580, "setHardwareModel:", v4);

  }
  objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "infoDictionary");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "objectForKey:", *MEMORY[0x1E0C9AAF0]);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)qword_1ECDBC580, "setAppMajorVersion:", v7);

  objc_msgSend(v6, "objectForKey:", *MEMORY[0x1E0C9AE90]);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)qword_1ECDBC580, "setAppMinorVersion:", v8);

  if (objc_msgSend(*(id *)(a1 + 32), "isInternalInstall"))
    objc_msgSend((id)qword_1ECDBC580, "setInternalInstall:", 1);
  +[GEOPlatform sharedPlatform](GEOPlatform, "sharedPlatform");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "supportsAdvancedMap");
  objc_msgSend((id)qword_1ECDBC580, "setSupportsAdvancedMap:", v10);

  objc_msgSend((id)qword_1ECDBC580, "setMaxManeuverTypeSupported:", 81);
  objc_msgSend((id)qword_1ECDBC580, "setMaxTrafficSpeedSupported:", 4);
  objc_msgSend((id)qword_1ECDBC580, "setMaxFormatterSupported:", 13);
  objc_msgSend((id)qword_1ECDBC580, "setClusteredTransitRoutesSupported:", 1);
  objc_msgSend((id)qword_1ECDBC580, "setRouteOptionsSupported:", 1);
  objc_msgSend((id)qword_1ECDBC580, "setTransitMarketSupport:", 3);
  objc_msgSend((id)qword_1ECDBC580, "setMaxSupportedTransitFareVersion:", 2);
  v11 = objc_alloc_init(GEOFormattedStringClientCapabilities);
  objc_msgSend((id)qword_1ECDBC580, "setFormattedStringClientCapabilities:", v11);

  objc_msgSend((id)qword_1ECDBC580, "formattedStringClientCapabilities");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setConcatenatingFormatStringsSupported:", 1);

  objc_msgSend((id)qword_1ECDBC580, "formattedStringClientCapabilities");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setTimestampFormatPatternSupported:", 1);

  objc_msgSend((id)qword_1ECDBC580, "formattedStringClientCapabilities");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setStyleSupported:", 1);

  objc_msgSend((id)qword_1ECDBC580, "setSnapToClosestStopSupported:", 1);
  objc_msgSend((id)qword_1ECDBC580, "setIncludeCrossLanguagePhonetics:", 1);
  objc_msgSend((id)qword_1ECDBC580, "setSupportsLongShieldStrings:", 1);
  objc_msgSend((id)qword_1ECDBC580, "setMaxZilchMessageVersionSupported:", 4);

}

- (void)setClientCapabilitiesHardwareIdentifier:(id)a3
{
  id v4;
  id v5;
  void *v6;
  id v7;

  v4 = a3;
  v7 = v4;
  if (!qword_1ECDBC580)
  {
    v5 = -[GEOPlatform clientCapabilities](self, "clientCapabilities");
    v4 = v7;
  }
  v6 = (void *)objc_msgSend(v4, "copy");
  objc_msgSend((id)qword_1ECDBC580, "setHardwareModel:", v6);

}

- (int64_t)deviceScreenWidthInPixels
{
  if (deviceScreenWidthInPixels_once != -1)
    dispatch_once(&deviceScreenWidthInPixels_once, &__block_literal_global_71);
  return deviceScreenWidthInPixels__deviceScreenWidthInPixels;
}

void __40__GEOPlatform_deviceScreenWidthInPixels__block_invoke()
{
  uint64_t v0;
  void *v1;
  void *v2;

  v0 = deviceScreenWidthInPixels__deviceScreenWidthInPixels;
  v1 = (void *)MGCopyAnswer();
  v2 = v1;
  if (v1)
    v0 = objc_msgSend(v1, "integerValue");

  deviceScreenWidthInPixels__deviceScreenWidthInPixels = v0;
}

- (int64_t)deviceScreenHeightInPixels
{
  if (deviceScreenHeightInPixels_once != -1)
    dispatch_once(&deviceScreenHeightInPixels_once, &__block_literal_global_74_0);
  return deviceScreenHeightInPixels__deviceScreenHeightInPixels;
}

void __41__GEOPlatform_deviceScreenHeightInPixels__block_invoke()
{
  uint64_t v0;
  void *v1;
  void *v2;

  v0 = deviceScreenHeightInPixels__deviceScreenHeightInPixels;
  v1 = (void *)MGCopyAnswer();
  v2 = v1;
  if (v1)
    v0 = objc_msgSend(v1, "integerValue");

  deviceScreenHeightInPixels__deviceScreenHeightInPixels = v0;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_coreTelephonyIsolationQueue, 0);
}

@end
