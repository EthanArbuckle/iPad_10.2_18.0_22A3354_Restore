@implementation GEOLogMsgEventPeriodicSettingsSummary

- (GEOLogMsgEventPeriodicSettingsSummary)init
{
  GEOLogMsgEventPeriodicSettingsSummary *v2;
  GEOLogMsgEventPeriodicSettingsSummary *v3;
  GEOLogMsgEventPeriodicSettingsSummary *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)GEOLogMsgEventPeriodicSettingsSummary;
  v2 = -[GEOLogMsgEventPeriodicSettingsSummary init](&v6, sel_init);
  v3 = v2;
  if (v2)
  {
    v2->_readerLock._os_unfair_lock_opaque = 0;
    v4 = v2;
  }

  return v3;
}

- (GEOLogMsgEventPeriodicSettingsSummary)initWithData:(id)a3
{
  GEOLogMsgEventPeriodicSettingsSummary *v3;
  GEOLogMsgEventPeriodicSettingsSummary *v4;
  GEOLogMsgEventPeriodicSettingsSummary *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)GEOLogMsgEventPeriodicSettingsSummary;
  v3 = -[GEOLogMsgEventPeriodicSettingsSummary initWithData:](&v7, sel_initWithData_, a3);
  v4 = v3;
  if (v3)
  {
    v3->_readerLock._os_unfair_lock_opaque = 0;
    v5 = v3;
  }

  return v4;
}

- (void)_readMapSettings
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 88));
    if ((*(_BYTE *)(a1 + 117) & 0x10) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOLogMsgEventPeriodicSettingsSummaryReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readMapSettings_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 88));
  }
}

- (BOOL)hasMapSettings
{
  -[GEOLogMsgEventPeriodicSettingsSummary _readMapSettings]((uint64_t)self);
  return self->_mapSettings != 0;
}

- (GEOLogMsgStateMapSettings)mapSettings
{
  -[GEOLogMsgEventPeriodicSettingsSummary _readMapSettings]((uint64_t)self);
  return self->_mapSettings;
}

- (void)setMapSettings:(id)a3
{
  *(_DWORD *)&self->_flags |= 0x21000u;
  objc_storeStrong((id *)&self->_mapSettings, a3);
}

- (void)_readMapUiShown
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 88));
    if ((*(_BYTE *)(a1 + 117) & 0x20) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOLogMsgEventPeriodicSettingsSummaryReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readMapUiShown_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 88));
  }
}

- (BOOL)hasMapUiShown
{
  -[GEOLogMsgEventPeriodicSettingsSummary _readMapUiShown]((uint64_t)self);
  return self->_mapUiShown != 0;
}

- (GEOLogMsgStateMapUIShown)mapUiShown
{
  -[GEOLogMsgEventPeriodicSettingsSummary _readMapUiShown]((uint64_t)self);
  return self->_mapUiShown;
}

- (void)setMapUiShown:(id)a3
{
  *(_DWORD *)&self->_flags |= 0x22000u;
  objc_storeStrong((id *)&self->_mapUiShown, a3);
}

- (BOOL)notificationsEnabled
{
  return self->_notificationsEnabled;
}

- (void)setNotificationsEnabled:(BOOL)a3
{
  *(_DWORD *)&self->_flags |= 0x20040u;
  self->_notificationsEnabled = a3;
}

- (void)setHasNotificationsEnabled:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 131136;
  else
    v3 = 0x20000;
  self->_flags = ($D63EE9E95D2419817D8490C7201791AB)(*(_DWORD *)&self->_flags & 0xFFFFFFBF | v3);
}

- (BOOL)hasNotificationsEnabled
{
  return (*(_BYTE *)&self->_flags >> 6) & 1;
}

- (BOOL)homeFavoriteSet
{
  return self->_homeFavoriteSet;
}

- (void)setHomeFavoriteSet:(BOOL)a3
{
  *(_DWORD *)&self->_flags |= 0x20010u;
  self->_homeFavoriteSet = a3;
}

- (void)setHasHomeFavoriteSet:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 131088;
  else
    v3 = 0x20000;
  self->_flags = ($D63EE9E95D2419817D8490C7201791AB)(*(_DWORD *)&self->_flags & 0xFFFFFFEF | v3);
}

- (BOOL)hasHomeFavoriteSet
{
  return (*(_BYTE *)&self->_flags >> 4) & 1;
}

- (BOOL)workFavoriteSet
{
  return self->_workFavoriteSet;
}

- (void)setWorkFavoriteSet:(BOOL)a3
{
  *(_DWORD *)&self->_flags |= 0x20100u;
  self->_workFavoriteSet = a3;
}

- (void)setHasWorkFavoriteSet:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 131328;
  else
    v3 = 0x20000;
  self->_flags = ($D63EE9E95D2419817D8490C7201791AB)(*(_DWORD *)&self->_flags & 0xFFFFFEFF | v3);
}

- (BOOL)hasWorkFavoriteSet
{
  return *((_BYTE *)&self->_flags + 1) & 1;
}

- (unsigned)favoritesCount
{
  return self->_favoritesCount;
}

- (void)setFavoritesCount:(unsigned int)a3
{
  *(_DWORD *)&self->_flags |= 0x20002u;
  self->_favoritesCount = a3;
}

- (void)setHasFavoritesCount:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 131074;
  else
    v3 = 0x20000;
  self->_flags = ($D63EE9E95D2419817D8490C7201791AB)(*(_DWORD *)&self->_flags & 0xFFFDFFFD | v3);
}

- (BOOL)hasFavoritesCount
{
  return (*(_BYTE *)&self->_flags >> 1) & 1;
}

- (unsigned)personalCollectionsCount
{
  return self->_personalCollectionsCount;
}

- (void)setPersonalCollectionsCount:(unsigned int)a3
{
  *(_DWORD *)&self->_flags |= 0x20008u;
  self->_personalCollectionsCount = a3;
}

- (void)setHasPersonalCollectionsCount:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 131080;
  else
    v3 = 0x20000;
  self->_flags = ($D63EE9E95D2419817D8490C7201791AB)(*(_DWORD *)&self->_flags & 0xFFFFFFF7 | v3);
}

- (BOOL)hasPersonalCollectionsCount
{
  return (*(_BYTE *)&self->_flags >> 3) & 1;
}

- (unsigned)electricVehicleCount
{
  return self->_electricVehicleCount;
}

- (void)setElectricVehicleCount:(unsigned int)a3
{
  *(_DWORD *)&self->_flags |= 0x20001u;
  self->_electricVehicleCount = a3;
}

- (void)setHasElectricVehicleCount:(BOOL)a3
{
  self->_flags = ($D63EE9E95D2419817D8490C7201791AB)(*(_DWORD *)&self->_flags & 0xFFFFFFFE | a3 | 0x20000);
}

- (BOOL)hasElectricVehicleCount
{
  return *(_DWORD *)&self->_flags & 1;
}

- (unsigned)licensePlateCount
{
  return self->_licensePlateCount;
}

- (void)setLicensePlateCount:(unsigned int)a3
{
  *(_DWORD *)&self->_flags |= 0x20004u;
  self->_licensePlateCount = a3;
}

- (void)setHasLicensePlateCount:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 131076;
  else
    v3 = 0x20000;
  self->_flags = ($D63EE9E95D2419817D8490C7201791AB)(*(_DWORD *)&self->_flags & 0xFFFFFFFB | v3);
}

- (BOOL)hasLicensePlateCount
{
  return (*(_BYTE *)&self->_flags >> 2) & 1;
}

- (BOOL)siriSuggestionsEnabled
{
  return self->_siriSuggestionsEnabled;
}

- (void)setSiriSuggestionsEnabled:(BOOL)a3
{
  *(_DWORD *)&self->_flags |= 0x20080u;
  self->_siriSuggestionsEnabled = a3;
}

- (void)setHasSiriSuggestionsEnabled:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 131200;
  else
    v3 = 0x20000;
  self->_flags = ($D63EE9E95D2419817D8490C7201791AB)(*(_DWORD *)&self->_flags & 0xFFFFFF7F | v3);
}

- (BOOL)hasSiriSuggestionsEnabled
{
  return *(_BYTE *)&self->_flags >> 7;
}

- (BOOL)learnFromAppEnabled
{
  return self->_learnFromAppEnabled;
}

- (void)setLearnFromAppEnabled:(BOOL)a3
{
  *(_DWORD *)&self->_flags |= 0x20020u;
  self->_learnFromAppEnabled = a3;
}

- (void)setHasLearnFromAppEnabled:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 131104;
  else
    v3 = 0x20000;
  self->_flags = ($D63EE9E95D2419817D8490C7201791AB)(*(_DWORD *)&self->_flags & 0xFFFFFFDF | v3);
}

- (BOOL)hasLearnFromAppEnabled
{
  return (*(_BYTE *)&self->_flags >> 5) & 1;
}

- (void)_readAccount
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 88));
    if ((*(_BYTE *)(a1 + 117) & 2) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOLogMsgEventPeriodicSettingsSummaryReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readAccount_tags_0);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 88));
  }
}

- (BOOL)hasAccount
{
  -[GEOLogMsgEventPeriodicSettingsSummary _readAccount]((uint64_t)self);
  return self->_account != 0;
}

- (GEOLogMsgStateAccount)account
{
  -[GEOLogMsgEventPeriodicSettingsSummary _readAccount]((uint64_t)self);
  return self->_account;
}

- (void)setAccount:(id)a3
{
  *(_DWORD *)&self->_flags |= 0x20200u;
  objc_storeStrong((id *)&self->_account, a3);
}

- (void)_readDeviceConnection
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 88));
    if ((*(_BYTE *)(a1 + 117) & 4) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOLogMsgEventPeriodicSettingsSummaryReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readDeviceConnection_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 88));
  }
}

- (BOOL)hasDeviceConnection
{
  -[GEOLogMsgEventPeriodicSettingsSummary _readDeviceConnection]((uint64_t)self);
  return self->_deviceConnection != 0;
}

- (GEOLogMsgStateDeviceConnection)deviceConnection
{
  -[GEOLogMsgEventPeriodicSettingsSummary _readDeviceConnection]((uint64_t)self);
  return self->_deviceConnection;
}

- (void)setDeviceConnection:(id)a3
{
  *(_DWORD *)&self->_flags |= 0x20400u;
  objc_storeStrong((id *)&self->_deviceConnection, a3);
}

- (void)_readMapsUserSettings
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 88));
    if ((*(_BYTE *)(a1 + 117) & 0x80) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOLogMsgEventPeriodicSettingsSummaryReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readMapsUserSettings_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 88));
  }
}

- (BOOL)hasMapsUserSettings
{
  -[GEOLogMsgEventPeriodicSettingsSummary _readMapsUserSettings]((uint64_t)self);
  return self->_mapsUserSettings != 0;
}

- (GEOLogMsgStateMapsUserSettings)mapsUserSettings
{
  -[GEOLogMsgEventPeriodicSettingsSummary _readMapsUserSettings]((uint64_t)self);
  return self->_mapsUserSettings;
}

- (void)setMapsUserSettings:(id)a3
{
  *(_DWORD *)&self->_flags |= 0x28000u;
  objc_storeStrong((id *)&self->_mapsUserSettings, a3);
}

- (void)_readRoutingSettings
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 88));
    if ((*(_BYTE *)(a1 + 118) & 1) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOLogMsgEventPeriodicSettingsSummaryReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readRoutingSettings_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 88));
  }
}

- (BOOL)hasRoutingSettings
{
  -[GEOLogMsgEventPeriodicSettingsSummary _readRoutingSettings]((uint64_t)self);
  return self->_routingSettings != 0;
}

- (GEOLogMsgStateRoutingSettings)routingSettings
{
  -[GEOLogMsgEventPeriodicSettingsSummary _readRoutingSettings]((uint64_t)self);
  return self->_routingSettings;
}

- (void)setRoutingSettings:(id)a3
{
  *(_DWORD *)&self->_flags |= 0x30000u;
  objc_storeStrong((id *)&self->_routingSettings, a3);
}

- (void)_readMapsFeatures
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 88));
    if ((*(_BYTE *)(a1 + 117) & 0x40) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOLogMsgEventPeriodicSettingsSummaryReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readMapsFeatures_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 88));
  }
}

- (BOOL)hasMapsFeatures
{
  -[GEOLogMsgEventPeriodicSettingsSummary _readMapsFeatures]((uint64_t)self);
  return self->_mapsFeatures != 0;
}

- (GEOLogMsgStateMapsFeatures)mapsFeatures
{
  -[GEOLogMsgEventPeriodicSettingsSummary _readMapsFeatures]((uint64_t)self);
  return self->_mapsFeatures;
}

- (void)setMapsFeatures:(id)a3
{
  *(_DWORD *)&self->_flags |= 0x24000u;
  objc_storeStrong((id *)&self->_mapsFeatures, a3);
}

- (void)_readDeviceSettings
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 88));
    if ((*(_BYTE *)(a1 + 117) & 8) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOLogMsgEventPeriodicSettingsSummaryReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readDeviceSettings_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 88));
  }
}

- (BOOL)hasDeviceSettings
{
  -[GEOLogMsgEventPeriodicSettingsSummary _readDeviceSettings]((uint64_t)self);
  return self->_deviceSettings != 0;
}

- (GEOLogMsgStateDeviceSettings)deviceSettings
{
  -[GEOLogMsgEventPeriodicSettingsSummary _readDeviceSettings]((uint64_t)self);
  return self->_deviceSettings;
}

- (void)setDeviceSettings:(id)a3
{
  *(_DWORD *)&self->_flags |= 0x20800u;
  objc_storeStrong((id *)&self->_deviceSettings, a3);
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
  v8.super_class = (Class)GEOLogMsgEventPeriodicSettingsSummary;
  -[GEOLogMsgEventPeriodicSettingsSummary description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[GEOLogMsgEventPeriodicSettingsSummary dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEOLogMsgEventPeriodicSettingsSummary _dictionaryRepresentation:]((uint64_t)self, 0);
}

- (id)_dictionaryRepresentation:(uint64_t)a1
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  const __CFString *v8;
  void *v9;
  void *v10;
  void *v11;
  const __CFString *v12;
  int v13;
  void *v14;
  const __CFString *v15;
  void *v16;
  void *v17;
  void *v18;
  const __CFString *v19;
  void *v20;
  const __CFString *v21;
  void *v22;
  const __CFString *v23;
  void *v24;
  const __CFString *v25;
  void *v26;
  const __CFString *v27;
  void *v28;
  const __CFString *v29;
  void *v30;
  const __CFString *v31;
  void *v32;
  const __CFString *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  const __CFString *v38;
  void *v39;
  void *v40;
  void *v41;
  const __CFString *v42;
  void *v43;
  void *v44;
  void *v45;
  const __CFString *v46;
  void *v47;
  void *v48;
  void *v49;
  const __CFString *v50;
  void *v51;
  void *v52;
  void *v53;
  const __CFString *v54;

  if (!a1)
  {
    v4 = 0;
    return v4;
  }
  objc_msgSend((id)a1, "readAll:", 1);
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)a1, "mapSettings");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5)
  {
    if ((a2 & 1) != 0)
    {
      objc_msgSend(v5, "jsonRepresentation");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = CFSTR("mapSettings");
    }
    else
    {
      objc_msgSend(v5, "dictionaryRepresentation");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = CFSTR("map_settings");
    }
    objc_msgSend(v4, "setObject:forKey:", v7, v8);

  }
  objc_msgSend((id)a1, "mapUiShown");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v9;
  if (v9)
  {
    if ((a2 & 1) != 0)
    {
      objc_msgSend(v9, "jsonRepresentation");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = CFSTR("mapUiShown");
    }
    else
    {
      objc_msgSend(v9, "dictionaryRepresentation");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = CFSTR("map_ui_shown");
    }
    objc_msgSend(v4, "setObject:forKey:", v11, v12);

  }
  v13 = *(_DWORD *)(a1 + 116);
  if ((v13 & 0x40) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", *(unsigned __int8 *)(a1 + 110));
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    if (a2)
      v19 = CFSTR("notificationsEnabled");
    else
      v19 = CFSTR("notifications_enabled");
    objc_msgSend(v4, "setObject:forKey:", v18, v19);

    v13 = *(_DWORD *)(a1 + 116);
    if ((v13 & 0x10) == 0)
    {
LABEL_14:
      if ((v13 & 0x100) == 0)
        goto LABEL_15;
      goto LABEL_36;
    }
  }
  else if ((v13 & 0x10) == 0)
  {
    goto LABEL_14;
  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", *(unsigned __int8 *)(a1 + 108));
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  if (a2)
    v21 = CFSTR("homeFavoriteSet");
  else
    v21 = CFSTR("home_favorite_set");
  objc_msgSend(v4, "setObject:forKey:", v20, v21);

  v13 = *(_DWORD *)(a1 + 116);
  if ((v13 & 0x100) == 0)
  {
LABEL_15:
    if ((v13 & 2) == 0)
      goto LABEL_16;
    goto LABEL_40;
  }
LABEL_36:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", *(unsigned __int8 *)(a1 + 112));
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  if (a2)
    v23 = CFSTR("workFavoriteSet");
  else
    v23 = CFSTR("work_favorite_set");
  objc_msgSend(v4, "setObject:forKey:", v22, v23);

  v13 = *(_DWORD *)(a1 + 116);
  if ((v13 & 2) == 0)
  {
LABEL_16:
    if ((v13 & 8) == 0)
      goto LABEL_17;
    goto LABEL_44;
  }
LABEL_40:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", *(unsigned int *)(a1 + 96));
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  if (a2)
    v25 = CFSTR("favoritesCount");
  else
    v25 = CFSTR("favorites_count");
  objc_msgSend(v4, "setObject:forKey:", v24, v25);

  v13 = *(_DWORD *)(a1 + 116);
  if ((v13 & 8) == 0)
  {
LABEL_17:
    if ((v13 & 1) == 0)
      goto LABEL_18;
    goto LABEL_48;
  }
LABEL_44:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", *(unsigned int *)(a1 + 104));
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  if (a2)
    v27 = CFSTR("personalCollectionsCount");
  else
    v27 = CFSTR("personal_collections_count");
  objc_msgSend(v4, "setObject:forKey:", v26, v27);

  v13 = *(_DWORD *)(a1 + 116);
  if ((v13 & 1) == 0)
  {
LABEL_18:
    if ((v13 & 4) == 0)
      goto LABEL_19;
    goto LABEL_52;
  }
LABEL_48:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", *(unsigned int *)(a1 + 92));
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  if (a2)
    v29 = CFSTR("electricVehicleCount");
  else
    v29 = CFSTR("electric_vehicle_count");
  objc_msgSend(v4, "setObject:forKey:", v28, v29);

  v13 = *(_DWORD *)(a1 + 116);
  if ((v13 & 4) == 0)
  {
LABEL_19:
    if ((v13 & 0x80) == 0)
      goto LABEL_20;
LABEL_56:
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", *(unsigned __int8 *)(a1 + 111));
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    if (a2)
      v33 = CFSTR("siriSuggestionsEnabled");
    else
      v33 = CFSTR("siri_suggestions_enabled");
    objc_msgSend(v4, "setObject:forKey:", v32, v33);

    if ((*(_DWORD *)(a1 + 116) & 0x20) == 0)
      goto LABEL_25;
    goto LABEL_21;
  }
LABEL_52:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", *(unsigned int *)(a1 + 100));
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  if (a2)
    v31 = CFSTR("licensePlateCount");
  else
    v31 = CFSTR("license_plate_count");
  objc_msgSend(v4, "setObject:forKey:", v30, v31);

  v13 = *(_DWORD *)(a1 + 116);
  if ((v13 & 0x80) != 0)
    goto LABEL_56;
LABEL_20:
  if ((v13 & 0x20) != 0)
  {
LABEL_21:
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", *(unsigned __int8 *)(a1 + 109));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    if (a2)
      v15 = CFSTR("learnFromAppEnabled");
    else
      v15 = CFSTR("learn_from_app_enabled");
    objc_msgSend(v4, "setObject:forKey:", v14, v15);

  }
LABEL_25:
  objc_msgSend((id)a1, "account");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = v16;
  if (v16)
  {
    if ((a2 & 1) != 0)
      objc_msgSend(v16, "jsonRepresentation");
    else
      objc_msgSend(v16, "dictionaryRepresentation");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v34, CFSTR("account"));

  }
  objc_msgSend((id)a1, "deviceConnection");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  v36 = v35;
  if (v35)
  {
    if ((a2 & 1) != 0)
    {
      objc_msgSend(v35, "jsonRepresentation");
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      v38 = CFSTR("deviceConnection");
    }
    else
    {
      objc_msgSend(v35, "dictionaryRepresentation");
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      v38 = CFSTR("device_connection");
    }
    objc_msgSend(v4, "setObject:forKey:", v37, v38);

  }
  objc_msgSend((id)a1, "mapsUserSettings");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  v40 = v39;
  if (v39)
  {
    if ((a2 & 1) != 0)
    {
      objc_msgSend(v39, "jsonRepresentation");
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      v42 = CFSTR("mapsUserSettings");
    }
    else
    {
      objc_msgSend(v39, "dictionaryRepresentation");
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      v42 = CFSTR("maps_user_settings");
    }
    objc_msgSend(v4, "setObject:forKey:", v41, v42);

  }
  objc_msgSend((id)a1, "routingSettings");
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  v44 = v43;
  if (v43)
  {
    if ((a2 & 1) != 0)
    {
      objc_msgSend(v43, "jsonRepresentation");
      v45 = (void *)objc_claimAutoreleasedReturnValue();
      v46 = CFSTR("routingSettings");
    }
    else
    {
      objc_msgSend(v43, "dictionaryRepresentation");
      v45 = (void *)objc_claimAutoreleasedReturnValue();
      v46 = CFSTR("routing_settings");
    }
    objc_msgSend(v4, "setObject:forKey:", v45, v46);

  }
  objc_msgSend((id)a1, "mapsFeatures");
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  v48 = v47;
  if (v47)
  {
    if ((a2 & 1) != 0)
    {
      objc_msgSend(v47, "jsonRepresentation");
      v49 = (void *)objc_claimAutoreleasedReturnValue();
      v50 = CFSTR("mapsFeatures");
    }
    else
    {
      objc_msgSend(v47, "dictionaryRepresentation");
      v49 = (void *)objc_claimAutoreleasedReturnValue();
      v50 = CFSTR("maps_features");
    }
    objc_msgSend(v4, "setObject:forKey:", v49, v50);

  }
  objc_msgSend((id)a1, "deviceSettings");
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  v52 = v51;
  if (v51)
  {
    if ((a2 & 1) != 0)
    {
      objc_msgSend(v51, "jsonRepresentation");
      v53 = (void *)objc_claimAutoreleasedReturnValue();
      v54 = CFSTR("deviceSettings");
    }
    else
    {
      objc_msgSend(v51, "dictionaryRepresentation");
      v53 = (void *)objc_claimAutoreleasedReturnValue();
      v54 = CFSTR("device_settings");
    }
    objc_msgSend(v4, "setObject:forKey:", v53, v54);

  }
  return v4;
}

- (id)jsonRepresentation
{
  return -[GEOLogMsgEventPeriodicSettingsSummary _dictionaryRepresentation:]((uint64_t)self, 1);
}

- (GEOLogMsgEventPeriodicSettingsSummary)initWithDictionary:(id)a3
{
  return (GEOLogMsgEventPeriodicSettingsSummary *)-[GEOLogMsgEventPeriodicSettingsSummary _initWithDictionary:isJSON:](self, a3, 0);
}

- (void)_initWithDictionary:(int)a3 isJSON:
{
  id v5;
  const __CFString *v6;
  void *v7;
  GEOLogMsgStateMapSettings *v8;
  uint64_t v9;
  void *v10;
  const __CFString *v11;
  void *v12;
  GEOLogMsgStateMapUIShown *v13;
  uint64_t v14;
  void *v15;
  const __CFString *v16;
  void *v17;
  const __CFString *v18;
  void *v19;
  const __CFString *v20;
  void *v21;
  const __CFString *v22;
  void *v23;
  const __CFString *v24;
  void *v25;
  const __CFString *v26;
  void *v27;
  const __CFString *v28;
  void *v29;
  const __CFString *v30;
  void *v31;
  const __CFString *v32;
  void *v33;
  void *v34;
  GEOLogMsgStateAccount *v35;
  uint64_t v36;
  void *v37;
  const __CFString *v38;
  void *v39;
  GEOLogMsgStateDeviceConnection *v40;
  uint64_t v41;
  void *v42;
  const __CFString *v43;
  void *v44;
  GEOLogMsgStateMapsUserSettings *v45;
  uint64_t v46;
  void *v47;
  const __CFString *v48;
  void *v49;
  GEOLogMsgStateRoutingSettings *v50;
  uint64_t v51;
  void *v52;
  const __CFString *v53;
  void *v54;
  GEOLogMsgStateMapsFeatures *v55;
  uint64_t v56;
  void *v57;
  const __CFString *v58;
  void *v59;
  GEOLogMsgStateDeviceSettings *v60;
  uint64_t v61;
  void *v62;

  v5 = a2;
  if (a1)
  {
    a1 = (void *)objc_msgSend(a1, "init");
    if (a1)
    {
      if (a3)
        v6 = CFSTR("mapSettings");
      else
        v6 = CFSTR("map_settings");
      objc_msgSend(v5, "objectForKeyedSubscript:", v6);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v8 = [GEOLogMsgStateMapSettings alloc];
        if ((a3 & 1) != 0)
          v9 = -[GEOLogMsgStateMapSettings initWithJSON:](v8, "initWithJSON:", v7);
        else
          v9 = -[GEOLogMsgStateMapSettings initWithDictionary:](v8, "initWithDictionary:", v7);
        v10 = (void *)v9;
        objc_msgSend(a1, "setMapSettings:", v9);

      }
      if (a3)
        v11 = CFSTR("mapUiShown");
      else
        v11 = CFSTR("map_ui_shown");
      objc_msgSend(v5, "objectForKeyedSubscript:", v11);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v13 = [GEOLogMsgStateMapUIShown alloc];
        if ((a3 & 1) != 0)
          v14 = -[GEOLogMsgStateMapUIShown initWithJSON:](v13, "initWithJSON:", v12);
        else
          v14 = -[GEOLogMsgStateMapUIShown initWithDictionary:](v13, "initWithDictionary:", v12);
        v15 = (void *)v14;
        objc_msgSend(a1, "setMapUiShown:", v14);

      }
      if (a3)
        v16 = CFSTR("notificationsEnabled");
      else
        v16 = CFSTR("notifications_enabled");
      objc_msgSend(v5, "objectForKeyedSubscript:", v16);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        objc_msgSend(a1, "setNotificationsEnabled:", objc_msgSend(v17, "BOOLValue"));

      if (a3)
        v18 = CFSTR("homeFavoriteSet");
      else
        v18 = CFSTR("home_favorite_set");
      objc_msgSend(v5, "objectForKeyedSubscript:", v18);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        objc_msgSend(a1, "setHomeFavoriteSet:", objc_msgSend(v19, "BOOLValue"));

      if (a3)
        v20 = CFSTR("workFavoriteSet");
      else
        v20 = CFSTR("work_favorite_set");
      objc_msgSend(v5, "objectForKeyedSubscript:", v20);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        objc_msgSend(a1, "setWorkFavoriteSet:", objc_msgSend(v21, "BOOLValue"));

      if (a3)
        v22 = CFSTR("favoritesCount");
      else
        v22 = CFSTR("favorites_count");
      objc_msgSend(v5, "objectForKeyedSubscript:", v22);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        objc_msgSend(a1, "setFavoritesCount:", objc_msgSend(v23, "unsignedIntValue"));

      if (a3)
        v24 = CFSTR("personalCollectionsCount");
      else
        v24 = CFSTR("personal_collections_count");
      objc_msgSend(v5, "objectForKeyedSubscript:", v24);
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        objc_msgSend(a1, "setPersonalCollectionsCount:", objc_msgSend(v25, "unsignedIntValue"));

      if (a3)
        v26 = CFSTR("electricVehicleCount");
      else
        v26 = CFSTR("electric_vehicle_count");
      objc_msgSend(v5, "objectForKeyedSubscript:", v26);
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        objc_msgSend(a1, "setElectricVehicleCount:", objc_msgSend(v27, "unsignedIntValue"));

      if (a3)
        v28 = CFSTR("licensePlateCount");
      else
        v28 = CFSTR("license_plate_count");
      objc_msgSend(v5, "objectForKeyedSubscript:", v28);
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        objc_msgSend(a1, "setLicensePlateCount:", objc_msgSend(v29, "unsignedIntValue"));

      if (a3)
        v30 = CFSTR("siriSuggestionsEnabled");
      else
        v30 = CFSTR("siri_suggestions_enabled");
      objc_msgSend(v5, "objectForKeyedSubscript:", v30);
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        objc_msgSend(a1, "setSiriSuggestionsEnabled:", objc_msgSend(v31, "BOOLValue"));

      if (a3)
        v32 = CFSTR("learnFromAppEnabled");
      else
        v32 = CFSTR("learn_from_app_enabled");
      objc_msgSend(v5, "objectForKeyedSubscript:", v32);
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        objc_msgSend(a1, "setLearnFromAppEnabled:", objc_msgSend(v33, "BOOLValue"));

      objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("account"));
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v35 = [GEOLogMsgStateAccount alloc];
        if ((a3 & 1) != 0)
          v36 = -[GEOLogMsgStateAccount initWithJSON:](v35, "initWithJSON:", v34);
        else
          v36 = -[GEOLogMsgStateAccount initWithDictionary:](v35, "initWithDictionary:", v34);
        v37 = (void *)v36;
        objc_msgSend(a1, "setAccount:", v36);

      }
      if (a3)
        v38 = CFSTR("deviceConnection");
      else
        v38 = CFSTR("device_connection");
      objc_msgSend(v5, "objectForKeyedSubscript:", v38);
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v40 = [GEOLogMsgStateDeviceConnection alloc];
        if ((a3 & 1) != 0)
          v41 = -[GEOLogMsgStateDeviceConnection initWithJSON:](v40, "initWithJSON:", v39);
        else
          v41 = -[GEOLogMsgStateDeviceConnection initWithDictionary:](v40, "initWithDictionary:", v39);
        v42 = (void *)v41;
        objc_msgSend(a1, "setDeviceConnection:", v41);

      }
      if (a3)
        v43 = CFSTR("mapsUserSettings");
      else
        v43 = CFSTR("maps_user_settings");
      objc_msgSend(v5, "objectForKeyedSubscript:", v43);
      v44 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v45 = [GEOLogMsgStateMapsUserSettings alloc];
        if ((a3 & 1) != 0)
          v46 = -[GEOLogMsgStateMapsUserSettings initWithJSON:](v45, "initWithJSON:", v44);
        else
          v46 = -[GEOLogMsgStateMapsUserSettings initWithDictionary:](v45, "initWithDictionary:", v44);
        v47 = (void *)v46;
        objc_msgSend(a1, "setMapsUserSettings:", v46);

      }
      if (a3)
        v48 = CFSTR("routingSettings");
      else
        v48 = CFSTR("routing_settings");
      objc_msgSend(v5, "objectForKeyedSubscript:", v48);
      v49 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v50 = [GEOLogMsgStateRoutingSettings alloc];
        if ((a3 & 1) != 0)
          v51 = -[GEOLogMsgStateRoutingSettings initWithJSON:](v50, "initWithJSON:", v49);
        else
          v51 = -[GEOLogMsgStateRoutingSettings initWithDictionary:](v50, "initWithDictionary:", v49);
        v52 = (void *)v51;
        objc_msgSend(a1, "setRoutingSettings:", v51);

      }
      if (a3)
        v53 = CFSTR("mapsFeatures");
      else
        v53 = CFSTR("maps_features");
      objc_msgSend(v5, "objectForKeyedSubscript:", v53);
      v54 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v55 = [GEOLogMsgStateMapsFeatures alloc];
        if ((a3 & 1) != 0)
          v56 = -[GEOLogMsgStateMapsFeatures initWithJSON:](v55, "initWithJSON:", v54);
        else
          v56 = -[GEOLogMsgStateMapsFeatures initWithDictionary:](v55, "initWithDictionary:", v54);
        v57 = (void *)v56;
        objc_msgSend(a1, "setMapsFeatures:", v56);

      }
      if (a3)
        v58 = CFSTR("deviceSettings");
      else
        v58 = CFSTR("device_settings");
      objc_msgSend(v5, "objectForKeyedSubscript:", v58);
      v59 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v60 = [GEOLogMsgStateDeviceSettings alloc];
        if ((a3 & 1) != 0)
          v61 = -[GEOLogMsgStateDeviceSettings initWithJSON:](v60, "initWithJSON:", v59);
        else
          v61 = -[GEOLogMsgStateDeviceSettings initWithDictionary:](v60, "initWithDictionary:", v59);
        v62 = (void *)v61;
        objc_msgSend(a1, "setDeviceSettings:", v61);

      }
    }
  }

  return a1;
}

- (GEOLogMsgEventPeriodicSettingsSummary)initWithJSON:(id)a3
{
  return (GEOLogMsgEventPeriodicSettingsSummary *)-[GEOLogMsgEventPeriodicSettingsSummary _initWithDictionary:isJSON:](self, a3, 1);
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
      v8 = (int *)&readAll__recursiveTag_3437;
    else
      v8 = (int *)&readAll__nonRecursiveTag_3438;
    GEOLogMsgEventPeriodicSettingsSummaryReadSpecified((uint64_t)self, (unint64_t)self->_reader, v8);
    objc_sync_exit(v7);

  }
  if (v3)
    _GEOLogMsgEventPeriodicSettingsSummaryCallReadAllRecursiveWithoutSynchronized((id *)&self->super.super.isa);
  os_unfair_lock_unlock(p_readerLock);
}

+ (BOOL)isValid:(id)a3
{
  return GEOLogMsgEventPeriodicSettingsSummaryIsValid((char *)a3);
}

- (BOOL)readFrom:(id)a3
{
  return GEOLogMsgEventPeriodicSettingsSummaryReadAllFrom((uint64_t)self, a3, 0);
}

- (void)writeTo:(id)a3
{
  os_unfair_lock_s *p_readerLock;
  $D63EE9E95D2419817D8490C7201791AB flags;
  PBDataReader *v6;
  void *v7;
  id v8;

  v8 = a3;
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  if (self->_reader && (_GEOLogMsgEventPeriodicSettingsSummaryIsDirty((uint64_t)self) & 1) == 0)
  {
    v6 = self->_reader;
    objc_sync_enter(v6);
    *(_QWORD *)((char *)self->_reader + (int)*MEMORY[0x1E0D82BD8]) = self->_readerMarkLength;
    -[PBDataReader seekToOffset:](self->_reader, "seekToOffset:", self->_readerMarkPos);
    -[PBDataReader readBytes:](self->_reader, "readBytes:", self->_readerMarkLength - self->_readerMarkPos);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "writeData:", v7);
    os_unfair_lock_unlock(p_readerLock);

    objc_sync_exit(v6);
    goto LABEL_39;
  }
  os_unfair_lock_unlock(&self->_readerLock);
  -[GEOLogMsgEventPeriodicSettingsSummary readAll:](self, "readAll:", 0);
  if (self->_mapSettings)
    PBDataWriterWriteSubmessage();
  if (self->_mapUiShown)
    PBDataWriterWriteSubmessage();
  flags = self->_flags;
  if ((*(_BYTE *)&flags & 0x40) != 0)
  {
    PBDataWriterWriteBOOLField();
    flags = self->_flags;
    if ((*(_BYTE *)&flags & 0x10) == 0)
    {
LABEL_9:
      if ((*(_WORD *)&flags & 0x100) == 0)
        goto LABEL_10;
      goto LABEL_31;
    }
  }
  else if ((*(_BYTE *)&flags & 0x10) == 0)
  {
    goto LABEL_9;
  }
  PBDataWriterWriteBOOLField();
  flags = self->_flags;
  if ((*(_WORD *)&flags & 0x100) == 0)
  {
LABEL_10:
    if ((*(_BYTE *)&flags & 2) == 0)
      goto LABEL_11;
    goto LABEL_32;
  }
LABEL_31:
  PBDataWriterWriteBOOLField();
  flags = self->_flags;
  if ((*(_BYTE *)&flags & 2) == 0)
  {
LABEL_11:
    if ((*(_BYTE *)&flags & 8) == 0)
      goto LABEL_12;
    goto LABEL_33;
  }
LABEL_32:
  PBDataWriterWriteUint32Field();
  flags = self->_flags;
  if ((*(_BYTE *)&flags & 8) == 0)
  {
LABEL_12:
    if ((*(_BYTE *)&flags & 1) == 0)
      goto LABEL_13;
    goto LABEL_34;
  }
LABEL_33:
  PBDataWriterWriteUint32Field();
  flags = self->_flags;
  if ((*(_BYTE *)&flags & 1) == 0)
  {
LABEL_13:
    if ((*(_BYTE *)&flags & 4) == 0)
      goto LABEL_14;
    goto LABEL_35;
  }
LABEL_34:
  PBDataWriterWriteUint32Field();
  flags = self->_flags;
  if ((*(_BYTE *)&flags & 4) == 0)
  {
LABEL_14:
    if ((*(_BYTE *)&flags & 0x80) == 0)
      goto LABEL_15;
LABEL_36:
    PBDataWriterWriteBOOLField();
    if ((*(_DWORD *)&self->_flags & 0x20) == 0)
      goto LABEL_17;
    goto LABEL_16;
  }
LABEL_35:
  PBDataWriterWriteUint32Field();
  flags = self->_flags;
  if ((*(_BYTE *)&flags & 0x80) != 0)
    goto LABEL_36;
LABEL_15:
  if ((*(_BYTE *)&flags & 0x20) != 0)
LABEL_16:
    PBDataWriterWriteBOOLField();
LABEL_17:
  if (self->_account)
    PBDataWriterWriteSubmessage();
  if (self->_deviceConnection)
    PBDataWriterWriteSubmessage();
  if (self->_mapsUserSettings)
    PBDataWriterWriteSubmessage();
  if (self->_routingSettings)
    PBDataWriterWriteSubmessage();
  if (self->_mapsFeatures)
    PBDataWriterWriteSubmessage();
  if (self->_deviceSettings)
    PBDataWriterWriteSubmessage();
LABEL_39:

}

- (void)copyTo:(id)a3
{
  $D63EE9E95D2419817D8490C7201791AB flags;
  id *v5;
  id *v6;

  v6 = (id *)a3;
  -[GEOLogMsgEventPeriodicSettingsSummary readAll:](self, "readAll:", 0);
  os_unfair_lock_lock_with_options();
  objc_storeStrong(v6 + 1, self->_reader);
  *((_DWORD *)v6 + 20) = self->_readerMarkPos;
  *((_DWORD *)v6 + 21) = self->_readerMarkLength;
  os_unfair_lock_unlock(&self->_readerLock);
  if (self->_mapSettings)
    objc_msgSend(v6, "setMapSettings:");
  if (self->_mapUiShown)
    objc_msgSend(v6, "setMapUiShown:");
  flags = self->_flags;
  v5 = v6;
  if ((*(_BYTE *)&flags & 0x40) != 0)
  {
    *((_BYTE *)v6 + 110) = self->_notificationsEnabled;
    *((_DWORD *)v6 + 29) |= 0x40u;
    flags = self->_flags;
    if ((*(_BYTE *)&flags & 0x10) == 0)
    {
LABEL_7:
      if ((*(_WORD *)&flags & 0x100) == 0)
        goto LABEL_8;
      goto LABEL_30;
    }
  }
  else if ((*(_BYTE *)&flags & 0x10) == 0)
  {
    goto LABEL_7;
  }
  *((_BYTE *)v6 + 108) = self->_homeFavoriteSet;
  *((_DWORD *)v6 + 29) |= 0x10u;
  flags = self->_flags;
  if ((*(_WORD *)&flags & 0x100) == 0)
  {
LABEL_8:
    if ((*(_BYTE *)&flags & 2) == 0)
      goto LABEL_9;
    goto LABEL_31;
  }
LABEL_30:
  *((_BYTE *)v6 + 112) = self->_workFavoriteSet;
  *((_DWORD *)v6 + 29) |= 0x100u;
  flags = self->_flags;
  if ((*(_BYTE *)&flags & 2) == 0)
  {
LABEL_9:
    if ((*(_BYTE *)&flags & 8) == 0)
      goto LABEL_10;
    goto LABEL_32;
  }
LABEL_31:
  *((_DWORD *)v6 + 24) = self->_favoritesCount;
  *((_DWORD *)v6 + 29) |= 2u;
  flags = self->_flags;
  if ((*(_BYTE *)&flags & 8) == 0)
  {
LABEL_10:
    if ((*(_BYTE *)&flags & 1) == 0)
      goto LABEL_11;
    goto LABEL_33;
  }
LABEL_32:
  *((_DWORD *)v6 + 26) = self->_personalCollectionsCount;
  *((_DWORD *)v6 + 29) |= 8u;
  flags = self->_flags;
  if ((*(_BYTE *)&flags & 1) == 0)
  {
LABEL_11:
    if ((*(_BYTE *)&flags & 4) == 0)
      goto LABEL_12;
    goto LABEL_34;
  }
LABEL_33:
  *((_DWORD *)v6 + 23) = self->_electricVehicleCount;
  *((_DWORD *)v6 + 29) |= 1u;
  flags = self->_flags;
  if ((*(_BYTE *)&flags & 4) == 0)
  {
LABEL_12:
    if ((*(_BYTE *)&flags & 0x80) == 0)
      goto LABEL_13;
    goto LABEL_35;
  }
LABEL_34:
  *((_DWORD *)v6 + 25) = self->_licensePlateCount;
  *((_DWORD *)v6 + 29) |= 4u;
  flags = self->_flags;
  if ((*(_BYTE *)&flags & 0x80) == 0)
  {
LABEL_13:
    if ((*(_BYTE *)&flags & 0x20) == 0)
      goto LABEL_15;
    goto LABEL_14;
  }
LABEL_35:
  *((_BYTE *)v6 + 111) = self->_siriSuggestionsEnabled;
  *((_DWORD *)v6 + 29) |= 0x80u;
  if ((*(_DWORD *)&self->_flags & 0x20) != 0)
  {
LABEL_14:
    *((_BYTE *)v6 + 109) = self->_learnFromAppEnabled;
    *((_DWORD *)v6 + 29) |= 0x20u;
  }
LABEL_15:
  if (self->_account)
  {
    objc_msgSend(v6, "setAccount:");
    v5 = v6;
  }
  if (self->_deviceConnection)
  {
    objc_msgSend(v6, "setDeviceConnection:");
    v5 = v6;
  }
  if (self->_mapsUserSettings)
  {
    objc_msgSend(v6, "setMapsUserSettings:");
    v5 = v6;
  }
  if (self->_routingSettings)
  {
    objc_msgSend(v6, "setRoutingSettings:");
    v5 = v6;
  }
  if (self->_mapsFeatures)
  {
    objc_msgSend(v6, "setMapsFeatures:");
    v5 = v6;
  }
  if (self->_deviceSettings)
  {
    objc_msgSend(v6, "setDeviceSettings:");
    v5 = v6;
  }

}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5;
  PBDataReader *reader;
  PBDataReader *v7;
  id v8;
  id v9;
  void *v10;
  id v11;
  void *v12;
  $D63EE9E95D2419817D8490C7201791AB flags;
  id v14;
  void *v15;
  id v16;
  void *v17;
  id v18;
  void *v19;
  id v20;
  void *v21;
  id v22;
  void *v23;
  id v24;

  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  os_unfair_lock_lock(&self->_readerLock);
  reader = self->_reader;
  if (!reader)
  {
LABEL_5:
    os_unfair_lock_unlock(&self->_readerLock);
    -[GEOLogMsgEventPeriodicSettingsSummary readAll:](self, "readAll:", 0);
    v9 = -[GEOLogMsgStateMapSettings copyWithZone:](self->_mapSettings, "copyWithZone:", a3);
    v10 = *(void **)(v5 + 40);
    *(_QWORD *)(v5 + 40) = v9;

    v11 = -[GEOLogMsgStateMapUIShown copyWithZone:](self->_mapUiShown, "copyWithZone:", a3);
    v12 = *(void **)(v5 + 48);
    *(_QWORD *)(v5 + 48) = v11;

    flags = self->_flags;
    if ((*(_BYTE *)&flags & 0x40) != 0)
    {
      *(_BYTE *)(v5 + 110) = self->_notificationsEnabled;
      *(_DWORD *)(v5 + 116) |= 0x40u;
      flags = self->_flags;
      if ((*(_BYTE *)&flags & 0x10) == 0)
      {
LABEL_7:
        if ((*(_WORD *)&flags & 0x100) == 0)
          goto LABEL_8;
        goto LABEL_19;
      }
    }
    else if ((*(_BYTE *)&flags & 0x10) == 0)
    {
      goto LABEL_7;
    }
    *(_BYTE *)(v5 + 108) = self->_homeFavoriteSet;
    *(_DWORD *)(v5 + 116) |= 0x10u;
    flags = self->_flags;
    if ((*(_WORD *)&flags & 0x100) == 0)
    {
LABEL_8:
      if ((*(_BYTE *)&flags & 2) == 0)
        goto LABEL_9;
      goto LABEL_20;
    }
LABEL_19:
    *(_BYTE *)(v5 + 112) = self->_workFavoriteSet;
    *(_DWORD *)(v5 + 116) |= 0x100u;
    flags = self->_flags;
    if ((*(_BYTE *)&flags & 2) == 0)
    {
LABEL_9:
      if ((*(_BYTE *)&flags & 8) == 0)
        goto LABEL_10;
      goto LABEL_21;
    }
LABEL_20:
    *(_DWORD *)(v5 + 96) = self->_favoritesCount;
    *(_DWORD *)(v5 + 116) |= 2u;
    flags = self->_flags;
    if ((*(_BYTE *)&flags & 8) == 0)
    {
LABEL_10:
      if ((*(_BYTE *)&flags & 1) == 0)
        goto LABEL_11;
      goto LABEL_22;
    }
LABEL_21:
    *(_DWORD *)(v5 + 104) = self->_personalCollectionsCount;
    *(_DWORD *)(v5 + 116) |= 8u;
    flags = self->_flags;
    if ((*(_BYTE *)&flags & 1) == 0)
    {
LABEL_11:
      if ((*(_BYTE *)&flags & 4) == 0)
        goto LABEL_12;
      goto LABEL_23;
    }
LABEL_22:
    *(_DWORD *)(v5 + 92) = self->_electricVehicleCount;
    *(_DWORD *)(v5 + 116) |= 1u;
    flags = self->_flags;
    if ((*(_BYTE *)&flags & 4) == 0)
    {
LABEL_12:
      if ((*(_BYTE *)&flags & 0x80) == 0)
        goto LABEL_13;
      goto LABEL_24;
    }
LABEL_23:
    *(_DWORD *)(v5 + 100) = self->_licensePlateCount;
    *(_DWORD *)(v5 + 116) |= 4u;
    flags = self->_flags;
    if ((*(_BYTE *)&flags & 0x80) == 0)
    {
LABEL_13:
      if ((*(_BYTE *)&flags & 0x20) == 0)
      {
LABEL_15:
        v14 = -[GEOLogMsgStateAccount copyWithZone:](self->_account, "copyWithZone:", a3);
        v15 = *(void **)(v5 + 16);
        *(_QWORD *)(v5 + 16) = v14;

        v16 = -[GEOLogMsgStateDeviceConnection copyWithZone:](self->_deviceConnection, "copyWithZone:", a3);
        v17 = *(void **)(v5 + 24);
        *(_QWORD *)(v5 + 24) = v16;

        v18 = -[GEOLogMsgStateMapsUserSettings copyWithZone:](self->_mapsUserSettings, "copyWithZone:", a3);
        v19 = *(void **)(v5 + 64);
        *(_QWORD *)(v5 + 64) = v18;

        v20 = -[GEOLogMsgStateRoutingSettings copyWithZone:](self->_routingSettings, "copyWithZone:", a3);
        v21 = *(void **)(v5 + 72);
        *(_QWORD *)(v5 + 72) = v20;

        v22 = -[GEOLogMsgStateMapsFeatures copyWithZone:](self->_mapsFeatures, "copyWithZone:", a3);
        v23 = *(void **)(v5 + 56);
        *(_QWORD *)(v5 + 56) = v22;

        v24 = -[GEOLogMsgStateDeviceSettings copyWithZone:](self->_deviceSettings, "copyWithZone:", a3);
        v8 = *(id *)(v5 + 32);
        *(_QWORD *)(v5 + 32) = v24;
        goto LABEL_16;
      }
LABEL_14:
      *(_BYTE *)(v5 + 109) = self->_learnFromAppEnabled;
      *(_DWORD *)(v5 + 116) |= 0x20u;
      goto LABEL_15;
    }
LABEL_24:
    *(_BYTE *)(v5 + 111) = self->_siriSuggestionsEnabled;
    *(_DWORD *)(v5 + 116) |= 0x80u;
    if ((*(_DWORD *)&self->_flags & 0x20) == 0)
      goto LABEL_15;
    goto LABEL_14;
  }
  v7 = reader;
  objc_sync_enter(v7);
  if ((*((_BYTE *)&self->_flags + 2) & 2) != 0)
  {
    objc_sync_exit(v7);

    goto LABEL_5;
  }
  *(_QWORD *)((char *)self->_reader + (int)*MEMORY[0x1E0D82BD8]) = self->_readerMarkLength;
  -[PBDataReader seekToOffset:](self->_reader, "seekToOffset:", self->_readerMarkPos);
  GEOLogMsgEventPeriodicSettingsSummaryReadAllFrom(v5, self->_reader, 0);
  os_unfair_lock_unlock(&self->_readerLock);
  v8 = (id)v5;
  objc_sync_exit(v7);

LABEL_16:
  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  GEOLogMsgStateMapSettings *mapSettings;
  GEOLogMsgStateMapUIShown *mapUiShown;
  $D63EE9E95D2419817D8490C7201791AB flags;
  int v8;
  GEOLogMsgStateAccount *account;
  GEOLogMsgStateDeviceConnection *deviceConnection;
  GEOLogMsgStateMapsUserSettings *mapsUserSettings;
  GEOLogMsgStateRoutingSettings *routingSettings;
  GEOLogMsgStateMapsFeatures *mapsFeatures;
  GEOLogMsgStateDeviceSettings *deviceSettings;
  char v15;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_78;
  -[GEOLogMsgEventPeriodicSettingsSummary readAll:](self, "readAll:", 1);
  objc_msgSend(v4, "readAll:", 1);
  mapSettings = self->_mapSettings;
  if ((unint64_t)mapSettings | *((_QWORD *)v4 + 5))
  {
    if (!-[GEOLogMsgStateMapSettings isEqual:](mapSettings, "isEqual:"))
      goto LABEL_78;
  }
  mapUiShown = self->_mapUiShown;
  if ((unint64_t)mapUiShown | *((_QWORD *)v4 + 6))
  {
    if (!-[GEOLogMsgStateMapUIShown isEqual:](mapUiShown, "isEqual:"))
      goto LABEL_78;
  }
  flags = self->_flags;
  v8 = *((_DWORD *)v4 + 29);
  if ((*(_BYTE *)&flags & 0x40) != 0)
  {
    if ((v8 & 0x40) == 0)
      goto LABEL_78;
    if (self->_notificationsEnabled)
    {
      if (!*((_BYTE *)v4 + 110))
        goto LABEL_78;
    }
    else if (*((_BYTE *)v4 + 110))
    {
      goto LABEL_78;
    }
  }
  else if ((v8 & 0x40) != 0)
  {
    goto LABEL_78;
  }
  if ((*(_BYTE *)&flags & 0x10) != 0)
  {
    if ((v8 & 0x10) == 0)
      goto LABEL_78;
    if (self->_homeFavoriteSet)
    {
      if (!*((_BYTE *)v4 + 108))
        goto LABEL_78;
    }
    else if (*((_BYTE *)v4 + 108))
    {
      goto LABEL_78;
    }
  }
  else if ((v8 & 0x10) != 0)
  {
    goto LABEL_78;
  }
  if ((*(_WORD *)&flags & 0x100) != 0)
  {
    if ((v8 & 0x100) == 0)
      goto LABEL_78;
    if (self->_workFavoriteSet)
    {
      if (!*((_BYTE *)v4 + 112))
        goto LABEL_78;
    }
    else if (*((_BYTE *)v4 + 112))
    {
      goto LABEL_78;
    }
  }
  else if ((v8 & 0x100) != 0)
  {
    goto LABEL_78;
  }
  if ((*(_BYTE *)&flags & 2) != 0)
  {
    if ((v8 & 2) == 0 || self->_favoritesCount != *((_DWORD *)v4 + 24))
      goto LABEL_78;
  }
  else if ((v8 & 2) != 0)
  {
    goto LABEL_78;
  }
  if ((*(_BYTE *)&flags & 8) != 0)
  {
    if ((v8 & 8) == 0 || self->_personalCollectionsCount != *((_DWORD *)v4 + 26))
      goto LABEL_78;
  }
  else if ((v8 & 8) != 0)
  {
    goto LABEL_78;
  }
  if ((*(_BYTE *)&flags & 1) != 0)
  {
    if ((v8 & 1) == 0 || self->_electricVehicleCount != *((_DWORD *)v4 + 23))
      goto LABEL_78;
  }
  else if ((v8 & 1) != 0)
  {
    goto LABEL_78;
  }
  if ((*(_BYTE *)&flags & 4) != 0)
  {
    if ((v8 & 4) == 0 || self->_licensePlateCount != *((_DWORD *)v4 + 25))
      goto LABEL_78;
  }
  else if ((v8 & 4) != 0)
  {
    goto LABEL_78;
  }
  if ((*(_BYTE *)&flags & 0x80) != 0)
  {
    if ((v8 & 0x80) == 0)
      goto LABEL_78;
    if (self->_siriSuggestionsEnabled)
    {
      if (!*((_BYTE *)v4 + 111))
        goto LABEL_78;
    }
    else if (*((_BYTE *)v4 + 111))
    {
      goto LABEL_78;
    }
  }
  else if ((v8 & 0x80) != 0)
  {
    goto LABEL_78;
  }
  if ((*(_BYTE *)&flags & 0x20) != 0)
  {
    if ((v8 & 0x20) != 0)
    {
      if (self->_learnFromAppEnabled)
      {
        if (!*((_BYTE *)v4 + 109))
          goto LABEL_78;
        goto LABEL_66;
      }
      if (!*((_BYTE *)v4 + 109))
        goto LABEL_66;
    }
LABEL_78:
    v15 = 0;
    goto LABEL_79;
  }
  if ((v8 & 0x20) != 0)
    goto LABEL_78;
LABEL_66:
  account = self->_account;
  if ((unint64_t)account | *((_QWORD *)v4 + 2) && !-[GEOLogMsgStateAccount isEqual:](account, "isEqual:"))
    goto LABEL_78;
  deviceConnection = self->_deviceConnection;
  if ((unint64_t)deviceConnection | *((_QWORD *)v4 + 3))
  {
    if (!-[GEOLogMsgStateDeviceConnection isEqual:](deviceConnection, "isEqual:"))
      goto LABEL_78;
  }
  mapsUserSettings = self->_mapsUserSettings;
  if ((unint64_t)mapsUserSettings | *((_QWORD *)v4 + 8))
  {
    if (!-[GEOLogMsgStateMapsUserSettings isEqual:](mapsUserSettings, "isEqual:"))
      goto LABEL_78;
  }
  routingSettings = self->_routingSettings;
  if ((unint64_t)routingSettings | *((_QWORD *)v4 + 9))
  {
    if (!-[GEOLogMsgStateRoutingSettings isEqual:](routingSettings, "isEqual:"))
      goto LABEL_78;
  }
  mapsFeatures = self->_mapsFeatures;
  if ((unint64_t)mapsFeatures | *((_QWORD *)v4 + 7))
  {
    if (!-[GEOLogMsgStateMapsFeatures isEqual:](mapsFeatures, "isEqual:"))
      goto LABEL_78;
  }
  deviceSettings = self->_deviceSettings;
  if ((unint64_t)deviceSettings | *((_QWORD *)v4 + 4))
    v15 = -[GEOLogMsgStateDeviceSettings isEqual:](deviceSettings, "isEqual:");
  else
    v15 = 1;
LABEL_79:

  return v15;
}

- (unint64_t)hash
{
  unint64_t v3;
  unint64_t v4;
  $D63EE9E95D2419817D8490C7201791AB flags;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  unint64_t v15;
  unint64_t v16;
  unint64_t v17;
  unint64_t v18;
  unint64_t v19;

  -[GEOLogMsgEventPeriodicSettingsSummary readAll:](self, "readAll:", 1);
  v3 = -[GEOLogMsgStateMapSettings hash](self->_mapSettings, "hash");
  v4 = -[GEOLogMsgStateMapUIShown hash](self->_mapUiShown, "hash");
  flags = self->_flags;
  if ((*(_BYTE *)&flags & 0x40) != 0)
  {
    v6 = 2654435761 * self->_notificationsEnabled;
    if ((*(_BYTE *)&flags & 0x10) != 0)
    {
LABEL_3:
      v7 = 2654435761 * self->_homeFavoriteSet;
      if ((*(_WORD *)&flags & 0x100) != 0)
        goto LABEL_4;
      goto LABEL_13;
    }
  }
  else
  {
    v6 = 0;
    if ((*(_BYTE *)&flags & 0x10) != 0)
      goto LABEL_3;
  }
  v7 = 0;
  if ((*(_WORD *)&flags & 0x100) != 0)
  {
LABEL_4:
    v8 = 2654435761 * self->_workFavoriteSet;
    if ((*(_BYTE *)&flags & 2) != 0)
      goto LABEL_5;
    goto LABEL_14;
  }
LABEL_13:
  v8 = 0;
  if ((*(_BYTE *)&flags & 2) != 0)
  {
LABEL_5:
    v9 = 2654435761 * self->_favoritesCount;
    if ((*(_BYTE *)&flags & 8) != 0)
      goto LABEL_6;
    goto LABEL_15;
  }
LABEL_14:
  v9 = 0;
  if ((*(_BYTE *)&flags & 8) != 0)
  {
LABEL_6:
    v10 = 2654435761 * self->_personalCollectionsCount;
    if ((*(_BYTE *)&flags & 1) != 0)
      goto LABEL_7;
    goto LABEL_16;
  }
LABEL_15:
  v10 = 0;
  if ((*(_BYTE *)&flags & 1) != 0)
  {
LABEL_7:
    v11 = 2654435761 * self->_electricVehicleCount;
    if ((*(_BYTE *)&flags & 4) != 0)
      goto LABEL_8;
    goto LABEL_17;
  }
LABEL_16:
  v11 = 0;
  if ((*(_BYTE *)&flags & 4) != 0)
  {
LABEL_8:
    v12 = 2654435761 * self->_licensePlateCount;
    if ((*(_BYTE *)&flags & 0x80) != 0)
      goto LABEL_9;
LABEL_18:
    v13 = 0;
    if ((*(_BYTE *)&flags & 0x20) != 0)
      goto LABEL_10;
LABEL_19:
    v14 = 0;
    goto LABEL_20;
  }
LABEL_17:
  v12 = 0;
  if ((*(_BYTE *)&flags & 0x80) == 0)
    goto LABEL_18;
LABEL_9:
  v13 = 2654435761 * self->_siriSuggestionsEnabled;
  if ((*(_BYTE *)&flags & 0x20) == 0)
    goto LABEL_19;
LABEL_10:
  v14 = 2654435761 * self->_learnFromAppEnabled;
LABEL_20:
  v15 = v4 ^ v3 ^ v6 ^ v7 ^ v8 ^ v9 ^ v10 ^ v11 ^ v12 ^ v13 ^ v14 ^ -[GEOLogMsgStateAccount hash](self->_account, "hash");
  v16 = -[GEOLogMsgStateDeviceConnection hash](self->_deviceConnection, "hash");
  v17 = v16 ^ -[GEOLogMsgStateMapsUserSettings hash](self->_mapsUserSettings, "hash");
  v18 = v15 ^ v17 ^ -[GEOLogMsgStateRoutingSettings hash](self->_routingSettings, "hash");
  v19 = -[GEOLogMsgStateMapsFeatures hash](self->_mapsFeatures, "hash");
  return v18 ^ v19 ^ -[GEOLogMsgStateDeviceSettings hash](self->_deviceSettings, "hash");
}

- (void)mergeFrom:(id)a3
{
  _QWORD *v4;
  GEOLogMsgStateMapSettings *mapSettings;
  uint64_t v6;
  GEOLogMsgStateMapUIShown *mapUiShown;
  uint64_t v8;
  int v9;
  GEOLogMsgStateAccount *account;
  uint64_t v11;
  GEOLogMsgStateDeviceConnection *deviceConnection;
  uint64_t v13;
  GEOLogMsgStateMapsUserSettings *mapsUserSettings;
  uint64_t v15;
  GEOLogMsgStateRoutingSettings *routingSettings;
  uint64_t v17;
  GEOLogMsgStateMapsFeatures *mapsFeatures;
  uint64_t v19;
  GEOLogMsgStateDeviceSettings *deviceSettings;
  uint64_t v21;
  _QWORD *v22;

  v22 = a3;
  objc_msgSend(v22, "readAll:", 0);
  v4 = v22;
  mapSettings = self->_mapSettings;
  v6 = v22[5];
  if (mapSettings)
  {
    if (!v6)
      goto LABEL_7;
    -[GEOLogMsgStateMapSettings mergeFrom:](mapSettings, "mergeFrom:");
  }
  else
  {
    if (!v6)
      goto LABEL_7;
    -[GEOLogMsgEventPeriodicSettingsSummary setMapSettings:](self, "setMapSettings:");
  }
  v4 = v22;
LABEL_7:
  mapUiShown = self->_mapUiShown;
  v8 = v4[6];
  if (mapUiShown)
  {
    if (!v8)
      goto LABEL_13;
    -[GEOLogMsgStateMapUIShown mergeFrom:](mapUiShown, "mergeFrom:");
  }
  else
  {
    if (!v8)
      goto LABEL_13;
    -[GEOLogMsgEventPeriodicSettingsSummary setMapUiShown:](self, "setMapUiShown:");
  }
  v4 = v22;
LABEL_13:
  v9 = *((_DWORD *)v4 + 29);
  if ((v9 & 0x40) != 0)
  {
    self->_notificationsEnabled = *((_BYTE *)v4 + 110);
    *(_DWORD *)&self->_flags |= 0x40u;
    v9 = *((_DWORD *)v4 + 29);
    if ((v9 & 0x10) == 0)
    {
LABEL_15:
      if ((v9 & 0x100) == 0)
        goto LABEL_16;
      goto LABEL_28;
    }
  }
  else if ((v9 & 0x10) == 0)
  {
    goto LABEL_15;
  }
  self->_homeFavoriteSet = *((_BYTE *)v4 + 108);
  *(_DWORD *)&self->_flags |= 0x10u;
  v9 = *((_DWORD *)v4 + 29);
  if ((v9 & 0x100) == 0)
  {
LABEL_16:
    if ((v9 & 2) == 0)
      goto LABEL_17;
    goto LABEL_29;
  }
LABEL_28:
  self->_workFavoriteSet = *((_BYTE *)v4 + 112);
  *(_DWORD *)&self->_flags |= 0x100u;
  v9 = *((_DWORD *)v4 + 29);
  if ((v9 & 2) == 0)
  {
LABEL_17:
    if ((v9 & 8) == 0)
      goto LABEL_18;
    goto LABEL_30;
  }
LABEL_29:
  self->_favoritesCount = *((_DWORD *)v4 + 24);
  *(_DWORD *)&self->_flags |= 2u;
  v9 = *((_DWORD *)v4 + 29);
  if ((v9 & 8) == 0)
  {
LABEL_18:
    if ((v9 & 1) == 0)
      goto LABEL_19;
    goto LABEL_31;
  }
LABEL_30:
  self->_personalCollectionsCount = *((_DWORD *)v4 + 26);
  *(_DWORD *)&self->_flags |= 8u;
  v9 = *((_DWORD *)v4 + 29);
  if ((v9 & 1) == 0)
  {
LABEL_19:
    if ((v9 & 4) == 0)
      goto LABEL_20;
    goto LABEL_32;
  }
LABEL_31:
  self->_electricVehicleCount = *((_DWORD *)v4 + 23);
  *(_DWORD *)&self->_flags |= 1u;
  v9 = *((_DWORD *)v4 + 29);
  if ((v9 & 4) == 0)
  {
LABEL_20:
    if ((v9 & 0x80) == 0)
      goto LABEL_21;
    goto LABEL_33;
  }
LABEL_32:
  self->_licensePlateCount = *((_DWORD *)v4 + 25);
  *(_DWORD *)&self->_flags |= 4u;
  v9 = *((_DWORD *)v4 + 29);
  if ((v9 & 0x80) == 0)
  {
LABEL_21:
    if ((v9 & 0x20) == 0)
      goto LABEL_23;
    goto LABEL_22;
  }
LABEL_33:
  self->_siriSuggestionsEnabled = *((_BYTE *)v4 + 111);
  *(_DWORD *)&self->_flags |= 0x80u;
  if ((*((_DWORD *)v4 + 29) & 0x20) != 0)
  {
LABEL_22:
    self->_learnFromAppEnabled = *((_BYTE *)v4 + 109);
    *(_DWORD *)&self->_flags |= 0x20u;
  }
LABEL_23:
  account = self->_account;
  v11 = v4[2];
  if (account)
  {
    if (!v11)
      goto LABEL_38;
    -[GEOLogMsgStateAccount mergeFrom:](account, "mergeFrom:");
  }
  else
  {
    if (!v11)
      goto LABEL_38;
    -[GEOLogMsgEventPeriodicSettingsSummary setAccount:](self, "setAccount:");
  }
  v4 = v22;
LABEL_38:
  deviceConnection = self->_deviceConnection;
  v13 = v4[3];
  if (deviceConnection)
  {
    if (!v13)
      goto LABEL_44;
    -[GEOLogMsgStateDeviceConnection mergeFrom:](deviceConnection, "mergeFrom:");
  }
  else
  {
    if (!v13)
      goto LABEL_44;
    -[GEOLogMsgEventPeriodicSettingsSummary setDeviceConnection:](self, "setDeviceConnection:");
  }
  v4 = v22;
LABEL_44:
  mapsUserSettings = self->_mapsUserSettings;
  v15 = v4[8];
  if (mapsUserSettings)
  {
    if (!v15)
      goto LABEL_50;
    -[GEOLogMsgStateMapsUserSettings mergeFrom:](mapsUserSettings, "mergeFrom:");
  }
  else
  {
    if (!v15)
      goto LABEL_50;
    -[GEOLogMsgEventPeriodicSettingsSummary setMapsUserSettings:](self, "setMapsUserSettings:");
  }
  v4 = v22;
LABEL_50:
  routingSettings = self->_routingSettings;
  v17 = v4[9];
  if (routingSettings)
  {
    if (!v17)
      goto LABEL_56;
    -[GEOLogMsgStateRoutingSettings mergeFrom:](routingSettings, "mergeFrom:");
  }
  else
  {
    if (!v17)
      goto LABEL_56;
    -[GEOLogMsgEventPeriodicSettingsSummary setRoutingSettings:](self, "setRoutingSettings:");
  }
  v4 = v22;
LABEL_56:
  mapsFeatures = self->_mapsFeatures;
  v19 = v4[7];
  if (mapsFeatures)
  {
    if (!v19)
      goto LABEL_62;
    -[GEOLogMsgStateMapsFeatures mergeFrom:](mapsFeatures, "mergeFrom:");
  }
  else
  {
    if (!v19)
      goto LABEL_62;
    -[GEOLogMsgEventPeriodicSettingsSummary setMapsFeatures:](self, "setMapsFeatures:");
  }
  v4 = v22;
LABEL_62:
  deviceSettings = self->_deviceSettings;
  v21 = v4[4];
  if (deviceSettings)
  {
    if (v21)
    {
      -[GEOLogMsgStateDeviceSettings mergeFrom:](deviceSettings, "mergeFrom:");
LABEL_67:
      v4 = v22;
    }
  }
  else if (v21)
  {
    -[GEOLogMsgEventPeriodicSettingsSummary setDeviceSettings:](self, "setDeviceSettings:");
    goto LABEL_67;
  }

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_routingSettings, 0);
  objc_storeStrong((id *)&self->_mapsUserSettings, 0);
  objc_storeStrong((id *)&self->_mapsFeatures, 0);
  objc_storeStrong((id *)&self->_mapUiShown, 0);
  objc_storeStrong((id *)&self->_mapSettings, 0);
  objc_storeStrong((id *)&self->_deviceSettings, 0);
  objc_storeStrong((id *)&self->_deviceConnection, 0);
  objc_storeStrong((id *)&self->_account, 0);
  objc_storeStrong((id *)&self->_reader, 0);
}

@end
