@implementation GEOPDClientMetadata

- (void)writeTo:(id)a3
{
  id v4;
  os_unfair_lock_s *p_readerLock;
  $F32854447752F5D8BD00F9C7283039A2 flags;
  NSMutableArray *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  unint64_t v11;
  unint64_t v12;
  NSMutableArray *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t j;
  unint64_t v17;
  unint64_t v18;
  $F32854447752F5D8BD00F9C7283039A2 v19;
  unint64_t v20;
  PBDataReader *v21;
  void *v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  _BYTE v31[128];
  _BYTE v32[128];
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  if (self->_reader && (_GEOPDClientMetadataIsDirty((uint64_t)self) & 1) == 0)
  {
    v21 = self->_reader;
    objc_sync_enter(v21);
    *(_QWORD *)((char *)self->_reader + (int)*MEMORY[0x1E0D82BD8]) = self->_readerMarkLength;
    -[PBDataReader seekToOffset:](self->_reader, "seekToOffset:", self->_readerMarkPos);
    -[PBDataReader readBytes:](self->_reader, "readBytes:", self->_readerMarkLength - self->_readerMarkPos);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "writeData:", v22);
    os_unfair_lock_unlock(p_readerLock);

    objc_sync_exit(v21);
    goto LABEL_85;
  }
  os_unfair_lock_unlock(&self->_readerLock);
  -[GEOPDClientMetadata readAll:](self, "readAll:", 0);
  if (self->_deviceCountryCode)
    PBDataWriterWriteStringField();
  if (self->_deviceDisplayLanguage)
    PBDataWriterWriteStringField();
  if (self->_deviceKeyboardLanguage)
    PBDataWriterWriteStringField();
  if (self->_deviceSpokenLanguage)
    PBDataWriterWriteStringField();
  if ((*(_BYTE *)&self->_flags & 0x40) != 0)
    PBDataWriterWriteUint32Field();
  if (self->_additionalEnabledMarkets)
    PBDataWriterWriteSubmessage();
  flags = self->_flags;
  if ((*(_BYTE *)&flags & 0x20) == 0)
  {
    if ((*(_BYTE *)&flags & 4) == 0)
      goto LABEL_17;
LABEL_82:
    PBDataWriterWriteUint32Field();
    if ((*(_QWORD *)&self->_flags & 2) == 0)
      goto LABEL_19;
    goto LABEL_18;
  }
  PBDataWriterWriteInt32Field();
  flags = self->_flags;
  if ((*(_BYTE *)&flags & 4) != 0)
    goto LABEL_82;
LABEL_17:
  if ((*(_BYTE *)&flags & 2) != 0)
LABEL_18:
    PBDataWriterWriteUint32Field();
LABEL_19:
  if (self->_deviceExtendedLocation)
    PBDataWriterWriteSubmessage();
  v29 = 0u;
  v30 = 0u;
  v27 = 0u;
  v28 = 0u;
  v7 = self->_deviceHistoricalLocations;
  v8 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v27, v32, 16);
  if (v8)
  {
    v9 = *(_QWORD *)v28;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v28 != v9)
          objc_enumerationMutation(v7);
        PBDataWriterWriteSubmessage();
      }
      v8 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v27, v32, 16);
    }
    while (v8);
  }

  if ((*(_BYTE *)&self->_flags & 0x10) != 0)
    PBDataWriterWriteInt32Field();
  if (self->_debugApiKey)
    PBDataWriterWriteStringField();
  if (self->_knownClientResolvedTypeDeprecateds.count)
  {
    v11 = 0;
    do
    {
      PBDataWriterWriteInt32Field();
      ++v11;
    }
    while (v11 < self->_knownClientResolvedTypeDeprecateds.count);
  }
  if ((*(_BYTE *)&self->_flags & 0x80) != 0)
    PBDataWriterWriteBOOLField();
  if (self->_knownClientResolvedTypes.count)
  {
    v12 = 0;
    do
    {
      PBDataWriterWriteInt32Field();
      ++v12;
    }
    while (v12 < self->_knownClientResolvedTypes.count);
  }
  v25 = 0u;
  v26 = 0u;
  v23 = 0u;
  v24 = 0u;
  v13 = self->_businessChatPreflightIdentifiers;
  v14 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v13, "countByEnumeratingWithState:objects:count:", &v23, v31, 16);
  if (v14)
  {
    v15 = *(_QWORD *)v24;
    do
    {
      for (j = 0; j != v14; ++j)
      {
        if (*(_QWORD *)v24 != v15)
          objc_enumerationMutation(v13);
        PBDataWriterWriteStringField();
      }
      v14 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v13, "countByEnumeratingWithState:objects:count:", &v23, v31, 16);
    }
    while (v14);
  }

  if ((*(_BYTE *)&self->_flags & 1) != 0)
    PBDataWriterWriteInt32Field();
  if (self->_localizationCapabilities)
    PBDataWriterWriteSubmessage();
  if (self->_deviceSku)
    PBDataWriterWriteStringField();
  if ((*((_BYTE *)&self->_flags + 1) & 1) != 0)
    PBDataWriterWriteBOOLField();
  if (self->_supportedMapsResultTypes.count)
  {
    v17 = 0;
    do
    {
      PBDataWriterWriteInt32Field();
      ++v17;
    }
    while (v17 < self->_supportedMapsResultTypes.count);
  }
  if (self->_mapsSuggestionsTouristInfo)
    PBDataWriterWriteSubmessage();
  if (self->_clientRevisions.count)
  {
    PBDataWriterPlaceMark();
    if (self->_clientRevisions.count)
    {
      v18 = 0;
      do
      {
        PBDataWriterWriteInt32Field();
        ++v18;
      }
      while (v18 < self->_clientRevisions.count);
    }
    PBDataWriterRecallMark();
  }
  if (self->_preferredDisplayCurrencySymbol)
    PBDataWriterWriteStringField();
  if (self->_displayRegion)
    PBDataWriterWriteStringField();
  v19 = self->_flags;
  if ((*(_WORD *)&v19 & 0x200) != 0)
  {
    PBDataWriterWriteBOOLField();
    v19 = self->_flags;
  }
  if ((*(_BYTE *)&v19 & 8) != 0)
    PBDataWriterWriteInt32Field();
  if (self->_supportedElevationModels.count)
  {
    v20 = 0;
    do
    {
      PBDataWriterWriteInt32Field();
      ++v20;
    }
    while (v20 < self->_supportedElevationModels.count);
  }
  if (self->_abClientMetadata)
    PBDataWriterWriteSubmessage();
  if (self->_abBranchInfo)
    PBDataWriterWriteSubmessage();
  -[PBUnknownFields writeTo:](self->_unknownFields, "writeTo:", v4);
LABEL_85:

}

- (void)readAll:(BOOL)a3
{
  _BOOL4 v3;
  os_unfair_lock_s *p_readerLock;
  PBDataReader *reader;
  PBDataReader *v7;
  int *v8;

  v3 = a3;
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  reader = self->_reader;
  if (reader)
  {
    v7 = reader;
    objc_sync_enter(v7);
    if (v3)
      v8 = (int *)&readAll__recursiveTag_437;
    else
      v8 = (int *)&readAll__nonRecursiveTag_438;
    GEOPDClientMetadataReadSpecified((uint64_t)self, (unint64_t)self->_reader, v8);
    objc_sync_exit(v7);

  }
  if (v3)
    _GEOPDClientMetadataCallReadAllRecursiveWithoutSynchronized((id *)&self->super.super.isa);
  os_unfair_lock_unlock(p_readerLock);
}

- (GEOPDClientMetadata)initWithTraits:(id)a3
{
  id v4;
  GEOPDClientMetadata *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  uint64_t v25;
  uint64_t v26;
  void *v27;
  uint64_t v28;
  NSObject *v29;
  uint64_t i;
  uint64_t v31;
  void *v32;
  id v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t j;
  GEOLocalizationCapabilities *v38;
  void *v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t k;
  void *v44;
  void *v45;
  int v46;
  uint64_t v47;
  void *v48;
  GEOPDClientMetadata *v49;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  objc_super v64;
  __int128 v65;
  __int128 v66;
  __int128 v67;
  __int128 v68;
  _BYTE v69[128];
  uint8_t v70[128];
  uint8_t buf[4];
  void *v72;
  _BYTE v73[128];
  uint64_t v74;

  v74 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v64.receiver = self;
  v64.super_class = (Class)GEOPDClientMetadata;
  v5 = -[GEOPDClientMetadata init](&v64, sel_init);
  if (v5)
  {
    +[GEOAdditionalEnabledMarkets additionalEnabledMarkets](GEOAdditionalEnabledMarkets, "additionalEnabledMarkets");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[GEOPDClientMetadata setAdditionalEnabledMarkets:](v5, "setAdditionalEnabledMarkets:", v6);

    +[GEOCountryConfiguration sharedConfiguration](GEOCountryConfiguration, "sharedConfiguration");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "countryCode");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[GEOPDClientMetadata setDeviceCountryCode:](v5, "setDeviceCountryCode:", v8);

    +[GEOPlatform sharedPlatform](GEOPlatform, "sharedPlatform");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "deviceCountrySKUForServiceRequests");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[GEOPDClientMetadata setDeviceSku:](v5, "setDeviceSku:", v10);

    objc_msgSend(MEMORY[0x1E0C99D48], "calendarWithIdentifier:", *MEMORY[0x1E0C996C8]);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "components:fromDate:", 60, v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v11, "dateFromComponents:", v13);
    v14 = objc_claimAutoreleasedReturnValue();
    v53 = v13;
    v15 = objc_msgSend(v13, "hour");
    v54 = v11;
    v52 = (void *)v14;
    LODWORD(v13) = objc_msgSend(v11, "ordinalityOfUnit:inUnit:forDate:", 512, 4096, v14);
    -[GEOPDClientMetadata setHourOfDay:](v5, "setHourOfDay:", v15);
    -[GEOPDClientMetadata setDayOfWeek:](v5, "setDayOfWeek:", ((_DWORD)v13 - 1));
    if (objc_msgSend(v4, "deviceDisplayLanguagesCount"))
    {
      objc_msgSend(v4, "deviceDisplayLanguages");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "firstObject");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      -[GEOPDClientMetadata setDeviceDisplayLanguage:](v5, "setDeviceDisplayLanguage:", v17);

    }
    if (objc_msgSend(v4, "hasDeviceKeyboardLocale"))
    {
      objc_msgSend(v4, "deviceKeyboardLocale");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      -[GEOPDClientMetadata setDeviceKeyboardLanguage:](v5, "setDeviceKeyboardLanguage:", v18);

    }
    if (objc_msgSend(v4, "hasDisplayRegion"))
    {
      objc_msgSend(v4, "displayRegion");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      -[GEOPDClientMetadata setDisplayRegion:](v5, "setDisplayRegion:", v19);

    }
    objc_msgSend(v4, "deviceLocation");
    v20 = (void *)objc_claimAutoreleasedReturnValue();

    if (v20)
    {
      objc_msgSend(v4, "deviceLocation");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      -[GEOPDClientMetadata setDeviceExtendedLocation:](v5, "setDeviceExtendedLocation:", v21);

    }
    if (objc_msgSend(v4, "hasDeviceSpokenLocale"))
    {
      objc_msgSend(v4, "deviceSpokenLocale");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      -[GEOPDClientMetadata setDeviceSpokenLanguage:](v5, "setDeviceSpokenLanguage:", v22);

    }
    if (objc_msgSend(v4, "hasTimeSinceMapEnteredForeground"))
      -[GEOPDClientMetadata setTimeSinceMapEnteredForeground:](v5, "setTimeSinceMapEnteredForeground:", objc_msgSend(v4, "timeSinceMapEnteredForeground"));
    -[GEOPDClientMetadata setResultListAttributionSupport:](v5, "setResultListAttributionSupport:", 1);
    -[GEOPDClientMetadata setRequiredVersion:](v5, "setRequiredVersion:", 3);
    _getValue(GeoServicesConfig_PlaceDataDebugAPI, (uint64_t)off_1EDF4CD98, 1, 0, 0, 0);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v23, "length"))
      -[GEOPDClientMetadata setDebugApiKey:](v5, "setDebugApiKey:", v23);
    if (GEOConfigGetBOOL(MapsFeaturesConfig_DrivingMultiWaypointRoutesEnabled, (uint64_t)off_1EDF4B0C8)
      && objc_msgSend(v4, "navigating"))
    {
      -[GEOPDClientMetadata addKnownClientResolvedType:](v5, "addKnownClientResolvedType:", 1);
      -[GEOPDClientMetadata addKnownClientResolvedType:](v5, "addKnownClientResolvedType:", 2);
      -[GEOPDClientMetadata addKnownClientResolvedType:](v5, "addKnownClientResolvedType:", 6);
    }
    else
    {
      -[GEOPDClientMetadata setKnownClientResolvedTypes:count:](v5, "setKnownClientResolvedTypes:count:", objc_msgSend(v4, "knownClientResolvedTypes"), objc_msgSend(v4, "knownClientResolvedTypesCount"));
    }
    v51 = v23;
    v55 = v4;
    -[GEOPDClientMetadata setEnablePreflightVenues:](v5, "setEnablePreflightVenues:", GEOConfigGetBOOL(GeoServicesConfig_VenuesPreflightEnabled, (uint64_t)off_1EDF4DB18));
    v62 = 0u;
    v63 = 0u;
    v60 = 0u;
    v61 = 0u;
    _getValue(GeoServicesConfig_BusinessChatPreflightIdentifiers, (uint64_t)off_1EDF4CE08, 1, 0, 0, 0);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v65 = 0u;
    v66 = 0u;
    v67 = 0u;
    v68 = 0u;
    v25 = objc_msgSend(v24, "countByEnumeratingWithState:objects:count:", &v65, v73, 16);
    if (v25)
    {
      v26 = v25;
      v27 = 0;
      v28 = *(_QWORD *)v66;
      v29 = MEMORY[0x1E0C81028];
      do
      {
        for (i = 0; i != v26; ++i)
        {
          if (*(_QWORD *)v66 != v28)
            objc_enumerationMutation(v24);
          v31 = *(_QWORD *)(*((_QWORD *)&v65 + 1) + 8 * i);
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            if (!v27)
            {
              objc_msgSend(MEMORY[0x1E0C99DE8], "array");
              v27 = (void *)objc_claimAutoreleasedReturnValue();
            }
            objc_msgSend(v27, "addObject:", v31);
          }
          else if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
          {
            v32 = (void *)objc_opt_class();
            *(_DWORD *)buf = 138543362;
            v72 = v32;
            v33 = v32;
            _os_log_impl(&dword_1885A9000, v29, OS_LOG_TYPE_ERROR, "Invalid business chat preflight identifier type: %{public}@", buf, 0xCu);

          }
        }
        v26 = objc_msgSend(v24, "countByEnumeratingWithState:objects:count:", &v65, v73, 16);
      }
      while (v26);
    }
    else
    {
      v27 = 0;
    }

    v34 = objc_msgSend(v27, "countByEnumeratingWithState:objects:count:", &v60, v70, 16);
    if (v34)
    {
      v35 = v34;
      v36 = *(_QWORD *)v61;
      do
      {
        for (j = 0; j != v35; ++j)
        {
          if (*(_QWORD *)v61 != v36)
            objc_enumerationMutation(v27);
          -[GEOPDClientMetadata addBusinessChatPreflightIdentifier:](v5, "addBusinessChatPreflightIdentifier:", *(_QWORD *)(*((_QWORD *)&v60 + 1) + 8 * j));
        }
        v35 = objc_msgSend(v27, "countByEnumeratingWithState:objects:count:", &v60, v70, 16);
      }
      while (v35);
    }

    v38 = objc_alloc_init(GEOLocalizationCapabilities);
    -[GEOLocalizationCapabilities setSupportsLocalizedTrafficControlIcons:](v38, "setSupportsLocalizedTrafficControlIcons:", 1);
    _getValue(GeoServicesConfig_LocalizationCapabilitiesSupportedPhoneticTypes, (uint64_t)off_1EDF4DD48, 1, 0, 0, 0);
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    v56 = 0u;
    v57 = 0u;
    v58 = 0u;
    v59 = 0u;
    v40 = objc_msgSend(v39, "countByEnumeratingWithState:objects:count:", &v56, v69, 16);
    if (v40)
    {
      v41 = v40;
      v42 = *(_QWORD *)v57;
      do
      {
        for (k = 0; k != v41; ++k)
        {
          if (*(_QWORD *)v57 != v42)
            objc_enumerationMutation(v39);
          -[GEOLocalizationCapabilities addSupportedPhoneticType:](v38, "addSupportedPhoneticType:", objc_msgSend(*(id *)(*((_QWORD *)&v56 + 1) + 8 * k), "unsignedIntegerValue"));
        }
        v41 = objc_msgSend(v39, "countByEnumeratingWithState:objects:count:", &v56, v69, 16);
      }
      while (v41);
    }
    -[GEOPDClientMetadata setLocalizationCapabilities:](v5, "setLocalizationCapabilities:", v38);
    -[GEOPDClientMetadata addClientRevisions:](v5, "addClientRevisions:", 10);
    -[GEOPDClientMetadata addClientRevisions:](v5, "addClientRevisions:", 11);
    -[GEOPDClientMetadata addClientRevisions:](v5, "addClientRevisions:", 30);
    -[GEOPDClientMetadata addClientRevisions:](v5, "addClientRevisions:", 29);
    -[GEOPDClientMetadata addClientRevisions:](v5, "addClientRevisions:", 31);
    -[GEOPDClientMetadata addClientRevisions:](v5, "addClientRevisions:", 33);
    if (GEOConfigGetBOOL(MapsFeaturesConfig_HikingWatchEnabled, (uint64_t)off_1EDF4B188))
      -[GEOPDClientMetadata addClientRevisions:](v5, "addClientRevisions:", 32);
    -[GEOPDClientMetadata addClientRevisions:](v5, "addClientRevisions:", 34);
    v4 = v55;
    if (GEOConfigGetBOOL(MapsFeaturesConfig_FlexibleActionLinksEnabled, (uint64_t)off_1EDF4B248))
      -[GEOPDClientMetadata addClientRevisions:](v5, "addClientRevisions:", 37);
    if (GEOConfigGetBOOL(MapsFeaturesConfig_SearchAndDiscovery, (uint64_t)off_1EDF4B218))
      -[GEOPDClientMetadata addClientRevisions:](v5, "addClientRevisions:", 35);
    if (GEOConfigGetBOOL(MapsFeaturesConfig_HikingiOSEnabled, (uint64_t)off_1EDF4B198))
      -[GEOPDClientMetadata addClientRevisions:](v5, "addClientRevisions:", 38);
    objc_msgSend(MEMORY[0x1E0C99DC8], "currentLocale");
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v44, "objectForKey:", *MEMORY[0x1E0C99840]);
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    v46 = objc_msgSend(v45, "BOOLValue");

    if (v46)
      v47 = 1;
    else
      v47 = 2;
    -[GEOPDClientMetadata setPreferredDistanceUnit:](v5, "setPreferredDistanceUnit:", v47);
    if (objc_msgSend(v55, "hasCurrentLocaleCurrencySymbol"))
    {
      objc_msgSend(v55, "currentLocaleCurrencySymbol");
      v48 = (void *)objc_claimAutoreleasedReturnValue();
      -[GEOPDClientMetadata setPreferredDisplayCurrencySymbol:](v5, "setPreferredDisplayCurrencySymbol:", v48);

    }
    if (GEOConfigGetBOOL(MapsFeaturesConfig_MyPlacesFeatures, (uint64_t)off_1EDF4B228))
      -[GEOPDClientMetadata addClientRevisions:](v5, "addClientRevisions:", 36);
    if (GEOConfigGetBOOL(GeoServicesConfig_ShouldRequestWGS84Elevations, (uint64_t)off_1EDF4E2A8))
      -[GEOPDClientMetadata addSupportedElevationModel:](v5, "addSupportedElevationModel:", 1);
    -[GEOPDClientMetadata addSupportedElevationModel:](v5, "addSupportedElevationModel:", 0);
    v49 = v5;

  }
  return v5;
}

- (void)addClientRevisions:(int)a3
{
  -[GEOPDClientMetadata _readClientRevisions]((uint64_t)self);
  if (self)
    PBRepeatedInt32Add();
  os_unfair_lock_lock_with_options();
  *(_QWORD *)&self->_flags |= 0x800uLL;
  os_unfair_lock_unlock(&self->_readerLock);
  *(_QWORD *)&self->_flags |= 0x100000000uLL;
}

- (void)_readClientRevisions
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 280));
    if ((*(_BYTE *)(a1 + 317) & 8) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOPDClientMetadataReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readClientRevisions_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 280));
  }
}

- (void)setAdditionalEnabledMarkets:(id)a3
{
  *(_QWORD *)&self->_flags |= 0x100040000uLL;
  objc_storeStrong((id *)&self->_additionalEnabledMarkets, a3);
}

- (void)setKnownClientResolvedTypes:(int *)a3 count:(unint64_t)a4
{
  os_unfair_lock_s *p_readerLock;

  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(_QWORD *)&self->_flags |= 0x2000uLL;
  os_unfair_lock_unlock(p_readerLock);
  *(_QWORD *)&self->_flags |= 0x100000000uLL;
  PBRepeatedInt32Set();
}

- (void)setResultListAttributionSupport:(int)a3
{
  *(_QWORD *)&self->_flags |= 0x100000020uLL;
  self->_resultListAttributionSupport = a3;
}

- (void)setRequiredVersion:(int)a3
{
  *(_QWORD *)&self->_flags |= 0x100000010uLL;
  self->_requiredVersion = a3;
}

- (void)setEnablePreflightVenues:(BOOL)a3
{
  *(_QWORD *)&self->_flags |= 0x100000080uLL;
  self->_enablePreflightVenues = a3;
}

- (void)setLocalizationCapabilities:(id)a3
{
  *(_QWORD *)&self->_flags |= 0x120000000uLL;
  objc_storeStrong((id *)&self->_localizationCapabilities, a3);
}

- (void)setHourOfDay:(unsigned int)a3
{
  *(_QWORD *)&self->_flags |= 0x100000004uLL;
  self->_hourOfDay = a3;
}

- (void)setDeviceSku:(id)a3
{
  *(_QWORD *)&self->_flags |= 0x104000000uLL;
  objc_storeStrong((id *)&self->_deviceSku, a3);
}

- (void)setDeviceCountryCode:(id)a3
{
  *(_QWORD *)&self->_flags |= 0x100200000uLL;
  objc_storeStrong((id *)&self->_deviceCountryCode, a3);
}

- (void)setDayOfWeek:(unsigned int)a3
{
  *(_QWORD *)&self->_flags |= 0x100000002uLL;
  self->_dayOfWeek = a3;
}

- (void)setDeviceDisplayLanguage:(id)a3
{
  *(_QWORD *)&self->_flags |= 0x100400000uLL;
  objc_storeStrong((id *)&self->_deviceDisplayLanguage, a3);
}

- (void)setSupportEnrichment:(BOOL)a3
{
  *(_QWORD *)&self->_flags |= 0x100000200uLL;
  self->_supportEnrichment = a3;
}

- (void)addSupportedMapsResultType:(int)a3
{
  -[GEOPDClientMetadata _readSupportedMapsResultTypes]((uint64_t)self);
  if (self)
    PBRepeatedInt32Add();
  os_unfair_lock_lock_with_options();
  *(_QWORD *)&self->_flags |= 0x8000uLL;
  os_unfair_lock_unlock(&self->_readerLock);
  *(_QWORD *)&self->_flags |= 0x100000000uLL;
}

- (void)_readSupportedMapsResultTypes
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 280));
    if ((*(_BYTE *)(a1 + 317) & 0x80) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOPDClientMetadataReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readSupportedMapsResultTypes_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 280));
  }
}

- (void)setDisplayRegion:(id)a3
{
  *(_QWORD *)&self->_flags |= 0x110000000uLL;
  objc_storeStrong((id *)&self->_displayRegion, a3);
}

- (GEOLocation)deviceExtendedLocation
{
  -[GEOPDClientMetadata _readDeviceExtendedLocation]((uint64_t)self);
  return self->_deviceExtendedLocation;
}

- (void)_readDeviceExtendedLocation
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 280));
    if ((*(_BYTE *)(a1 + 318) & 0x80) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOPDClientMetadataReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readDeviceExtendedLocation_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 280));
  }
}

- (BOOL)hasDeviceExtendedLocation
{
  -[GEOPDClientMetadata _readDeviceExtendedLocation]((uint64_t)self);
  return self->_deviceExtendedLocation != 0;
}

- (NSMutableArray)deviceHistoricalLocations
{
  -[GEOPDClientMetadata _readDeviceHistoricalLocations]((uint64_t)self);
  return self->_deviceHistoricalLocations;
}

- (void)_readDeviceHistoricalLocations
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 280));
    if ((*(_BYTE *)(a1 + 319) & 1) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOPDClientMetadataReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readDeviceHistoricalLocations_tags_0);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 280));
  }
}

- (void)clearSensitiveFields:(unint64_t)a3
{
  GEOPDClientMetadataClearSensitiveFields((id *)&self->super.super.isa, a3, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_preferredDisplayCurrencySymbol, 0);
  objc_storeStrong((id *)&self->_mapsSuggestionsTouristInfo, 0);
  objc_storeStrong((id *)&self->_localizationCapabilities, 0);
  objc_storeStrong((id *)&self->_displayRegion, 0);
  objc_storeStrong((id *)&self->_deviceSpokenLanguage, 0);
  objc_storeStrong((id *)&self->_deviceSku, 0);
  objc_storeStrong((id *)&self->_deviceKeyboardLanguage, 0);
  objc_storeStrong((id *)&self->_deviceHistoricalLocations, 0);
  objc_storeStrong((id *)&self->_deviceExtendedLocation, 0);
  objc_storeStrong((id *)&self->_deviceDisplayLanguage, 0);
  objc_storeStrong((id *)&self->_deviceCountryCode, 0);
  objc_storeStrong((id *)&self->_debugApiKey, 0);
  objc_storeStrong((id *)&self->_businessChatPreflightIdentifiers, 0);
  objc_storeStrong((id *)&self->_additionalEnabledMarkets, 0);
  objc_storeStrong((id *)&self->_abClientMetadata, 0);
  objc_storeStrong((id *)&self->_abBranchInfo, 0);
  objc_storeStrong((id *)&self->_unknownFields, 0);
  objc_storeStrong((id *)&self->_reader, 0);
}

- (GEOPDClientMetadata)init
{
  GEOPDClientMetadata *v2;
  GEOPDClientMetadata *v3;
  GEOPDClientMetadata *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)GEOPDClientMetadata;
  v2 = -[GEOPDClientMetadata init](&v6, sel_init);
  v3 = v2;
  if (v2)
  {
    v2->_readerLock._os_unfair_lock_opaque = 0;
    v4 = v2;
  }

  return v3;
}

- (void)dealloc
{
  objc_super v3;

  PBRepeatedInt32Clear();
  PBRepeatedInt32Clear();
  PBRepeatedInt32Clear();
  PBRepeatedInt32Clear();
  PBRepeatedInt32Clear();
  v3.receiver = self;
  v3.super_class = (Class)GEOPDClientMetadata;
  -[GEOPDClientMetadata dealloc](&v3, sel_dealloc);
}

- (void)setAbClientMetadata:(id)a3
{
  *(_QWORD *)&self->_flags |= 0x100020000uLL;
  objc_storeStrong((id *)&self->_abClientMetadata, a3);
}

- (GEOAdditionalEnabledMarkets)additionalEnabledMarkets
{
  -[GEOPDClientMetadata _readAdditionalEnabledMarkets]((uint64_t)self);
  return self->_additionalEnabledMarkets;
}

- (void)setBusinessChatPreflightIdentifiers:(id)a3
{
  NSMutableArray *v4;
  NSMutableArray *businessChatPreflightIdentifiers;

  v4 = (NSMutableArray *)a3;
  os_unfair_lock_lock_with_options();
  *(_QWORD *)&self->_flags |= 0x80000uLL;
  os_unfair_lock_unlock(&self->_readerLock);
  *(_QWORD *)&self->_flags |= 0x100000000uLL;
  businessChatPreflightIdentifiers = self->_businessChatPreflightIdentifiers;
  self->_businessChatPreflightIdentifiers = v4;

}

- (int)resultListAttributionSupport
{
  os_unfair_lock_s *p_readerLock;
  $F32854447752F5D8BD00F9C7283039A2 flags;

  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  flags = self->_flags;
  os_unfair_lock_unlock(p_readerLock);
  if ((*(_BYTE *)&flags & 0x20) != 0)
    return self->_resultListAttributionSupport;
  else
    return 0;
}

- (int)requiredVersion
{
  os_unfair_lock_s *p_readerLock;
  $F32854447752F5D8BD00F9C7283039A2 flags;

  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  flags = self->_flags;
  os_unfair_lock_unlock(p_readerLock);
  if ((*(_BYTE *)&flags & 0x10) != 0)
    return self->_requiredVersion;
  else
    return 1;
}

- (BOOL)enablePreflightVenues
{
  os_unfair_lock_s *p_readerLock;
  $F32854447752F5D8BD00F9C7283039A2 flags;

  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  flags = self->_flags;
  os_unfair_lock_unlock(p_readerLock);
  return (*(_BYTE *)&flags & 0x80) != 0 && self->_enablePreflightVenues;
}

- (NSMutableArray)businessChatPreflightIdentifiers
{
  -[GEOPDClientMetadata _readBusinessChatPreflightIdentifiers]((uint64_t)self);
  return self->_businessChatPreflightIdentifiers;
}

- (void)_readBusinessChatPreflightIdentifiers
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 280));
    if ((*(_BYTE *)(a1 + 318) & 8) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOPDClientMetadataReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readBusinessChatPreflightIdentifiers_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 280));
  }
}

- (void)_readAdditionalEnabledMarkets
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 280));
    if ((*(_BYTE *)(a1 + 318) & 4) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOPDClientMetadataReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readAdditionalEnabledMarkets_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 280));
  }
}

- (GEOPDClientMetadata)initWithData:(id)a3
{
  GEOPDClientMetadata *v3;
  GEOPDClientMetadata *v4;
  GEOPDClientMetadata *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)GEOPDClientMetadata;
  v3 = -[GEOPDClientMetadata initWithData:](&v7, sel_initWithData_, a3);
  v4 = v3;
  if (v3)
  {
    v3->_readerLock._os_unfair_lock_opaque = 0;
    v5 = v3;
  }

  return v4;
}

- (void)_readDeviceCountryCode
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 280));
    if ((*(_BYTE *)(a1 + 318) & 0x20) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOPDClientMetadataReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readDeviceCountryCode_tags_0);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 280));
  }
}

- (BOOL)hasDeviceCountryCode
{
  -[GEOPDClientMetadata _readDeviceCountryCode]((uint64_t)self);
  return self->_deviceCountryCode != 0;
}

- (NSString)deviceCountryCode
{
  -[GEOPDClientMetadata _readDeviceCountryCode]((uint64_t)self);
  return self->_deviceCountryCode;
}

- (void)_readDeviceDisplayLanguage
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 280));
    if ((*(_BYTE *)(a1 + 318) & 0x40) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOPDClientMetadataReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readDeviceDisplayLanguage_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 280));
  }
}

- (BOOL)hasDeviceDisplayLanguage
{
  -[GEOPDClientMetadata _readDeviceDisplayLanguage]((uint64_t)self);
  return self->_deviceDisplayLanguage != 0;
}

- (NSString)deviceDisplayLanguage
{
  -[GEOPDClientMetadata _readDeviceDisplayLanguage]((uint64_t)self);
  return self->_deviceDisplayLanguage;
}

- (void)_readDeviceKeyboardLanguage
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 280));
    if ((*(_BYTE *)(a1 + 319) & 2) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOPDClientMetadataReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readDeviceKeyboardLanguage_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 280));
  }
}

- (BOOL)hasDeviceKeyboardLanguage
{
  -[GEOPDClientMetadata _readDeviceKeyboardLanguage]((uint64_t)self);
  return self->_deviceKeyboardLanguage != 0;
}

- (NSString)deviceKeyboardLanguage
{
  -[GEOPDClientMetadata _readDeviceKeyboardLanguage]((uint64_t)self);
  return self->_deviceKeyboardLanguage;
}

- (void)setDeviceKeyboardLanguage:(id)a3
{
  *(_QWORD *)&self->_flags |= 0x102000000uLL;
  objc_storeStrong((id *)&self->_deviceKeyboardLanguage, a3);
}

- (void)_readDeviceSpokenLanguage
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 280));
    if ((*(_BYTE *)(a1 + 319) & 8) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOPDClientMetadataReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readDeviceSpokenLanguage_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 280));
  }
}

- (BOOL)hasDeviceSpokenLanguage
{
  -[GEOPDClientMetadata _readDeviceSpokenLanguage]((uint64_t)self);
  return self->_deviceSpokenLanguage != 0;
}

- (NSString)deviceSpokenLanguage
{
  -[GEOPDClientMetadata _readDeviceSpokenLanguage]((uint64_t)self);
  return self->_deviceSpokenLanguage;
}

- (void)setDeviceSpokenLanguage:(id)a3
{
  *(_QWORD *)&self->_flags |= 0x108000000uLL;
  objc_storeStrong((id *)&self->_deviceSpokenLanguage, a3);
}

- (unsigned)timeSinceMapEnteredForeground
{
  return self->_timeSinceMapEnteredForeground;
}

- (void)setTimeSinceMapEnteredForeground:(unsigned int)a3
{
  *(_QWORD *)&self->_flags |= 0x100000040uLL;
  self->_timeSinceMapEnteredForeground = a3;
}

- (void)setHasTimeSinceMapEnteredForeground:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x100000000;
  if (a3)
    v3 = 0x100000040;
  self->_flags = ($F32854447752F5D8BD00F9C7283039A2)(*(_QWORD *)&self->_flags & 0xFFFFFFFFFFFFFFBFLL | v3);
}

- (BOOL)hasTimeSinceMapEnteredForeground
{
  return (*(_BYTE *)&self->_flags >> 6) & 1;
}

- (BOOL)hasAdditionalEnabledMarkets
{
  -[GEOPDClientMetadata _readAdditionalEnabledMarkets]((uint64_t)self);
  return self->_additionalEnabledMarkets != 0;
}

- (void)setHasResultListAttributionSupport:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x100000000;
  if (a3)
    v3 = 0x100000020;
  self->_flags = ($F32854447752F5D8BD00F9C7283039A2)(*(_QWORD *)&self->_flags & 0xFFFFFFFFFFFFFFDFLL | v3);
}

- (BOOL)hasResultListAttributionSupport
{
  return (*(_BYTE *)&self->_flags >> 5) & 1;
}

- (id)resultListAttributionSupportAsString:(int)a3
{
  __CFString *v3;

  if (!a3)
    return CFSTR("SINGLE_ATTRIBUTION");
  if (a3 == 1)
  {
    v3 = CFSTR("MULTIPLE_ATTRIBUTIONS");
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3);
    v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  return v3;
}

- (int)StringAsResultListAttributionSupport:(id)a3
{
  id v3;
  int v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("SINGLE_ATTRIBUTION")) & 1) != 0)
    v4 = 0;
  else
    v4 = objc_msgSend(v3, "isEqualToString:", CFSTR("MULTIPLE_ATTRIBUTIONS"));

  return v4;
}

- (unsigned)hourOfDay
{
  return self->_hourOfDay;
}

- (void)setHasHourOfDay:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x100000000;
  if (a3)
    v3 = 0x100000004;
  self->_flags = ($F32854447752F5D8BD00F9C7283039A2)(*(_QWORD *)&self->_flags & 0xFFFFFFFFFFFFFFFBLL | v3);
}

- (BOOL)hasHourOfDay
{
  return (*(_BYTE *)&self->_flags >> 2) & 1;
}

- (unsigned)dayOfWeek
{
  return self->_dayOfWeek;
}

- (void)setHasDayOfWeek:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x100000000;
  if (a3)
    v3 = 0x100000002;
  self->_flags = ($F32854447752F5D8BD00F9C7283039A2)(*(_QWORD *)&self->_flags & 0xFFFFFFFFFFFFFFFDLL | v3);
}

- (BOOL)hasDayOfWeek
{
  return (*(_BYTE *)&self->_flags >> 1) & 1;
}

- (void)setDeviceExtendedLocation:(id)a3
{
  *(_QWORD *)&self->_flags |= 0x100800000uLL;
  objc_storeStrong((id *)&self->_deviceExtendedLocation, a3);
}

- (void)setDeviceHistoricalLocations:(id)a3
{
  NSMutableArray *v4;
  NSMutableArray *deviceHistoricalLocations;

  v4 = (NSMutableArray *)a3;
  os_unfair_lock_lock_with_options();
  *(_QWORD *)&self->_flags |= 0x1000000uLL;
  os_unfair_lock_unlock(&self->_readerLock);
  *(_QWORD *)&self->_flags |= 0x100000000uLL;
  deviceHistoricalLocations = self->_deviceHistoricalLocations;
  self->_deviceHistoricalLocations = v4;

}

- (void)clearDeviceHistoricalLocations
{
  os_unfair_lock_s *p_readerLock;

  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(_QWORD *)&self->_flags |= 0x1000000uLL;
  os_unfair_lock_unlock(p_readerLock);
  *(_QWORD *)&self->_flags |= 0x100000000uLL;
  -[NSMutableArray removeAllObjects](self->_deviceHistoricalLocations, "removeAllObjects");
}

- (void)addDeviceHistoricalLocation:(id)a3
{
  id v4;

  v4 = a3;
  -[GEOPDClientMetadata _readDeviceHistoricalLocations]((uint64_t)self);
  -[GEOPDClientMetadata _addNoFlagsDeviceHistoricalLocation:]((uint64_t)self, v4);

  os_unfair_lock_lock_with_options();
  *(_QWORD *)&self->_flags |= 0x1000000uLL;
  os_unfair_lock_unlock(&self->_readerLock);
  *(_QWORD *)&self->_flags |= 0x100000000uLL;
}

- (void)_addNoFlagsDeviceHistoricalLocation:(uint64_t)a1
{
  id v3;
  void *v4;
  id v5;
  void *v6;
  id v7;

  v3 = a2;
  if (a1)
  {
    v4 = *(void **)(a1 + 208);
    v7 = v3;
    if (!v4)
    {
      v5 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
      v6 = *(void **)(a1 + 208);
      *(_QWORD *)(a1 + 208) = v5;

      v4 = *(void **)(a1 + 208);
    }
    objc_msgSend(v4, "addObject:", v7);
    v3 = v7;
  }

}

- (unint64_t)deviceHistoricalLocationsCount
{
  -[GEOPDClientMetadata _readDeviceHistoricalLocations]((uint64_t)self);
  return -[NSMutableArray count](self->_deviceHistoricalLocations, "count");
}

- (id)deviceHistoricalLocationAtIndex:(unint64_t)a3
{
  -[GEOPDClientMetadata _readDeviceHistoricalLocations]((uint64_t)self);
  return (id)-[NSMutableArray objectAtIndex:](self->_deviceHistoricalLocations, "objectAtIndex:", a3);
}

+ (Class)deviceHistoricalLocationType
{
  return (Class)objc_opt_class();
}

- (void)setHasRequiredVersion:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x100000000;
  if (a3)
    v3 = 0x100000010;
  self->_flags = ($F32854447752F5D8BD00F9C7283039A2)(*(_QWORD *)&self->_flags & 0xFFFFFFFFFFFFFFEFLL | v3);
}

- (BOOL)hasRequiredVersion
{
  return (*(_BYTE *)&self->_flags >> 4) & 1;
}

- (id)requiredVersionAsString:(int)a3
{
  if ((a3 - 1) < 3)
    return off_1E1C0E810[a3 - 1];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (int)StringAsRequiredVersion:(id)a3
{
  id v3;
  int v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("VERSION_1")) & 1) != 0)
  {
    v4 = 1;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("VERSION_2")) & 1) != 0)
  {
    v4 = 2;
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("VERSION_3")))
  {
    v4 = 3;
  }
  else
  {
    v4 = 1;
  }

  return v4;
}

- (void)_readDebugApiKey
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 280));
    if ((*(_BYTE *)(a1 + 318) & 0x10) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOPDClientMetadataReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readDebugApiKey_tags_0);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 280));
  }
}

- (BOOL)hasDebugApiKey
{
  -[GEOPDClientMetadata _readDebugApiKey]((uint64_t)self);
  return self->_debugApiKey != 0;
}

- (NSString)debugApiKey
{
  -[GEOPDClientMetadata _readDebugApiKey]((uint64_t)self);
  return self->_debugApiKey;
}

- (void)setDebugApiKey:(id)a3
{
  *(_QWORD *)&self->_flags |= 0x100100000uLL;
  objc_storeStrong((id *)&self->_debugApiKey, a3);
}

- (void)_readKnownClientResolvedTypeDeprecateds
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 280));
    if ((*(_BYTE *)(a1 + 317) & 0x10) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOPDClientMetadataReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readKnownClientResolvedTypeDeprecateds_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 280));
  }
}

- (unint64_t)knownClientResolvedTypeDeprecatedsCount
{
  -[GEOPDClientMetadata _readKnownClientResolvedTypeDeprecateds]((uint64_t)self);
  return self->_knownClientResolvedTypeDeprecateds.count;
}

- (int)knownClientResolvedTypeDeprecateds
{
  -[GEOPDClientMetadata _readKnownClientResolvedTypeDeprecateds]((uint64_t)self);
  return self->_knownClientResolvedTypeDeprecateds.list;
}

- (void)clearKnownClientResolvedTypeDeprecateds
{
  os_unfair_lock_s *p_readerLock;

  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(_QWORD *)&self->_flags |= 0x1000uLL;
  os_unfair_lock_unlock(p_readerLock);
  *(_QWORD *)&self->_flags |= 0x100000000uLL;
  PBRepeatedInt32Clear();
}

- (void)addKnownClientResolvedTypeDeprecated:(int)a3
{
  -[GEOPDClientMetadata _readKnownClientResolvedTypeDeprecateds]((uint64_t)self);
  if (self)
    PBRepeatedInt32Add();
  os_unfair_lock_lock_with_options();
  *(_QWORD *)&self->_flags |= 0x1000uLL;
  os_unfair_lock_unlock(&self->_readerLock);
  *(_QWORD *)&self->_flags |= 0x100000000uLL;
}

- (int)knownClientResolvedTypeDeprecatedAtIndex:(unint64_t)a3
{
  $27AAA0BB14FCB8642CC83DAEBE69EA4A *p_knownClientResolvedTypeDeprecateds;
  unint64_t count;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;

  -[GEOPDClientMetadata _readKnownClientResolvedTypeDeprecateds]((uint64_t)self);
  p_knownClientResolvedTypeDeprecateds = &self->_knownClientResolvedTypeDeprecateds;
  count = self->_knownClientResolvedTypeDeprecateds.count;
  if (count <= a3)
  {
    v7 = (void *)MEMORY[0x1E0C99DA0];
    v8 = *MEMORY[0x1E0C99858];
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("idx (%tu) is out of range (%tu)"), a3, count);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "exceptionWithName:reason:userInfo:", v8, v9, 0);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "raise");

  }
  return p_knownClientResolvedTypeDeprecateds->list[a3];
}

- (void)setKnownClientResolvedTypeDeprecateds:(int *)a3 count:(unint64_t)a4
{
  os_unfair_lock_s *p_readerLock;

  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(_QWORD *)&self->_flags |= 0x1000uLL;
  os_unfair_lock_unlock(p_readerLock);
  *(_QWORD *)&self->_flags |= 0x100000000uLL;
  PBRepeatedInt32Set();
}

- (id)knownClientResolvedTypeDeprecatedsAsString:(int)a3
{
  if (a3 < 7)
    return off_1E1C0E828[a3];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (int)StringAsKnownClientResolvedTypeDeprecateds:(id)a3
{
  id v3;
  int v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("RESOLVED_ITEM_TYPE_UNKNOWN")) & 1) != 0)
  {
    v4 = 0;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("RESOLVED_ITEM_TYPE_HOME")) & 1) != 0)
  {
    v4 = 1;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("RESOLVED_ITEM_TYPE_WORK")) & 1) != 0)
  {
    v4 = 2;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("RESOLVED_ITEM_TYPE_PARKED_CAR")) & 1) != 0)
  {
    v4 = 3;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("RESOLVED_ITEM_TYPE_CURRENT_LOCATION")) & 1) != 0)
  {
    v4 = 4;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("RESOLVED_ITEM_TYPE_SERVER")) & 1) != 0)
  {
    v4 = 5;
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("RESOLVED_ITEM_TYPE_SCHOOL")))
  {
    v4 = 6;
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (void)setHasEnablePreflightVenues:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x100000000;
  if (a3)
    v3 = 0x100000080;
  self->_flags = ($F32854447752F5D8BD00F9C7283039A2)(*(_QWORD *)&self->_flags & 0xFFFFFFFFFFFFFF7FLL | v3);
}

- (BOOL)hasEnablePreflightVenues
{
  return *(_BYTE *)&self->_flags >> 7;
}

- (void)_readKnownClientResolvedTypes
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 280));
    if ((*(_BYTE *)(a1 + 317) & 0x20) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOPDClientMetadataReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readKnownClientResolvedTypes_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 280));
  }
}

- (unint64_t)knownClientResolvedTypesCount
{
  -[GEOPDClientMetadata _readKnownClientResolvedTypes]((uint64_t)self);
  return self->_knownClientResolvedTypes.count;
}

- (int)knownClientResolvedTypes
{
  -[GEOPDClientMetadata _readKnownClientResolvedTypes]((uint64_t)self);
  return self->_knownClientResolvedTypes.list;
}

- (void)clearKnownClientResolvedTypes
{
  os_unfair_lock_s *p_readerLock;

  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(_QWORD *)&self->_flags |= 0x2000uLL;
  os_unfair_lock_unlock(p_readerLock);
  *(_QWORD *)&self->_flags |= 0x100000000uLL;
  PBRepeatedInt32Clear();
}

- (void)addKnownClientResolvedType:(int)a3
{
  -[GEOPDClientMetadata _readKnownClientResolvedTypes]((uint64_t)self);
  if (self)
    PBRepeatedInt32Add();
  os_unfair_lock_lock_with_options();
  *(_QWORD *)&self->_flags |= 0x2000uLL;
  os_unfair_lock_unlock(&self->_readerLock);
  *(_QWORD *)&self->_flags |= 0x100000000uLL;
}

- (int)knownClientResolvedTypeAtIndex:(unint64_t)a3
{
  $27AAA0BB14FCB8642CC83DAEBE69EA4A *p_knownClientResolvedTypes;
  unint64_t count;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;

  -[GEOPDClientMetadata _readKnownClientResolvedTypes]((uint64_t)self);
  p_knownClientResolvedTypes = &self->_knownClientResolvedTypes;
  count = self->_knownClientResolvedTypes.count;
  if (count <= a3)
  {
    v7 = (void *)MEMORY[0x1E0C99DA0];
    v8 = *MEMORY[0x1E0C99858];
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("idx (%tu) is out of range (%tu)"), a3, count);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "exceptionWithName:reason:userInfo:", v8, v9, 0);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "raise");

  }
  return p_knownClientResolvedTypes->list[a3];
}

- (id)knownClientResolvedTypesAsString:(int)a3
{
  if (a3 < 7)
    return off_1E1C0E828[a3];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (int)StringAsKnownClientResolvedTypes:(id)a3
{
  id v3;
  int v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("RESOLVED_ITEM_TYPE_UNKNOWN")) & 1) != 0)
  {
    v4 = 0;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("RESOLVED_ITEM_TYPE_HOME")) & 1) != 0)
  {
    v4 = 1;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("RESOLVED_ITEM_TYPE_WORK")) & 1) != 0)
  {
    v4 = 2;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("RESOLVED_ITEM_TYPE_PARKED_CAR")) & 1) != 0)
  {
    v4 = 3;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("RESOLVED_ITEM_TYPE_CURRENT_LOCATION")) & 1) != 0)
  {
    v4 = 4;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("RESOLVED_ITEM_TYPE_SERVER")) & 1) != 0)
  {
    v4 = 5;
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("RESOLVED_ITEM_TYPE_SCHOOL")))
  {
    v4 = 6;
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (void)clearBusinessChatPreflightIdentifiers
{
  os_unfair_lock_s *p_readerLock;

  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(_QWORD *)&self->_flags |= 0x80000uLL;
  os_unfair_lock_unlock(p_readerLock);
  *(_QWORD *)&self->_flags |= 0x100000000uLL;
  -[NSMutableArray removeAllObjects](self->_businessChatPreflightIdentifiers, "removeAllObjects");
}

- (void)addBusinessChatPreflightIdentifier:(id)a3
{
  id v4;

  v4 = a3;
  -[GEOPDClientMetadata _readBusinessChatPreflightIdentifiers]((uint64_t)self);
  -[GEOPDClientMetadata _addNoFlagsBusinessChatPreflightIdentifier:]((uint64_t)self, v4);

  os_unfair_lock_lock_with_options();
  *(_QWORD *)&self->_flags |= 0x80000uLL;
  os_unfair_lock_unlock(&self->_readerLock);
  *(_QWORD *)&self->_flags |= 0x100000000uLL;
}

- (void)_addNoFlagsBusinessChatPreflightIdentifier:(uint64_t)a1
{
  id v3;
  void *v4;
  id v5;
  void *v6;
  id v7;

  v3 = a2;
  if (a1)
  {
    v4 = *(void **)(a1 + 168);
    v7 = v3;
    if (!v4)
    {
      v5 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
      v6 = *(void **)(a1 + 168);
      *(_QWORD *)(a1 + 168) = v5;

      v4 = *(void **)(a1 + 168);
    }
    objc_msgSend(v4, "addObject:", v7);
    v3 = v7;
  }

}

- (unint64_t)businessChatPreflightIdentifiersCount
{
  -[GEOPDClientMetadata _readBusinessChatPreflightIdentifiers]((uint64_t)self);
  return -[NSMutableArray count](self->_businessChatPreflightIdentifiers, "count");
}

- (id)businessChatPreflightIdentifierAtIndex:(unint64_t)a3
{
  -[GEOPDClientMetadata _readBusinessChatPreflightIdentifiers]((uint64_t)self);
  return (id)-[NSMutableArray objectAtIndex:](self->_businessChatPreflightIdentifiers, "objectAtIndex:", a3);
}

+ (Class)businessChatPreflightIdentifierType
{
  return (Class)objc_opt_class();
}

- (int)clientRevision
{
  os_unfair_lock_s *p_readerLock;
  $F32854447752F5D8BD00F9C7283039A2 flags;

  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  flags = self->_flags;
  os_unfair_lock_unlock(p_readerLock);
  if ((*(_BYTE *)&flags & 1) != 0)
    return self->_clientRevision;
  else
    return 0;
}

- (void)setClientRevision:(int)a3
{
  *(_QWORD *)&self->_flags |= 0x100000001uLL;
  self->_clientRevision = a3;
}

- (void)setHasClientRevision:(BOOL)a3
{
  self->_flags = ($F32854447752F5D8BD00F9C7283039A2)(*(_QWORD *)&self->_flags & 0xFFFFFFFEFFFFFFFELL | a3 | 0x100000000);
}

- (BOOL)hasClientRevision
{
  return *(_DWORD *)&self->_flags & 1;
}

- (id)clientRevisionAsString:(int)a3
{
  __CFString *v3;

  if (a3 < 0x27 && ((0x7FE0100DFFuLL >> a3) & 1) != 0)
  {
    v3 = off_1E1C0E860[a3];
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3);
    v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  return v3;
}

- (int)StringAsClientRevision:(id)a3
{
  id v3;
  int v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("CLIENT_REVISION_UNKNOWN")) & 1) != 0)
  {
    v4 = 0;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("CLIENT_REVISION_CAN_HANDLE_PERMANENTLY_CLOSED")) & 1) != 0)
  {
    v4 = 1;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("CLIENT_REVISION_CAN_HANDLE_BASEMAP_ID")) & 1) != 0)
  {
    v4 = 2;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("CLIENT_REVISION_CAN_HANDLE_APPCLIPS")) & 1) != 0)
  {
    v4 = 3;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("CLIENT_REVISION_CAN_HANDLE_APPLE_RATINGS_PHOTOS")) & 1) != 0)
  {
    v4 = 4;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("CLIENT_REVISION_CAN_HANDLE_ENHANCED_PLACEMENTS")) & 1) != 0)
  {
    v4 = 5;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("CLIENT_REVISION_CAN_HANDLE_ADDRESS_CLUSTER")) & 1) != 0)
  {
    v4 = 6;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("CLIENT_REVISION_CAN_HANDLE_COARSE_LOCATION")) & 1) != 0)
  {
    v4 = 7;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("CLIENT_REVISION_CAN_HANDLE_SIRI_TRAFFIC_INCIDENTS")) & 1) != 0)
  {
    v4 = 8;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("CLIENT_REVISION_AZUL_RELEASE")) & 1) != 0)
  {
    v4 = 10;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("CLIENT_REVISION_CAN_HANDLE_SMART_CARD_DYNAMIC_LAYOUT")) & 1) != 0)
  {
    v4 = 11;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("CLIENT_REVISION_SKY_RELEASE")) & 1) != 0)
  {
    v4 = 20;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("CLIENT_REVISION_CAN_HANDLE_UNIFIED_ACTION_ROW")) & 1) != 0)
  {
    v4 = 29;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("CLIENT_REVISION_SYDNEY_RELEASE")) & 1) != 0)
  {
    v4 = 30;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("CLIENT_REVISION_CAN_HANDLE_YELP_PHOTO_COMMINGLE")) & 1) != 0)
  {
    v4 = 31;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("CLIENT_REVISION_CAN_HANDLE_HIKING_DATA")) & 1) != 0)
  {
    v4 = 32;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("CLIENT_REVISION_CAN_HANDLE_REALTIME_EV_CHARGING")) & 1) != 0)
  {
    v4 = 33;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("CLIENT_REVISION_CAN_HANDLE_OFFLINE_DATA")) & 1) != 0)
  {
    v4 = 34;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("CLIENT_REVISION_CAN_HANDLE_INTERLEAVED_GUIDES_IN_SEARCH_RESULTS")) & 1) != 0)
  {
    v4 = 35;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("CLIENT_REVISION_CAN_HANDLE_SAVE_BUTTON")) & 1) != 0)
  {
    v4 = 36;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("CLIENT_REVISION_CAN_HANDLE_FLEXIBLE_ACTION_LINK")) & 1) != 0)
  {
    v4 = 37;
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("CLIENT_REVISION_CAN_HANDLE_HIKE_ROUTE")))
  {
    v4 = 38;
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (void)_readLocalizationCapabilities
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 280));
    if ((*(_BYTE *)(a1 + 319) & 0x20) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOPDClientMetadataReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readLocalizationCapabilities_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 280));
  }
}

- (BOOL)hasLocalizationCapabilities
{
  -[GEOPDClientMetadata _readLocalizationCapabilities]((uint64_t)self);
  return self->_localizationCapabilities != 0;
}

- (GEOLocalizationCapabilities)localizationCapabilities
{
  -[GEOPDClientMetadata _readLocalizationCapabilities]((uint64_t)self);
  return self->_localizationCapabilities;
}

- (void)_readDeviceSku
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 280));
    if ((*(_BYTE *)(a1 + 319) & 4) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOPDClientMetadataReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readDeviceSku_tags_0);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 280));
  }
}

- (BOOL)hasDeviceSku
{
  -[GEOPDClientMetadata _readDeviceSku]((uint64_t)self);
  return self->_deviceSku != 0;
}

- (NSString)deviceSku
{
  -[GEOPDClientMetadata _readDeviceSku]((uint64_t)self);
  return self->_deviceSku;
}

- (BOOL)siriUserConsentsForAnalysis
{
  return self->_siriUserConsentsForAnalysis;
}

- (void)setSiriUserConsentsForAnalysis:(BOOL)a3
{
  *(_QWORD *)&self->_flags |= 0x100000100uLL;
  self->_siriUserConsentsForAnalysis = a3;
}

- (void)setHasSiriUserConsentsForAnalysis:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x100000000;
  if (a3)
    v3 = 0x100000100;
  self->_flags = ($F32854447752F5D8BD00F9C7283039A2)(*(_QWORD *)&self->_flags & 0xFFFFFFFFFFFFFEFFLL | v3);
}

- (BOOL)hasSiriUserConsentsForAnalysis
{
  return *((_BYTE *)&self->_flags + 1) & 1;
}

- (unint64_t)supportedMapsResultTypesCount
{
  -[GEOPDClientMetadata _readSupportedMapsResultTypes]((uint64_t)self);
  return self->_supportedMapsResultTypes.count;
}

- (int)supportedMapsResultTypes
{
  -[GEOPDClientMetadata _readSupportedMapsResultTypes]((uint64_t)self);
  return self->_supportedMapsResultTypes.list;
}

- (void)clearSupportedMapsResultTypes
{
  os_unfair_lock_s *p_readerLock;

  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(_QWORD *)&self->_flags |= 0x8000uLL;
  os_unfair_lock_unlock(p_readerLock);
  *(_QWORD *)&self->_flags |= 0x100000000uLL;
  PBRepeatedInt32Clear();
}

- (int)supportedMapsResultTypeAtIndex:(unint64_t)a3
{
  $27AAA0BB14FCB8642CC83DAEBE69EA4A *p_supportedMapsResultTypes;
  unint64_t count;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;

  -[GEOPDClientMetadata _readSupportedMapsResultTypes]((uint64_t)self);
  p_supportedMapsResultTypes = &self->_supportedMapsResultTypes;
  count = self->_supportedMapsResultTypes.count;
  if (count <= a3)
  {
    v7 = (void *)MEMORY[0x1E0C99DA0];
    v8 = *MEMORY[0x1E0C99858];
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("idx (%tu) is out of range (%tu)"), a3, count);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "exceptionWithName:reason:userInfo:", v8, v9, 0);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "raise");

  }
  return p_supportedMapsResultTypes->list[a3];
}

- (void)setSupportedMapsResultTypes:(int *)a3 count:(unint64_t)a4
{
  os_unfair_lock_s *p_readerLock;

  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(_QWORD *)&self->_flags |= 0x8000uLL;
  os_unfair_lock_unlock(p_readerLock);
  *(_QWORD *)&self->_flags |= 0x100000000uLL;
  PBRepeatedInt32Set();
}

- (id)supportedMapsResultTypesAsString:(int)a3
{
  if (a3 < 6)
    return off_1E1C0E9B0[a3];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (int)StringAsSupportedMapsResultTypes:(id)a3
{
  id v3;
  int v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("MAPS_RESULT_TYPE_UNKNOWN")) & 1) != 0)
  {
    v4 = 0;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("MAPS_RESULT_TYPE_PLACE")) & 1) != 0)
  {
    v4 = 1;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("MAPS_RESULT_TYPE_COLLECTION")) & 1) != 0)
  {
    v4 = 2;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("MAPS_RESULT_TYPE_PUBLISHER")) & 1) != 0)
  {
    v4 = 3;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("MAPS_RESULT_TYPE_PLACE_QUESTIONNAIRE")) & 1) != 0)
  {
    v4 = 4;
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("MAPS_RESULT_TYPE_BATCH_REVERSE_GEOCODE")))
  {
    v4 = 5;
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (void)_readMapsSuggestionsTouristInfo
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 280));
    if ((*(_BYTE *)(a1 + 319) & 0x40) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOPDClientMetadataReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readMapsSuggestionsTouristInfo_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 280));
  }
}

- (BOOL)hasMapsSuggestionsTouristInfo
{
  -[GEOPDClientMetadata _readMapsSuggestionsTouristInfo]((uint64_t)self);
  return self->_mapsSuggestionsTouristInfo != 0;
}

- (GEOPDMapsSuggestionsTouristInfo)mapsSuggestionsTouristInfo
{
  -[GEOPDClientMetadata _readMapsSuggestionsTouristInfo]((uint64_t)self);
  return self->_mapsSuggestionsTouristInfo;
}

- (void)setMapsSuggestionsTouristInfo:(id)a3
{
  *(_QWORD *)&self->_flags |= 0x140000000uLL;
  objc_storeStrong((id *)&self->_mapsSuggestionsTouristInfo, a3);
}

- (unint64_t)clientRevisionsCount
{
  -[GEOPDClientMetadata _readClientRevisions]((uint64_t)self);
  return self->_clientRevisions.count;
}

- (int)clientRevisions
{
  -[GEOPDClientMetadata _readClientRevisions]((uint64_t)self);
  return self->_clientRevisions.list;
}

- (void)clearClientRevisions
{
  os_unfair_lock_s *p_readerLock;

  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(_QWORD *)&self->_flags |= 0x800uLL;
  os_unfair_lock_unlock(p_readerLock);
  *(_QWORD *)&self->_flags |= 0x100000000uLL;
  PBRepeatedInt32Clear();
}

- (int)clientRevisionsAtIndex:(unint64_t)a3
{
  $27AAA0BB14FCB8642CC83DAEBE69EA4A *p_clientRevisions;
  unint64_t count;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;

  -[GEOPDClientMetadata _readClientRevisions]((uint64_t)self);
  p_clientRevisions = &self->_clientRevisions;
  count = self->_clientRevisions.count;
  if (count <= a3)
  {
    v7 = (void *)MEMORY[0x1E0C99DA0];
    v8 = *MEMORY[0x1E0C99858];
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("idx (%tu) is out of range (%tu)"), a3, count);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "exceptionWithName:reason:userInfo:", v8, v9, 0);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "raise");

  }
  return p_clientRevisions->list[a3];
}

- (void)setClientRevisions:(int *)a3 count:(unint64_t)a4
{
  os_unfair_lock_s *p_readerLock;

  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(_QWORD *)&self->_flags |= 0x800uLL;
  os_unfair_lock_unlock(p_readerLock);
  *(_QWORD *)&self->_flags |= 0x100000000uLL;
  PBRepeatedInt32Set();
}

- (id)clientRevisionsAsString:(int)a3
{
  __CFString *v3;

  if (a3 < 0x27 && ((0x7FE0100DFFuLL >> a3) & 1) != 0)
  {
    v3 = off_1E1C0E860[a3];
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3);
    v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  return v3;
}

- (int)StringAsClientRevisions:(id)a3
{
  id v3;
  int v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("CLIENT_REVISION_UNKNOWN")) & 1) != 0)
  {
    v4 = 0;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("CLIENT_REVISION_CAN_HANDLE_PERMANENTLY_CLOSED")) & 1) != 0)
  {
    v4 = 1;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("CLIENT_REVISION_CAN_HANDLE_BASEMAP_ID")) & 1) != 0)
  {
    v4 = 2;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("CLIENT_REVISION_CAN_HANDLE_APPCLIPS")) & 1) != 0)
  {
    v4 = 3;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("CLIENT_REVISION_CAN_HANDLE_APPLE_RATINGS_PHOTOS")) & 1) != 0)
  {
    v4 = 4;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("CLIENT_REVISION_CAN_HANDLE_ENHANCED_PLACEMENTS")) & 1) != 0)
  {
    v4 = 5;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("CLIENT_REVISION_CAN_HANDLE_ADDRESS_CLUSTER")) & 1) != 0)
  {
    v4 = 6;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("CLIENT_REVISION_CAN_HANDLE_COARSE_LOCATION")) & 1) != 0)
  {
    v4 = 7;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("CLIENT_REVISION_CAN_HANDLE_SIRI_TRAFFIC_INCIDENTS")) & 1) != 0)
  {
    v4 = 8;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("CLIENT_REVISION_AZUL_RELEASE")) & 1) != 0)
  {
    v4 = 10;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("CLIENT_REVISION_CAN_HANDLE_SMART_CARD_DYNAMIC_LAYOUT")) & 1) != 0)
  {
    v4 = 11;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("CLIENT_REVISION_SKY_RELEASE")) & 1) != 0)
  {
    v4 = 20;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("CLIENT_REVISION_CAN_HANDLE_UNIFIED_ACTION_ROW")) & 1) != 0)
  {
    v4 = 29;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("CLIENT_REVISION_SYDNEY_RELEASE")) & 1) != 0)
  {
    v4 = 30;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("CLIENT_REVISION_CAN_HANDLE_YELP_PHOTO_COMMINGLE")) & 1) != 0)
  {
    v4 = 31;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("CLIENT_REVISION_CAN_HANDLE_HIKING_DATA")) & 1) != 0)
  {
    v4 = 32;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("CLIENT_REVISION_CAN_HANDLE_REALTIME_EV_CHARGING")) & 1) != 0)
  {
    v4 = 33;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("CLIENT_REVISION_CAN_HANDLE_OFFLINE_DATA")) & 1) != 0)
  {
    v4 = 34;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("CLIENT_REVISION_CAN_HANDLE_INTERLEAVED_GUIDES_IN_SEARCH_RESULTS")) & 1) != 0)
  {
    v4 = 35;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("CLIENT_REVISION_CAN_HANDLE_SAVE_BUTTON")) & 1) != 0)
  {
    v4 = 36;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("CLIENT_REVISION_CAN_HANDLE_FLEXIBLE_ACTION_LINK")) & 1) != 0)
  {
    v4 = 37;
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("CLIENT_REVISION_CAN_HANDLE_HIKE_ROUTE")))
  {
    v4 = 38;
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (void)_readPreferredDisplayCurrencySymbol
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 280));
    if ((*(_BYTE *)(a1 + 319) & 0x80) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOPDClientMetadataReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readPreferredDisplayCurrencySymbol_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 280));
  }
}

- (BOOL)hasPreferredDisplayCurrencySymbol
{
  -[GEOPDClientMetadata _readPreferredDisplayCurrencySymbol]((uint64_t)self);
  return self->_preferredDisplayCurrencySymbol != 0;
}

- (NSString)preferredDisplayCurrencySymbol
{
  -[GEOPDClientMetadata _readPreferredDisplayCurrencySymbol]((uint64_t)self);
  return self->_preferredDisplayCurrencySymbol;
}

- (void)setPreferredDisplayCurrencySymbol:(id)a3
{
  *(_QWORD *)&self->_flags |= 0x180000000uLL;
  objc_storeStrong((id *)&self->_preferredDisplayCurrencySymbol, a3);
}

- (void)_readDisplayRegion
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 280));
    if ((*(_BYTE *)(a1 + 319) & 0x10) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOPDClientMetadataReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readDisplayRegion_tags_0);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 280));
  }
}

- (BOOL)hasDisplayRegion
{
  -[GEOPDClientMetadata _readDisplayRegion]((uint64_t)self);
  return self->_displayRegion != 0;
}

- (NSString)displayRegion
{
  -[GEOPDClientMetadata _readDisplayRegion]((uint64_t)self);
  return self->_displayRegion;
}

- (BOOL)supportEnrichment
{
  return self->_supportEnrichment;
}

- (void)setHasSupportEnrichment:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x100000000;
  if (a3)
    v3 = 0x100000200;
  self->_flags = ($F32854447752F5D8BD00F9C7283039A2)(*(_QWORD *)&self->_flags & 0xFFFFFFFFFFFFFDFFLL | v3);
}

- (BOOL)hasSupportEnrichment
{
  return (*((unsigned __int8 *)&self->_flags + 1) >> 1) & 1;
}

- (int)preferredDistanceUnit
{
  os_unfair_lock_s *p_readerLock;
  $F32854447752F5D8BD00F9C7283039A2 flags;

  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  flags = self->_flags;
  os_unfair_lock_unlock(p_readerLock);
  if ((*(_BYTE *)&flags & 8) != 0)
    return self->_preferredDistanceUnit;
  else
    return 0;
}

- (void)setPreferredDistanceUnit:(int)a3
{
  *(_QWORD *)&self->_flags |= 0x100000008uLL;
  self->_preferredDistanceUnit = a3;
}

- (void)setHasPreferredDistanceUnit:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x100000000;
  if (a3)
    v3 = 0x100000008;
  self->_flags = ($F32854447752F5D8BD00F9C7283039A2)(*(_QWORD *)&self->_flags & 0xFFFFFFFFFFFFFFF7 | v3);
}

- (BOOL)hasPreferredDistanceUnit
{
  return (*(_BYTE *)&self->_flags >> 3) & 1;
}

- (id)preferredDistanceUnitAsString:(int)a3
{
  if (a3 < 3)
    return off_1E1C0E998[a3];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (int)StringAsPreferredDistanceUnit:(id)a3
{
  id v3;
  int v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("PREFERRED_DISTANCE_UNIT_UNKNOWN")) & 1) != 0)
  {
    v4 = 0;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("PREFERRED_DISTANCE_UNIT_METRIC")) & 1) != 0)
  {
    v4 = 1;
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("PREFERRED_DISTANCE_UNIT_IMPERIAL")))
  {
    v4 = 2;
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (void)_readSupportedElevationModels
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 280));
    if ((*(_BYTE *)(a1 + 317) & 0x40) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOPDClientMetadataReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readSupportedElevationModels_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 280));
  }
}

- (unint64_t)supportedElevationModelsCount
{
  -[GEOPDClientMetadata _readSupportedElevationModels]((uint64_t)self);
  return self->_supportedElevationModels.count;
}

- (int)supportedElevationModels
{
  -[GEOPDClientMetadata _readSupportedElevationModels]((uint64_t)self);
  return self->_supportedElevationModels.list;
}

- (void)clearSupportedElevationModels
{
  os_unfair_lock_s *p_readerLock;

  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(_QWORD *)&self->_flags |= 0x4000uLL;
  os_unfair_lock_unlock(p_readerLock);
  *(_QWORD *)&self->_flags |= 0x100000000uLL;
  PBRepeatedInt32Clear();
}

- (void)addSupportedElevationModel:(int)a3
{
  -[GEOPDClientMetadata _readSupportedElevationModels]((uint64_t)self);
  if (self)
    PBRepeatedInt32Add();
  os_unfair_lock_lock_with_options();
  *(_QWORD *)&self->_flags |= 0x4000uLL;
  os_unfair_lock_unlock(&self->_readerLock);
  *(_QWORD *)&self->_flags |= 0x100000000uLL;
}

- (int)supportedElevationModelAtIndex:(unint64_t)a3
{
  $27AAA0BB14FCB8642CC83DAEBE69EA4A *p_supportedElevationModels;
  unint64_t count;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;

  -[GEOPDClientMetadata _readSupportedElevationModels]((uint64_t)self);
  p_supportedElevationModels = &self->_supportedElevationModels;
  count = self->_supportedElevationModels.count;
  if (count <= a3)
  {
    v7 = (void *)MEMORY[0x1E0C99DA0];
    v8 = *MEMORY[0x1E0C99858];
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("idx (%tu) is out of range (%tu)"), a3, count);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "exceptionWithName:reason:userInfo:", v8, v9, 0);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "raise");

  }
  return p_supportedElevationModels->list[a3];
}

- (void)setSupportedElevationModels:(int *)a3 count:(unint64_t)a4
{
  os_unfair_lock_s *p_readerLock;

  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(_QWORD *)&self->_flags |= 0x4000uLL;
  os_unfair_lock_unlock(p_readerLock);
  *(_QWORD *)&self->_flags |= 0x100000000uLL;
  PBRepeatedInt32Set();
}

- (id)supportedElevationModelsAsString:(int)a3
{
  __CFString *v3;

  if (!a3)
    return CFSTR("ELEVATION_MODEL_EGM96");
  if (a3 == 1)
  {
    v3 = CFSTR("ELEVATION_MODEL_WGS84");
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3);
    v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  return v3;
}

- (int)StringAsSupportedElevationModels:(id)a3
{
  id v3;
  int v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("ELEVATION_MODEL_EGM96")) & 1) != 0)
    v4 = 0;
  else
    v4 = objc_msgSend(v3, "isEqualToString:", CFSTR("ELEVATION_MODEL_WGS84"));

  return v4;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v8;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v8.receiver = self;
  v8.super_class = (Class)GEOPDClientMetadata;
  -[GEOPDClientMetadata description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[GEOPDClientMetadata dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEOPDClientMetadata _dictionaryRepresentation:]((uint64_t)self, 0);
}

- (id)_dictionaryRepresentation:(uint64_t)a1
{
  void *v4;
  void *v5;
  const __CFString *v6;
  void *v7;
  const __CFString *v8;
  void *v9;
  const __CFString *v10;
  void *v11;
  const __CFString *v12;
  int *v13;
  void *v14;
  const __CFString *v15;
  void *v16;
  void *v17;
  void *v18;
  const __CFString *v19;
  id v20;
  uint64_t v21;
  void *v22;
  const __CFString *v23;
  void *v24;
  void *v25;
  void *v26;
  const __CFString *v27;
  int v28;
  __CFString *v29;
  id v30;
  void *v31;
  id v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t i;
  void *v37;
  id v38;
  const __CFString *v39;
  unsigned int v40;
  __CFString *v41;
  const __CFString *v42;
  void *v43;
  const __CFString *v44;
  void *v45;
  _QWORD *v46;
  unint64_t v47;
  uint64_t v48;
  __CFString *v49;
  const __CFString *v50;
  void *v51;
  const __CFString *v52;
  void *v53;
  _QWORD *v54;
  unint64_t v55;
  uint64_t v56;
  __CFString *v57;
  const __CFString *v58;
  void *v59;
  const __CFString *v60;
  unsigned int v61;
  __CFString *v62;
  const __CFString *v63;
  void *v64;
  const __CFString *v65;
  const __CFString *v66;
  void *v67;
  void *v68;
  void *v69;
  const __CFString *v70;
  id v71;
  void *v72;
  const __CFString *v73;
  void *v74;
  const __CFString *v75;
  void *v76;
  _QWORD *v77;
  unint64_t v78;
  uint64_t v79;
  __CFString *v80;
  const __CFString *v81;
  void *v82;
  void *v83;
  void *v84;
  const __CFString *v85;
  id v86;
  void *v87;
  _QWORD *v88;
  unint64_t v89;
  uint64_t v90;
  __CFString *v91;
  const __CFString *v92;
  void *v93;
  const __CFString *v94;
  void *v95;
  const __CFString *v96;
  uint64_t v97;
  void *v98;
  const __CFString *v99;
  uint64_t v100;
  __CFString *v101;
  const __CFString *v102;
  void *v103;
  _QWORD *v104;
  unint64_t v105;
  uint64_t v106;
  __CFString *v107;
  const __CFString *v108;
  void *v109;
  void *v110;
  void *v111;
  const __CFString *v112;
  id v113;
  void *v114;
  void *v115;
  void *v116;
  const __CFString *v117;
  id v118;
  void *v119;
  void *v120;
  void *v121;
  void *v122;
  id v123;
  id v124;
  id v125;
  void *v127;
  _QWORD v128[4];
  id v129;
  __int128 v130;
  __int128 v131;
  __int128 v132;
  __int128 v133;
  _BYTE v134[128];
  uint64_t v135;

  v135 = *MEMORY[0x1E0C80C00];
  if (!a1)
    return 0;
  objc_msgSend((id)a1, "readAll:", 1);
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)a1, "deviceCountryCode");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    if (a2)
      v6 = CFSTR("deviceCountryCode");
    else
      v6 = CFSTR("device_country_code");
    objc_msgSend(v4, "setObject:forKey:", v5, v6);
  }

  objc_msgSend((id)a1, "deviceDisplayLanguage");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    if (a2)
      v8 = CFSTR("deviceDisplayLanguage");
    else
      v8 = CFSTR("device_display_language");
    objc_msgSend(v4, "setObject:forKey:", v7, v8);
  }

  objc_msgSend((id)a1, "deviceKeyboardLanguage");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (v9)
  {
    if (a2)
      v10 = CFSTR("deviceKeyboardLanguage");
    else
      v10 = CFSTR("device_keyboard_language");
    objc_msgSend(v4, "setObject:forKey:", v9, v10);
  }

  objc_msgSend((id)a1, "deviceSpokenLanguage");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (v11)
  {
    if (a2)
      v12 = CFSTR("deviceSpokenLanguage");
    else
      v12 = CFSTR("device_spoken_language");
    objc_msgSend(v4, "setObject:forKey:", v11, v12);
  }

  v13 = &OBJC_IVAR___GEOPDRelatedEntitySection__reader;
  if ((*(_BYTE *)(a1 + 316) & 0x40) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", *(unsigned int *)(a1 + 308));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    if (a2)
      v15 = CFSTR("timeSinceMapEnteredForeground");
    else
      v15 = CFSTR("time_since_map_entered_foreground");
    objc_msgSend(v4, "setObject:forKey:", v14, v15);

  }
  objc_msgSend((id)a1, "additionalEnabledMarkets");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = v16;
  if (v16)
  {
    if ((a2 & 1) != 0)
    {
      objc_msgSend(v16, "jsonRepresentation");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = CFSTR("additionalEnabledMarkets");
    }
    else
    {
      objc_msgSend(v16, "dictionaryRepresentation");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = CFSTR("additional_enabled_markets");
    }
    v20 = v18;

    objc_msgSend(v4, "setObject:forKey:", v20, v19);
  }

  v21 = *(_QWORD *)(a1 + 316);
  if ((v21 & 0x20) == 0)
  {
    if ((v21 & 4) == 0)
      goto LABEL_34;
LABEL_117:
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", *(unsigned int *)(a1 + 292));
    v64 = (void *)objc_claimAutoreleasedReturnValue();
    if (a2)
      v65 = CFSTR("hourOfDay");
    else
      v65 = CFSTR("hour_of_day");
    objc_msgSend(v4, "setObject:forKey:", v64, v65);

    if ((*(_QWORD *)(a1 + 316) & 2) == 0)
      goto LABEL_39;
    goto LABEL_35;
  }
  v28 = *(_DWORD *)(a1 + 304);
  if (v28)
  {
    if (v28 == 1)
    {
      v29 = CFSTR("MULTIPLE_ATTRIBUTIONS");
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(unsigned int *)(a1 + 304));
      v29 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
  }
  else
  {
    v29 = CFSTR("SINGLE_ATTRIBUTION");
  }
  if (a2)
    v63 = CFSTR("resultListAttributionSupport");
  else
    v63 = CFSTR("result_list_attribution_support");
  objc_msgSend(v4, "setObject:forKey:", v29, v63);

  v21 = *(_QWORD *)(a1 + 316);
  if ((v21 & 4) != 0)
    goto LABEL_117;
LABEL_34:
  if ((v21 & 2) != 0)
  {
LABEL_35:
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", *(unsigned int *)(a1 + 288));
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    if (a2)
      v23 = CFSTR("dayOfWeek");
    else
      v23 = CFSTR("day_of_week");
    objc_msgSend(v4, "setObject:forKey:", v22, v23);

  }
LABEL_39:
  objc_msgSend((id)a1, "deviceExtendedLocation");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = v24;
  if (v24)
  {
    if ((a2 & 1) != 0)
    {
      objc_msgSend(v24, "jsonRepresentation");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      v27 = CFSTR("deviceExtendedLocation");
    }
    else
    {
      objc_msgSend(v24, "dictionaryRepresentation");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      v27 = CFSTR("device_extended_location");
    }
    v30 = v26;

    objc_msgSend(v4, "setObject:forKey:", v30, v27);
  }

  v127 = v4;
  if (objc_msgSend(*(id *)(a1 + 208), "count"))
  {
    v31 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(*(id *)(a1 + 208), "count"));
    v130 = 0u;
    v131 = 0u;
    v132 = 0u;
    v133 = 0u;
    v32 = *(id *)(a1 + 208);
    v33 = objc_msgSend(v32, "countByEnumeratingWithState:objects:count:", &v130, v134, 16);
    if (v33)
    {
      v34 = v33;
      v35 = *(_QWORD *)v131;
      do
      {
        for (i = 0; i != v34; ++i)
        {
          if (*(_QWORD *)v131 != v35)
            objc_enumerationMutation(v32);
          v37 = *(void **)(*((_QWORD *)&v130 + 1) + 8 * i);
          if ((a2 & 1) != 0)
            objc_msgSend(v37, "jsonRepresentation");
          else
            objc_msgSend(v37, "dictionaryRepresentation");
          v38 = (id)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v31, "addObject:", v38);
        }
        v34 = objc_msgSend(v32, "countByEnumeratingWithState:objects:count:", &v130, v134, 16);
      }
      while (v34);
    }

    if (a2)
      v39 = CFSTR("deviceHistoricalLocation");
    else
      v39 = CFSTR("device_historical_location");
    v4 = v127;
    objc_msgSend(v127, "setObject:forKey:", v31, v39);

  }
  if ((*(_BYTE *)(a1 + 316) & 0x10) != 0)
  {
    v40 = *(_DWORD *)(a1 + 300) - 1;
    if (v40 >= 3)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(unsigned int *)(a1 + 300));
      v41 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v41 = off_1E1C0E810[v40];
    }
    if (a2)
      v42 = CFSTR("requiredVersion");
    else
      v42 = CFSTR("required_version");
    objc_msgSend(v4, "setObject:forKey:", v41, v42);

  }
  objc_msgSend((id)a1, "debugApiKey");
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  if (v43)
  {
    if (a2)
      v44 = CFSTR("debugApiKey");
    else
      v44 = CFSTR("debug_api_key");
    objc_msgSend(v4, "setObject:forKey:", v43, v44);
  }

  if (*(_QWORD *)(a1 + 56))
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:");
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    v46 = (_QWORD *)(a1 + 48);
    if (*(_QWORD *)(a1 + 56))
    {
      v47 = 0;
      do
      {
        v48 = *(int *)(*v46 + 4 * v47);
        if (v48 >= 7)
        {
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), v48);
          v49 = (__CFString *)objc_claimAutoreleasedReturnValue();
        }
        else
        {
          v49 = off_1E1C0E828[v48];
        }
        objc_msgSend(v45, "addObject:", v49);

        ++v47;
        v46 = (_QWORD *)(a1 + 48);
      }
      while (v47 < *(_QWORD *)(a1 + 56));
    }
    if (a2)
      v50 = CFSTR("knownClientResolvedTypeDeprecated");
    else
      v50 = CFSTR("known_client_resolved_type_deprecated");
    objc_msgSend(v4, "setObject:forKey:", v45, v50);

    v13 = &OBJC_IVAR___GEOPDRelatedEntitySection__reader;
  }
  if ((*(_BYTE *)(a1 + 316) & 0x80) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", *(unsigned __int8 *)(a1 + 312));
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    if (a2)
      v52 = CFSTR("enablePreflightVenues");
    else
      v52 = CFSTR("enable_preflight_venues");
    objc_msgSend(v4, "setObject:forKey:", v51, v52);

  }
  if (*(_QWORD *)(a1 + 80))
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:");
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    v54 = (_QWORD *)(a1 + 72);
    if (*(_QWORD *)(a1 + 80))
    {
      v55 = 0;
      do
      {
        v56 = *(int *)(*v54 + 4 * v55);
        if (v56 >= 7)
        {
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), v56);
          v57 = (__CFString *)objc_claimAutoreleasedReturnValue();
        }
        else
        {
          v57 = off_1E1C0E828[v56];
        }
        objc_msgSend(v53, "addObject:", v57);

        ++v55;
        v54 = (_QWORD *)(a1 + 72);
      }
      while (v55 < *(_QWORD *)(a1 + 80));
    }
    if (a2)
      v58 = CFSTR("knownClientResolvedType");
    else
      v58 = CFSTR("known_client_resolved_type");
    objc_msgSend(v4, "setObject:forKey:", v53, v58);

    v13 = &OBJC_IVAR___GEOPDRelatedEntitySection__reader;
  }
  if (*(_QWORD *)(a1 + 168))
  {
    objc_msgSend((id)a1, "businessChatPreflightIdentifiers");
    v59 = (void *)objc_claimAutoreleasedReturnValue();
    if (a2)
      v60 = CFSTR("businessChatPreflightIdentifier");
    else
      v60 = CFSTR("business_chat_preflight_identifier");
    objc_msgSend(v4, "setObject:forKey:", v59, v60);

  }
  if ((*(_BYTE *)(a1 + 316) & 1) != 0)
  {
    v61 = *(_DWORD *)(a1 + 284);
    if (v61 < 0x27 && ((0x7FE0100DFFuLL >> v61) & 1) != 0)
    {
      v62 = off_1E1C0E860[v61];
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(unsigned int *)(a1 + 284));
      v62 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    if (a2)
      v66 = CFSTR("clientRevision");
    else
      v66 = CFSTR("client_revision");
    objc_msgSend(v4, "setObject:forKey:", v62, v66);

  }
  objc_msgSend((id)a1, "localizationCapabilities");
  v67 = (void *)objc_claimAutoreleasedReturnValue();
  v68 = v67;
  if (v67)
  {
    if ((a2 & 1) != 0)
    {
      objc_msgSend(v67, "jsonRepresentation");
      v69 = (void *)objc_claimAutoreleasedReturnValue();
      v70 = CFSTR("localizationCapabilities");
    }
    else
    {
      objc_msgSend(v67, "dictionaryRepresentation");
      v69 = (void *)objc_claimAutoreleasedReturnValue();
      v70 = CFSTR("localization_capabilities");
    }
    v71 = v69;

    objc_msgSend(v4, "setObject:forKey:", v71, v70);
  }

  objc_msgSend((id)a1, "deviceSku");
  v72 = (void *)objc_claimAutoreleasedReturnValue();
  if (v72)
  {
    if (a2)
      v73 = CFSTR("deviceSku");
    else
      v73 = CFSTR("device_sku");
    objc_msgSend(v4, "setObject:forKey:", v72, v73);
  }

  if ((*(_BYTE *)(a1 + 317) & 1) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", *(unsigned __int8 *)(a1 + 313));
    v74 = (void *)objc_claimAutoreleasedReturnValue();
    if (a2)
      v75 = CFSTR("siriUserConsentsForAnalysis");
    else
      v75 = CFSTR("siri_user_consents_for_analysis");
    objc_msgSend(v4, "setObject:forKey:", v74, v75);

  }
  if (*(_QWORD *)(a1 + 128))
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:");
    v76 = (void *)objc_claimAutoreleasedReturnValue();
    v77 = (_QWORD *)(a1 + 120);
    if (*(_QWORD *)(a1 + 128))
    {
      v78 = 0;
      do
      {
        v79 = *(int *)(*v77 + 4 * v78);
        if (v79 >= 6)
        {
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), v79);
          v80 = (__CFString *)objc_claimAutoreleasedReturnValue();
        }
        else
        {
          v80 = off_1E1C0E9B0[v79];
        }
        objc_msgSend(v76, "addObject:", v80);

        ++v78;
        v77 = (_QWORD *)(a1 + 120);
      }
      while (v78 < *(_QWORD *)(a1 + 128));
    }
    if (a2)
      v81 = CFSTR("supportedMapsResultType");
    else
      v81 = CFSTR("supported_maps_result_type");
    objc_msgSend(v4, "setObject:forKey:", v76, v81);

    v13 = &OBJC_IVAR___GEOPDRelatedEntitySection__reader;
  }
  objc_msgSend((id)a1, "mapsSuggestionsTouristInfo");
  v82 = (void *)objc_claimAutoreleasedReturnValue();
  v83 = v82;
  if (v82)
  {
    if ((a2 & 1) != 0)
    {
      objc_msgSend(v82, "jsonRepresentation");
      v84 = (void *)objc_claimAutoreleasedReturnValue();
      v85 = CFSTR("mapsSuggestionsTouristInfo");
    }
    else
    {
      objc_msgSend(v82, "dictionaryRepresentation");
      v84 = (void *)objc_claimAutoreleasedReturnValue();
      v85 = CFSTR("maps_suggestions_tourist_info");
    }
    v86 = v84;

    objc_msgSend(v4, "setObject:forKey:", v86, v85);
  }

  if (*(_QWORD *)(a1 + 32))
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:");
    v87 = (void *)objc_claimAutoreleasedReturnValue();
    v88 = (_QWORD *)(a1 + 24);
    if (*(_QWORD *)(a1 + 32))
    {
      v89 = 0;
      do
      {
        v90 = *(unsigned int *)(*v88 + 4 * v89);
        if (v90 < 0x27 && ((0x7FE0100DFFuLL >> v90) & 1) != 0)
        {
          v91 = off_1E1C0E860[(int)v90];
        }
        else
        {
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), v90);
          v91 = (__CFString *)objc_claimAutoreleasedReturnValue();
        }
        objc_msgSend(v87, "addObject:", v91);

        ++v89;
        v88 = (_QWORD *)(a1 + 24);
      }
      while (v89 < *(_QWORD *)(a1 + 32));
    }
    if (a2)
      v92 = CFSTR("clientRevisions");
    else
      v92 = CFSTR("client_revisions");
    v4 = v127;
    objc_msgSend(v127, "setObject:forKey:", v87, v92);

    v13 = &OBJC_IVAR___GEOPDRelatedEntitySection__reader;
  }
  objc_msgSend((id)a1, "preferredDisplayCurrencySymbol");
  v93 = (void *)objc_claimAutoreleasedReturnValue();
  if (v93)
  {
    if (a2)
      v94 = CFSTR("preferredDisplayCurrencySymbol");
    else
      v94 = CFSTR("preferred_display_currency_symbol");
    objc_msgSend(v4, "setObject:forKey:", v93, v94);
  }

  objc_msgSend((id)a1, "displayRegion");
  v95 = (void *)objc_claimAutoreleasedReturnValue();
  if (v95)
  {
    if (a2)
      v96 = CFSTR("displayRegion");
    else
      v96 = CFSTR("display_region");
    objc_msgSend(v4, "setObject:forKey:", v95, v96);
  }

  v97 = *(_QWORD *)(a1 + v13[320]);
  if ((v97 & 0x200) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", *(unsigned __int8 *)(a1 + 314));
    v98 = (void *)objc_claimAutoreleasedReturnValue();
    if (a2)
      v99 = CFSTR("supportEnrichment");
    else
      v99 = CFSTR("support_enrichment");
    objc_msgSend(v4, "setObject:forKey:", v98, v99);

    v97 = *(_QWORD *)(a1 + v13[320]);
  }
  if ((v97 & 8) != 0)
  {
    v100 = *(int *)(a1 + 296);
    if (v100 >= 3)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(int *)(a1 + 296));
      v101 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v101 = off_1E1C0E998[v100];
    }
    if (a2)
      v102 = CFSTR("preferredDistanceUnit");
    else
      v102 = CFSTR("preferred_distance_unit");
    objc_msgSend(v4, "setObject:forKey:", v101, v102);

  }
  if (*(_QWORD *)(a1 + 104))
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:");
    v103 = (void *)objc_claimAutoreleasedReturnValue();
    v104 = (_QWORD *)(a1 + 96);
    if (*(_QWORD *)(a1 + 104))
    {
      v105 = 0;
      do
      {
        v106 = *(unsigned int *)(*v104 + 4 * v105);
        if ((_DWORD)v106)
        {
          if ((_DWORD)v106 == 1)
          {
            v107 = CFSTR("ELEVATION_MODEL_WGS84");
          }
          else
          {
            objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), v106);
            v107 = (__CFString *)objc_claimAutoreleasedReturnValue();
          }
        }
        else
        {
          v107 = CFSTR("ELEVATION_MODEL_EGM96");
        }
        objc_msgSend(v103, "addObject:", v107);

        ++v105;
        v104 = (_QWORD *)(a1 + 96);
      }
      while (v105 < *(_QWORD *)(a1 + 104));
    }
    if (a2)
      v108 = CFSTR("supportedElevationModel");
    else
      v108 = CFSTR("supported_elevation_model");
    v4 = v127;
    objc_msgSend(v127, "setObject:forKey:", v103, v108);

  }
  objc_msgSend((id)a1, "abClientMetadata");
  v109 = (void *)objc_claimAutoreleasedReturnValue();
  v110 = v109;
  if (v109)
  {
    if ((a2 & 1) != 0)
    {
      objc_msgSend(v109, "jsonRepresentation");
      v111 = (void *)objc_claimAutoreleasedReturnValue();
      v112 = CFSTR("abClientMetadata");
    }
    else
    {
      objc_msgSend(v109, "dictionaryRepresentation");
      v111 = (void *)objc_claimAutoreleasedReturnValue();
      v112 = CFSTR("ab_client_metadata");
    }
    v113 = v111;

    objc_msgSend(v4, "setObject:forKey:", v113, v112);
  }

  objc_msgSend((id)a1, "abBranchInfo");
  v114 = (void *)objc_claimAutoreleasedReturnValue();
  v115 = v114;
  if (v114)
  {
    if ((a2 & 1) != 0)
    {
      objc_msgSend(v114, "jsonRepresentation");
      v116 = (void *)objc_claimAutoreleasedReturnValue();
      v117 = CFSTR("abBranchInfo");
    }
    else
    {
      objc_msgSend(v114, "dictionaryRepresentation");
      v116 = (void *)objc_claimAutoreleasedReturnValue();
      v117 = CFSTR("ab_branch_info");
    }
    v118 = v116;

    objc_msgSend(v4, "setObject:forKey:", v118, v117);
  }

  v119 = *(void **)(a1 + 16);
  if (v119)
  {
    objc_msgSend(v119, "dictionaryRepresentation");
    v120 = (void *)objc_claimAutoreleasedReturnValue();
    v121 = v120;
    if (a2)
    {
      objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", objc_msgSend(v120, "count"));
      v122 = (void *)objc_claimAutoreleasedReturnValue();
      v128[0] = MEMORY[0x1E0C809B0];
      v128[1] = 3221225472;
      v128[2] = __49__GEOPDClientMetadata__dictionaryRepresentation___block_invoke;
      v128[3] = &unk_1E1C00600;
      v123 = v122;
      v129 = v123;
      objc_msgSend(v121, "enumerateKeysAndObjectsUsingBlock:", v128);
      v124 = v123;

      v121 = v124;
    }
    objc_msgSend(v4, "setObject:forKey:", v121, CFSTR("Unknown Fields"));

  }
  v125 = v4;

  return v125;
}

- (id)jsonRepresentation
{
  return -[GEOPDClientMetadata _dictionaryRepresentation:]((uint64_t)self, 1);
}

void __49__GEOPDClientMetadata__dictionaryRepresentation___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  char isKindOfClass;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v10 = a2;
  v5 = a3;
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();
  v7 = *(void **)(a1 + 32);
  if ((isKindOfClass & 1) != 0)
  {
    objc_msgSend(v5, "base64EncodedStringWithOptions:", 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "description");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setObject:forKey:", v8, v9);

  }
  else
  {
    objc_msgSend(v10, "description");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setObject:forKey:", v5, v8);
  }

}

- (GEOPDClientMetadata)initWithDictionary:(id)a3
{
  return (GEOPDClientMetadata *)-[GEOPDClientMetadata _initWithDictionary:isJSON:](self, a3, 0);
}

- (id)_initWithDictionary:(int)a3 isJSON:
{
  id v5;
  id v6;
  const __CFString *v7;
  void *v8;
  void *v9;
  const __CFString *v10;
  void *v11;
  void *v12;
  const __CFString *v13;
  void *v14;
  void *v15;
  const __CFString *v16;
  void *v17;
  void *v18;
  const __CFString *v19;
  void *v20;
  const __CFString *v21;
  void *v22;
  GEOAdditionalEnabledMarkets *v23;
  uint64_t v24;
  void *v25;
  const __CFString *v26;
  void *v27;
  id v28;
  uint64_t v29;
  const __CFString *v30;
  void *v31;
  const __CFString *v32;
  void *v33;
  const __CFString *v34;
  void *v35;
  GEOLocation *v36;
  uint64_t v37;
  void *v38;
  const __CFString *v39;
  void *v40;
  id v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t i;
  uint64_t v46;
  GEOLocation *v47;
  uint64_t v48;
  void *v49;
  const __CFString *v50;
  void *v51;
  id v52;
  uint64_t v53;
  const __CFString *v54;
  void *v55;
  void *v56;
  const __CFString *v57;
  void *v58;
  id v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t j;
  void *v64;
  id v65;
  uint64_t v66;
  const __CFString *v67;
  void *v68;
  const __CFString *v69;
  void *v70;
  id v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t v74;
  uint64_t k;
  void *v76;
  id v77;
  uint64_t v78;
  const __CFString *v79;
  void *v80;
  id v81;
  uint64_t v82;
  uint64_t v83;
  uint64_t v84;
  uint64_t m;
  void *v86;
  void *v87;
  const __CFString *v88;
  void *v89;
  id v90;
  uint64_t v91;
  const __CFString *v92;
  void *v93;
  GEOLocalizationCapabilities *v94;
  uint64_t v95;
  void *v96;
  const __CFString *v97;
  void *v98;
  void *v99;
  const __CFString *v100;
  void *v101;
  const __CFString *v102;
  void *v103;
  id v104;
  uint64_t v105;
  uint64_t v106;
  uint64_t v107;
  uint64_t n;
  void *v109;
  id v110;
  uint64_t v111;
  const __CFString *v112;
  void *v113;
  GEOPDMapsSuggestionsTouristInfo *v114;
  id v115;
  const __CFString *v116;
  void *v117;
  double v118;
  const __CFString *v119;
  void *v120;
  id v121;
  uint64_t v122;
  uint64_t v123;
  uint64_t v124;
  uint64_t ii;
  void *v126;
  id v127;
  uint64_t v128;
  const __CFString *v129;
  void *v130;
  void *v131;
  const __CFString *v132;
  void *v133;
  void *v134;
  const __CFString *v135;
  void *v136;
  const __CFString *v137;
  void *v138;
  id v139;
  uint64_t v140;
  const __CFString *v141;
  void *v142;
  id v143;
  uint64_t v144;
  uint64_t v145;
  uint64_t v146;
  uint64_t jj;
  void *v148;
  id v149;
  uint64_t v150;
  const __CFString *v151;
  void *v152;
  GEOABSecondPartyPlaceRequestClientMetaData *v153;
  uint64_t v154;
  void *v155;
  const __CFString *v156;
  void *v157;
  GEOABBranchInfo *v158;
  uint64_t v159;
  void *v160;
  void *v162;
  void *v163;
  void *v164;
  void *v165;
  void *v166;
  id v167;
  int v168;
  __int128 v169;
  __int128 v170;
  __int128 v171;
  __int128 v172;
  __int128 v173;
  __int128 v174;
  __int128 v175;
  __int128 v176;
  __int128 v177;
  __int128 v178;
  __int128 v179;
  __int128 v180;
  __int128 v181;
  __int128 v182;
  __int128 v183;
  __int128 v184;
  __int128 v185;
  __int128 v186;
  __int128 v187;
  __int128 v188;
  __int128 v189;
  __int128 v190;
  __int128 v191;
  __int128 v192;
  __int128 v193;
  __int128 v194;
  __int128 v195;
  __int128 v196;
  _BYTE v197[128];
  _BYTE v198[128];
  _BYTE v199[128];
  _BYTE v200[128];
  _BYTE v201[128];
  _BYTE v202[128];
  _BYTE v203[128];
  uint64_t v204;

  v204 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  if (!a1)
    goto LABEL_431;
  v6 = (id)objc_msgSend(a1, "init");

  if (!v6)
  {
    a1 = 0;
    goto LABEL_431;
  }
  if (a3)
    v7 = CFSTR("deviceCountryCode");
  else
    v7 = CFSTR("device_country_code");
  objc_msgSend(v5, "objectForKeyedSubscript:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v9 = (void *)objc_msgSend(v8, "copy");
    objc_msgSend(v6, "setDeviceCountryCode:", v9);

  }
  if (a3)
    v10 = CFSTR("deviceDisplayLanguage");
  else
    v10 = CFSTR("device_display_language");
  objc_msgSend(v5, "objectForKeyedSubscript:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v12 = (void *)objc_msgSend(v11, "copy");
    objc_msgSend(v6, "setDeviceDisplayLanguage:", v12);

  }
  if (a3)
    v13 = CFSTR("deviceKeyboardLanguage");
  else
    v13 = CFSTR("device_keyboard_language");
  objc_msgSend(v5, "objectForKeyedSubscript:", v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v15 = (void *)objc_msgSend(v14, "copy");
    objc_msgSend(v6, "setDeviceKeyboardLanguage:", v15);

  }
  if (a3)
    v16 = CFSTR("deviceSpokenLanguage");
  else
    v16 = CFSTR("device_spoken_language");
  objc_msgSend(v5, "objectForKeyedSubscript:", v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v18 = (void *)objc_msgSend(v17, "copy");
    objc_msgSend(v6, "setDeviceSpokenLanguage:", v18);

  }
  if (a3)
    v19 = CFSTR("timeSinceMapEnteredForeground");
  else
    v19 = CFSTR("time_since_map_entered_foreground");
  objc_msgSend(v5, "objectForKeyedSubscript:", v19);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    objc_msgSend(v6, "setTimeSinceMapEnteredForeground:", objc_msgSend(v20, "unsignedIntValue"));

  if (a3)
    v21 = CFSTR("additionalEnabledMarkets");
  else
    v21 = CFSTR("additional_enabled_markets");
  objc_msgSend(v5, "objectForKeyedSubscript:", v21);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v23 = [GEOAdditionalEnabledMarkets alloc];
    if ((a3 & 1) != 0)
      v24 = -[GEOAdditionalEnabledMarkets initWithJSON:](v23, "initWithJSON:", v22);
    else
      v24 = -[GEOAdditionalEnabledMarkets initWithDictionary:](v23, "initWithDictionary:", v22);
    v25 = (void *)v24;
    objc_msgSend(v6, "setAdditionalEnabledMarkets:", v24);

  }
  if (a3)
    v26 = CFSTR("resultListAttributionSupport");
  else
    v26 = CFSTR("result_list_attribution_support");
  objc_msgSend(v5, "objectForKeyedSubscript:", v26);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v28 = v27;
    if ((objc_msgSend(v28, "isEqualToString:", CFSTR("SINGLE_ATTRIBUTION")) & 1) != 0)
      v29 = 0;
    else
      v29 = objc_msgSend(v28, "isEqualToString:", CFSTR("MULTIPLE_ATTRIBUTIONS"));

  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
      goto LABEL_48;
    v29 = objc_msgSend(v27, "intValue");
  }
  objc_msgSend(v6, "setResultListAttributionSupport:", v29);
LABEL_48:

  if (a3)
    v30 = CFSTR("hourOfDay");
  else
    v30 = CFSTR("hour_of_day");
  objc_msgSend(v5, "objectForKeyedSubscript:", v30);
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    objc_msgSend(v6, "setHourOfDay:", objc_msgSend(v31, "unsignedIntValue"));

  if (a3)
    v32 = CFSTR("dayOfWeek");
  else
    v32 = CFSTR("day_of_week");
  objc_msgSend(v5, "objectForKeyedSubscript:", v32);
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    objc_msgSend(v6, "setDayOfWeek:", objc_msgSend(v33, "unsignedIntValue"));

  if (a3)
    v34 = CFSTR("deviceExtendedLocation");
  else
    v34 = CFSTR("device_extended_location");
  objc_msgSend(v5, "objectForKeyedSubscript:", v34);
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v36 = [GEOLocation alloc];
    if ((a3 & 1) != 0)
      v37 = -[GEOLocation initWithJSON:](v36, "initWithJSON:", v35);
    else
      v37 = -[GEOLocation initWithDictionary:](v36, "initWithDictionary:", v35);
    v38 = (void *)v37;
    objc_msgSend(v6, "setDeviceExtendedLocation:", v37);

  }
  if (a3)
    v39 = CFSTR("deviceHistoricalLocation");
  else
    v39 = CFSTR("device_historical_location");
  objc_msgSend(v5, "objectForKeyedSubscript:", v39);
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  v167 = v5;
  v168 = a3;
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v195 = 0u;
    v196 = 0u;
    v193 = 0u;
    v194 = 0u;
    v41 = v40;
    v42 = objc_msgSend(v41, "countByEnumeratingWithState:objects:count:", &v193, v203, 16);
    if (v42)
    {
      v43 = v42;
      v44 = *(_QWORD *)v194;
      do
      {
        for (i = 0; i != v43; ++i)
        {
          if (*(_QWORD *)v194 != v44)
            objc_enumerationMutation(v41);
          v46 = *(_QWORD *)(*((_QWORD *)&v193 + 1) + 8 * i);
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            v47 = [GEOLocation alloc];
            if ((a3 & 1) != 0)
              v48 = -[GEOLocation initWithJSON:](v47, "initWithJSON:", v46);
            else
              v48 = -[GEOLocation initWithDictionary:](v47, "initWithDictionary:", v46);
            v49 = (void *)v48;
            objc_msgSend(v6, "addDeviceHistoricalLocation:", v48);

          }
        }
        v43 = objc_msgSend(v41, "countByEnumeratingWithState:objects:count:", &v193, v203, 16);
      }
      while (v43);
    }

    v5 = v167;
  }

  if (a3)
    v50 = CFSTR("requiredVersion");
  else
    v50 = CFSTR("required_version");
  objc_msgSend(v5, "objectForKeyedSubscript:", v50);
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v52 = v51;
    if ((objc_msgSend(v52, "isEqualToString:", CFSTR("VERSION_1")) & 1) != 0)
    {
      v53 = 1;
    }
    else if ((objc_msgSend(v52, "isEqualToString:", CFSTR("VERSION_2")) & 1) != 0)
    {
      v53 = 2;
    }
    else if (objc_msgSend(v52, "isEqualToString:", CFSTR("VERSION_3")))
    {
      v53 = 3;
    }
    else
    {
      v53 = 1;
    }

  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
      goto LABEL_98;
    v53 = objc_msgSend(v51, "intValue");
  }
  objc_msgSend(v6, "setRequiredVersion:", v53);
LABEL_98:

  if (a3)
    v54 = CFSTR("debugApiKey");
  else
    v54 = CFSTR("debug_api_key");
  objc_msgSend(v5, "objectForKeyedSubscript:", v54);
  v55 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v56 = (void *)objc_msgSend(v55, "copy");
    objc_msgSend(v6, "setDebugApiKey:", v56);

  }
  if (a3)
    v57 = CFSTR("knownClientResolvedTypeDeprecated");
  else
    v57 = CFSTR("known_client_resolved_type_deprecated");
  objc_msgSend(v5, "objectForKeyedSubscript:", v57);
  v58 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v191 = 0u;
    v192 = 0u;
    v189 = 0u;
    v190 = 0u;
    v162 = v58;
    v59 = v58;
    v60 = objc_msgSend(v59, "countByEnumeratingWithState:objects:count:", &v189, v202, 16);
    if (!v60)
      goto LABEL_134;
    v61 = v60;
    v62 = *(_QWORD *)v190;
    while (1)
    {
      for (j = 0; j != v61; ++j)
      {
        if (*(_QWORD *)v190 != v62)
          objc_enumerationMutation(v59);
        v64 = *(void **)(*((_QWORD *)&v189 + 1) + 8 * j);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v65 = v64;
          if ((objc_msgSend(v65, "isEqualToString:", CFSTR("RESOLVED_ITEM_TYPE_UNKNOWN")) & 1) != 0)
          {
            v66 = 0;
          }
          else if ((objc_msgSend(v65, "isEqualToString:", CFSTR("RESOLVED_ITEM_TYPE_HOME")) & 1) != 0)
          {
            v66 = 1;
          }
          else if ((objc_msgSend(v65, "isEqualToString:", CFSTR("RESOLVED_ITEM_TYPE_WORK")) & 1) != 0)
          {
            v66 = 2;
          }
          else if ((objc_msgSend(v65, "isEqualToString:", CFSTR("RESOLVED_ITEM_TYPE_PARKED_CAR")) & 1) != 0)
          {
            v66 = 3;
          }
          else if ((objc_msgSend(v65, "isEqualToString:", CFSTR("RESOLVED_ITEM_TYPE_CURRENT_LOCATION")) & 1) != 0)
          {
            v66 = 4;
          }
          else if ((objc_msgSend(v65, "isEqualToString:", CFSTR("RESOLVED_ITEM_TYPE_SERVER")) & 1) != 0)
          {
            v66 = 5;
          }
          else if (objc_msgSend(v65, "isEqualToString:", CFSTR("RESOLVED_ITEM_TYPE_SCHOOL")))
          {
            v66 = 6;
          }
          else
          {
            v66 = 0;
          }

        }
        else
        {
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) == 0)
            continue;
          v66 = objc_msgSend(v64, "intValue");
        }
        objc_msgSend(v6, "addKnownClientResolvedTypeDeprecated:", v66);
      }
      v61 = objc_msgSend(v59, "countByEnumeratingWithState:objects:count:", &v189, v202, 16);
      if (!v61)
      {
LABEL_134:

        v58 = v162;
        v5 = v167;
        a3 = v168;
        break;
      }
    }
  }

  if (a3)
    v67 = CFSTR("enablePreflightVenues");
  else
    v67 = CFSTR("enable_preflight_venues");
  objc_msgSend(v5, "objectForKeyedSubscript:", v67);
  v68 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    objc_msgSend(v6, "setEnablePreflightVenues:", objc_msgSend(v68, "BOOLValue"));

  if (a3)
    v69 = CFSTR("knownClientResolvedType");
  else
    v69 = CFSTR("known_client_resolved_type");
  objc_msgSend(v5, "objectForKeyedSubscript:", v69);
  v70 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v187 = 0u;
    v188 = 0u;
    v185 = 0u;
    v186 = 0u;
    v163 = v70;
    v71 = v70;
    v72 = objc_msgSend(v71, "countByEnumeratingWithState:objects:count:", &v185, v201, 16);
    if (!v72)
      goto LABEL_171;
    v73 = v72;
    v74 = *(_QWORD *)v186;
    while (1)
    {
      for (k = 0; k != v73; ++k)
      {
        if (*(_QWORD *)v186 != v74)
          objc_enumerationMutation(v71);
        v76 = *(void **)(*((_QWORD *)&v185 + 1) + 8 * k);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v77 = v76;
          if ((objc_msgSend(v77, "isEqualToString:", CFSTR("RESOLVED_ITEM_TYPE_UNKNOWN")) & 1) != 0)
          {
            v78 = 0;
          }
          else if ((objc_msgSend(v77, "isEqualToString:", CFSTR("RESOLVED_ITEM_TYPE_HOME")) & 1) != 0)
          {
            v78 = 1;
          }
          else if ((objc_msgSend(v77, "isEqualToString:", CFSTR("RESOLVED_ITEM_TYPE_WORK")) & 1) != 0)
          {
            v78 = 2;
          }
          else if ((objc_msgSend(v77, "isEqualToString:", CFSTR("RESOLVED_ITEM_TYPE_PARKED_CAR")) & 1) != 0)
          {
            v78 = 3;
          }
          else if ((objc_msgSend(v77, "isEqualToString:", CFSTR("RESOLVED_ITEM_TYPE_CURRENT_LOCATION")) & 1) != 0)
          {
            v78 = 4;
          }
          else if ((objc_msgSend(v77, "isEqualToString:", CFSTR("RESOLVED_ITEM_TYPE_SERVER")) & 1) != 0)
          {
            v78 = 5;
          }
          else if (objc_msgSend(v77, "isEqualToString:", CFSTR("RESOLVED_ITEM_TYPE_SCHOOL")))
          {
            v78 = 6;
          }
          else
          {
            v78 = 0;
          }

        }
        else
        {
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) == 0)
            continue;
          v78 = objc_msgSend(v76, "intValue");
        }
        objc_msgSend(v6, "addKnownClientResolvedType:", v78);
      }
      v73 = objc_msgSend(v71, "countByEnumeratingWithState:objects:count:", &v185, v201, 16);
      if (!v73)
      {
LABEL_171:

        v70 = v163;
        v5 = v167;
        a3 = v168;
        break;
      }
    }
  }

  if (a3)
    v79 = CFSTR("businessChatPreflightIdentifier");
  else
    v79 = CFSTR("business_chat_preflight_identifier");
  objc_msgSend(v5, "objectForKeyedSubscript:", v79);
  v80 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v183 = 0u;
    v184 = 0u;
    v181 = 0u;
    v182 = 0u;
    v81 = v80;
    v82 = objc_msgSend(v81, "countByEnumeratingWithState:objects:count:", &v181, v200, 16);
    if (v82)
    {
      v83 = v82;
      v84 = *(_QWORD *)v182;
      do
      {
        for (m = 0; m != v83; ++m)
        {
          if (*(_QWORD *)v182 != v84)
            objc_enumerationMutation(v81);
          v86 = *(void **)(*((_QWORD *)&v181 + 1) + 8 * m);
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            v87 = (void *)objc_msgSend(v86, "copy");
            objc_msgSend(v6, "addBusinessChatPreflightIdentifier:", v87);

          }
        }
        v83 = objc_msgSend(v81, "countByEnumeratingWithState:objects:count:", &v181, v200, 16);
      }
      while (v83);
    }

    v5 = v167;
    a3 = v168;
  }

  if (a3)
    v88 = CFSTR("clientRevision");
  else
    v88 = CFSTR("client_revision");
  objc_msgSend(v5, "objectForKeyedSubscript:", v88);
  v89 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v90 = v89;
    if ((objc_msgSend(v90, "isEqualToString:", CFSTR("CLIENT_REVISION_UNKNOWN")) & 1) != 0)
    {
      v91 = 0;
    }
    else if ((objc_msgSend(v90, "isEqualToString:", CFSTR("CLIENT_REVISION_CAN_HANDLE_PERMANENTLY_CLOSED")) & 1) != 0)
    {
      v91 = 1;
    }
    else if ((objc_msgSend(v90, "isEqualToString:", CFSTR("CLIENT_REVISION_CAN_HANDLE_BASEMAP_ID")) & 1) != 0)
    {
      v91 = 2;
    }
    else if ((objc_msgSend(v90, "isEqualToString:", CFSTR("CLIENT_REVISION_CAN_HANDLE_APPCLIPS")) & 1) != 0)
    {
      v91 = 3;
    }
    else if ((objc_msgSend(v90, "isEqualToString:", CFSTR("CLIENT_REVISION_CAN_HANDLE_APPLE_RATINGS_PHOTOS")) & 1) != 0)
    {
      v91 = 4;
    }
    else if ((objc_msgSend(v90, "isEqualToString:", CFSTR("CLIENT_REVISION_CAN_HANDLE_ENHANCED_PLACEMENTS")) & 1) != 0)
    {
      v91 = 5;
    }
    else if ((objc_msgSend(v90, "isEqualToString:", CFSTR("CLIENT_REVISION_CAN_HANDLE_ADDRESS_CLUSTER")) & 1) != 0)
    {
      v91 = 6;
    }
    else if ((objc_msgSend(v90, "isEqualToString:", CFSTR("CLIENT_REVISION_CAN_HANDLE_COARSE_LOCATION")) & 1) != 0)
    {
      v91 = 7;
    }
    else if ((objc_msgSend(v90, "isEqualToString:", CFSTR("CLIENT_REVISION_CAN_HANDLE_SIRI_TRAFFIC_INCIDENTS")) & 1) != 0)
    {
      v91 = 8;
    }
    else if ((objc_msgSend(v90, "isEqualToString:", CFSTR("CLIENT_REVISION_AZUL_RELEASE")) & 1) != 0)
    {
      v91 = 10;
    }
    else if ((objc_msgSend(v90, "isEqualToString:", CFSTR("CLIENT_REVISION_CAN_HANDLE_SMART_CARD_DYNAMIC_LAYOUT")) & 1) != 0)
    {
      v91 = 11;
    }
    else if ((objc_msgSend(v90, "isEqualToString:", CFSTR("CLIENT_REVISION_SKY_RELEASE")) & 1) != 0)
    {
      v91 = 20;
    }
    else
    {
      if ((objc_msgSend(v90, "isEqualToString:", CFSTR("CLIENT_REVISION_CAN_HANDLE_UNIFIED_ACTION_ROW")) & 1) != 0)
      {
        v91 = 29;
      }
      else if ((objc_msgSend(v90, "isEqualToString:", CFSTR("CLIENT_REVISION_SYDNEY_RELEASE")) & 1) != 0)
      {
        v91 = 30;
      }
      else if ((objc_msgSend(v90, "isEqualToString:", CFSTR("CLIENT_REVISION_CAN_HANDLE_YELP_PHOTO_COMMINGLE")) & 1) != 0)
      {
        v91 = 31;
      }
      else if ((objc_msgSend(v90, "isEqualToString:", CFSTR("CLIENT_REVISION_CAN_HANDLE_HIKING_DATA")) & 1) != 0)
      {
        v91 = 32;
      }
      else if ((objc_msgSend(v90, "isEqualToString:", CFSTR("CLIENT_REVISION_CAN_HANDLE_REALTIME_EV_CHARGING")) & 1) != 0)
      {
        v91 = 33;
      }
      else if ((objc_msgSend(v90, "isEqualToString:", CFSTR("CLIENT_REVISION_CAN_HANDLE_OFFLINE_DATA")) & 1) != 0)
      {
        v91 = 34;
      }
      else if ((objc_msgSend(v90, "isEqualToString:", CFSTR("CLIENT_REVISION_CAN_HANDLE_INTERLEAVED_GUIDES_IN_SEARCH_RESULTS")) & 1) != 0)
      {
        v91 = 35;
      }
      else if ((objc_msgSend(v90, "isEqualToString:", CFSTR("CLIENT_REVISION_CAN_HANDLE_SAVE_BUTTON")) & 1) != 0)
      {
        v91 = 36;
      }
      else if ((objc_msgSend(v90, "isEqualToString:", CFSTR("CLIENT_REVISION_CAN_HANDLE_FLEXIBLE_ACTION_LINK")) & 1) != 0)
      {
        v91 = 37;
      }
      else if (objc_msgSend(v90, "isEqualToString:", CFSTR("CLIENT_REVISION_CAN_HANDLE_HIKE_ROUTE")))
      {
        v91 = 38;
      }
      else
      {
        v91 = 0;
      }
      v5 = v167;
      a3 = v168;
    }

  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
      goto LABEL_240;
    v91 = objc_msgSend(v89, "intValue");
  }
  objc_msgSend(v6, "setClientRevision:", v91);
LABEL_240:

  if (a3)
    v92 = CFSTR("localizationCapabilities");
  else
    v92 = CFSTR("localization_capabilities");
  objc_msgSend(v5, "objectForKeyedSubscript:", v92);
  v93 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v94 = [GEOLocalizationCapabilities alloc];
    if ((a3 & 1) != 0)
      v95 = -[GEOLocalizationCapabilities initWithJSON:](v94, "initWithJSON:", v93);
    else
      v95 = -[GEOLocalizationCapabilities initWithDictionary:](v94, "initWithDictionary:", v93);
    v96 = (void *)v95;
    objc_msgSend(v6, "setLocalizationCapabilities:", v95);

  }
  if (a3)
    v97 = CFSTR("deviceSku");
  else
    v97 = CFSTR("device_sku");
  objc_msgSend(v5, "objectForKeyedSubscript:", v97);
  v98 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v99 = (void *)objc_msgSend(v98, "copy");
    objc_msgSend(v6, "setDeviceSku:", v99);

  }
  if (a3)
    v100 = CFSTR("siriUserConsentsForAnalysis");
  else
    v100 = CFSTR("siri_user_consents_for_analysis");
  objc_msgSend(v5, "objectForKeyedSubscript:", v100);
  v101 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    objc_msgSend(v6, "setSiriUserConsentsForAnalysis:", objc_msgSend(v101, "BOOLValue"));

  if (a3)
    v102 = CFSTR("supportedMapsResultType");
  else
    v102 = CFSTR("supported_maps_result_type");
  objc_msgSend(v5, "objectForKeyedSubscript:", v102);
  v103 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v179 = 0u;
    v180 = 0u;
    v177 = 0u;
    v178 = 0u;
    v164 = v103;
    v104 = v103;
    v105 = objc_msgSend(v104, "countByEnumeratingWithState:objects:count:", &v177, v199, 16);
    if (!v105)
      goto LABEL_287;
    v106 = v105;
    v107 = *(_QWORD *)v178;
    while (1)
    {
      for (n = 0; n != v106; ++n)
      {
        if (*(_QWORD *)v178 != v107)
          objc_enumerationMutation(v104);
        v109 = *(void **)(*((_QWORD *)&v177 + 1) + 8 * n);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v110 = v109;
          if ((objc_msgSend(v110, "isEqualToString:", CFSTR("MAPS_RESULT_TYPE_UNKNOWN")) & 1) != 0)
          {
            v111 = 0;
          }
          else if ((objc_msgSend(v110, "isEqualToString:", CFSTR("MAPS_RESULT_TYPE_PLACE")) & 1) != 0)
          {
            v111 = 1;
          }
          else if ((objc_msgSend(v110, "isEqualToString:", CFSTR("MAPS_RESULT_TYPE_COLLECTION")) & 1) != 0)
          {
            v111 = 2;
          }
          else if ((objc_msgSend(v110, "isEqualToString:", CFSTR("MAPS_RESULT_TYPE_PUBLISHER")) & 1) != 0)
          {
            v111 = 3;
          }
          else if ((objc_msgSend(v110, "isEqualToString:", CFSTR("MAPS_RESULT_TYPE_PLACE_QUESTIONNAIRE")) & 1) != 0)
          {
            v111 = 4;
          }
          else if (objc_msgSend(v110, "isEqualToString:", CFSTR("MAPS_RESULT_TYPE_BATCH_REVERSE_GEOCODE")))
          {
            v111 = 5;
          }
          else
          {
            v111 = 0;
          }

        }
        else
        {
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) == 0)
            continue;
          v111 = objc_msgSend(v109, "intValue");
        }
        objc_msgSend(v6, "addSupportedMapsResultType:", v111);
      }
      v106 = objc_msgSend(v104, "countByEnumeratingWithState:objects:count:", &v177, v199, 16);
      if (!v106)
      {
LABEL_287:

        v103 = v164;
        v5 = v167;
        a3 = v168;
        break;
      }
    }
  }

  if (a3)
    v112 = CFSTR("mapsSuggestionsTouristInfo");
  else
    v112 = CFSTR("maps_suggestions_tourist_info");
  objc_msgSend(v5, "objectForKeyedSubscript:", v112);
  v113 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v114 = [GEOPDMapsSuggestionsTouristInfo alloc];
    if (v114)
    {
      v115 = v113;
      v114 = -[GEOPDMapsSuggestionsTouristInfo init](v114, "init");
      if (v114)
      {
        if (a3)
          v116 = CFSTR("isTourist");
        else
          v116 = CFSTR("is_tourist");
        objc_msgSend(v115, "objectForKeyedSubscript:", v116);
        v117 = (void *)objc_claimAutoreleasedReturnValue();
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          objc_msgSend(v117, "doubleValue");
          *(_BYTE *)&v114->_flags |= 1u;
          v114->_isTourist = v118;
        }

      }
    }
    objc_msgSend(v6, "setMapsSuggestionsTouristInfo:", v114);

  }
  if (a3)
    v119 = CFSTR("clientRevisions");
  else
    v119 = CFSTR("client_revisions");
  objc_msgSend(v5, "objectForKeyedSubscript:", v119);
  v120 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v175 = 0u;
    v176 = 0u;
    v173 = 0u;
    v174 = 0u;
    v165 = v120;
    v121 = v120;
    v122 = objc_msgSend(v121, "countByEnumeratingWithState:objects:count:", &v173, v198, 16);
    if (!v122)
      goto LABEL_363;
    v123 = v122;
    v124 = *(_QWORD *)v174;
    while (1)
    {
      for (ii = 0; ii != v123; ++ii)
      {
        if (*(_QWORD *)v174 != v124)
          objc_enumerationMutation(v121);
        v126 = *(void **)(*((_QWORD *)&v173 + 1) + 8 * ii);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v127 = v126;
          if ((objc_msgSend(v127, "isEqualToString:", CFSTR("CLIENT_REVISION_UNKNOWN")) & 1) != 0)
          {
            v128 = 0;
          }
          else if ((objc_msgSend(v127, "isEqualToString:", CFSTR("CLIENT_REVISION_CAN_HANDLE_PERMANENTLY_CLOSED")) & 1) != 0)
          {
            v128 = 1;
          }
          else if ((objc_msgSend(v127, "isEqualToString:", CFSTR("CLIENT_REVISION_CAN_HANDLE_BASEMAP_ID")) & 1) != 0)
          {
            v128 = 2;
          }
          else if ((objc_msgSend(v127, "isEqualToString:", CFSTR("CLIENT_REVISION_CAN_HANDLE_APPCLIPS")) & 1) != 0)
          {
            v128 = 3;
          }
          else if ((objc_msgSend(v127, "isEqualToString:", CFSTR("CLIENT_REVISION_CAN_HANDLE_APPLE_RATINGS_PHOTOS")) & 1) != 0)
          {
            v128 = 4;
          }
          else if ((objc_msgSend(v127, "isEqualToString:", CFSTR("CLIENT_REVISION_CAN_HANDLE_ENHANCED_PLACEMENTS")) & 1) != 0)
          {
            v128 = 5;
          }
          else if ((objc_msgSend(v127, "isEqualToString:", CFSTR("CLIENT_REVISION_CAN_HANDLE_ADDRESS_CLUSTER")) & 1) != 0)
          {
            v128 = 6;
          }
          else if ((objc_msgSend(v127, "isEqualToString:", CFSTR("CLIENT_REVISION_CAN_HANDLE_COARSE_LOCATION")) & 1) != 0)
          {
            v128 = 7;
          }
          else if ((objc_msgSend(v127, "isEqualToString:", CFSTR("CLIENT_REVISION_CAN_HANDLE_SIRI_TRAFFIC_INCIDENTS")) & 1) != 0)
          {
            v128 = 8;
          }
          else if ((objc_msgSend(v127, "isEqualToString:", CFSTR("CLIENT_REVISION_AZUL_RELEASE")) & 1) != 0)
          {
            v128 = 10;
          }
          else if ((objc_msgSend(v127, "isEqualToString:", CFSTR("CLIENT_REVISION_CAN_HANDLE_SMART_CARD_DYNAMIC_LAYOUT")) & 1) != 0)
          {
            v128 = 11;
          }
          else if ((objc_msgSend(v127, "isEqualToString:", CFSTR("CLIENT_REVISION_SKY_RELEASE")) & 1) != 0)
          {
            v128 = 20;
          }
          else if ((objc_msgSend(v127, "isEqualToString:", CFSTR("CLIENT_REVISION_CAN_HANDLE_UNIFIED_ACTION_ROW")) & 1) != 0)
          {
            v128 = 29;
          }
          else if ((objc_msgSend(v127, "isEqualToString:", CFSTR("CLIENT_REVISION_SYDNEY_RELEASE")) & 1) != 0)
          {
            v128 = 30;
          }
          else if ((objc_msgSend(v127, "isEqualToString:", CFSTR("CLIENT_REVISION_CAN_HANDLE_YELP_PHOTO_COMMINGLE")) & 1) != 0)
          {
            v128 = 31;
          }
          else if ((objc_msgSend(v127, "isEqualToString:", CFSTR("CLIENT_REVISION_CAN_HANDLE_HIKING_DATA")) & 1) != 0)
          {
            v128 = 32;
          }
          else if ((objc_msgSend(v127, "isEqualToString:", CFSTR("CLIENT_REVISION_CAN_HANDLE_REALTIME_EV_CHARGING")) & 1) != 0)
          {
            v128 = 33;
          }
          else if ((objc_msgSend(v127, "isEqualToString:", CFSTR("CLIENT_REVISION_CAN_HANDLE_OFFLINE_DATA")) & 1) != 0)
          {
            v128 = 34;
          }
          else if ((objc_msgSend(v127, "isEqualToString:", CFSTR("CLIENT_REVISION_CAN_HANDLE_INTERLEAVED_GUIDES_IN_SEARCH_RESULTS")) & 1) != 0)
          {
            v128 = 35;
          }
          else if ((objc_msgSend(v127, "isEqualToString:", CFSTR("CLIENT_REVISION_CAN_HANDLE_SAVE_BUTTON")) & 1) != 0)
          {
            v128 = 36;
          }
          else if ((objc_msgSend(v127, "isEqualToString:", CFSTR("CLIENT_REVISION_CAN_HANDLE_FLEXIBLE_ACTION_LINK")) & 1) != 0)
          {
            v128 = 37;
          }
          else if (objc_msgSend(v127, "isEqualToString:", CFSTR("CLIENT_REVISION_CAN_HANDLE_HIKE_ROUTE")))
          {
            v128 = 38;
          }
          else
          {
            v128 = 0;
          }

        }
        else
        {
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) == 0)
            continue;
          v128 = objc_msgSend(v126, "intValue");
        }
        objc_msgSend(v6, "addClientRevisions:", v128);
      }
      v123 = objc_msgSend(v121, "countByEnumeratingWithState:objects:count:", &v173, v198, 16);
      if (!v123)
      {
LABEL_363:

        v120 = v165;
        v5 = v167;
        a3 = v168;
        break;
      }
    }
  }

  if (a3)
    v129 = CFSTR("preferredDisplayCurrencySymbol");
  else
    v129 = CFSTR("preferred_display_currency_symbol");
  objc_msgSend(v5, "objectForKeyedSubscript:", v129);
  v130 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v131 = (void *)objc_msgSend(v130, "copy");
    objc_msgSend(v6, "setPreferredDisplayCurrencySymbol:", v131);

  }
  if (a3)
    v132 = CFSTR("displayRegion");
  else
    v132 = CFSTR("display_region");
  objc_msgSend(v5, "objectForKeyedSubscript:", v132);
  v133 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v134 = (void *)objc_msgSend(v133, "copy");
    objc_msgSend(v6, "setDisplayRegion:", v134);

  }
  if (a3)
    v135 = CFSTR("supportEnrichment");
  else
    v135 = CFSTR("support_enrichment");
  objc_msgSend(v5, "objectForKeyedSubscript:", v135);
  v136 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    objc_msgSend(v6, "setSupportEnrichment:", objc_msgSend(v136, "BOOLValue"));

  if (a3)
    v137 = CFSTR("preferredDistanceUnit");
  else
    v137 = CFSTR("preferred_distance_unit");
  objc_msgSend(v5, "objectForKeyedSubscript:", v137);
  v138 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v139 = v138;
    if ((objc_msgSend(v139, "isEqualToString:", CFSTR("PREFERRED_DISTANCE_UNIT_UNKNOWN")) & 1) != 0)
    {
      v140 = 0;
    }
    else if ((objc_msgSend(v139, "isEqualToString:", CFSTR("PREFERRED_DISTANCE_UNIT_METRIC")) & 1) != 0)
    {
      v140 = 1;
    }
    else if (objc_msgSend(v139, "isEqualToString:", CFSTR("PREFERRED_DISTANCE_UNIT_IMPERIAL")))
    {
      v140 = 2;
    }
    else
    {
      v140 = 0;
    }

    goto LABEL_393;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v140 = objc_msgSend(v138, "intValue");
LABEL_393:
    objc_msgSend(v6, "setPreferredDistanceUnit:", v140);
  }

  if (a3)
    v141 = CFSTR("supportedElevationModel");
  else
    v141 = CFSTR("supported_elevation_model");
  objc_msgSend(v5, "objectForKeyedSubscript:", v141);
  v142 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v171 = 0u;
    v172 = 0u;
    v169 = 0u;
    v170 = 0u;
    v166 = v142;
    v143 = v142;
    v144 = objc_msgSend(v143, "countByEnumeratingWithState:objects:count:", &v169, v197, 16);
    if (!v144)
      goto LABEL_413;
    v145 = v144;
    v146 = *(_QWORD *)v170;
    while (1)
    {
      for (jj = 0; jj != v145; ++jj)
      {
        if (*(_QWORD *)v170 != v146)
          objc_enumerationMutation(v143);
        v148 = *(void **)(*((_QWORD *)&v169 + 1) + 8 * jj);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v149 = v148;
          if ((objc_msgSend(v149, "isEqualToString:", CFSTR("ELEVATION_MODEL_EGM96")) & 1) != 0)
            v150 = 0;
          else
            v150 = objc_msgSend(v149, "isEqualToString:", CFSTR("ELEVATION_MODEL_WGS84"));

        }
        else
        {
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) == 0)
            continue;
          v150 = objc_msgSend(v148, "intValue");
        }
        objc_msgSend(v6, "addSupportedElevationModel:", v150);
      }
      v145 = objc_msgSend(v143, "countByEnumeratingWithState:objects:count:", &v169, v197, 16);
      if (!v145)
      {
LABEL_413:

        v142 = v166;
        v5 = v167;
        a3 = v168;
        break;
      }
    }
  }

  if (a3)
    v151 = CFSTR("abClientMetadata");
  else
    v151 = CFSTR("ab_client_metadata");
  objc_msgSend(v5, "objectForKeyedSubscript:", v151);
  v152 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v153 = [GEOABSecondPartyPlaceRequestClientMetaData alloc];
    if ((a3 & 1) != 0)
      v154 = -[GEOABSecondPartyPlaceRequestClientMetaData initWithJSON:](v153, "initWithJSON:", v152);
    else
      v154 = -[GEOABSecondPartyPlaceRequestClientMetaData initWithDictionary:](v153, "initWithDictionary:", v152);
    v155 = (void *)v154;
    objc_msgSend(v6, "setAbClientMetadata:", v154);

  }
  if (a3)
    v156 = CFSTR("abBranchInfo");
  else
    v156 = CFSTR("ab_branch_info");
  objc_msgSend(v5, "objectForKeyedSubscript:", v156);
  v157 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v158 = [GEOABBranchInfo alloc];
    if ((a3 & 1) != 0)
      v159 = -[GEOABBranchInfo initWithJSON:](v158, "initWithJSON:", v157);
    else
      v159 = -[GEOABBranchInfo initWithDictionary:](v158, "initWithDictionary:", v157);
    v160 = (void *)v159;
    objc_msgSend(v6, "setAbBranchInfo:", v159);

  }
  a1 = v6;

LABEL_431:
  return a1;
}

- (GEOPDClientMetadata)initWithJSON:(id)a3
{
  return (GEOPDClientMetadata *)-[GEOPDClientMetadata _initWithDictionary:isJSON:](self, a3, 1);
}

+ (BOOL)isValid:(id)a3
{
  return GEOPDClientMetadataIsValid((char *)a3);
}

- (BOOL)readFrom:(id)a3
{
  return GEOPDClientMetadataReadAllFrom((uint64_t)self, a3, 0);
}

- (BOOL)hasGreenTeaWithValue:(BOOL)a3
{
  _BOOL8 v3;
  BOOL v5;
  NSMutableArray *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v3 = a3;
  v17 = *MEMORY[0x1E0C80C00];
  -[GEOPDClientMetadata _readDeviceExtendedLocation]((uint64_t)self);
  if (-[GEOLocation hasGreenTeaWithValue:](self->_deviceExtendedLocation, "hasGreenTeaWithValue:", v3))
    return 1;
  -[GEOPDClientMetadata _readDeviceHistoricalLocations]((uint64_t)self);
  v14 = 0u;
  v15 = 0u;
  v12 = 0u;
  v13 = 0u;
  v6 = self->_deviceHistoricalLocations;
  v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v13;
    while (2)
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v13 != v9)
          objc_enumerationMutation(v6);
        if ((objc_msgSend(*(id *)(*((_QWORD *)&v12 + 1) + 8 * i), "hasGreenTeaWithValue:", v3, (_QWORD)v12) & 1) != 0)
        {
          v5 = 1;
          goto LABEL_13;
        }
      }
      v8 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
      if (v8)
        continue;
      break;
    }
  }
  v5 = 0;
LABEL_13:

  return v5;
}

- (void)copyTo:(id)a3
{
  char *v4;
  $F32854447752F5D8BD00F9C7283039A2 flags;
  unint64_t v6;
  unint64_t v7;
  uint64_t i;
  void *v9;
  unint64_t v10;
  unint64_t v11;
  uint64_t j;
  unint64_t v13;
  unint64_t v14;
  uint64_t k;
  unint64_t v16;
  unint64_t v17;
  uint64_t m;
  void *v19;
  char *v20;
  unint64_t v21;
  unint64_t v22;
  uint64_t n;
  unint64_t v24;
  unint64_t v25;
  uint64_t ii;
  char *v27;
  $F32854447752F5D8BD00F9C7283039A2 v28;
  unint64_t v29;
  unint64_t v30;
  uint64_t jj;
  void *v32;
  char *v33;

  v33 = (char *)a3;
  -[GEOPDClientMetadata readAll:](self, "readAll:", 0);
  os_unfair_lock_lock_with_options();
  objc_storeStrong((id *)v33 + 1, self->_reader);
  *((_DWORD *)v33 + 68) = self->_readerMarkPos;
  *((_DWORD *)v33 + 69) = self->_readerMarkLength;
  os_unfair_lock_unlock(&self->_readerLock);
  if (self->_deviceCountryCode)
    objc_msgSend(v33, "setDeviceCountryCode:");
  if (self->_deviceDisplayLanguage)
    objc_msgSend(v33, "setDeviceDisplayLanguage:");
  v4 = v33;
  if (self->_deviceKeyboardLanguage)
  {
    objc_msgSend(v33, "setDeviceKeyboardLanguage:");
    v4 = v33;
  }
  if (self->_deviceSpokenLanguage)
  {
    objc_msgSend(v33, "setDeviceSpokenLanguage:");
    v4 = v33;
  }
  if ((*(_BYTE *)&self->_flags & 0x40) != 0)
  {
    *((_DWORD *)v4 + 77) = self->_timeSinceMapEnteredForeground;
    *(_QWORD *)(v4 + 316) |= 0x40uLL;
  }
  if (self->_additionalEnabledMarkets)
  {
    objc_msgSend(v33, "setAdditionalEnabledMarkets:");
    v4 = v33;
  }
  flags = self->_flags;
  if ((*(_BYTE *)&flags & 0x20) != 0)
  {
    *((_DWORD *)v4 + 76) = self->_resultListAttributionSupport;
    *(_QWORD *)(v4 + 316) |= 0x20uLL;
    flags = self->_flags;
    if ((*(_BYTE *)&flags & 4) == 0)
    {
LABEL_15:
      if ((*(_BYTE *)&flags & 2) == 0)
        goto LABEL_17;
      goto LABEL_16;
    }
  }
  else if ((*(_BYTE *)&flags & 4) == 0)
  {
    goto LABEL_15;
  }
  *((_DWORD *)v4 + 73) = self->_hourOfDay;
  *(_QWORD *)(v4 + 316) |= 4uLL;
  if ((*(_QWORD *)&self->_flags & 2) != 0)
  {
LABEL_16:
    *((_DWORD *)v4 + 72) = self->_dayOfWeek;
    *(_QWORD *)(v4 + 316) |= 2uLL;
  }
LABEL_17:
  if (self->_deviceExtendedLocation)
    objc_msgSend(v33, "setDeviceExtendedLocation:");
  if (-[GEOPDClientMetadata deviceHistoricalLocationsCount](self, "deviceHistoricalLocationsCount"))
  {
    objc_msgSend(v33, "clearDeviceHistoricalLocations");
    v6 = -[GEOPDClientMetadata deviceHistoricalLocationsCount](self, "deviceHistoricalLocationsCount");
    if (v6)
    {
      v7 = v6;
      for (i = 0; i != v7; ++i)
      {
        -[GEOPDClientMetadata deviceHistoricalLocationAtIndex:](self, "deviceHistoricalLocationAtIndex:", i);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v33, "addDeviceHistoricalLocation:", v9);

      }
    }
  }
  if ((*(_BYTE *)&self->_flags & 0x10) != 0)
  {
    *((_DWORD *)v33 + 75) = self->_requiredVersion;
    *(_QWORD *)(v33 + 316) |= 0x10uLL;
  }
  if (self->_debugApiKey)
    objc_msgSend(v33, "setDebugApiKey:");
  if (-[GEOPDClientMetadata knownClientResolvedTypeDeprecatedsCount](self, "knownClientResolvedTypeDeprecatedsCount"))
  {
    objc_msgSend(v33, "clearKnownClientResolvedTypeDeprecateds");
    v10 = -[GEOPDClientMetadata knownClientResolvedTypeDeprecatedsCount](self, "knownClientResolvedTypeDeprecatedsCount");
    if (v10)
    {
      v11 = v10;
      for (j = 0; j != v11; ++j)
        objc_msgSend(v33, "addKnownClientResolvedTypeDeprecated:", -[GEOPDClientMetadata knownClientResolvedTypeDeprecatedAtIndex:](self, "knownClientResolvedTypeDeprecatedAtIndex:", j));
    }
  }
  if ((*(_BYTE *)&self->_flags & 0x80) != 0)
  {
    v33[312] = self->_enablePreflightVenues;
    *(_QWORD *)(v33 + 316) |= 0x80uLL;
  }
  if (-[GEOPDClientMetadata knownClientResolvedTypesCount](self, "knownClientResolvedTypesCount"))
  {
    objc_msgSend(v33, "clearKnownClientResolvedTypes");
    v13 = -[GEOPDClientMetadata knownClientResolvedTypesCount](self, "knownClientResolvedTypesCount");
    if (v13)
    {
      v14 = v13;
      for (k = 0; k != v14; ++k)
        objc_msgSend(v33, "addKnownClientResolvedType:", -[GEOPDClientMetadata knownClientResolvedTypeAtIndex:](self, "knownClientResolvedTypeAtIndex:", k));
    }
  }
  if (-[GEOPDClientMetadata businessChatPreflightIdentifiersCount](self, "businessChatPreflightIdentifiersCount"))
  {
    objc_msgSend(v33, "clearBusinessChatPreflightIdentifiers");
    v16 = -[GEOPDClientMetadata businessChatPreflightIdentifiersCount](self, "businessChatPreflightIdentifiersCount");
    if (v16)
    {
      v17 = v16;
      for (m = 0; m != v17; ++m)
      {
        -[GEOPDClientMetadata businessChatPreflightIdentifierAtIndex:](self, "businessChatPreflightIdentifierAtIndex:", m);
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v33, "addBusinessChatPreflightIdentifier:", v19);

      }
    }
  }
  v20 = v33;
  if ((*(_BYTE *)&self->_flags & 1) != 0)
  {
    *((_DWORD *)v33 + 71) = self->_clientRevision;
    *(_QWORD *)(v33 + 316) |= 1uLL;
  }
  if (self->_localizationCapabilities)
  {
    objc_msgSend(v33, "setLocalizationCapabilities:");
    v20 = v33;
  }
  if (self->_deviceSku)
  {
    objc_msgSend(v33, "setDeviceSku:");
    v20 = v33;
  }
  if ((*((_BYTE *)&self->_flags + 1) & 1) != 0)
  {
    v20[313] = self->_siriUserConsentsForAnalysis;
    *(_QWORD *)(v20 + 316) |= 0x100uLL;
  }
  if (-[GEOPDClientMetadata supportedMapsResultTypesCount](self, "supportedMapsResultTypesCount"))
  {
    objc_msgSend(v33, "clearSupportedMapsResultTypes");
    v21 = -[GEOPDClientMetadata supportedMapsResultTypesCount](self, "supportedMapsResultTypesCount");
    if (v21)
    {
      v22 = v21;
      for (n = 0; n != v22; ++n)
        objc_msgSend(v33, "addSupportedMapsResultType:", -[GEOPDClientMetadata supportedMapsResultTypeAtIndex:](self, "supportedMapsResultTypeAtIndex:", n));
    }
  }
  if (self->_mapsSuggestionsTouristInfo)
    objc_msgSend(v33, "setMapsSuggestionsTouristInfo:");
  if (-[GEOPDClientMetadata clientRevisionsCount](self, "clientRevisionsCount"))
  {
    objc_msgSend(v33, "clearClientRevisions");
    v24 = -[GEOPDClientMetadata clientRevisionsCount](self, "clientRevisionsCount");
    if (v24)
    {
      v25 = v24;
      for (ii = 0; ii != v25; ++ii)
        objc_msgSend(v33, "addClientRevisions:", -[GEOPDClientMetadata clientRevisionsAtIndex:](self, "clientRevisionsAtIndex:", ii));
    }
  }
  if (self->_preferredDisplayCurrencySymbol)
    objc_msgSend(v33, "setPreferredDisplayCurrencySymbol:");
  v27 = v33;
  if (self->_displayRegion)
  {
    objc_msgSend(v33, "setDisplayRegion:");
    v27 = v33;
  }
  v28 = self->_flags;
  if ((*(_WORD *)&v28 & 0x200) != 0)
  {
    v27[314] = self->_supportEnrichment;
    *(_QWORD *)(v27 + 316) |= 0x200uLL;
    v28 = self->_flags;
  }
  if ((*(_BYTE *)&v28 & 8) != 0)
  {
    *((_DWORD *)v27 + 74) = self->_preferredDistanceUnit;
    *(_QWORD *)(v27 + 316) |= 8uLL;
  }
  if (-[GEOPDClientMetadata supportedElevationModelsCount](self, "supportedElevationModelsCount"))
  {
    objc_msgSend(v33, "clearSupportedElevationModels");
    v29 = -[GEOPDClientMetadata supportedElevationModelsCount](self, "supportedElevationModelsCount");
    if (v29)
    {
      v30 = v29;
      for (jj = 0; jj != v30; ++jj)
        objc_msgSend(v33, "addSupportedElevationModel:", -[GEOPDClientMetadata supportedElevationModelAtIndex:](self, "supportedElevationModelAtIndex:", jj));
    }
  }
  if (self->_abClientMetadata)
    objc_msgSend(v33, "setAbClientMetadata:");
  v32 = v33;
  if (self->_abBranchInfo)
  {
    objc_msgSend(v33, "setAbBranchInfo:");
    v32 = v33;
  }

}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5;
  PBDataReader *reader;
  PBDataReader *v7;
  id v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  void *v16;
  id v17;
  void *v18;
  $F32854447752F5D8BD00F9C7283039A2 flags;
  id v20;
  void *v21;
  NSMutableArray *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t i;
  void *v26;
  uint64_t v27;
  void *v28;
  NSMutableArray *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t j;
  void *v33;
  id v34;
  void *v35;
  uint64_t v36;
  void *v37;
  id v38;
  void *v39;
  uint64_t v40;
  void *v41;
  uint64_t v42;
  void *v43;
  $F32854447752F5D8BD00F9C7283039A2 v44;
  id v45;
  void *v46;
  id v47;
  void *v48;
  PBUnknownFields *v49;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  _BYTE v59[128];
  _BYTE v60[128];
  uint64_t v61;

  v61 = *MEMORY[0x1E0C80C00];
  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  os_unfair_lock_lock(&self->_readerLock);
  reader = self->_reader;
  if (reader)
  {
    v7 = reader;
    objc_sync_enter(v7);
    if ((*((_BYTE *)&self->_flags + 4) & 1) == 0)
    {
      *(_QWORD *)((char *)self->_reader + (int)*MEMORY[0x1E0D82BD8]) = self->_readerMarkLength;
      -[PBDataReader seekToOffset:](self->_reader, "seekToOffset:", self->_readerMarkPos);
      GEOPDClientMetadataReadAllFrom(v5, self->_reader, 0);
      os_unfair_lock_unlock(&self->_readerLock);
      v8 = (id)v5;
      objc_sync_exit(v7);

      goto LABEL_38;
    }
    objc_sync_exit(v7);

  }
  os_unfair_lock_unlock(&self->_readerLock);
  -[GEOPDClientMetadata readAll:](self, "readAll:", 0);
  v9 = -[NSString copyWithZone:](self->_deviceCountryCode, "copyWithZone:", a3);
  v10 = *(void **)(v5 + 184);
  *(_QWORD *)(v5 + 184) = v9;

  v11 = -[NSString copyWithZone:](self->_deviceDisplayLanguage, "copyWithZone:", a3);
  v12 = *(void **)(v5 + 192);
  *(_QWORD *)(v5 + 192) = v11;

  v13 = -[NSString copyWithZone:](self->_deviceKeyboardLanguage, "copyWithZone:", a3);
  v14 = *(void **)(v5 + 216);
  *(_QWORD *)(v5 + 216) = v13;

  v15 = -[NSString copyWithZone:](self->_deviceSpokenLanguage, "copyWithZone:", a3);
  v16 = *(void **)(v5 + 232);
  *(_QWORD *)(v5 + 232) = v15;

  if ((*(_BYTE *)&self->_flags & 0x40) != 0)
  {
    *(_DWORD *)(v5 + 308) = self->_timeSinceMapEnteredForeground;
    *(_QWORD *)(v5 + 316) |= 0x40uLL;
  }
  v17 = -[GEOAdditionalEnabledMarkets copyWithZone:](self->_additionalEnabledMarkets, "copyWithZone:", a3);
  v18 = *(void **)(v5 + 160);
  *(_QWORD *)(v5 + 160) = v17;

  flags = self->_flags;
  if ((*(_BYTE *)&flags & 0x20) == 0)
  {
    if ((*(_BYTE *)&flags & 4) == 0)
      goto LABEL_9;
LABEL_40:
    *(_DWORD *)(v5 + 292) = self->_hourOfDay;
    *(_QWORD *)(v5 + 316) |= 4uLL;
    if ((*(_QWORD *)&self->_flags & 2) == 0)
      goto LABEL_11;
    goto LABEL_10;
  }
  *(_DWORD *)(v5 + 304) = self->_resultListAttributionSupport;
  *(_QWORD *)(v5 + 316) |= 0x20uLL;
  flags = self->_flags;
  if ((*(_BYTE *)&flags & 4) != 0)
    goto LABEL_40;
LABEL_9:
  if ((*(_BYTE *)&flags & 2) != 0)
  {
LABEL_10:
    *(_DWORD *)(v5 + 288) = self->_dayOfWeek;
    *(_QWORD *)(v5 + 316) |= 2uLL;
  }
LABEL_11:
  v20 = -[GEOLocation copyWithZone:](self->_deviceExtendedLocation, "copyWithZone:", a3);
  v21 = *(void **)(v5 + 200);
  *(_QWORD *)(v5 + 200) = v20;

  v57 = 0u;
  v58 = 0u;
  v55 = 0u;
  v56 = 0u;
  v22 = self->_deviceHistoricalLocations;
  v23 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v22, "countByEnumeratingWithState:objects:count:", &v55, v60, 16);
  if (v23)
  {
    v24 = *(_QWORD *)v56;
    do
    {
      for (i = 0; i != v23; ++i)
      {
        if (*(_QWORD *)v56 != v24)
          objc_enumerationMutation(v22);
        v26 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v55 + 1) + 8 * i), "copyWithZone:", a3);
        objc_msgSend((id)v5, "addDeviceHistoricalLocation:", v26);

      }
      v23 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v22, "countByEnumeratingWithState:objects:count:", &v55, v60, 16);
    }
    while (v23);
  }

  if ((*(_BYTE *)&self->_flags & 0x10) != 0)
  {
    *(_DWORD *)(v5 + 300) = self->_requiredVersion;
    *(_QWORD *)(v5 + 316) |= 0x10uLL;
  }
  v27 = -[NSString copyWithZone:](self->_debugApiKey, "copyWithZone:", a3);
  v28 = *(void **)(v5 + 176);
  *(_QWORD *)(v5 + 176) = v27;

  PBRepeatedInt32Copy();
  if ((*(_BYTE *)&self->_flags & 0x80) != 0)
  {
    *(_BYTE *)(v5 + 312) = self->_enablePreflightVenues;
    *(_QWORD *)(v5 + 316) |= 0x80uLL;
  }
  PBRepeatedInt32Copy();
  v53 = 0u;
  v54 = 0u;
  v51 = 0u;
  v52 = 0u;
  v29 = self->_businessChatPreflightIdentifiers;
  v30 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v29, "countByEnumeratingWithState:objects:count:", &v51, v59, 16);
  if (v30)
  {
    v31 = *(_QWORD *)v52;
    do
    {
      for (j = 0; j != v30; ++j)
      {
        if (*(_QWORD *)v52 != v31)
          objc_enumerationMutation(v29);
        v33 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v51 + 1) + 8 * j), "copyWithZone:", a3, (_QWORD)v51);
        objc_msgSend((id)v5, "addBusinessChatPreflightIdentifier:", v33);

      }
      v30 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v29, "countByEnumeratingWithState:objects:count:", &v51, v59, 16);
    }
    while (v30);
  }

  if ((*(_BYTE *)&self->_flags & 1) != 0)
  {
    *(_DWORD *)(v5 + 284) = self->_clientRevision;
    *(_QWORD *)(v5 + 316) |= 1uLL;
  }
  v34 = -[GEOLocalizationCapabilities copyWithZone:](self->_localizationCapabilities, "copyWithZone:", a3, (_QWORD)v51);
  v35 = *(void **)(v5 + 248);
  *(_QWORD *)(v5 + 248) = v34;

  v36 = -[NSString copyWithZone:](self->_deviceSku, "copyWithZone:", a3);
  v37 = *(void **)(v5 + 224);
  *(_QWORD *)(v5 + 224) = v36;

  if ((*((_BYTE *)&self->_flags + 1) & 1) != 0)
  {
    *(_BYTE *)(v5 + 313) = self->_siriUserConsentsForAnalysis;
    *(_QWORD *)(v5 + 316) |= 0x100uLL;
  }
  PBRepeatedInt32Copy();
  v38 = -[GEOPDMapsSuggestionsTouristInfo copyWithZone:](self->_mapsSuggestionsTouristInfo, "copyWithZone:", a3);
  v39 = *(void **)(v5 + 256);
  *(_QWORD *)(v5 + 256) = v38;

  PBRepeatedInt32Copy();
  v40 = -[NSString copyWithZone:](self->_preferredDisplayCurrencySymbol, "copyWithZone:", a3);
  v41 = *(void **)(v5 + 264);
  *(_QWORD *)(v5 + 264) = v40;

  v42 = -[NSString copyWithZone:](self->_displayRegion, "copyWithZone:", a3);
  v43 = *(void **)(v5 + 240);
  *(_QWORD *)(v5 + 240) = v42;

  v44 = self->_flags;
  if ((*(_WORD *)&v44 & 0x200) != 0)
  {
    *(_BYTE *)(v5 + 314) = self->_supportEnrichment;
    *(_QWORD *)(v5 + 316) |= 0x200uLL;
    v44 = self->_flags;
  }
  if ((*(_BYTE *)&v44 & 8) != 0)
  {
    *(_DWORD *)(v5 + 296) = self->_preferredDistanceUnit;
    *(_QWORD *)(v5 + 316) |= 8uLL;
  }
  PBRepeatedInt32Copy();
  v45 = -[GEOABSecondPartyPlaceRequestClientMetaData copyWithZone:](self->_abClientMetadata, "copyWithZone:", a3);
  v46 = *(void **)(v5 + 152);
  *(_QWORD *)(v5 + 152) = v45;

  v47 = -[GEOABBranchInfo copyWithZone:](self->_abBranchInfo, "copyWithZone:", a3);
  v48 = *(void **)(v5 + 144);
  *(_QWORD *)(v5 + 144) = v47;

  v49 = self->_unknownFields;
  v8 = *(id *)(v5 + 16);
  *(_QWORD *)(v5 + 16) = v49;
LABEL_38:

  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  char *v4;
  NSString *deviceCountryCode;
  NSString *deviceDisplayLanguage;
  NSString *deviceKeyboardLanguage;
  NSString *deviceSpokenLanguage;
  $F32854447752F5D8BD00F9C7283039A2 flags;
  uint64_t v10;
  GEOAdditionalEnabledMarkets *additionalEnabledMarkets;
  GEOLocation *deviceExtendedLocation;
  NSMutableArray *deviceHistoricalLocations;
  uint64_t v14;
  NSString *debugApiKey;
  uint64_t v16;
  NSMutableArray *businessChatPreflightIdentifiers;
  uint64_t v18;
  GEOLocalizationCapabilities *localizationCapabilities;
  NSString *deviceSku;
  uint64_t v21;
  GEOPDMapsSuggestionsTouristInfo *mapsSuggestionsTouristInfo;
  NSString *preferredDisplayCurrencySymbol;
  NSString *displayRegion;
  $F32854447752F5D8BD00F9C7283039A2 v25;
  uint64_t v26;
  GEOABSecondPartyPlaceRequestClientMetaData *abClientMetadata;
  GEOABBranchInfo *abBranchInfo;
  char v29;

  v4 = (char *)a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_99;
  -[GEOPDClientMetadata readAll:](self, "readAll:", 1);
  objc_msgSend(v4, "readAll:", 1);
  deviceCountryCode = self->_deviceCountryCode;
  if ((unint64_t)deviceCountryCode | *((_QWORD *)v4 + 23))
  {
    if (!-[NSString isEqual:](deviceCountryCode, "isEqual:"))
      goto LABEL_99;
  }
  deviceDisplayLanguage = self->_deviceDisplayLanguage;
  if ((unint64_t)deviceDisplayLanguage | *((_QWORD *)v4 + 24))
  {
    if (!-[NSString isEqual:](deviceDisplayLanguage, "isEqual:"))
      goto LABEL_99;
  }
  deviceKeyboardLanguage = self->_deviceKeyboardLanguage;
  if ((unint64_t)deviceKeyboardLanguage | *((_QWORD *)v4 + 27))
  {
    if (!-[NSString isEqual:](deviceKeyboardLanguage, "isEqual:"))
      goto LABEL_99;
  }
  deviceSpokenLanguage = self->_deviceSpokenLanguage;
  if ((unint64_t)deviceSpokenLanguage | *((_QWORD *)v4 + 29))
  {
    if (!-[NSString isEqual:](deviceSpokenLanguage, "isEqual:"))
      goto LABEL_99;
  }
  flags = self->_flags;
  v10 = *(_QWORD *)(v4 + 316);
  if ((*(_BYTE *)&flags & 0x40) != 0)
  {
    if ((v10 & 0x40) == 0 || self->_timeSinceMapEnteredForeground != *((_DWORD *)v4 + 77))
      goto LABEL_99;
  }
  else if ((v10 & 0x40) != 0)
  {
    goto LABEL_99;
  }
  additionalEnabledMarkets = self->_additionalEnabledMarkets;
  if ((unint64_t)additionalEnabledMarkets | *((_QWORD *)v4 + 20))
  {
    if (!-[GEOAdditionalEnabledMarkets isEqual:](additionalEnabledMarkets, "isEqual:"))
      goto LABEL_99;
    flags = self->_flags;
    v10 = *(_QWORD *)(v4 + 316);
  }
  if ((*(_BYTE *)&flags & 0x20) != 0)
  {
    if ((v10 & 0x20) == 0 || self->_resultListAttributionSupport != *((_DWORD *)v4 + 76))
      goto LABEL_99;
  }
  else if ((v10 & 0x20) != 0)
  {
    goto LABEL_99;
  }
  if ((*(_BYTE *)&flags & 4) != 0)
  {
    if ((v10 & 4) == 0 || self->_hourOfDay != *((_DWORD *)v4 + 73))
      goto LABEL_99;
  }
  else if ((v10 & 4) != 0)
  {
    goto LABEL_99;
  }
  if ((*(_BYTE *)&flags & 2) != 0)
  {
    if ((v10 & 2) == 0 || self->_dayOfWeek != *((_DWORD *)v4 + 72))
      goto LABEL_99;
  }
  else if ((v10 & 2) != 0)
  {
    goto LABEL_99;
  }
  deviceExtendedLocation = self->_deviceExtendedLocation;
  if ((unint64_t)deviceExtendedLocation | *((_QWORD *)v4 + 25)
    && !-[GEOLocation isEqual:](deviceExtendedLocation, "isEqual:"))
  {
    goto LABEL_99;
  }
  deviceHistoricalLocations = self->_deviceHistoricalLocations;
  if ((unint64_t)deviceHistoricalLocations | *((_QWORD *)v4 + 26))
  {
    if (!-[NSMutableArray isEqual:](deviceHistoricalLocations, "isEqual:"))
      goto LABEL_99;
  }
  v14 = *(_QWORD *)(v4 + 316);
  if ((*(_BYTE *)&self->_flags & 0x10) != 0)
  {
    if ((v14 & 0x10) == 0 || self->_requiredVersion != *((_DWORD *)v4 + 75))
      goto LABEL_99;
  }
  else if ((v14 & 0x10) != 0)
  {
    goto LABEL_99;
  }
  debugApiKey = self->_debugApiKey;
  if ((unint64_t)debugApiKey | *((_QWORD *)v4 + 22)
    && !-[NSString isEqual:](debugApiKey, "isEqual:")
    || !PBRepeatedInt32IsEqual())
  {
    goto LABEL_99;
  }
  v16 = *(_QWORD *)(v4 + 316);
  if ((*(_BYTE *)&self->_flags & 0x80) != 0)
  {
    if ((v16 & 0x80) == 0)
      goto LABEL_99;
    if (self->_enablePreflightVenues)
    {
      if (!v4[312])
        goto LABEL_99;
    }
    else if (v4[312])
    {
      goto LABEL_99;
    }
  }
  else if ((v16 & 0x80) != 0)
  {
    goto LABEL_99;
  }
  if (!PBRepeatedInt32IsEqual())
    goto LABEL_99;
  businessChatPreflightIdentifiers = self->_businessChatPreflightIdentifiers;
  if ((unint64_t)businessChatPreflightIdentifiers | *((_QWORD *)v4 + 21))
  {
    if (!-[NSMutableArray isEqual:](businessChatPreflightIdentifiers, "isEqual:"))
      goto LABEL_99;
  }
  v18 = *(_QWORD *)(v4 + 316);
  if ((*(_BYTE *)&self->_flags & 1) != 0)
  {
    if ((v18 & 1) == 0 || self->_clientRevision != *((_DWORD *)v4 + 71))
      goto LABEL_99;
  }
  else if ((v18 & 1) != 0)
  {
    goto LABEL_99;
  }
  localizationCapabilities = self->_localizationCapabilities;
  if ((unint64_t)localizationCapabilities | *((_QWORD *)v4 + 31)
    && !-[GEOLocalizationCapabilities isEqual:](localizationCapabilities, "isEqual:"))
  {
    goto LABEL_99;
  }
  deviceSku = self->_deviceSku;
  if ((unint64_t)deviceSku | *((_QWORD *)v4 + 28))
  {
    if (!-[NSString isEqual:](deviceSku, "isEqual:"))
      goto LABEL_99;
  }
  v21 = *(_QWORD *)(v4 + 316);
  if ((*((_BYTE *)&self->_flags + 1) & 1) != 0)
  {
    if ((v21 & 0x100) == 0)
      goto LABEL_99;
    if (self->_siriUserConsentsForAnalysis)
    {
      if (!v4[313])
        goto LABEL_99;
    }
    else if (v4[313])
    {
      goto LABEL_99;
    }
  }
  else if ((v21 & 0x100) != 0)
  {
    goto LABEL_99;
  }
  if (!PBRepeatedInt32IsEqual())
    goto LABEL_99;
  mapsSuggestionsTouristInfo = self->_mapsSuggestionsTouristInfo;
  if ((unint64_t)mapsSuggestionsTouristInfo | *((_QWORD *)v4 + 32))
  {
    if (!-[GEOPDMapsSuggestionsTouristInfo isEqual:](mapsSuggestionsTouristInfo, "isEqual:"))
      goto LABEL_99;
  }
  if (!PBRepeatedInt32IsEqual())
    goto LABEL_99;
  preferredDisplayCurrencySymbol = self->_preferredDisplayCurrencySymbol;
  if ((unint64_t)preferredDisplayCurrencySymbol | *((_QWORD *)v4 + 33))
  {
    if (!-[NSString isEqual:](preferredDisplayCurrencySymbol, "isEqual:"))
      goto LABEL_99;
  }
  displayRegion = self->_displayRegion;
  if ((unint64_t)displayRegion | *((_QWORD *)v4 + 30))
  {
    if (!-[NSString isEqual:](displayRegion, "isEqual:"))
      goto LABEL_99;
  }
  v25 = self->_flags;
  v26 = *(_QWORD *)(v4 + 316);
  if ((*(_WORD *)&v25 & 0x200) != 0)
  {
    if ((v26 & 0x200) != 0)
    {
      if (self->_supportEnrichment)
      {
        if (!v4[314])
          goto LABEL_99;
        goto LABEL_89;
      }
      if (!v4[314])
        goto LABEL_89;
    }
LABEL_99:
    v29 = 0;
    goto LABEL_100;
  }
  if ((v26 & 0x200) != 0)
    goto LABEL_99;
LABEL_89:
  if ((*(_BYTE *)&v25 & 8) != 0)
  {
    if ((v26 & 8) == 0 || self->_preferredDistanceUnit != *((_DWORD *)v4 + 74))
      goto LABEL_99;
  }
  else if ((v26 & 8) != 0)
  {
    goto LABEL_99;
  }
  if (!PBRepeatedInt32IsEqual())
    goto LABEL_99;
  abClientMetadata = self->_abClientMetadata;
  if ((unint64_t)abClientMetadata | *((_QWORD *)v4 + 19))
  {
    if (!-[GEOABSecondPartyPlaceRequestClientMetaData isEqual:](abClientMetadata, "isEqual:"))
      goto LABEL_99;
  }
  abBranchInfo = self->_abBranchInfo;
  if ((unint64_t)abBranchInfo | *((_QWORD *)v4 + 18))
    v29 = -[GEOABBranchInfo isEqual:](abBranchInfo, "isEqual:");
  else
    v29 = 1;
LABEL_100:

  return v29;
}

- (unint64_t)hash
{
  $F32854447752F5D8BD00F9C7283039A2 flags;
  NSUInteger v4;
  uint64_t v5;
  uint64_t v6;
  unint64_t v7;
  uint64_t v8;
  NSUInteger v9;
  NSUInteger v10;
  $F32854447752F5D8BD00F9C7283039A2 v11;
  uint64_t v12;
  uint64_t v13;
  NSUInteger v14;
  uint64_t v15;
  unint64_t v16;
  unint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  NSUInteger v24;
  uint64_t v25;
  uint64_t v26;
  unint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  unint64_t v31;
  uint64_t v32;
  NSUInteger v33;
  NSUInteger v34;
  NSUInteger v35;
  NSUInteger v36;

  -[GEOPDClientMetadata readAll:](self, "readAll:", 1);
  v36 = -[NSString hash](self->_deviceCountryCode, "hash");
  v35 = -[NSString hash](self->_deviceDisplayLanguage, "hash");
  v34 = -[NSString hash](self->_deviceKeyboardLanguage, "hash");
  v33 = -[NSString hash](self->_deviceSpokenLanguage, "hash");
  if ((*(_BYTE *)&self->_flags & 0x40) != 0)
    v32 = 2654435761 * self->_timeSinceMapEnteredForeground;
  else
    v32 = 0;
  v31 = -[GEOAdditionalEnabledMarkets hash](self->_additionalEnabledMarkets, "hash");
  flags = self->_flags;
  if ((*(_BYTE *)&flags & 0x20) == 0)
  {
    v30 = 0;
    if ((*(_BYTE *)&flags & 4) != 0)
      goto LABEL_6;
LABEL_9:
    v29 = 0;
    if ((*(_BYTE *)&flags & 2) != 0)
      goto LABEL_7;
    goto LABEL_10;
  }
  v30 = 2654435761 * self->_resultListAttributionSupport;
  if ((*(_BYTE *)&flags & 4) == 0)
    goto LABEL_9;
LABEL_6:
  v29 = 2654435761 * self->_hourOfDay;
  if ((*(_BYTE *)&flags & 2) != 0)
  {
LABEL_7:
    v28 = 2654435761 * self->_dayOfWeek;
    goto LABEL_11;
  }
LABEL_10:
  v28 = 0;
LABEL_11:
  v27 = -[GEOLocation hash](self->_deviceExtendedLocation, "hash");
  v26 = -[NSMutableArray hash](self->_deviceHistoricalLocations, "hash");
  if ((*(_BYTE *)&self->_flags & 0x10) != 0)
    v25 = 2654435761 * self->_requiredVersion;
  else
    v25 = 0;
  v24 = -[NSString hash](self->_debugApiKey, "hash");
  v23 = PBRepeatedInt32Hash();
  if ((*(_BYTE *)&self->_flags & 0x80) != 0)
    v22 = 2654435761 * self->_enablePreflightVenues;
  else
    v22 = 0;
  v21 = PBRepeatedInt32Hash();
  v20 = -[NSMutableArray hash](self->_businessChatPreflightIdentifiers, "hash");
  if ((*(_BYTE *)&self->_flags & 1) != 0)
    v19 = 2654435761 * self->_clientRevision;
  else
    v19 = 0;
  v18 = -[GEOLocalizationCapabilities hash](self->_localizationCapabilities, "hash");
  v4 = -[NSString hash](self->_deviceSku, "hash");
  if ((*((_BYTE *)&self->_flags + 1) & 1) != 0)
    v5 = 2654435761 * self->_siriUserConsentsForAnalysis;
  else
    v5 = 0;
  v6 = PBRepeatedInt32Hash();
  v7 = -[GEOPDMapsSuggestionsTouristInfo hash](self->_mapsSuggestionsTouristInfo, "hash");
  v8 = PBRepeatedInt32Hash();
  v9 = -[NSString hash](self->_preferredDisplayCurrencySymbol, "hash");
  v10 = -[NSString hash](self->_displayRegion, "hash");
  v11 = self->_flags;
  if ((*(_WORD *)&v11 & 0x200) != 0)
  {
    v12 = 2654435761 * self->_supportEnrichment;
    if ((*(_BYTE *)&v11 & 8) != 0)
      goto LABEL_25;
LABEL_27:
    v13 = 0;
    goto LABEL_28;
  }
  v12 = 0;
  if ((*(_BYTE *)&v11 & 8) == 0)
    goto LABEL_27;
LABEL_25:
  v13 = 2654435761 * self->_preferredDistanceUnit;
LABEL_28:
  v14 = v35 ^ v36 ^ v34 ^ v33 ^ v32 ^ v31 ^ v30 ^ v29 ^ v28 ^ v27 ^ v26 ^ v25 ^ v24 ^ v23 ^ v22 ^ v21 ^ v20 ^ v19 ^ v18 ^ v4 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9 ^ v10 ^ v12;
  v15 = v13 ^ PBRepeatedInt32Hash();
  v16 = v15 ^ -[GEOABSecondPartyPlaceRequestClientMetaData hash](self->_abClientMetadata, "hash");
  return v14 ^ v16 ^ -[GEOABBranchInfo hash](self->_abBranchInfo, "hash");
}

- (void)mergeFrom:(id)a3
{
  char *v4;
  GEOAdditionalEnabledMarkets *additionalEnabledMarkets;
  uint64_t v6;
  uint64_t v7;
  GEOLocation *deviceExtendedLocation;
  uint64_t v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  uint64_t v15;
  uint64_t v16;
  uint64_t j;
  uint64_t v18;
  uint64_t v19;
  uint64_t k;
  id v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t m;
  GEOLocalizationCapabilities *localizationCapabilities;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t n;
  GEOPDMapsSuggestionsTouristInfo *mapsSuggestionsTouristInfo;
  void *v32;
  double *v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t ii;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t jj;
  GEOABSecondPartyPlaceRequestClientMetaData *abClientMetadata;
  uint64_t v42;
  GEOABBranchInfo *abBranchInfo;
  uint64_t v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  _BYTE v53[128];
  _BYTE v54[128];
  uint64_t v55;

  v55 = *MEMORY[0x1E0C80C00];
  v4 = (char *)a3;
  objc_msgSend(v4, "readAll:", 0);
  if (*((_QWORD *)v4 + 23))
    -[GEOPDClientMetadata setDeviceCountryCode:](self, "setDeviceCountryCode:");
  if (*((_QWORD *)v4 + 24))
    -[GEOPDClientMetadata setDeviceDisplayLanguage:](self, "setDeviceDisplayLanguage:");
  if (*((_QWORD *)v4 + 27))
    -[GEOPDClientMetadata setDeviceKeyboardLanguage:](self, "setDeviceKeyboardLanguage:");
  if (*((_QWORD *)v4 + 29))
    -[GEOPDClientMetadata setDeviceSpokenLanguage:](self, "setDeviceSpokenLanguage:");
  if ((v4[316] & 0x40) != 0)
  {
    self->_timeSinceMapEnteredForeground = *((_DWORD *)v4 + 77);
    *(_QWORD *)&self->_flags |= 0x40uLL;
  }
  additionalEnabledMarkets = self->_additionalEnabledMarkets;
  v6 = *((_QWORD *)v4 + 20);
  if (additionalEnabledMarkets)
  {
    if (v6)
      -[GEOAdditionalEnabledMarkets mergeFrom:](additionalEnabledMarkets, "mergeFrom:");
  }
  else if (v6)
  {
    -[GEOPDClientMetadata setAdditionalEnabledMarkets:](self, "setAdditionalEnabledMarkets:");
  }
  v7 = *(_QWORD *)(v4 + 316);
  if ((v7 & 0x20) != 0)
  {
    self->_resultListAttributionSupport = *((_DWORD *)v4 + 76);
    *(_QWORD *)&self->_flags |= 0x20uLL;
    v7 = *(_QWORD *)(v4 + 316);
    if ((v7 & 4) == 0)
    {
LABEL_18:
      if ((v7 & 2) == 0)
        goto LABEL_20;
      goto LABEL_19;
    }
  }
  else if ((v7 & 4) == 0)
  {
    goto LABEL_18;
  }
  self->_hourOfDay = *((_DWORD *)v4 + 73);
  *(_QWORD *)&self->_flags |= 4uLL;
  if ((*(_QWORD *)(v4 + 316) & 2) != 0)
  {
LABEL_19:
    self->_dayOfWeek = *((_DWORD *)v4 + 72);
    *(_QWORD *)&self->_flags |= 2uLL;
  }
LABEL_20:
  deviceExtendedLocation = self->_deviceExtendedLocation;
  v9 = *((_QWORD *)v4 + 25);
  if (deviceExtendedLocation)
  {
    if (v9)
      -[GEOLocation mergeFrom:](deviceExtendedLocation, "mergeFrom:");
  }
  else if (v9)
  {
    -[GEOPDClientMetadata setDeviceExtendedLocation:](self, "setDeviceExtendedLocation:");
  }
  v51 = 0u;
  v52 = 0u;
  v49 = 0u;
  v50 = 0u;
  v10 = *((id *)v4 + 26);
  v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v49, v54, 16);
  if (v11)
  {
    v12 = v11;
    v13 = *(_QWORD *)v50;
    do
    {
      for (i = 0; i != v12; ++i)
      {
        if (*(_QWORD *)v50 != v13)
          objc_enumerationMutation(v10);
        -[GEOPDClientMetadata addDeviceHistoricalLocation:](self, "addDeviceHistoricalLocation:", *(_QWORD *)(*((_QWORD *)&v49 + 1) + 8 * i));
      }
      v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v49, v54, 16);
    }
    while (v12);
  }

  if ((v4[316] & 0x10) != 0)
  {
    self->_requiredVersion = *((_DWORD *)v4 + 75);
    *(_QWORD *)&self->_flags |= 0x10uLL;
  }
  if (*((_QWORD *)v4 + 22))
    -[GEOPDClientMetadata setDebugApiKey:](self, "setDebugApiKey:");
  v15 = objc_msgSend(v4, "knownClientResolvedTypeDeprecatedsCount");
  if (v15)
  {
    v16 = v15;
    for (j = 0; j != v16; ++j)
      -[GEOPDClientMetadata addKnownClientResolvedTypeDeprecated:](self, "addKnownClientResolvedTypeDeprecated:", objc_msgSend(v4, "knownClientResolvedTypeDeprecatedAtIndex:", j));
  }
  if (v4[316] < 0)
  {
    self->_enablePreflightVenues = v4[312];
    *(_QWORD *)&self->_flags |= 0x80uLL;
  }
  v18 = objc_msgSend(v4, "knownClientResolvedTypesCount");
  if (v18)
  {
    v19 = v18;
    for (k = 0; k != v19; ++k)
      -[GEOPDClientMetadata addKnownClientResolvedType:](self, "addKnownClientResolvedType:", objc_msgSend(v4, "knownClientResolvedTypeAtIndex:", k));
  }
  v47 = 0u;
  v48 = 0u;
  v45 = 0u;
  v46 = 0u;
  v21 = *((id *)v4 + 21);
  v22 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v45, v53, 16);
  if (v22)
  {
    v23 = v22;
    v24 = *(_QWORD *)v46;
    do
    {
      for (m = 0; m != v23; ++m)
      {
        if (*(_QWORD *)v46 != v24)
          objc_enumerationMutation(v21);
        -[GEOPDClientMetadata addBusinessChatPreflightIdentifier:](self, "addBusinessChatPreflightIdentifier:", *(_QWORD *)(*((_QWORD *)&v45 + 1) + 8 * m), (_QWORD)v45);
      }
      v23 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v45, v53, 16);
    }
    while (v23);
  }

  if ((v4[316] & 1) != 0)
  {
    self->_clientRevision = *((_DWORD *)v4 + 71);
    *(_QWORD *)&self->_flags |= 1uLL;
  }
  localizationCapabilities = self->_localizationCapabilities;
  v27 = *((_QWORD *)v4 + 31);
  if (localizationCapabilities)
  {
    if (v27)
      -[GEOLocalizationCapabilities mergeFrom:](localizationCapabilities, "mergeFrom:");
  }
  else if (v27)
  {
    -[GEOPDClientMetadata setLocalizationCapabilities:](self, "setLocalizationCapabilities:");
  }
  if (*((_QWORD *)v4 + 28))
    -[GEOPDClientMetadata setDeviceSku:](self, "setDeviceSku:");
  if ((v4[317] & 1) != 0)
  {
    self->_siriUserConsentsForAnalysis = v4[313];
    *(_QWORD *)&self->_flags |= 0x100uLL;
  }
  v28 = objc_msgSend(v4, "supportedMapsResultTypesCount", (_QWORD)v45);
  if (v28)
  {
    v29 = v28;
    for (n = 0; n != v29; ++n)
      -[GEOPDClientMetadata addSupportedMapsResultType:](self, "addSupportedMapsResultType:", objc_msgSend(v4, "supportedMapsResultTypeAtIndex:", n));
  }
  mapsSuggestionsTouristInfo = self->_mapsSuggestionsTouristInfo;
  v32 = (void *)*((_QWORD *)v4 + 32);
  if (mapsSuggestionsTouristInfo)
  {
    if (v32)
    {
      v33 = v32;
      if (((_BYTE)v33[3] & 1) != 0)
      {
        mapsSuggestionsTouristInfo->_isTourist = v33[2];
        *(_BYTE *)&mapsSuggestionsTouristInfo->_flags |= 1u;
      }

    }
  }
  else if (v32)
  {
    -[GEOPDClientMetadata setMapsSuggestionsTouristInfo:](self, "setMapsSuggestionsTouristInfo:");
  }
  v34 = objc_msgSend(v4, "clientRevisionsCount");
  if (v34)
  {
    v35 = v34;
    for (ii = 0; ii != v35; ++ii)
      -[GEOPDClientMetadata addClientRevisions:](self, "addClientRevisions:", objc_msgSend(v4, "clientRevisionsAtIndex:", ii));
  }
  if (*((_QWORD *)v4 + 33))
    -[GEOPDClientMetadata setPreferredDisplayCurrencySymbol:](self, "setPreferredDisplayCurrencySymbol:");
  if (*((_QWORD *)v4 + 30))
    -[GEOPDClientMetadata setDisplayRegion:](self, "setDisplayRegion:");
  v37 = *(_QWORD *)(v4 + 316);
  if ((v37 & 0x200) != 0)
  {
    self->_supportEnrichment = v4[314];
    *(_QWORD *)&self->_flags |= 0x200uLL;
    v37 = *(_QWORD *)(v4 + 316);
  }
  if ((v37 & 8) != 0)
  {
    self->_preferredDistanceUnit = *((_DWORD *)v4 + 74);
    *(_QWORD *)&self->_flags |= 8uLL;
  }
  v38 = objc_msgSend(v4, "supportedElevationModelsCount");
  if (v38)
  {
    v39 = v38;
    for (jj = 0; jj != v39; ++jj)
      -[GEOPDClientMetadata addSupportedElevationModel:](self, "addSupportedElevationModel:", objc_msgSend(v4, "supportedElevationModelAtIndex:", jj));
  }
  abClientMetadata = self->_abClientMetadata;
  v42 = *((_QWORD *)v4 + 19);
  if (abClientMetadata)
  {
    if (v42)
      -[GEOABSecondPartyPlaceRequestClientMetaData mergeFrom:](abClientMetadata, "mergeFrom:");
  }
  else if (v42)
  {
    -[GEOPDClientMetadata setAbClientMetadata:](self, "setAbClientMetadata:");
  }
  abBranchInfo = self->_abBranchInfo;
  v44 = *((_QWORD *)v4 + 18);
  if (abBranchInfo)
  {
    if (v44)
      -[GEOABBranchInfo mergeFrom:](abBranchInfo, "mergeFrom:");
  }
  else if (v44)
  {
    -[GEOPDClientMetadata setAbBranchInfo:](self, "setAbBranchInfo:");
  }

}

- (PBUnknownFields)unknownFields
{
  os_unfair_lock_s *p_readerLock;
  PBDataReader *reader;
  PBDataReader *v5;

  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  if ((*((_BYTE *)&self->_flags + 1) & 4) == 0)
  {
    reader = self->_reader;
    if (reader)
    {
      v5 = reader;
      objc_sync_enter(v5);
      GEOPDClientMetadataReadSpecified((uint64_t)self, (unint64_t)self->_reader, (int *)&unknownFields_tags_441);
      objc_sync_exit(v5);

    }
  }
  os_unfair_lock_unlock(p_readerLock);
  return self->_unknownFields;
}

- (void)clearUnknownFields:(BOOL)a3
{
  _BOOL4 v3;
  os_unfair_lock_s *p_readerLock;
  PBUnknownFields *unknownFields;
  NSMutableArray *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  GEOPDMapsSuggestionsTouristInfo *mapsSuggestionsTouristInfo;
  PBUnknownFields *v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v3 = a3;
  v19 = *MEMORY[0x1E0C80C00];
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(_QWORD *)&self->_flags |= 0x100000400uLL;
  os_unfair_lock_unlock(p_readerLock);
  unknownFields = self->_unknownFields;
  self->_unknownFields = 0;

  if (v3)
  {
    -[GEOPDClientMetadata readAll:](self, "readAll:", 0);
    -[GEOAdditionalEnabledMarkets clearUnknownFields:](self->_additionalEnabledMarkets, "clearUnknownFields:", 1);
    -[GEOLocation clearUnknownFields:](self->_deviceExtendedLocation, "clearUnknownFields:", 1);
    v16 = 0u;
    v17 = 0u;
    v14 = 0u;
    v15 = 0u;
    v7 = self->_deviceHistoricalLocations;
    v8 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    if (v8)
    {
      v9 = v8;
      v10 = *(_QWORD *)v15;
      do
      {
        v11 = 0;
        do
        {
          if (*(_QWORD *)v15 != v10)
            objc_enumerationMutation(v7);
          objc_msgSend(*(id *)(*((_QWORD *)&v14 + 1) + 8 * v11++), "clearUnknownFields:", 1, (_QWORD)v14);
        }
        while (v9 != v11);
        v9 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
      }
      while (v9);
    }

    -[GEOLocalizationCapabilities clearUnknownFields:](self->_localizationCapabilities, "clearUnknownFields:", 1);
    mapsSuggestionsTouristInfo = self->_mapsSuggestionsTouristInfo;
    if (mapsSuggestionsTouristInfo)
    {
      v13 = mapsSuggestionsTouristInfo->_unknownFields;
      mapsSuggestionsTouristInfo->_unknownFields = 0;

    }
    -[GEOABSecondPartyPlaceRequestClientMetaData clearUnknownFields:](self->_abClientMetadata, "clearUnknownFields:", 1, (_QWORD)v14);
    -[GEOABBranchInfo clearUnknownFields:](self->_abBranchInfo, "clearUnknownFields:", 1);
  }
}

- (void)_readAbClientMetadata
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 280));
    if ((*(_BYTE *)(a1 + 318) & 2) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOPDClientMetadataReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readAbClientMetadata_tags_1);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 280));
  }
}

- (BOOL)hasAbClientMetadata
{
  -[GEOPDClientMetadata _readAbClientMetadata]((uint64_t)self);
  return self->_abClientMetadata != 0;
}

- (GEOABSecondPartyPlaceRequestClientMetaData)abClientMetadata
{
  -[GEOPDClientMetadata _readAbClientMetadata]((uint64_t)self);
  return self->_abClientMetadata;
}

- (void)_readAbBranchInfo
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 280));
    if ((*(_BYTE *)(a1 + 318) & 1) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOPDClientMetadataReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readAbBranchInfo_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 280));
  }
}

- (BOOL)hasAbBranchInfo
{
  -[GEOPDClientMetadata _readAbBranchInfo]((uint64_t)self);
  return self->_abBranchInfo != 0;
}

- (GEOABBranchInfo)abBranchInfo
{
  -[GEOPDClientMetadata _readAbBranchInfo]((uint64_t)self);
  return self->_abBranchInfo;
}

- (void)setAbBranchInfo:(id)a3
{
  *(_QWORD *)&self->_flags |= 0x100010000uLL;
  objc_storeStrong((id *)&self->_abBranchInfo, a3);
}

- (void)clearLocations
{
  -[GEOPDClientMetadata setDeviceHistoricalLocations:](self, "setDeviceHistoricalLocations:", 0);
  -[GEOPDClientMetadata setDeviceExtendedLocation:](self, "setDeviceExtendedLocation:", 0);
  -[GEOPDClientMetadata clearKnownClientResolvedTypes](self, "clearKnownClientResolvedTypes");
  -[GEOPDClientMetadata addKnownClientResolvedType:](self, "addKnownClientResolvedType:", 0);
}

@end
