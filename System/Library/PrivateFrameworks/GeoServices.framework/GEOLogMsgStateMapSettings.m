@implementation GEOLogMsgStateMapSettings

- (int)preferredTransportMode
{
  if ((*(_BYTE *)&self->_flags & 0x10) != 0)
    return self->_preferredTransportMode;
  else
    return 0;
}

- (void)setPreferredTransportMode:(int)a3
{
  *(_DWORD *)&self->_flags |= 0x10u;
  self->_preferredTransportMode = a3;
}

- (void)setHasPreferredTransportMode:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 16;
  else
    v3 = 0;
  self->_flags = ($BCC5AE05094F9DBFF15DB1C7A33A3F08)(*(_DWORD *)&self->_flags & 0xFFFFFFEF | v3);
}

- (BOOL)hasPreferredTransportMode
{
  return (*(_BYTE *)&self->_flags >> 4) & 1;
}

- (id)preferredTransportModeAsString:(int)a3
{
  if (a3 < 6)
    return off_1E1C23268[a3];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (int)StringAsPreferredTransportMode:(id)a3
{
  id v3;
  int v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("UNKNOWN_TRANSPORT_MODE")) & 1) != 0)
  {
    v4 = 0;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("DRIVING_MODE")) & 1) != 0)
  {
    v4 = 1;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("WALKING_MODE")) & 1) != 0)
  {
    v4 = 2;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("TRANSIT_MODE")) & 1) != 0)
  {
    v4 = 3;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("RIDESHARE_MODE")) & 1) != 0)
  {
    v4 = 4;
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("CYCLING_MODE")))
  {
    v4 = 5;
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (BOOL)avoidTolls
{
  return self->_avoidTolls;
}

- (void)setAvoidTolls:(BOOL)a3
{
  *(_DWORD *)&self->_flags |= 0x800u;
  self->_avoidTolls = a3;
}

- (void)setHasAvoidTolls:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 2048;
  else
    v3 = 0;
  self->_flags = ($BCC5AE05094F9DBFF15DB1C7A33A3F08)(*(_DWORD *)&self->_flags & 0xFFFFF7FF | v3);
}

- (BOOL)hasAvoidTolls
{
  return (*((unsigned __int8 *)&self->_flags + 1) >> 3) & 1;
}

- (BOOL)avoidHighways
{
  return self->_avoidHighways;
}

- (void)setAvoidHighways:(BOOL)a3
{
  *(_DWORD *)&self->_flags |= 0x100u;
  self->_avoidHighways = a3;
}

- (void)setHasAvoidHighways:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 256;
  else
    v3 = 0;
  self->_flags = ($BCC5AE05094F9DBFF15DB1C7A33A3F08)(*(_DWORD *)&self->_flags & 0xFFFFFEFF | v3);
}

- (BOOL)hasAvoidHighways
{
  return *((_BYTE *)&self->_flags + 1) & 1;
}

- (BOOL)headingEnabled
{
  return self->_headingEnabled;
}

- (void)setHeadingEnabled:(BOOL)a3
{
  *(_DWORD *)&self->_flags |= 0x40000u;
  self->_headingEnabled = a3;
}

- (void)setHasHeadingEnabled:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 0x40000;
  else
    v3 = 0;
  self->_flags = ($BCC5AE05094F9DBFF15DB1C7A33A3F08)(*(_DWORD *)&self->_flags & 0xFFFBFFFF | v3);
}

- (BOOL)hasHeadingEnabled
{
  return (*((unsigned __int8 *)&self->_flags + 2) >> 2) & 1;
}

- (BOOL)speedLimitEnabled
{
  return self->_speedLimitEnabled;
}

- (void)setSpeedLimitEnabled:(BOOL)a3
{
  *(_DWORD *)&self->_flags |= 0x200000u;
  self->_speedLimitEnabled = a3;
}

- (void)setHasSpeedLimitEnabled:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 0x200000;
  else
    v3 = 0;
  self->_flags = ($BCC5AE05094F9DBFF15DB1C7A33A3F08)(*(_DWORD *)&self->_flags & 0xFFDFFFFF | v3);
}

- (BOOL)hasSpeedLimitEnabled
{
  return (*((unsigned __int8 *)&self->_flags + 2) >> 5) & 1;
}

- (int)navVoiceVolume
{
  if ((*(_BYTE *)&self->_flags & 8) != 0)
    return self->_navVoiceVolume;
  else
    return 0;
}

- (void)setNavVoiceVolume:(int)a3
{
  *(_DWORD *)&self->_flags |= 8u;
  self->_navVoiceVolume = a3;
}

- (void)setHasNavVoiceVolume:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 8;
  else
    v3 = 0;
  self->_flags = ($BCC5AE05094F9DBFF15DB1C7A33A3F08)(*(_DWORD *)&self->_flags & 0xFFFFFFF7 | v3);
}

- (BOOL)hasNavVoiceVolume
{
  return (*(_BYTE *)&self->_flags >> 3) & 1;
}

- (id)navVoiceVolumeAsString:(int)a3
{
  if (a3 < 5)
    return off_1E1C22C20[a3];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (int)StringAsNavVoiceVolume:(id)a3
{
  id v3;
  int v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("UNKNOWN_VOICE_VOLUME")) & 1) != 0)
  {
    v4 = 0;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("NO_VOICE")) & 1) != 0)
  {
    v4 = 1;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("LOW_VOLUME")) & 1) != 0)
  {
    v4 = 2;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("NORMAL_VOLUME")) & 1) != 0)
  {
    v4 = 3;
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("LOUD_VOLUME")))
  {
    v4 = 4;
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (BOOL)pauseSpokenAudioEnabled
{
  return self->_pauseSpokenAudioEnabled;
}

- (void)setPauseSpokenAudioEnabled:(BOOL)a3
{
  *(_DWORD *)&self->_flags |= 0x100000u;
  self->_pauseSpokenAudioEnabled = a3;
}

- (void)setHasPauseSpokenAudioEnabled:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 0x100000;
  else
    v3 = 0;
  self->_flags = ($BCC5AE05094F9DBFF15DB1C7A33A3F08)(*(_DWORD *)&self->_flags & 0xFFEFFFFF | v3);
}

- (BOOL)hasPauseSpokenAudioEnabled
{
  return (*((unsigned __int8 *)&self->_flags + 2) >> 4) & 1;
}

- (BOOL)findMyCarEnabled
{
  return self->_findMyCarEnabled;
}

- (void)setFindMyCarEnabled:(BOOL)a3
{
  *(_DWORD *)&self->_flags |= 0x20000u;
  self->_findMyCarEnabled = a3;
}

- (void)setHasFindMyCarEnabled:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 0x20000;
  else
    v3 = 0;
  self->_flags = ($BCC5AE05094F9DBFF15DB1C7A33A3F08)(*(_DWORD *)&self->_flags & 0xFFFDFFFF | v3);
}

- (BOOL)hasFindMyCarEnabled
{
  return (*((unsigned __int8 *)&self->_flags + 2) >> 1) & 1;
}

- (BOOL)trafficEnabled
{
  return self->_trafficEnabled;
}

- (void)setTrafficEnabled:(BOOL)a3
{
  *(_DWORD *)&self->_flags |= 0x400000u;
  self->_trafficEnabled = a3;
}

- (void)setHasTrafficEnabled:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 0x400000;
  else
    v3 = 0;
  self->_flags = ($BCC5AE05094F9DBFF15DB1C7A33A3F08)(*(_DWORD *)&self->_flags & 0xFFBFFFFF | v3);
}

- (BOOL)hasTrafficEnabled
{
  return (*((unsigned __int8 *)&self->_flags + 2) >> 6) & 1;
}

- (BOOL)labelEnabled
{
  return self->_labelEnabled;
}

- (void)setLabelEnabled:(BOOL)a3
{
  *(_DWORD *)&self->_flags |= 0x80000u;
  self->_labelEnabled = a3;
}

- (void)setHasLabelEnabled:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 0x80000;
  else
    v3 = 0;
  self->_flags = ($BCC5AE05094F9DBFF15DB1C7A33A3F08)(*(_DWORD *)&self->_flags & 0xFFF7FFFF | v3);
}

- (BOOL)hasLabelEnabled
{
  return (*((unsigned __int8 *)&self->_flags + 2) >> 3) & 1;
}

- (BOOL)avoidHills
{
  return self->_avoidHills;
}

- (void)setAvoidHills:(BOOL)a3
{
  *(_DWORD *)&self->_flags |= 0x200u;
  self->_avoidHills = a3;
}

- (void)setHasAvoidHills:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 512;
  else
    v3 = 0;
  self->_flags = ($BCC5AE05094F9DBFF15DB1C7A33A3F08)(*(_DWORD *)&self->_flags & 0xFFFFFDFF | v3);
}

- (BOOL)hasAvoidHills
{
  return (*((unsigned __int8 *)&self->_flags + 1) >> 1) & 1;
}

- (BOOL)avoidStairs
{
  return self->_avoidStairs;
}

- (void)setAvoidStairs:(BOOL)a3
{
  *(_DWORD *)&self->_flags |= 0x400u;
  self->_avoidStairs = a3;
}

- (void)setHasAvoidStairs:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 1024;
  else
    v3 = 0;
  self->_flags = ($BCC5AE05094F9DBFF15DB1C7A33A3F08)(*(_DWORD *)&self->_flags & 0xFFFFFBFF | v3);
}

- (BOOL)hasAvoidStairs
{
  return (*((unsigned __int8 *)&self->_flags + 1) >> 2) & 1;
}

- (BOOL)avoidBusyRoads
{
  return self->_avoidBusyRoads;
}

- (void)setAvoidBusyRoads:(BOOL)a3
{
  *(_DWORD *)&self->_flags |= 0x80u;
  self->_avoidBusyRoads = a3;
}

- (void)setHasAvoidBusyRoads:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 128;
  else
    v3 = 0;
  self->_flags = ($BCC5AE05094F9DBFF15DB1C7A33A3F08)(*(_DWORD *)&self->_flags & 0xFFFFFF7F | v3);
}

- (BOOL)hasAvoidBusyRoads
{
  return *(_BYTE *)&self->_flags >> 7;
}

- (int)locationType
{
  if ((*(_BYTE *)&self->_flags & 4) != 0)
    return self->_locationType;
  else
    return 0;
}

- (void)setLocationType:(int)a3
{
  *(_DWORD *)&self->_flags |= 4u;
  self->_locationType = a3;
}

- (void)setHasLocationType:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 4;
  else
    v3 = 0;
  self->_flags = ($BCC5AE05094F9DBFF15DB1C7A33A3F08)(*(_DWORD *)&self->_flags & 0xFFFFFFFB | v3);
}

- (BOOL)hasLocationType
{
  return (*(_BYTE *)&self->_flags >> 2) & 1;
}

- (id)locationTypeAsString:(int)a3
{
  if (a3 < 4)
    return off_1E1C22C48[a3];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (int)StringAsLocationType:(id)a3
{
  id v3;
  int v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("UNKNOWN")) & 1) != 0)
  {
    v4 = 0;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("NO_AUTH")) & 1) != 0)
  {
    v4 = 1;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("PRECISE")) & 1) != 0)
  {
    v4 = 2;
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("COARSE")))
  {
    v4 = 3;
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (BOOL)eBike
{
  return self->_eBike;
}

- (void)setEBike:(BOOL)a3
{
  *(_DWORD *)&self->_flags |= 0x10000u;
  self->_eBike = a3;
}

- (void)setHasEBike:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 0x10000;
  else
    v3 = 0;
  self->_flags = ($BCC5AE05094F9DBFF15DB1C7A33A3F08)(*(_DWORD *)&self->_flags & 0xFFFEFFFF | v3);
}

- (BOOL)hasEBike
{
  return *((_BYTE *)&self->_flags + 2) & 1;
}

- (NSMutableArray)navVoiceSettings
{
  return self->_navVoiceSettings;
}

- (void)setNavVoiceSettings:(id)a3
{
  objc_storeStrong((id *)&self->_navVoiceSettings, a3);
}

- (void)clearNavVoiceSettings
{
  -[NSMutableArray removeAllObjects](self->_navVoiceSettings, "removeAllObjects");
}

- (void)addNavVoiceSettings:(id)a3
{
  id v4;
  NSMutableArray *navVoiceSettings;
  NSMutableArray *v6;
  NSMutableArray *v7;
  id v8;

  v4 = a3;
  navVoiceSettings = self->_navVoiceSettings;
  v8 = v4;
  if (!navVoiceSettings)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v7 = self->_navVoiceSettings;
    self->_navVoiceSettings = v6;

    v4 = v8;
    navVoiceSettings = self->_navVoiceSettings;
  }
  -[NSMutableArray addObject:](navVoiceSettings, "addObject:", v4);

}

- (unint64_t)navVoiceSettingsCount
{
  return -[NSMutableArray count](self->_navVoiceSettings, "count");
}

- (id)navVoiceSettingsAtIndex:(unint64_t)a3
{
  return (id)-[NSMutableArray objectAtIndex:](self->_navVoiceSettings, "objectAtIndex:", a3);
}

+ (Class)navVoiceSettingsType
{
  return (Class)objc_opt_class();
}

- (BOOL)hFPEnabled
{
  return self->_hFPEnabled;
}

- (void)setHFPEnabled:(BOOL)a3
{
  *(_DWORD *)&self->_flags |= 0x40u;
  self->_hFPEnabled = a3;
}

- (void)setHasHFPEnabled:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 64;
  else
    v3 = 0;
  self->_flags = ($BCC5AE05094F9DBFF15DB1C7A33A3F08)(*(_DWORD *)&self->_flags & 0xFFFFFFBF | v3);
}

- (BOOL)hasHFPEnabled
{
  return (*(_BYTE *)&self->_flags >> 6) & 1;
}

- (int)drivingVoiceSettings
{
  if ((*(_BYTE *)&self->_flags & 2) != 0)
    return self->_drivingVoiceSettings;
  else
    return 0;
}

- (void)setDrivingVoiceSettings:(int)a3
{
  *(_DWORD *)&self->_flags |= 2u;
  self->_drivingVoiceSettings = a3;
}

- (void)setHasDrivingVoiceSettings:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  self->_flags = ($BCC5AE05094F9DBFF15DB1C7A33A3F08)(*(_DWORD *)&self->_flags & 0xFFFFFFFD | v3);
}

- (BOOL)hasDrivingVoiceSettings
{
  return (*(_BYTE *)&self->_flags >> 1) & 1;
}

- (id)drivingVoiceSettingsAsString:(int)a3
{
  if (a3 < 4)
    return off_1E1C23248[a3];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (int)StringAsDrivingVoiceSettings:(id)a3
{
  id v3;
  int v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("LEVEL_UNKNOWN")) & 1) != 0)
  {
    v4 = 0;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("LEVEL_NONE")) & 1) != 0)
  {
    v4 = 1;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("LEVEL_INCIDENTS")) & 1) != 0)
  {
    v4 = 2;
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("LEVEL_FULL")))
  {
    v4 = 3;
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (int)walkingVoiceSettings
{
  if ((*(_BYTE *)&self->_flags & 0x20) != 0)
    return self->_walkingVoiceSettings;
  else
    return 0;
}

- (void)setWalkingVoiceSettings:(int)a3
{
  *(_DWORD *)&self->_flags |= 0x20u;
  self->_walkingVoiceSettings = a3;
}

- (void)setHasWalkingVoiceSettings:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 32;
  else
    v3 = 0;
  self->_flags = ($BCC5AE05094F9DBFF15DB1C7A33A3F08)(*(_DWORD *)&self->_flags & 0xFFFFFFDF | v3);
}

- (BOOL)hasWalkingVoiceSettings
{
  return (*(_BYTE *)&self->_flags >> 5) & 1;
}

- (id)walkingVoiceSettingsAsString:(int)a3
{
  if (a3 < 4)
    return off_1E1C23248[a3];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (int)StringAsWalkingVoiceSettings:(id)a3
{
  id v3;
  int v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("LEVEL_UNKNOWN")) & 1) != 0)
  {
    v4 = 0;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("LEVEL_NONE")) & 1) != 0)
  {
    v4 = 1;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("LEVEL_INCIDENTS")) & 1) != 0)
  {
    v4 = 2;
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("LEVEL_FULL")))
  {
    v4 = 3;
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (int)cyclingVoiceSettings
{
  if ((*(_BYTE *)&self->_flags & 1) != 0)
    return self->_cyclingVoiceSettings;
  else
    return 0;
}

- (void)setCyclingVoiceSettings:(int)a3
{
  *(_DWORD *)&self->_flags |= 1u;
  self->_cyclingVoiceSettings = a3;
}

- (void)setHasCyclingVoiceSettings:(BOOL)a3
{
  self->_flags = ($BCC5AE05094F9DBFF15DB1C7A33A3F08)(*(_DWORD *)&self->_flags & 0xFFFFFFFE | a3);
}

- (BOOL)hasCyclingVoiceSettings
{
  return *(_DWORD *)&self->_flags & 1;
}

- (id)cyclingVoiceSettingsAsString:(int)a3
{
  if (a3 < 4)
    return off_1E1C23248[a3];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (int)StringAsCyclingVoiceSettings:(id)a3
{
  id v3;
  int v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("LEVEL_UNKNOWN")) & 1) != 0)
  {
    v4 = 0;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("LEVEL_NONE")) & 1) != 0)
  {
    v4 = 1;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("LEVEL_INCIDENTS")) & 1) != 0)
  {
    v4 = 2;
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("LEVEL_FULL")))
  {
    v4 = 3;
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (BOOL)walkingAvoidHills
{
  return self->_walkingAvoidHills;
}

- (void)setWalkingAvoidHills:(BOOL)a3
{
  *(_DWORD *)&self->_flags |= 0x1000000u;
  self->_walkingAvoidHills = a3;
}

- (void)setHasWalkingAvoidHills:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 0x1000000;
  else
    v3 = 0;
  self->_flags = ($BCC5AE05094F9DBFF15DB1C7A33A3F08)(*(_DWORD *)&self->_flags & 0xFEFFFFFF | v3);
}

- (BOOL)hasWalkingAvoidHills
{
  return *((_BYTE *)&self->_flags + 3) & 1;
}

- (BOOL)walkingAvoidBusyRoads
{
  return self->_walkingAvoidBusyRoads;
}

- (void)setWalkingAvoidBusyRoads:(BOOL)a3
{
  *(_DWORD *)&self->_flags |= 0x800000u;
  self->_walkingAvoidBusyRoads = a3;
}

- (void)setHasWalkingAvoidBusyRoads:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 0x800000;
  else
    v3 = 0;
  self->_flags = ($BCC5AE05094F9DBFF15DB1C7A33A3F08)(*(_DWORD *)&self->_flags & 0xFF7FFFFF | v3);
}

- (BOOL)hasWalkingAvoidBusyRoads
{
  return *((unsigned __int8 *)&self->_flags + 2) >> 7;
}

- (BOOL)walkingAvoidStairs
{
  return self->_walkingAvoidStairs;
}

- (void)setWalkingAvoidStairs:(BOOL)a3
{
  *(_DWORD *)&self->_flags |= 0x2000000u;
  self->_walkingAvoidStairs = a3;
}

- (void)setHasWalkingAvoidStairs:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 0x2000000;
  else
    v3 = 0;
  self->_flags = ($BCC5AE05094F9DBFF15DB1C7A33A3F08)(*(_DWORD *)&self->_flags & 0xFDFFFFFF | v3);
}

- (BOOL)hasWalkingAvoidStairs
{
  return (*((unsigned __int8 *)&self->_flags + 3) >> 1) & 1;
}

- (BOOL)bikingAvoidHills
{
  return self->_bikingAvoidHills;
}

- (void)setBikingAvoidHills:(BOOL)a3
{
  *(_DWORD *)&self->_flags |= 0x2000u;
  self->_bikingAvoidHills = a3;
}

- (void)setHasBikingAvoidHills:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 0x2000;
  else
    v3 = 0;
  self->_flags = ($BCC5AE05094F9DBFF15DB1C7A33A3F08)(*(_DWORD *)&self->_flags & 0xFFFFDFFF | v3);
}

- (BOOL)hasBikingAvoidHills
{
  return (*((unsigned __int8 *)&self->_flags + 1) >> 5) & 1;
}

- (BOOL)bikingAvoidStairs
{
  return self->_bikingAvoidStairs;
}

- (void)setBikingAvoidStairs:(BOOL)a3
{
  *(_DWORD *)&self->_flags |= 0x4000u;
  self->_bikingAvoidStairs = a3;
}

- (void)setHasBikingAvoidStairs:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 0x4000;
  else
    v3 = 0;
  self->_flags = ($BCC5AE05094F9DBFF15DB1C7A33A3F08)(*(_DWORD *)&self->_flags & 0xFFFFBFFF | v3);
}

- (BOOL)hasBikingAvoidStairs
{
  return (*((unsigned __int8 *)&self->_flags + 1) >> 6) & 1;
}

- (BOOL)bikingAvoidBusyRoads
{
  return self->_bikingAvoidBusyRoads;
}

- (void)setBikingAvoidBusyRoads:(BOOL)a3
{
  *(_DWORD *)&self->_flags |= 0x1000u;
  self->_bikingAvoidBusyRoads = a3;
}

- (void)setHasBikingAvoidBusyRoads:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 4096;
  else
    v3 = 0;
  self->_flags = ($BCC5AE05094F9DBFF15DB1C7A33A3F08)(*(_DWORD *)&self->_flags & 0xFFFFEFFF | v3);
}

- (BOOL)hasBikingAvoidBusyRoads
{
  return (*((unsigned __int8 *)&self->_flags + 1) >> 4) & 1;
}

- (BOOL)directionsWakeDevice
{
  return self->_directionsWakeDevice;
}

- (void)setDirectionsWakeDevice:(BOOL)a3
{
  *(_DWORD *)&self->_flags |= 0x8000u;
  self->_directionsWakeDevice = a3;
}

- (void)setHasDirectionsWakeDevice:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 0x8000;
  else
    v3 = 0;
  self->_flags = ($BCC5AE05094F9DBFF15DB1C7A33A3F08)(*(_DWORD *)&self->_flags & 0xFFFF7FFF | v3);
}

- (BOOL)hasDirectionsWakeDevice
{
  return *((unsigned __int8 *)&self->_flags + 1) >> 7;
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
  v8.super_class = (Class)GEOLogMsgStateMapSettings;
  -[GEOLogMsgStateMapSettings description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[GEOLogMsgStateMapSettings dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEOLogMsgStateMapSettings _dictionaryRepresentation:]((uint64_t)self, 0);
}

- (id)_dictionaryRepresentation:(uint64_t)a1
{
  void *v4;
  int v5;
  uint64_t v6;
  __CFString *v7;
  const __CFString *v8;
  void *v9;
  const __CFString *v10;
  void *v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t i;
  void *v17;
  id v18;
  const __CFString *v19;
  int v20;
  void *v21;
  const __CFString *v22;
  id v23;
  void *v25;
  const __CFString *v26;
  void *v27;
  const __CFString *v28;
  void *v29;
  const __CFString *v30;
  void *v31;
  const __CFString *v32;
  uint64_t v33;
  __CFString *v34;
  void *v35;
  const __CFString *v36;
  uint64_t v37;
  __CFString *v38;
  const __CFString *v39;
  void *v40;
  const __CFString *v41;
  void *v42;
  const __CFString *v43;
  void *v44;
  const __CFString *v45;
  void *v46;
  const __CFString *v47;
  void *v48;
  const __CFString *v49;
  void *v50;
  const __CFString *v51;
  void *v52;
  const __CFString *v53;
  uint64_t v54;
  __CFString *v55;
  const __CFString *v56;
  uint64_t v57;
  __CFString *v58;
  const __CFString *v59;
  const __CFString *v60;
  uint64_t v61;
  __CFString *v62;
  const __CFString *v63;
  void *v64;
  const __CFString *v65;
  void *v66;
  const __CFString *v67;
  void *v68;
  const __CFString *v69;
  void *v70;
  const __CFString *v71;
  void *v72;
  const __CFString *v73;
  void *v74;
  const __CFString *v75;
  __int128 v76;
  __int128 v77;
  __int128 v78;
  __int128 v79;
  _BYTE v80[128];
  uint64_t v81;

  v81 = *MEMORY[0x1E0C80C00];
  if (a1)
  {
    objc_msgSend((id)a1, "readAll:", 1);
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = *(_DWORD *)(a1 + 60);
    if ((v5 & 0x10) != 0)
    {
      v6 = *(int *)(a1 + 32);
      if (v6 >= 6)
      {
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(int *)(a1 + 32));
        v7 = (__CFString *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v7 = off_1E1C23268[v6];
      }
      if (a2)
        v8 = CFSTR("preferredTransportMode");
      else
        v8 = CFSTR("preferred_transport_mode");
      objc_msgSend(v4, "setObject:forKey:", v7, v8);

      v5 = *(_DWORD *)(a1 + 60);
    }
    if ((v5 & 0x800) != 0)
    {
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", *(unsigned __int8 *)(a1 + 45));
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      if (a2)
        v26 = CFSTR("avoidTolls");
      else
        v26 = CFSTR("avoid_tolls");
      objc_msgSend(v4, "setObject:forKey:", v25, v26);

      v5 = *(_DWORD *)(a1 + 60);
      if ((v5 & 0x100) == 0)
      {
LABEL_12:
        if ((v5 & 0x40000) == 0)
          goto LABEL_13;
        goto LABEL_67;
      }
    }
    else if ((v5 & 0x100) == 0)
    {
      goto LABEL_12;
    }
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", *(unsigned __int8 *)(a1 + 42));
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    if (a2)
      v28 = CFSTR("avoidHighways");
    else
      v28 = CFSTR("avoid_highways");
    objc_msgSend(v4, "setObject:forKey:", v27, v28);

    v5 = *(_DWORD *)(a1 + 60);
    if ((v5 & 0x40000) == 0)
    {
LABEL_13:
      if ((v5 & 0x200000) == 0)
        goto LABEL_14;
      goto LABEL_71;
    }
LABEL_67:
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", *(unsigned __int8 *)(a1 + 52));
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    if (a2)
      v30 = CFSTR("headingEnabled");
    else
      v30 = CFSTR("heading_enabled");
    objc_msgSend(v4, "setObject:forKey:", v29, v30);

    v5 = *(_DWORD *)(a1 + 60);
    if ((v5 & 0x200000) == 0)
    {
LABEL_14:
      if ((v5 & 8) == 0)
        goto LABEL_15;
      goto LABEL_75;
    }
LABEL_71:
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", *(unsigned __int8 *)(a1 + 55));
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    if (a2)
      v32 = CFSTR("speedLimitEnabled");
    else
      v32 = CFSTR("speed_limit_enabled");
    objc_msgSend(v4, "setObject:forKey:", v31, v32);

    v5 = *(_DWORD *)(a1 + 60);
    if ((v5 & 8) == 0)
    {
LABEL_15:
      if ((v5 & 0x100000) == 0)
        goto LABEL_16;
      goto LABEL_88;
    }
LABEL_75:
    v33 = *(int *)(a1 + 28);
    if (v33 >= 5)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(int *)(a1 + 28));
      v34 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v34 = off_1E1C22C20[v33];
    }
    if (a2)
      v39 = CFSTR("navVoiceVolume");
    else
      v39 = CFSTR("nav_voice_volume");
    objc_msgSend(v4, "setObject:forKey:", v34, v39);

    v5 = *(_DWORD *)(a1 + 60);
    if ((v5 & 0x100000) == 0)
    {
LABEL_16:
      if ((v5 & 0x20000) == 0)
        goto LABEL_17;
      goto LABEL_92;
    }
LABEL_88:
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", *(unsigned __int8 *)(a1 + 54));
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    if (a2)
      v41 = CFSTR("pauseSpokenAudioEnabled");
    else
      v41 = CFSTR("pause_spoken_audio_enabled");
    objc_msgSend(v4, "setObject:forKey:", v40, v41);

    v5 = *(_DWORD *)(a1 + 60);
    if ((v5 & 0x20000) == 0)
    {
LABEL_17:
      if ((v5 & 0x400000) == 0)
        goto LABEL_18;
      goto LABEL_96;
    }
LABEL_92:
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", *(unsigned __int8 *)(a1 + 51));
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    if (a2)
      v43 = CFSTR("findMyCarEnabled");
    else
      v43 = CFSTR("find_my_car_enabled");
    objc_msgSend(v4, "setObject:forKey:", v42, v43);

    v5 = *(_DWORD *)(a1 + 60);
    if ((v5 & 0x400000) == 0)
    {
LABEL_18:
      if ((v5 & 0x80000) == 0)
        goto LABEL_19;
      goto LABEL_100;
    }
LABEL_96:
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", *(unsigned __int8 *)(a1 + 56));
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    if (a2)
      v45 = CFSTR("trafficEnabled");
    else
      v45 = CFSTR("traffic_enabled");
    objc_msgSend(v4, "setObject:forKey:", v44, v45);

    v5 = *(_DWORD *)(a1 + 60);
    if ((v5 & 0x80000) == 0)
    {
LABEL_19:
      if ((v5 & 0x200) == 0)
        goto LABEL_20;
      goto LABEL_104;
    }
LABEL_100:
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", *(unsigned __int8 *)(a1 + 53));
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    if (a2)
      v47 = CFSTR("labelEnabled");
    else
      v47 = CFSTR("label_enabled");
    objc_msgSend(v4, "setObject:forKey:", v46, v47);

    v5 = *(_DWORD *)(a1 + 60);
    if ((v5 & 0x200) == 0)
    {
LABEL_20:
      if ((v5 & 0x400) == 0)
        goto LABEL_21;
      goto LABEL_108;
    }
LABEL_104:
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", *(unsigned __int8 *)(a1 + 43));
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    if (a2)
      v49 = CFSTR("avoidHills");
    else
      v49 = CFSTR("avoid_hills");
    objc_msgSend(v4, "setObject:forKey:", v48, v49);

    v5 = *(_DWORD *)(a1 + 60);
    if ((v5 & 0x400) == 0)
    {
LABEL_21:
      if ((v5 & 0x80) == 0)
        goto LABEL_22;
      goto LABEL_112;
    }
LABEL_108:
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", *(unsigned __int8 *)(a1 + 44));
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    if (a2)
      v51 = CFSTR("avoidStairs");
    else
      v51 = CFSTR("avoid_stairs");
    objc_msgSend(v4, "setObject:forKey:", v50, v51);

    v5 = *(_DWORD *)(a1 + 60);
    if ((v5 & 0x80) == 0)
    {
LABEL_22:
      if ((v5 & 4) == 0)
        goto LABEL_23;
      goto LABEL_116;
    }
LABEL_112:
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", *(unsigned __int8 *)(a1 + 41));
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    if (a2)
      v53 = CFSTR("avoidBusyRoads");
    else
      v53 = CFSTR("avoid_busy_roads");
    objc_msgSend(v4, "setObject:forKey:", v52, v53);

    v5 = *(_DWORD *)(a1 + 60);
    if ((v5 & 4) == 0)
    {
LABEL_23:
      if ((v5 & 0x10000) == 0)
        goto LABEL_28;
      goto LABEL_24;
    }
LABEL_116:
    v54 = *(int *)(a1 + 24);
    if (v54 >= 4)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(int *)(a1 + 24));
      v55 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v55 = off_1E1C22C48[v54];
    }
    if (a2)
      v59 = CFSTR("locationType");
    else
      v59 = CFSTR("location_type");
    objc_msgSend(v4, "setObject:forKey:", v55, v59);

    if ((*(_DWORD *)(a1 + 60) & 0x10000) == 0)
    {
LABEL_28:
      if (objc_msgSend(*(id *)(a1 + 8), "count"))
      {
        v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(*(id *)(a1 + 8), "count"));
        v76 = 0u;
        v77 = 0u;
        v78 = 0u;
        v79 = 0u;
        v12 = *(id *)(a1 + 8);
        v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v76, v80, 16);
        if (v13)
        {
          v14 = v13;
          v15 = *(_QWORD *)v77;
          do
          {
            for (i = 0; i != v14; ++i)
            {
              if (*(_QWORD *)v77 != v15)
                objc_enumerationMutation(v12);
              v17 = *(void **)(*((_QWORD *)&v76 + 1) + 8 * i);
              if ((a2 & 1) != 0)
                objc_msgSend(v17, "jsonRepresentation");
              else
                objc_msgSend(v17, "dictionaryRepresentation");
              v18 = (id)objc_claimAutoreleasedReturnValue();

              objc_msgSend(v11, "addObject:", v18);
            }
            v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v76, v80, 16);
          }
          while (v14);
        }

        if (a2)
          v19 = CFSTR("navVoiceSettings");
        else
          v19 = CFSTR("nav_voice_settings");
        objc_msgSend(v4, "setObject:forKey:", v11, v19);

      }
      v20 = *(_DWORD *)(a1 + 60);
      if ((v20 & 0x40) != 0)
      {
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", *(unsigned __int8 *)(a1 + 40));
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        if (a2)
          v36 = CFSTR("hFPEnabled");
        else
          v36 = CFSTR("HFP_enabled");
        objc_msgSend(v4, "setObject:forKey:", v35, v36);

        v20 = *(_DWORD *)(a1 + 60);
        if ((v20 & 2) == 0)
        {
LABEL_45:
          if ((v20 & 0x20) == 0)
            goto LABEL_46;
          goto LABEL_123;
        }
      }
      else if ((v20 & 2) == 0)
      {
        goto LABEL_45;
      }
      v37 = *(int *)(a1 + 20);
      if (v37 >= 4)
      {
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(int *)(a1 + 20));
        v38 = (__CFString *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v38 = off_1E1C23248[v37];
      }
      if (a2)
        v56 = CFSTR("drivingVoiceSettings");
      else
        v56 = CFSTR("driving_voice_settings");
      objc_msgSend(v4, "setObject:forKey:", v38, v56);

      v20 = *(_DWORD *)(a1 + 60);
      if ((v20 & 0x20) == 0)
      {
LABEL_46:
        if ((v20 & 1) == 0)
          goto LABEL_47;
        goto LABEL_136;
      }
LABEL_123:
      v57 = *(int *)(a1 + 36);
      if (v57 >= 4)
      {
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(int *)(a1 + 36));
        v58 = (__CFString *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v58 = off_1E1C23248[v57];
      }
      if (a2)
        v60 = CFSTR("walkingVoiceSettings");
      else
        v60 = CFSTR("walking_voice_settings");
      objc_msgSend(v4, "setObject:forKey:", v58, v60);

      v20 = *(_DWORD *)(a1 + 60);
      if ((v20 & 1) == 0)
      {
LABEL_47:
        if ((v20 & 0x1000000) == 0)
          goto LABEL_48;
        goto LABEL_143;
      }
LABEL_136:
      v61 = *(int *)(a1 + 16);
      if (v61 >= 4)
      {
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(int *)(a1 + 16));
        v62 = (__CFString *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v62 = off_1E1C23248[v61];
      }
      if (a2)
        v63 = CFSTR("cyclingVoiceSettings");
      else
        v63 = CFSTR("cycling_voice_settings");
      objc_msgSend(v4, "setObject:forKey:", v62, v63);

      v20 = *(_DWORD *)(a1 + 60);
      if ((v20 & 0x1000000) == 0)
      {
LABEL_48:
        if ((v20 & 0x800000) == 0)
          goto LABEL_49;
        goto LABEL_147;
      }
LABEL_143:
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", *(unsigned __int8 *)(a1 + 58));
      v64 = (void *)objc_claimAutoreleasedReturnValue();
      if (a2)
        v65 = CFSTR("walkingAvoidHills");
      else
        v65 = CFSTR("walking_avoid_hills");
      objc_msgSend(v4, "setObject:forKey:", v64, v65);

      v20 = *(_DWORD *)(a1 + 60);
      if ((v20 & 0x800000) == 0)
      {
LABEL_49:
        if ((v20 & 0x2000000) == 0)
          goto LABEL_50;
        goto LABEL_151;
      }
LABEL_147:
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", *(unsigned __int8 *)(a1 + 57));
      v66 = (void *)objc_claimAutoreleasedReturnValue();
      if (a2)
        v67 = CFSTR("walkingAvoidBusyRoads");
      else
        v67 = CFSTR("walking_avoid_busy_roads");
      objc_msgSend(v4, "setObject:forKey:", v66, v67);

      v20 = *(_DWORD *)(a1 + 60);
      if ((v20 & 0x2000000) == 0)
      {
LABEL_50:
        if ((v20 & 0x2000) == 0)
          goto LABEL_51;
        goto LABEL_155;
      }
LABEL_151:
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", *(unsigned __int8 *)(a1 + 59));
      v68 = (void *)objc_claimAutoreleasedReturnValue();
      if (a2)
        v69 = CFSTR("walkingAvoidStairs");
      else
        v69 = CFSTR("walking_avoid_stairs");
      objc_msgSend(v4, "setObject:forKey:", v68, v69);

      v20 = *(_DWORD *)(a1 + 60);
      if ((v20 & 0x2000) == 0)
      {
LABEL_51:
        if ((v20 & 0x4000) == 0)
          goto LABEL_52;
        goto LABEL_159;
      }
LABEL_155:
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", *(unsigned __int8 *)(a1 + 47));
      v70 = (void *)objc_claimAutoreleasedReturnValue();
      if (a2)
        v71 = CFSTR("bikingAvoidHills");
      else
        v71 = CFSTR("biking_avoid_hills");
      objc_msgSend(v4, "setObject:forKey:", v70, v71);

      v20 = *(_DWORD *)(a1 + 60);
      if ((v20 & 0x4000) == 0)
      {
LABEL_52:
        if ((v20 & 0x1000) == 0)
          goto LABEL_53;
        goto LABEL_163;
      }
LABEL_159:
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", *(unsigned __int8 *)(a1 + 48));
      v72 = (void *)objc_claimAutoreleasedReturnValue();
      if (a2)
        v73 = CFSTR("bikingAvoidStairs");
      else
        v73 = CFSTR("biking_avoid_stairs");
      objc_msgSend(v4, "setObject:forKey:", v72, v73);

      v20 = *(_DWORD *)(a1 + 60);
      if ((v20 & 0x1000) == 0)
      {
LABEL_53:
        if ((v20 & 0x8000) == 0)
        {
LABEL_58:
          v23 = v4;

          return v23;
        }
LABEL_54:
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", *(unsigned __int8 *)(a1 + 49));
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        if (a2)
          v22 = CFSTR("directionsWakeDevice");
        else
          v22 = CFSTR("directions_wake_device");
        objc_msgSend(v4, "setObject:forKey:", v21, v22);

        goto LABEL_58;
      }
LABEL_163:
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", *(unsigned __int8 *)(a1 + 46));
      v74 = (void *)objc_claimAutoreleasedReturnValue();
      if (a2)
        v75 = CFSTR("bikingAvoidBusyRoads");
      else
        v75 = CFSTR("biking_avoid_busy_roads");
      objc_msgSend(v4, "setObject:forKey:", v74, v75);

      if ((*(_DWORD *)(a1 + 60) & 0x8000) == 0)
        goto LABEL_58;
      goto LABEL_54;
    }
LABEL_24:
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", *(unsigned __int8 *)(a1 + 50));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (a2)
      v10 = CFSTR("eBike");
    else
      v10 = CFSTR("e_bike");
    objc_msgSend(v4, "setObject:forKey:", v9, v10);

    goto LABEL_28;
  }
  return 0;
}

- (id)jsonRepresentation
{
  return -[GEOLogMsgStateMapSettings _dictionaryRepresentation:]((uint64_t)self, 1);
}

- (GEOLogMsgStateMapSettings)initWithDictionary:(id)a3
{
  return (GEOLogMsgStateMapSettings *)-[GEOLogMsgStateMapSettings _initWithDictionary:isJSON:](self, a3, 0);
}

- (id)_initWithDictionary:(int)a3 isJSON:
{
  id v5;
  const __CFString *v6;
  void *v7;
  id v8;
  uint64_t v9;
  const __CFString *v10;
  void *v11;
  const __CFString *v12;
  void *v13;
  const __CFString *v14;
  void *v15;
  const __CFString *v16;
  void *v17;
  const __CFString *v18;
  void *v19;
  id v20;
  uint64_t v21;
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
  const __CFString *v34;
  void *v35;
  const __CFString *v36;
  void *v37;
  id v38;
  uint64_t v39;
  const __CFString *v40;
  void *v41;
  const __CFString *v42;
  void *v43;
  id v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t i;
  uint64_t v49;
  GEONavVoiceGuidanceSettings *v50;
  uint64_t v51;
  void *v52;
  const __CFString *v53;
  void *v54;
  const __CFString *v55;
  void *v56;
  id v57;
  uint64_t v58;
  const __CFString *v59;
  void *v60;
  id v61;
  uint64_t v62;
  const __CFString *v63;
  void *v64;
  id v65;
  uint64_t v66;
  const __CFString *v67;
  void *v68;
  const __CFString *v69;
  void *v70;
  const __CFString *v71;
  void *v72;
  const __CFString *v73;
  void *v74;
  const __CFString *v75;
  void *v76;
  const __CFString *v77;
  void *v78;
  const __CFString *v79;
  void *v80;
  id v82;
  __int128 v83;
  __int128 v84;
  __int128 v85;
  __int128 v86;
  _BYTE v87[128];
  uint64_t v88;

  v88 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  if (!a1)
    goto LABEL_229;
  a1 = (id)objc_msgSend(a1, "init");

  if (!a1)
    goto LABEL_229;
  if (a3)
    v6 = CFSTR("preferredTransportMode");
  else
    v6 = CFSTR("preferred_transport_mode");
  objc_msgSend(v5, "objectForKeyedSubscript:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v8 = v7;
    if ((objc_msgSend(v8, "isEqualToString:", CFSTR("UNKNOWN_TRANSPORT_MODE")) & 1) != 0)
    {
      v9 = 0;
    }
    else if ((objc_msgSend(v8, "isEqualToString:", CFSTR("DRIVING_MODE")) & 1) != 0)
    {
      v9 = 1;
    }
    else if ((objc_msgSend(v8, "isEqualToString:", CFSTR("WALKING_MODE")) & 1) != 0)
    {
      v9 = 2;
    }
    else if ((objc_msgSend(v8, "isEqualToString:", CFSTR("TRANSIT_MODE")) & 1) != 0)
    {
      v9 = 3;
    }
    else if ((objc_msgSend(v8, "isEqualToString:", CFSTR("RIDESHARE_MODE")) & 1) != 0)
    {
      v9 = 4;
    }
    else if (objc_msgSend(v8, "isEqualToString:", CFSTR("CYCLING_MODE")))
    {
      v9 = 5;
    }
    else
    {
      v9 = 0;
    }

  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
      goto LABEL_24;
    v9 = objc_msgSend(v7, "intValue");
  }
  objc_msgSend(a1, "setPreferredTransportMode:", v9);
LABEL_24:

  if (a3)
    v10 = CFSTR("avoidTolls");
  else
    v10 = CFSTR("avoid_tolls");
  objc_msgSend(v5, "objectForKeyedSubscript:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    objc_msgSend(a1, "setAvoidTolls:", objc_msgSend(v11, "BOOLValue"));

  if (a3)
    v12 = CFSTR("avoidHighways");
  else
    v12 = CFSTR("avoid_highways");
  objc_msgSend(v5, "objectForKeyedSubscript:", v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    objc_msgSend(a1, "setAvoidHighways:", objc_msgSend(v13, "BOOLValue"));

  if (a3)
    v14 = CFSTR("headingEnabled");
  else
    v14 = CFSTR("heading_enabled");
  objc_msgSend(v5, "objectForKeyedSubscript:", v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    objc_msgSend(a1, "setHeadingEnabled:", objc_msgSend(v15, "BOOLValue"));

  if (a3)
    v16 = CFSTR("speedLimitEnabled");
  else
    v16 = CFSTR("speed_limit_enabled");
  objc_msgSend(v5, "objectForKeyedSubscript:", v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    objc_msgSend(a1, "setSpeedLimitEnabled:", objc_msgSend(v17, "BOOLValue"));

  if (a3)
    v18 = CFSTR("navVoiceVolume");
  else
    v18 = CFSTR("nav_voice_volume");
  objc_msgSend(v5, "objectForKeyedSubscript:", v18);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v20 = v19;
    if ((objc_msgSend(v20, "isEqualToString:", CFSTR("UNKNOWN_VOICE_VOLUME")) & 1) != 0)
    {
      v21 = 0;
    }
    else if ((objc_msgSend(v20, "isEqualToString:", CFSTR("NO_VOICE")) & 1) != 0)
    {
      v21 = 1;
    }
    else if ((objc_msgSend(v20, "isEqualToString:", CFSTR("LOW_VOLUME")) & 1) != 0)
    {
      v21 = 2;
    }
    else if ((objc_msgSend(v20, "isEqualToString:", CFSTR("NORMAL_VOLUME")) & 1) != 0)
    {
      v21 = 3;
    }
    else if (objc_msgSend(v20, "isEqualToString:", CFSTR("LOUD_VOLUME")))
    {
      v21 = 4;
    }
    else
    {
      v21 = 0;
    }

  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
      goto LABEL_63;
    v21 = objc_msgSend(v19, "intValue");
  }
  objc_msgSend(a1, "setNavVoiceVolume:", v21);
LABEL_63:

  if (a3)
    v22 = CFSTR("pauseSpokenAudioEnabled");
  else
    v22 = CFSTR("pause_spoken_audio_enabled");
  objc_msgSend(v5, "objectForKeyedSubscript:", v22);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    objc_msgSend(a1, "setPauseSpokenAudioEnabled:", objc_msgSend(v23, "BOOLValue"));

  if (a3)
    v24 = CFSTR("findMyCarEnabled");
  else
    v24 = CFSTR("find_my_car_enabled");
  objc_msgSend(v5, "objectForKeyedSubscript:", v24);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    objc_msgSend(a1, "setFindMyCarEnabled:", objc_msgSend(v25, "BOOLValue"));

  if (a3)
    v26 = CFSTR("trafficEnabled");
  else
    v26 = CFSTR("traffic_enabled");
  objc_msgSend(v5, "objectForKeyedSubscript:", v26);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    objc_msgSend(a1, "setTrafficEnabled:", objc_msgSend(v27, "BOOLValue"));

  if (a3)
    v28 = CFSTR("labelEnabled");
  else
    v28 = CFSTR("label_enabled");
  objc_msgSend(v5, "objectForKeyedSubscript:", v28);
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    objc_msgSend(a1, "setLabelEnabled:", objc_msgSend(v29, "BOOLValue"));

  if (a3)
    v30 = CFSTR("avoidHills");
  else
    v30 = CFSTR("avoid_hills");
  objc_msgSend(v5, "objectForKeyedSubscript:", v30);
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    objc_msgSend(a1, "setAvoidHills:", objc_msgSend(v31, "BOOLValue"));

  if (a3)
    v32 = CFSTR("avoidStairs");
  else
    v32 = CFSTR("avoid_stairs");
  objc_msgSend(v5, "objectForKeyedSubscript:", v32);
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    objc_msgSend(a1, "setAvoidStairs:", objc_msgSend(v33, "BOOLValue"));

  if (a3)
    v34 = CFSTR("avoidBusyRoads");
  else
    v34 = CFSTR("avoid_busy_roads");
  objc_msgSend(v5, "objectForKeyedSubscript:", v34);
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    objc_msgSend(a1, "setAvoidBusyRoads:", objc_msgSend(v35, "BOOLValue"));

  if (a3)
    v36 = CFSTR("locationType");
  else
    v36 = CFSTR("location_type");
  objc_msgSend(v5, "objectForKeyedSubscript:", v36);
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v38 = v37;
    if ((objc_msgSend(v38, "isEqualToString:", CFSTR("UNKNOWN")) & 1) != 0)
    {
      v39 = 0;
    }
    else if ((objc_msgSend(v38, "isEqualToString:", CFSTR("NO_AUTH")) & 1) != 0)
    {
      v39 = 1;
    }
    else if ((objc_msgSend(v38, "isEqualToString:", CFSTR("PRECISE")) & 1) != 0)
    {
      v39 = 2;
    }
    else if (objc_msgSend(v38, "isEqualToString:", CFSTR("COARSE")))
    {
      v39 = 3;
    }
    else
    {
      v39 = 0;
    }

  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
      goto LABEL_115;
    v39 = objc_msgSend(v37, "intValue");
  }
  objc_msgSend(a1, "setLocationType:", v39);
LABEL_115:

  if (a3)
    v40 = CFSTR("eBike");
  else
    v40 = CFSTR("e_bike");
  objc_msgSend(v5, "objectForKeyedSubscript:", v40);
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    objc_msgSend(a1, "setEBike:", objc_msgSend(v41, "BOOLValue"));

  if (a3)
    v42 = CFSTR("navVoiceSettings");
  else
    v42 = CFSTR("nav_voice_settings");
  objc_msgSend(v5, "objectForKeyedSubscript:", v42);
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v82 = v5;
    v85 = 0u;
    v86 = 0u;
    v83 = 0u;
    v84 = 0u;
    v44 = v43;
    v45 = objc_msgSend(v44, "countByEnumeratingWithState:objects:count:", &v83, v87, 16);
    if (v45)
    {
      v46 = v45;
      v47 = *(_QWORD *)v84;
      do
      {
        for (i = 0; i != v46; ++i)
        {
          if (*(_QWORD *)v84 != v47)
            objc_enumerationMutation(v44);
          v49 = *(_QWORD *)(*((_QWORD *)&v83 + 1) + 8 * i);
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            v50 = [GEONavVoiceGuidanceSettings alloc];
            if ((a3 & 1) != 0)
              v51 = -[GEONavVoiceGuidanceSettings initWithJSON:](v50, "initWithJSON:", v49);
            else
              v51 = -[GEONavVoiceGuidanceSettings initWithDictionary:](v50, "initWithDictionary:", v49);
            v52 = (void *)v51;
            objc_msgSend(a1, "addNavVoiceSettings:", v51);

          }
        }
        v46 = objc_msgSend(v44, "countByEnumeratingWithState:objects:count:", &v83, v87, 16);
      }
      while (v46);
    }

    v5 = v82;
  }

  if (a3)
    v53 = CFSTR("hFPEnabled");
  else
    v53 = CFSTR("HFP_enabled");
  objc_msgSend(v5, "objectForKeyedSubscript:", v53);
  v54 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    objc_msgSend(a1, "setHFPEnabled:", objc_msgSend(v54, "BOOLValue"));

  if (a3)
    v55 = CFSTR("drivingVoiceSettings");
  else
    v55 = CFSTR("driving_voice_settings");
  objc_msgSend(v5, "objectForKeyedSubscript:", v55);
  v56 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v57 = v56;
    if ((objc_msgSend(v57, "isEqualToString:", CFSTR("LEVEL_UNKNOWN")) & 1) != 0)
    {
      v58 = 0;
    }
    else if ((objc_msgSend(v57, "isEqualToString:", CFSTR("LEVEL_NONE")) & 1) != 0)
    {
      v58 = 1;
    }
    else if ((objc_msgSend(v57, "isEqualToString:", CFSTR("LEVEL_INCIDENTS")) & 1) != 0)
    {
      v58 = 2;
    }
    else if (objc_msgSend(v57, "isEqualToString:", CFSTR("LEVEL_FULL")))
    {
      v58 = 3;
    }
    else
    {
      v58 = 0;
    }

  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
      goto LABEL_159;
    v58 = objc_msgSend(v56, "intValue");
  }
  objc_msgSend(a1, "setDrivingVoiceSettings:", v58);
LABEL_159:

  if (a3)
    v59 = CFSTR("walkingVoiceSettings");
  else
    v59 = CFSTR("walking_voice_settings");
  objc_msgSend(v5, "objectForKeyedSubscript:", v59);
  v60 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v61 = v60;
    if ((objc_msgSend(v61, "isEqualToString:", CFSTR("LEVEL_UNKNOWN")) & 1) != 0)
    {
      v62 = 0;
    }
    else if ((objc_msgSend(v61, "isEqualToString:", CFSTR("LEVEL_NONE")) & 1) != 0)
    {
      v62 = 1;
    }
    else if ((objc_msgSend(v61, "isEqualToString:", CFSTR("LEVEL_INCIDENTS")) & 1) != 0)
    {
      v62 = 2;
    }
    else if (objc_msgSend(v61, "isEqualToString:", CFSTR("LEVEL_FULL")))
    {
      v62 = 3;
    }
    else
    {
      v62 = 0;
    }

  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
      goto LABEL_176;
    v62 = objc_msgSend(v60, "intValue");
  }
  objc_msgSend(a1, "setWalkingVoiceSettings:", v62);
LABEL_176:

  if (a3)
    v63 = CFSTR("cyclingVoiceSettings");
  else
    v63 = CFSTR("cycling_voice_settings");
  objc_msgSend(v5, "objectForKeyedSubscript:", v63);
  v64 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v65 = v64;
    if ((objc_msgSend(v65, "isEqualToString:", CFSTR("LEVEL_UNKNOWN")) & 1) != 0)
    {
      v66 = 0;
    }
    else if ((objc_msgSend(v65, "isEqualToString:", CFSTR("LEVEL_NONE")) & 1) != 0)
    {
      v66 = 1;
    }
    else if ((objc_msgSend(v65, "isEqualToString:", CFSTR("LEVEL_INCIDENTS")) & 1) != 0)
    {
      v66 = 2;
    }
    else if (objc_msgSend(v65, "isEqualToString:", CFSTR("LEVEL_FULL")))
    {
      v66 = 3;
    }
    else
    {
      v66 = 0;
    }

    goto LABEL_192;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v66 = objc_msgSend(v64, "intValue");
LABEL_192:
    objc_msgSend(a1, "setCyclingVoiceSettings:", v66);
  }

  if (a3)
    v67 = CFSTR("walkingAvoidHills");
  else
    v67 = CFSTR("walking_avoid_hills");
  objc_msgSend(v5, "objectForKeyedSubscript:", v67);
  v68 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    objc_msgSend(a1, "setWalkingAvoidHills:", objc_msgSend(v68, "BOOLValue"));

  if (a3)
    v69 = CFSTR("walkingAvoidBusyRoads");
  else
    v69 = CFSTR("walking_avoid_busy_roads");
  objc_msgSend(v5, "objectForKeyedSubscript:", v69);
  v70 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    objc_msgSend(a1, "setWalkingAvoidBusyRoads:", objc_msgSend(v70, "BOOLValue"));

  if (a3)
    v71 = CFSTR("walkingAvoidStairs");
  else
    v71 = CFSTR("walking_avoid_stairs");
  objc_msgSend(v5, "objectForKeyedSubscript:", v71);
  v72 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    objc_msgSend(a1, "setWalkingAvoidStairs:", objc_msgSend(v72, "BOOLValue"));

  if (a3)
    v73 = CFSTR("bikingAvoidHills");
  else
    v73 = CFSTR("biking_avoid_hills");
  objc_msgSend(v5, "objectForKeyedSubscript:", v73);
  v74 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    objc_msgSend(a1, "setBikingAvoidHills:", objc_msgSend(v74, "BOOLValue"));

  if (a3)
    v75 = CFSTR("bikingAvoidStairs");
  else
    v75 = CFSTR("biking_avoid_stairs");
  objc_msgSend(v5, "objectForKeyedSubscript:", v75);
  v76 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    objc_msgSend(a1, "setBikingAvoidStairs:", objc_msgSend(v76, "BOOLValue"));

  if (a3)
    v77 = CFSTR("bikingAvoidBusyRoads");
  else
    v77 = CFSTR("biking_avoid_busy_roads");
  objc_msgSend(v5, "objectForKeyedSubscript:", v77);
  v78 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    objc_msgSend(a1, "setBikingAvoidBusyRoads:", objc_msgSend(v78, "BOOLValue"));

  if (a3)
    v79 = CFSTR("directionsWakeDevice");
  else
    v79 = CFSTR("directions_wake_device");
  objc_msgSend(v5, "objectForKeyedSubscript:", v79);
  v80 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    objc_msgSend(a1, "setDirectionsWakeDevice:", objc_msgSend(v80, "BOOLValue"));

  a1 = a1;
LABEL_229:

  return a1;
}

- (GEOLogMsgStateMapSettings)initWithJSON:(id)a3
{
  return (GEOLogMsgStateMapSettings *)-[GEOLogMsgStateMapSettings _initWithDictionary:isJSON:](self, a3, 1);
}

+ (BOOL)isValid:(id)a3
{
  return GEOLogMsgStateMapSettingsIsValid((char *)a3);
}

- (BOOL)readFrom:(id)a3
{
  return GEOLogMsgStateMapSettingsReadAllFrom(self, a3);
}

- (void)writeTo:(id)a3
{
  id v4;
  $BCC5AE05094F9DBFF15DB1C7A33A3F08 flags;
  NSMutableArray *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  $BCC5AE05094F9DBFF15DB1C7A33A3F08 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  flags = self->_flags;
  if ((*(_BYTE *)&flags & 0x10) != 0)
  {
    PBDataWriterWriteInt32Field();
    flags = self->_flags;
    if ((*(_WORD *)&flags & 0x800) == 0)
    {
LABEL_3:
      if ((*(_WORD *)&flags & 0x100) == 0)
        goto LABEL_4;
      goto LABEL_39;
    }
  }
  else if ((*(_WORD *)&flags & 0x800) == 0)
  {
    goto LABEL_3;
  }
  PBDataWriterWriteBOOLField();
  flags = self->_flags;
  if ((*(_WORD *)&flags & 0x100) == 0)
  {
LABEL_4:
    if ((*(_DWORD *)&flags & 0x40000) == 0)
      goto LABEL_5;
    goto LABEL_40;
  }
LABEL_39:
  PBDataWriterWriteBOOLField();
  flags = self->_flags;
  if ((*(_DWORD *)&flags & 0x40000) == 0)
  {
LABEL_5:
    if ((*(_DWORD *)&flags & 0x200000) == 0)
      goto LABEL_6;
    goto LABEL_41;
  }
LABEL_40:
  PBDataWriterWriteBOOLField();
  flags = self->_flags;
  if ((*(_DWORD *)&flags & 0x200000) == 0)
  {
LABEL_6:
    if ((*(_BYTE *)&flags & 8) == 0)
      goto LABEL_7;
    goto LABEL_42;
  }
LABEL_41:
  PBDataWriterWriteBOOLField();
  flags = self->_flags;
  if ((*(_BYTE *)&flags & 8) == 0)
  {
LABEL_7:
    if ((*(_DWORD *)&flags & 0x100000) == 0)
      goto LABEL_8;
    goto LABEL_43;
  }
LABEL_42:
  PBDataWriterWriteInt32Field();
  flags = self->_flags;
  if ((*(_DWORD *)&flags & 0x100000) == 0)
  {
LABEL_8:
    if ((*(_DWORD *)&flags & 0x20000) == 0)
      goto LABEL_9;
    goto LABEL_44;
  }
LABEL_43:
  PBDataWriterWriteBOOLField();
  flags = self->_flags;
  if ((*(_DWORD *)&flags & 0x20000) == 0)
  {
LABEL_9:
    if ((*(_DWORD *)&flags & 0x400000) == 0)
      goto LABEL_10;
    goto LABEL_45;
  }
LABEL_44:
  PBDataWriterWriteBOOLField();
  flags = self->_flags;
  if ((*(_DWORD *)&flags & 0x400000) == 0)
  {
LABEL_10:
    if ((*(_DWORD *)&flags & 0x80000) == 0)
      goto LABEL_11;
    goto LABEL_46;
  }
LABEL_45:
  PBDataWriterWriteBOOLField();
  flags = self->_flags;
  if ((*(_DWORD *)&flags & 0x80000) == 0)
  {
LABEL_11:
    if ((*(_WORD *)&flags & 0x200) == 0)
      goto LABEL_12;
    goto LABEL_47;
  }
LABEL_46:
  PBDataWriterWriteBOOLField();
  flags = self->_flags;
  if ((*(_WORD *)&flags & 0x200) == 0)
  {
LABEL_12:
    if ((*(_WORD *)&flags & 0x400) == 0)
      goto LABEL_13;
    goto LABEL_48;
  }
LABEL_47:
  PBDataWriterWriteBOOLField();
  flags = self->_flags;
  if ((*(_WORD *)&flags & 0x400) == 0)
  {
LABEL_13:
    if ((*(_BYTE *)&flags & 0x80) == 0)
      goto LABEL_14;
    goto LABEL_49;
  }
LABEL_48:
  PBDataWriterWriteBOOLField();
  flags = self->_flags;
  if ((*(_BYTE *)&flags & 0x80) == 0)
  {
LABEL_14:
    if ((*(_BYTE *)&flags & 4) == 0)
      goto LABEL_15;
    goto LABEL_50;
  }
LABEL_49:
  PBDataWriterWriteBOOLField();
  flags = self->_flags;
  if ((*(_BYTE *)&flags & 4) == 0)
  {
LABEL_15:
    if ((*(_DWORD *)&flags & 0x10000) == 0)
      goto LABEL_17;
    goto LABEL_16;
  }
LABEL_50:
  PBDataWriterWriteInt32Field();
  if ((*(_DWORD *)&self->_flags & 0x10000) != 0)
LABEL_16:
    PBDataWriterWriteBOOLField();
LABEL_17:
  v14 = 0u;
  v15 = 0u;
  v12 = 0u;
  v13 = 0u;
  v6 = self->_navVoiceSettings;
  v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v13;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v13 != v9)
          objc_enumerationMutation(v6);
        PBDataWriterWriteSubmessage();
        ++v10;
      }
      while (v8 != v10);
      v8 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v8);
  }

  v11 = self->_flags;
  if ((*(_BYTE *)&v11 & 0x40) != 0)
  {
    PBDataWriterWriteBOOLField();
    v11 = self->_flags;
    if ((*(_BYTE *)&v11 & 2) == 0)
    {
LABEL_26:
      if ((*(_BYTE *)&v11 & 0x20) == 0)
        goto LABEL_27;
      goto LABEL_54;
    }
  }
  else if ((*(_BYTE *)&v11 & 2) == 0)
  {
    goto LABEL_26;
  }
  PBDataWriterWriteInt32Field();
  v11 = self->_flags;
  if ((*(_BYTE *)&v11 & 0x20) == 0)
  {
LABEL_27:
    if ((*(_BYTE *)&v11 & 1) == 0)
      goto LABEL_28;
    goto LABEL_55;
  }
LABEL_54:
  PBDataWriterWriteInt32Field();
  v11 = self->_flags;
  if ((*(_BYTE *)&v11 & 1) == 0)
  {
LABEL_28:
    if ((*(_DWORD *)&v11 & 0x1000000) == 0)
      goto LABEL_29;
    goto LABEL_56;
  }
LABEL_55:
  PBDataWriterWriteInt32Field();
  v11 = self->_flags;
  if ((*(_DWORD *)&v11 & 0x1000000) == 0)
  {
LABEL_29:
    if ((*(_DWORD *)&v11 & 0x800000) == 0)
      goto LABEL_30;
    goto LABEL_57;
  }
LABEL_56:
  PBDataWriterWriteBOOLField();
  v11 = self->_flags;
  if ((*(_DWORD *)&v11 & 0x800000) == 0)
  {
LABEL_30:
    if ((*(_DWORD *)&v11 & 0x2000000) == 0)
      goto LABEL_31;
    goto LABEL_58;
  }
LABEL_57:
  PBDataWriterWriteBOOLField();
  v11 = self->_flags;
  if ((*(_DWORD *)&v11 & 0x2000000) == 0)
  {
LABEL_31:
    if ((*(_WORD *)&v11 & 0x2000) == 0)
      goto LABEL_32;
    goto LABEL_59;
  }
LABEL_58:
  PBDataWriterWriteBOOLField();
  v11 = self->_flags;
  if ((*(_WORD *)&v11 & 0x2000) == 0)
  {
LABEL_32:
    if ((*(_WORD *)&v11 & 0x4000) == 0)
      goto LABEL_33;
    goto LABEL_60;
  }
LABEL_59:
  PBDataWriterWriteBOOLField();
  v11 = self->_flags;
  if ((*(_WORD *)&v11 & 0x4000) == 0)
  {
LABEL_33:
    if ((*(_WORD *)&v11 & 0x1000) == 0)
      goto LABEL_34;
LABEL_61:
    PBDataWriterWriteBOOLField();
    if ((*(_DWORD *)&self->_flags & 0x8000) == 0)
      goto LABEL_36;
    goto LABEL_35;
  }
LABEL_60:
  PBDataWriterWriteBOOLField();
  v11 = self->_flags;
  if ((*(_WORD *)&v11 & 0x1000) != 0)
    goto LABEL_61;
LABEL_34:
  if ((*(_WORD *)&v11 & 0x8000) != 0)
LABEL_35:
    PBDataWriterWriteBOOLField();
LABEL_36:

}

- (void)copyTo:(id)a3
{
  $BCC5AE05094F9DBFF15DB1C7A33A3F08 flags;
  unint64_t v5;
  unint64_t v6;
  uint64_t i;
  void *v8;
  $BCC5AE05094F9DBFF15DB1C7A33A3F08 v9;
  _DWORD *v10;

  v10 = a3;
  -[GEOLogMsgStateMapSettings readAll:](self, "readAll:", 0);
  flags = self->_flags;
  if ((*(_BYTE *)&flags & 0x10) != 0)
  {
    v10[8] = self->_preferredTransportMode;
    v10[15] |= 0x10u;
    flags = self->_flags;
    if ((*(_WORD *)&flags & 0x800) == 0)
    {
LABEL_3:
      if ((*(_WORD *)&flags & 0x100) == 0)
        goto LABEL_4;
      goto LABEL_36;
    }
  }
  else if ((*(_WORD *)&flags & 0x800) == 0)
  {
    goto LABEL_3;
  }
  *((_BYTE *)v10 + 45) = self->_avoidTolls;
  v10[15] |= 0x800u;
  flags = self->_flags;
  if ((*(_WORD *)&flags & 0x100) == 0)
  {
LABEL_4:
    if ((*(_DWORD *)&flags & 0x40000) == 0)
      goto LABEL_5;
    goto LABEL_37;
  }
LABEL_36:
  *((_BYTE *)v10 + 42) = self->_avoidHighways;
  v10[15] |= 0x100u;
  flags = self->_flags;
  if ((*(_DWORD *)&flags & 0x40000) == 0)
  {
LABEL_5:
    if ((*(_DWORD *)&flags & 0x200000) == 0)
      goto LABEL_6;
    goto LABEL_38;
  }
LABEL_37:
  *((_BYTE *)v10 + 52) = self->_headingEnabled;
  v10[15] |= 0x40000u;
  flags = self->_flags;
  if ((*(_DWORD *)&flags & 0x200000) == 0)
  {
LABEL_6:
    if ((*(_BYTE *)&flags & 8) == 0)
      goto LABEL_7;
    goto LABEL_39;
  }
LABEL_38:
  *((_BYTE *)v10 + 55) = self->_speedLimitEnabled;
  v10[15] |= 0x200000u;
  flags = self->_flags;
  if ((*(_BYTE *)&flags & 8) == 0)
  {
LABEL_7:
    if ((*(_DWORD *)&flags & 0x100000) == 0)
      goto LABEL_8;
    goto LABEL_40;
  }
LABEL_39:
  v10[7] = self->_navVoiceVolume;
  v10[15] |= 8u;
  flags = self->_flags;
  if ((*(_DWORD *)&flags & 0x100000) == 0)
  {
LABEL_8:
    if ((*(_DWORD *)&flags & 0x20000) == 0)
      goto LABEL_9;
    goto LABEL_41;
  }
LABEL_40:
  *((_BYTE *)v10 + 54) = self->_pauseSpokenAudioEnabled;
  v10[15] |= 0x100000u;
  flags = self->_flags;
  if ((*(_DWORD *)&flags & 0x20000) == 0)
  {
LABEL_9:
    if ((*(_DWORD *)&flags & 0x400000) == 0)
      goto LABEL_10;
    goto LABEL_42;
  }
LABEL_41:
  *((_BYTE *)v10 + 51) = self->_findMyCarEnabled;
  v10[15] |= 0x20000u;
  flags = self->_flags;
  if ((*(_DWORD *)&flags & 0x400000) == 0)
  {
LABEL_10:
    if ((*(_DWORD *)&flags & 0x80000) == 0)
      goto LABEL_11;
    goto LABEL_43;
  }
LABEL_42:
  *((_BYTE *)v10 + 56) = self->_trafficEnabled;
  v10[15] |= 0x400000u;
  flags = self->_flags;
  if ((*(_DWORD *)&flags & 0x80000) == 0)
  {
LABEL_11:
    if ((*(_WORD *)&flags & 0x200) == 0)
      goto LABEL_12;
    goto LABEL_44;
  }
LABEL_43:
  *((_BYTE *)v10 + 53) = self->_labelEnabled;
  v10[15] |= 0x80000u;
  flags = self->_flags;
  if ((*(_WORD *)&flags & 0x200) == 0)
  {
LABEL_12:
    if ((*(_WORD *)&flags & 0x400) == 0)
      goto LABEL_13;
    goto LABEL_45;
  }
LABEL_44:
  *((_BYTE *)v10 + 43) = self->_avoidHills;
  v10[15] |= 0x200u;
  flags = self->_flags;
  if ((*(_WORD *)&flags & 0x400) == 0)
  {
LABEL_13:
    if ((*(_BYTE *)&flags & 0x80) == 0)
      goto LABEL_14;
    goto LABEL_46;
  }
LABEL_45:
  *((_BYTE *)v10 + 44) = self->_avoidStairs;
  v10[15] |= 0x400u;
  flags = self->_flags;
  if ((*(_BYTE *)&flags & 0x80) == 0)
  {
LABEL_14:
    if ((*(_BYTE *)&flags & 4) == 0)
      goto LABEL_15;
LABEL_47:
    v10[6] = self->_locationType;
    v10[15] |= 4u;
    if ((*(_DWORD *)&self->_flags & 0x10000) == 0)
      goto LABEL_17;
    goto LABEL_16;
  }
LABEL_46:
  *((_BYTE *)v10 + 41) = self->_avoidBusyRoads;
  v10[15] |= 0x80u;
  flags = self->_flags;
  if ((*(_BYTE *)&flags & 4) != 0)
    goto LABEL_47;
LABEL_15:
  if ((*(_DWORD *)&flags & 0x10000) != 0)
  {
LABEL_16:
    *((_BYTE *)v10 + 50) = self->_eBike;
    v10[15] |= 0x10000u;
  }
LABEL_17:
  if (-[GEOLogMsgStateMapSettings navVoiceSettingsCount](self, "navVoiceSettingsCount"))
  {
    objc_msgSend(v10, "clearNavVoiceSettings");
    v5 = -[GEOLogMsgStateMapSettings navVoiceSettingsCount](self, "navVoiceSettingsCount");
    if (v5)
    {
      v6 = v5;
      for (i = 0; i != v6; ++i)
      {
        -[GEOLogMsgStateMapSettings navVoiceSettingsAtIndex:](self, "navVoiceSettingsAtIndex:", i);
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "addNavVoiceSettings:", v8);

      }
    }
  }
  v9 = self->_flags;
  if ((*(_BYTE *)&v9 & 0x40) != 0)
  {
    *((_BYTE *)v10 + 40) = self->_hFPEnabled;
    v10[15] |= 0x40u;
    v9 = self->_flags;
    if ((*(_BYTE *)&v9 & 2) == 0)
    {
LABEL_23:
      if ((*(_BYTE *)&v9 & 0x20) == 0)
        goto LABEL_24;
      goto LABEL_51;
    }
  }
  else if ((*(_BYTE *)&v9 & 2) == 0)
  {
    goto LABEL_23;
  }
  v10[5] = self->_drivingVoiceSettings;
  v10[15] |= 2u;
  v9 = self->_flags;
  if ((*(_BYTE *)&v9 & 0x20) == 0)
  {
LABEL_24:
    if ((*(_BYTE *)&v9 & 1) == 0)
      goto LABEL_25;
    goto LABEL_52;
  }
LABEL_51:
  v10[9] = self->_walkingVoiceSettings;
  v10[15] |= 0x20u;
  v9 = self->_flags;
  if ((*(_BYTE *)&v9 & 1) == 0)
  {
LABEL_25:
    if ((*(_DWORD *)&v9 & 0x1000000) == 0)
      goto LABEL_26;
    goto LABEL_53;
  }
LABEL_52:
  v10[4] = self->_cyclingVoiceSettings;
  v10[15] |= 1u;
  v9 = self->_flags;
  if ((*(_DWORD *)&v9 & 0x1000000) == 0)
  {
LABEL_26:
    if ((*(_DWORD *)&v9 & 0x800000) == 0)
      goto LABEL_27;
    goto LABEL_54;
  }
LABEL_53:
  *((_BYTE *)v10 + 58) = self->_walkingAvoidHills;
  v10[15] |= 0x1000000u;
  v9 = self->_flags;
  if ((*(_DWORD *)&v9 & 0x800000) == 0)
  {
LABEL_27:
    if ((*(_DWORD *)&v9 & 0x2000000) == 0)
      goto LABEL_28;
    goto LABEL_55;
  }
LABEL_54:
  *((_BYTE *)v10 + 57) = self->_walkingAvoidBusyRoads;
  v10[15] |= 0x800000u;
  v9 = self->_flags;
  if ((*(_DWORD *)&v9 & 0x2000000) == 0)
  {
LABEL_28:
    if ((*(_WORD *)&v9 & 0x2000) == 0)
      goto LABEL_29;
    goto LABEL_56;
  }
LABEL_55:
  *((_BYTE *)v10 + 59) = self->_walkingAvoidStairs;
  v10[15] |= 0x2000000u;
  v9 = self->_flags;
  if ((*(_WORD *)&v9 & 0x2000) == 0)
  {
LABEL_29:
    if ((*(_WORD *)&v9 & 0x4000) == 0)
      goto LABEL_30;
    goto LABEL_57;
  }
LABEL_56:
  *((_BYTE *)v10 + 47) = self->_bikingAvoidHills;
  v10[15] |= 0x2000u;
  v9 = self->_flags;
  if ((*(_WORD *)&v9 & 0x4000) == 0)
  {
LABEL_30:
    if ((*(_WORD *)&v9 & 0x1000) == 0)
      goto LABEL_31;
LABEL_58:
    *((_BYTE *)v10 + 46) = self->_bikingAvoidBusyRoads;
    v10[15] |= 0x1000u;
    if ((*(_DWORD *)&self->_flags & 0x8000) == 0)
      goto LABEL_33;
    goto LABEL_32;
  }
LABEL_57:
  *((_BYTE *)v10 + 48) = self->_bikingAvoidStairs;
  v10[15] |= 0x4000u;
  v9 = self->_flags;
  if ((*(_WORD *)&v9 & 0x1000) != 0)
    goto LABEL_58;
LABEL_31:
  if ((*(_WORD *)&v9 & 0x8000) != 0)
  {
LABEL_32:
    *((_BYTE *)v10 + 49) = self->_directionsWakeDevice;
    v10[15] |= 0x8000u;
  }
LABEL_33:

}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5;
  uint64_t v6;
  $BCC5AE05094F9DBFF15DB1C7A33A3F08 flags;
  NSMutableArray *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  $BCC5AE05094F9DBFF15DB1C7A33A3F08 v14;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = v5;
  flags = self->_flags;
  if ((*(_BYTE *)&flags & 0x10) != 0)
  {
    *(_DWORD *)(v5 + 32) = self->_preferredTransportMode;
    *(_DWORD *)(v5 + 60) |= 0x10u;
    flags = self->_flags;
    if ((*(_WORD *)&flags & 0x800) == 0)
    {
LABEL_3:
      if ((*(_WORD *)&flags & 0x100) == 0)
        goto LABEL_4;
      goto LABEL_39;
    }
  }
  else if ((*(_WORD *)&flags & 0x800) == 0)
  {
    goto LABEL_3;
  }
  *(_BYTE *)(v5 + 45) = self->_avoidTolls;
  *(_DWORD *)(v5 + 60) |= 0x800u;
  flags = self->_flags;
  if ((*(_WORD *)&flags & 0x100) == 0)
  {
LABEL_4:
    if ((*(_DWORD *)&flags & 0x40000) == 0)
      goto LABEL_5;
    goto LABEL_40;
  }
LABEL_39:
  *(_BYTE *)(v5 + 42) = self->_avoidHighways;
  *(_DWORD *)(v5 + 60) |= 0x100u;
  flags = self->_flags;
  if ((*(_DWORD *)&flags & 0x40000) == 0)
  {
LABEL_5:
    if ((*(_DWORD *)&flags & 0x200000) == 0)
      goto LABEL_6;
    goto LABEL_41;
  }
LABEL_40:
  *(_BYTE *)(v5 + 52) = self->_headingEnabled;
  *(_DWORD *)(v5 + 60) |= 0x40000u;
  flags = self->_flags;
  if ((*(_DWORD *)&flags & 0x200000) == 0)
  {
LABEL_6:
    if ((*(_BYTE *)&flags & 8) == 0)
      goto LABEL_7;
    goto LABEL_42;
  }
LABEL_41:
  *(_BYTE *)(v5 + 55) = self->_speedLimitEnabled;
  *(_DWORD *)(v5 + 60) |= 0x200000u;
  flags = self->_flags;
  if ((*(_BYTE *)&flags & 8) == 0)
  {
LABEL_7:
    if ((*(_DWORD *)&flags & 0x100000) == 0)
      goto LABEL_8;
    goto LABEL_43;
  }
LABEL_42:
  *(_DWORD *)(v5 + 28) = self->_navVoiceVolume;
  *(_DWORD *)(v5 + 60) |= 8u;
  flags = self->_flags;
  if ((*(_DWORD *)&flags & 0x100000) == 0)
  {
LABEL_8:
    if ((*(_DWORD *)&flags & 0x20000) == 0)
      goto LABEL_9;
    goto LABEL_44;
  }
LABEL_43:
  *(_BYTE *)(v5 + 54) = self->_pauseSpokenAudioEnabled;
  *(_DWORD *)(v5 + 60) |= 0x100000u;
  flags = self->_flags;
  if ((*(_DWORD *)&flags & 0x20000) == 0)
  {
LABEL_9:
    if ((*(_DWORD *)&flags & 0x400000) == 0)
      goto LABEL_10;
    goto LABEL_45;
  }
LABEL_44:
  *(_BYTE *)(v5 + 51) = self->_findMyCarEnabled;
  *(_DWORD *)(v5 + 60) |= 0x20000u;
  flags = self->_flags;
  if ((*(_DWORD *)&flags & 0x400000) == 0)
  {
LABEL_10:
    if ((*(_DWORD *)&flags & 0x80000) == 0)
      goto LABEL_11;
    goto LABEL_46;
  }
LABEL_45:
  *(_BYTE *)(v5 + 56) = self->_trafficEnabled;
  *(_DWORD *)(v5 + 60) |= 0x400000u;
  flags = self->_flags;
  if ((*(_DWORD *)&flags & 0x80000) == 0)
  {
LABEL_11:
    if ((*(_WORD *)&flags & 0x200) == 0)
      goto LABEL_12;
    goto LABEL_47;
  }
LABEL_46:
  *(_BYTE *)(v5 + 53) = self->_labelEnabled;
  *(_DWORD *)(v5 + 60) |= 0x80000u;
  flags = self->_flags;
  if ((*(_WORD *)&flags & 0x200) == 0)
  {
LABEL_12:
    if ((*(_WORD *)&flags & 0x400) == 0)
      goto LABEL_13;
    goto LABEL_48;
  }
LABEL_47:
  *(_BYTE *)(v5 + 43) = self->_avoidHills;
  *(_DWORD *)(v5 + 60) |= 0x200u;
  flags = self->_flags;
  if ((*(_WORD *)&flags & 0x400) == 0)
  {
LABEL_13:
    if ((*(_BYTE *)&flags & 0x80) == 0)
      goto LABEL_14;
    goto LABEL_49;
  }
LABEL_48:
  *(_BYTE *)(v5 + 44) = self->_avoidStairs;
  *(_DWORD *)(v5 + 60) |= 0x400u;
  flags = self->_flags;
  if ((*(_BYTE *)&flags & 0x80) == 0)
  {
LABEL_14:
    if ((*(_BYTE *)&flags & 4) == 0)
      goto LABEL_15;
    goto LABEL_50;
  }
LABEL_49:
  *(_BYTE *)(v5 + 41) = self->_avoidBusyRoads;
  *(_DWORD *)(v5 + 60) |= 0x80u;
  flags = self->_flags;
  if ((*(_BYTE *)&flags & 4) == 0)
  {
LABEL_15:
    if ((*(_DWORD *)&flags & 0x10000) == 0)
      goto LABEL_17;
    goto LABEL_16;
  }
LABEL_50:
  *(_DWORD *)(v5 + 24) = self->_locationType;
  *(_DWORD *)(v5 + 60) |= 4u;
  if ((*(_DWORD *)&self->_flags & 0x10000) != 0)
  {
LABEL_16:
    *(_BYTE *)(v5 + 50) = self->_eBike;
    *(_DWORD *)(v5 + 60) |= 0x10000u;
  }
LABEL_17:
  v18 = 0u;
  v19 = 0u;
  v16 = 0u;
  v17 = 0u;
  v8 = self->_navVoiceSettings;
  v9 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v17;
    do
    {
      v12 = 0;
      do
      {
        if (*(_QWORD *)v17 != v11)
          objc_enumerationMutation(v8);
        v13 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v16 + 1) + 8 * v12), "copyWithZone:", a3, (_QWORD)v16);
        objc_msgSend((id)v6, "addNavVoiceSettings:", v13);

        ++v12;
      }
      while (v10 != v12);
      v10 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    }
    while (v10);
  }

  v14 = self->_flags;
  if ((*(_BYTE *)&v14 & 0x40) != 0)
  {
    *(_BYTE *)(v6 + 40) = self->_hFPEnabled;
    *(_DWORD *)(v6 + 60) |= 0x40u;
    v14 = self->_flags;
    if ((*(_BYTE *)&v14 & 2) == 0)
    {
LABEL_26:
      if ((*(_BYTE *)&v14 & 0x20) == 0)
        goto LABEL_27;
      goto LABEL_54;
    }
  }
  else if ((*(_BYTE *)&v14 & 2) == 0)
  {
    goto LABEL_26;
  }
  *(_DWORD *)(v6 + 20) = self->_drivingVoiceSettings;
  *(_DWORD *)(v6 + 60) |= 2u;
  v14 = self->_flags;
  if ((*(_BYTE *)&v14 & 0x20) == 0)
  {
LABEL_27:
    if ((*(_BYTE *)&v14 & 1) == 0)
      goto LABEL_28;
    goto LABEL_55;
  }
LABEL_54:
  *(_DWORD *)(v6 + 36) = self->_walkingVoiceSettings;
  *(_DWORD *)(v6 + 60) |= 0x20u;
  v14 = self->_flags;
  if ((*(_BYTE *)&v14 & 1) == 0)
  {
LABEL_28:
    if ((*(_DWORD *)&v14 & 0x1000000) == 0)
      goto LABEL_29;
    goto LABEL_56;
  }
LABEL_55:
  *(_DWORD *)(v6 + 16) = self->_cyclingVoiceSettings;
  *(_DWORD *)(v6 + 60) |= 1u;
  v14 = self->_flags;
  if ((*(_DWORD *)&v14 & 0x1000000) == 0)
  {
LABEL_29:
    if ((*(_DWORD *)&v14 & 0x800000) == 0)
      goto LABEL_30;
    goto LABEL_57;
  }
LABEL_56:
  *(_BYTE *)(v6 + 58) = self->_walkingAvoidHills;
  *(_DWORD *)(v6 + 60) |= 0x1000000u;
  v14 = self->_flags;
  if ((*(_DWORD *)&v14 & 0x800000) == 0)
  {
LABEL_30:
    if ((*(_DWORD *)&v14 & 0x2000000) == 0)
      goto LABEL_31;
    goto LABEL_58;
  }
LABEL_57:
  *(_BYTE *)(v6 + 57) = self->_walkingAvoidBusyRoads;
  *(_DWORD *)(v6 + 60) |= 0x800000u;
  v14 = self->_flags;
  if ((*(_DWORD *)&v14 & 0x2000000) == 0)
  {
LABEL_31:
    if ((*(_WORD *)&v14 & 0x2000) == 0)
      goto LABEL_32;
    goto LABEL_59;
  }
LABEL_58:
  *(_BYTE *)(v6 + 59) = self->_walkingAvoidStairs;
  *(_DWORD *)(v6 + 60) |= 0x2000000u;
  v14 = self->_flags;
  if ((*(_WORD *)&v14 & 0x2000) == 0)
  {
LABEL_32:
    if ((*(_WORD *)&v14 & 0x4000) == 0)
      goto LABEL_33;
    goto LABEL_60;
  }
LABEL_59:
  *(_BYTE *)(v6 + 47) = self->_bikingAvoidHills;
  *(_DWORD *)(v6 + 60) |= 0x2000u;
  v14 = self->_flags;
  if ((*(_WORD *)&v14 & 0x4000) == 0)
  {
LABEL_33:
    if ((*(_WORD *)&v14 & 0x1000) == 0)
      goto LABEL_34;
LABEL_61:
    *(_BYTE *)(v6 + 46) = self->_bikingAvoidBusyRoads;
    *(_DWORD *)(v6 + 60) |= 0x1000u;
    if ((*(_DWORD *)&self->_flags & 0x8000) == 0)
      return (id)v6;
    goto LABEL_35;
  }
LABEL_60:
  *(_BYTE *)(v6 + 48) = self->_bikingAvoidStairs;
  *(_DWORD *)(v6 + 60) |= 0x4000u;
  v14 = self->_flags;
  if ((*(_WORD *)&v14 & 0x1000) != 0)
    goto LABEL_61;
LABEL_34:
  if ((*(_WORD *)&v14 & 0x8000) != 0)
  {
LABEL_35:
    *(_BYTE *)(v6 + 49) = self->_directionsWakeDevice;
    *(_DWORD *)(v6 + 60) |= 0x8000u;
  }
  return (id)v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  $BCC5AE05094F9DBFF15DB1C7A33A3F08 flags;
  int v6;
  NSMutableArray *navVoiceSettings;
  BOOL v8;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_190;
  -[GEOLogMsgStateMapSettings readAll:](self, "readAll:", 1);
  objc_msgSend(v4, "readAll:", 1);
  flags = self->_flags;
  v6 = *((_DWORD *)v4 + 15);
  if ((*(_BYTE *)&flags & 0x10) != 0)
  {
    if ((v6 & 0x10) == 0 || self->_preferredTransportMode != *((_DWORD *)v4 + 8))
      goto LABEL_190;
  }
  else if ((v6 & 0x10) != 0)
  {
    goto LABEL_190;
  }
  if ((*(_WORD *)&flags & 0x800) != 0)
  {
    if ((v6 & 0x800) == 0)
      goto LABEL_190;
    if (self->_avoidTolls)
    {
      if (!*((_BYTE *)v4 + 45))
        goto LABEL_190;
    }
    else if (*((_BYTE *)v4 + 45))
    {
      goto LABEL_190;
    }
  }
  else if ((v6 & 0x800) != 0)
  {
    goto LABEL_190;
  }
  if ((*(_WORD *)&flags & 0x100) != 0)
  {
    if ((v6 & 0x100) == 0)
      goto LABEL_190;
    if (self->_avoidHighways)
    {
      if (!*((_BYTE *)v4 + 42))
        goto LABEL_190;
    }
    else if (*((_BYTE *)v4 + 42))
    {
      goto LABEL_190;
    }
  }
  else if ((v6 & 0x100) != 0)
  {
    goto LABEL_190;
  }
  if ((*(_DWORD *)&flags & 0x40000) != 0)
  {
    if ((v6 & 0x40000) == 0)
      goto LABEL_190;
    if (self->_headingEnabled)
    {
      if (!*((_BYTE *)v4 + 52))
        goto LABEL_190;
    }
    else if (*((_BYTE *)v4 + 52))
    {
      goto LABEL_190;
    }
  }
  else if ((v6 & 0x40000) != 0)
  {
    goto LABEL_190;
  }
  if ((*(_DWORD *)&flags & 0x200000) != 0)
  {
    if ((v6 & 0x200000) == 0)
      goto LABEL_190;
    if (self->_speedLimitEnabled)
    {
      if (!*((_BYTE *)v4 + 55))
        goto LABEL_190;
    }
    else if (*((_BYTE *)v4 + 55))
    {
      goto LABEL_190;
    }
  }
  else if ((v6 & 0x200000) != 0)
  {
    goto LABEL_190;
  }
  if ((*(_BYTE *)&flags & 8) != 0)
  {
    if ((v6 & 8) == 0 || self->_navVoiceVolume != *((_DWORD *)v4 + 7))
      goto LABEL_190;
  }
  else if ((v6 & 8) != 0)
  {
    goto LABEL_190;
  }
  if ((*(_DWORD *)&flags & 0x100000) != 0)
  {
    if ((v6 & 0x100000) == 0)
      goto LABEL_190;
    if (self->_pauseSpokenAudioEnabled)
    {
      if (!*((_BYTE *)v4 + 54))
        goto LABEL_190;
    }
    else if (*((_BYTE *)v4 + 54))
    {
      goto LABEL_190;
    }
  }
  else if ((v6 & 0x100000) != 0)
  {
    goto LABEL_190;
  }
  if ((*(_DWORD *)&flags & 0x20000) != 0)
  {
    if ((v6 & 0x20000) == 0)
      goto LABEL_190;
    if (self->_findMyCarEnabled)
    {
      if (!*((_BYTE *)v4 + 51))
        goto LABEL_190;
    }
    else if (*((_BYTE *)v4 + 51))
    {
      goto LABEL_190;
    }
  }
  else if ((v6 & 0x20000) != 0)
  {
    goto LABEL_190;
  }
  if ((*(_DWORD *)&flags & 0x400000) != 0)
  {
    if ((v6 & 0x400000) == 0)
      goto LABEL_190;
    if (self->_trafficEnabled)
    {
      if (!*((_BYTE *)v4 + 56))
        goto LABEL_190;
    }
    else if (*((_BYTE *)v4 + 56))
    {
      goto LABEL_190;
    }
  }
  else if ((v6 & 0x400000) != 0)
  {
    goto LABEL_190;
  }
  if ((*(_DWORD *)&flags & 0x80000) != 0)
  {
    if ((v6 & 0x80000) == 0)
      goto LABEL_190;
    if (self->_labelEnabled)
    {
      if (!*((_BYTE *)v4 + 53))
        goto LABEL_190;
    }
    else if (*((_BYTE *)v4 + 53))
    {
      goto LABEL_190;
    }
  }
  else if ((v6 & 0x80000) != 0)
  {
    goto LABEL_190;
  }
  if ((*(_WORD *)&flags & 0x200) != 0)
  {
    if ((v6 & 0x200) == 0)
      goto LABEL_190;
    if (self->_avoidHills)
    {
      if (!*((_BYTE *)v4 + 43))
        goto LABEL_190;
    }
    else if (*((_BYTE *)v4 + 43))
    {
      goto LABEL_190;
    }
  }
  else if ((v6 & 0x200) != 0)
  {
    goto LABEL_190;
  }
  if ((*(_WORD *)&flags & 0x400) != 0)
  {
    if ((v6 & 0x400) == 0)
      goto LABEL_190;
    if (self->_avoidStairs)
    {
      if (!*((_BYTE *)v4 + 44))
        goto LABEL_190;
    }
    else if (*((_BYTE *)v4 + 44))
    {
      goto LABEL_190;
    }
  }
  else if ((v6 & 0x400) != 0)
  {
    goto LABEL_190;
  }
  if ((*(_BYTE *)&flags & 0x80) != 0)
  {
    if ((v6 & 0x80) == 0)
      goto LABEL_190;
    if (self->_avoidBusyRoads)
    {
      if (!*((_BYTE *)v4 + 41))
        goto LABEL_190;
    }
    else if (*((_BYTE *)v4 + 41))
    {
      goto LABEL_190;
    }
  }
  else if ((v6 & 0x80) != 0)
  {
    goto LABEL_190;
  }
  if ((*(_BYTE *)&flags & 4) != 0)
  {
    if ((v6 & 4) == 0 || self->_locationType != *((_DWORD *)v4 + 6))
      goto LABEL_190;
  }
  else if ((v6 & 4) != 0)
  {
    goto LABEL_190;
  }
  if ((*(_DWORD *)&flags & 0x10000) != 0)
  {
    if ((v6 & 0x10000) == 0)
      goto LABEL_190;
    if (self->_eBike)
    {
      if (!*((_BYTE *)v4 + 50))
        goto LABEL_190;
    }
    else if (*((_BYTE *)v4 + 50))
    {
      goto LABEL_190;
    }
  }
  else if ((v6 & 0x10000) != 0)
  {
    goto LABEL_190;
  }
  navVoiceSettings = self->_navVoiceSettings;
  if ((unint64_t)navVoiceSettings | *((_QWORD *)v4 + 1))
  {
    if (!-[NSMutableArray isEqual:](navVoiceSettings, "isEqual:"))
      goto LABEL_190;
    flags = self->_flags;
    v6 = *((_DWORD *)v4 + 15);
  }
  if ((*(_BYTE *)&flags & 0x40) != 0)
  {
    if ((v6 & 0x40) == 0)
      goto LABEL_190;
    if (self->_hFPEnabled)
    {
      if (!*((_BYTE *)v4 + 40))
        goto LABEL_190;
    }
    else if (*((_BYTE *)v4 + 40))
    {
      goto LABEL_190;
    }
  }
  else if ((v6 & 0x40) != 0)
  {
    goto LABEL_190;
  }
  if ((*(_BYTE *)&flags & 2) != 0)
  {
    if ((v6 & 2) == 0 || self->_drivingVoiceSettings != *((_DWORD *)v4 + 5))
      goto LABEL_190;
  }
  else if ((v6 & 2) != 0)
  {
    goto LABEL_190;
  }
  if ((*(_BYTE *)&flags & 0x20) != 0)
  {
    if ((v6 & 0x20) == 0 || self->_walkingVoiceSettings != *((_DWORD *)v4 + 9))
      goto LABEL_190;
  }
  else if ((v6 & 0x20) != 0)
  {
    goto LABEL_190;
  }
  if ((*(_BYTE *)&flags & 1) != 0)
  {
    if ((v6 & 1) == 0 || self->_cyclingVoiceSettings != *((_DWORD *)v4 + 4))
      goto LABEL_190;
  }
  else if ((v6 & 1) != 0)
  {
    goto LABEL_190;
  }
  if ((*(_DWORD *)&flags & 0x1000000) != 0)
  {
    if ((v6 & 0x1000000) == 0)
      goto LABEL_190;
    if (self->_walkingAvoidHills)
    {
      if (!*((_BYTE *)v4 + 58))
        goto LABEL_190;
    }
    else if (*((_BYTE *)v4 + 58))
    {
      goto LABEL_190;
    }
  }
  else if ((v6 & 0x1000000) != 0)
  {
    goto LABEL_190;
  }
  if ((*(_DWORD *)&flags & 0x800000) != 0)
  {
    if ((v6 & 0x800000) == 0)
      goto LABEL_190;
    if (self->_walkingAvoidBusyRoads)
    {
      if (!*((_BYTE *)v4 + 57))
        goto LABEL_190;
    }
    else if (*((_BYTE *)v4 + 57))
    {
      goto LABEL_190;
    }
  }
  else if ((v6 & 0x800000) != 0)
  {
    goto LABEL_190;
  }
  if ((*(_DWORD *)&flags & 0x2000000) != 0)
  {
    if ((v6 & 0x2000000) == 0)
      goto LABEL_190;
    if (self->_walkingAvoidStairs)
    {
      if (!*((_BYTE *)v4 + 59))
        goto LABEL_190;
    }
    else if (*((_BYTE *)v4 + 59))
    {
      goto LABEL_190;
    }
  }
  else if ((v6 & 0x2000000) != 0)
  {
    goto LABEL_190;
  }
  if ((*(_WORD *)&flags & 0x2000) != 0)
  {
    if ((v6 & 0x2000) == 0)
      goto LABEL_190;
    if (self->_bikingAvoidHills)
    {
      if (!*((_BYTE *)v4 + 47))
        goto LABEL_190;
    }
    else if (*((_BYTE *)v4 + 47))
    {
      goto LABEL_190;
    }
  }
  else if ((v6 & 0x2000) != 0)
  {
    goto LABEL_190;
  }
  if ((*(_WORD *)&flags & 0x4000) != 0)
  {
    if ((v6 & 0x4000) == 0)
      goto LABEL_190;
    if (self->_bikingAvoidStairs)
    {
      if (!*((_BYTE *)v4 + 48))
        goto LABEL_190;
    }
    else if (*((_BYTE *)v4 + 48))
    {
      goto LABEL_190;
    }
  }
  else if ((v6 & 0x4000) != 0)
  {
    goto LABEL_190;
  }
  if ((*(_WORD *)&flags & 0x1000) != 0)
  {
    if ((v6 & 0x1000) == 0)
      goto LABEL_190;
    if (self->_bikingAvoidBusyRoads)
    {
      if (!*((_BYTE *)v4 + 46))
        goto LABEL_190;
    }
    else if (*((_BYTE *)v4 + 46))
    {
      goto LABEL_190;
    }
  }
  else if ((v6 & 0x1000) != 0)
  {
    goto LABEL_190;
  }
  if ((*(_WORD *)&flags & 0x8000) != 0)
  {
    if ((v6 & 0x8000) != 0)
    {
      if (self->_directionsWakeDevice)
      {
        if (!*((_BYTE *)v4 + 49))
          goto LABEL_190;
      }
      else if (*((_BYTE *)v4 + 49))
      {
        goto LABEL_190;
      }
      v8 = 1;
      goto LABEL_191;
    }
LABEL_190:
    v8 = 0;
    goto LABEL_191;
  }
  v8 = (v6 & 0x8000) == 0;
LABEL_191:

  return v8;
}

- (unint64_t)hash
{
  $BCC5AE05094F9DBFF15DB1C7A33A3F08 flags;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  $BCC5AE05094F9DBFF15DB1C7A33A3F08 v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;

  -[GEOLogMsgStateMapSettings readAll:](self, "readAll:", 1);
  flags = self->_flags;
  if ((*(_BYTE *)&flags & 0x10) != 0)
  {
    v33 = 2654435761 * self->_preferredTransportMode;
    if ((*(_WORD *)&flags & 0x800) != 0)
    {
LABEL_3:
      v32 = 2654435761 * self->_avoidTolls;
      if ((*(_WORD *)&flags & 0x100) != 0)
        goto LABEL_4;
      goto LABEL_19;
    }
  }
  else
  {
    v33 = 0;
    if ((*(_WORD *)&flags & 0x800) != 0)
      goto LABEL_3;
  }
  v32 = 0;
  if ((*(_WORD *)&flags & 0x100) != 0)
  {
LABEL_4:
    v31 = 2654435761 * self->_avoidHighways;
    if ((*(_DWORD *)&flags & 0x40000) != 0)
      goto LABEL_5;
    goto LABEL_20;
  }
LABEL_19:
  v31 = 0;
  if ((*(_DWORD *)&flags & 0x40000) != 0)
  {
LABEL_5:
    v30 = 2654435761 * self->_headingEnabled;
    if ((*(_DWORD *)&flags & 0x200000) != 0)
      goto LABEL_6;
    goto LABEL_21;
  }
LABEL_20:
  v30 = 0;
  if ((*(_DWORD *)&flags & 0x200000) != 0)
  {
LABEL_6:
    v29 = 2654435761 * self->_speedLimitEnabled;
    if ((*(_BYTE *)&flags & 8) != 0)
      goto LABEL_7;
    goto LABEL_22;
  }
LABEL_21:
  v29 = 0;
  if ((*(_BYTE *)&flags & 8) != 0)
  {
LABEL_7:
    v28 = 2654435761 * self->_navVoiceVolume;
    if ((*(_DWORD *)&flags & 0x100000) != 0)
      goto LABEL_8;
    goto LABEL_23;
  }
LABEL_22:
  v28 = 0;
  if ((*(_DWORD *)&flags & 0x100000) != 0)
  {
LABEL_8:
    v27 = 2654435761 * self->_pauseSpokenAudioEnabled;
    if ((*(_DWORD *)&flags & 0x20000) != 0)
      goto LABEL_9;
    goto LABEL_24;
  }
LABEL_23:
  v27 = 0;
  if ((*(_DWORD *)&flags & 0x20000) != 0)
  {
LABEL_9:
    v25 = 2654435761 * self->_findMyCarEnabled;
    if ((*(_DWORD *)&flags & 0x400000) != 0)
      goto LABEL_10;
    goto LABEL_25;
  }
LABEL_24:
  v25 = 0;
  if ((*(_DWORD *)&flags & 0x400000) != 0)
  {
LABEL_10:
    v4 = 2654435761 * self->_trafficEnabled;
    if ((*(_DWORD *)&flags & 0x80000) != 0)
      goto LABEL_11;
    goto LABEL_26;
  }
LABEL_25:
  v4 = 0;
  if ((*(_DWORD *)&flags & 0x80000) != 0)
  {
LABEL_11:
    v5 = 2654435761 * self->_labelEnabled;
    if ((*(_WORD *)&flags & 0x200) != 0)
      goto LABEL_12;
    goto LABEL_27;
  }
LABEL_26:
  v5 = 0;
  if ((*(_WORD *)&flags & 0x200) != 0)
  {
LABEL_12:
    v6 = 2654435761 * self->_avoidHills;
    if ((*(_WORD *)&flags & 0x400) != 0)
      goto LABEL_13;
    goto LABEL_28;
  }
LABEL_27:
  v6 = 0;
  if ((*(_WORD *)&flags & 0x400) != 0)
  {
LABEL_13:
    v7 = 2654435761 * self->_avoidStairs;
    if ((*(_BYTE *)&flags & 0x80) != 0)
      goto LABEL_14;
    goto LABEL_29;
  }
LABEL_28:
  v7 = 0;
  if ((*(_BYTE *)&flags & 0x80) != 0)
  {
LABEL_14:
    v8 = 2654435761 * self->_avoidBusyRoads;
    if ((*(_BYTE *)&flags & 4) != 0)
      goto LABEL_15;
LABEL_30:
    v9 = 0;
    if ((*(_DWORD *)&flags & 0x10000) != 0)
      goto LABEL_16;
    goto LABEL_31;
  }
LABEL_29:
  v8 = 0;
  if ((*(_BYTE *)&flags & 4) == 0)
    goto LABEL_30;
LABEL_15:
  v9 = 2654435761 * self->_locationType;
  if ((*(_DWORD *)&flags & 0x10000) != 0)
  {
LABEL_16:
    v10 = 2654435761 * self->_eBike;
    goto LABEL_32;
  }
LABEL_31:
  v10 = 0;
LABEL_32:
  v11 = -[NSMutableArray hash](self->_navVoiceSettings, "hash", v25);
  v12 = self->_flags;
  if ((*(_BYTE *)&v12 & 0x40) != 0)
  {
    v13 = 2654435761 * self->_hFPEnabled;
    if ((*(_BYTE *)&v12 & 2) != 0)
    {
LABEL_34:
      v14 = 2654435761 * self->_drivingVoiceSettings;
      if ((*(_BYTE *)&v12 & 0x20) != 0)
        goto LABEL_35;
      goto LABEL_46;
    }
  }
  else
  {
    v13 = 0;
    if ((*(_BYTE *)&v12 & 2) != 0)
      goto LABEL_34;
  }
  v14 = 0;
  if ((*(_BYTE *)&v12 & 0x20) != 0)
  {
LABEL_35:
    v15 = 2654435761 * self->_walkingVoiceSettings;
    if ((*(_BYTE *)&v12 & 1) != 0)
      goto LABEL_36;
    goto LABEL_47;
  }
LABEL_46:
  v15 = 0;
  if ((*(_BYTE *)&v12 & 1) != 0)
  {
LABEL_36:
    v16 = 2654435761 * self->_cyclingVoiceSettings;
    if ((*(_DWORD *)&v12 & 0x1000000) != 0)
      goto LABEL_37;
    goto LABEL_48;
  }
LABEL_47:
  v16 = 0;
  if ((*(_DWORD *)&v12 & 0x1000000) != 0)
  {
LABEL_37:
    v17 = 2654435761 * self->_walkingAvoidHills;
    if ((*(_DWORD *)&v12 & 0x800000) != 0)
      goto LABEL_38;
    goto LABEL_49;
  }
LABEL_48:
  v17 = 0;
  if ((*(_DWORD *)&v12 & 0x800000) != 0)
  {
LABEL_38:
    v18 = 2654435761 * self->_walkingAvoidBusyRoads;
    if ((*(_DWORD *)&v12 & 0x2000000) != 0)
      goto LABEL_39;
    goto LABEL_50;
  }
LABEL_49:
  v18 = 0;
  if ((*(_DWORD *)&v12 & 0x2000000) != 0)
  {
LABEL_39:
    v19 = 2654435761 * self->_walkingAvoidStairs;
    if ((*(_WORD *)&v12 & 0x2000) != 0)
      goto LABEL_40;
    goto LABEL_51;
  }
LABEL_50:
  v19 = 0;
  if ((*(_WORD *)&v12 & 0x2000) != 0)
  {
LABEL_40:
    v20 = 2654435761 * self->_bikingAvoidHills;
    if ((*(_WORD *)&v12 & 0x4000) != 0)
      goto LABEL_41;
    goto LABEL_52;
  }
LABEL_51:
  v20 = 0;
  if ((*(_WORD *)&v12 & 0x4000) != 0)
  {
LABEL_41:
    v21 = 2654435761 * self->_bikingAvoidStairs;
    if ((*(_WORD *)&v12 & 0x1000) != 0)
      goto LABEL_42;
LABEL_53:
    v22 = 0;
    if ((*(_WORD *)&v12 & 0x8000) != 0)
      goto LABEL_43;
LABEL_54:
    v23 = 0;
    return v32 ^ v33 ^ v31 ^ v30 ^ v29 ^ v28 ^ v27 ^ v26 ^ v4 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9 ^ v10 ^ v13 ^ v14 ^ v15 ^ v16 ^ v17 ^ v18 ^ v11 ^ v19 ^ v20 ^ v21 ^ v22 ^ v23;
  }
LABEL_52:
  v21 = 0;
  if ((*(_WORD *)&v12 & 0x1000) == 0)
    goto LABEL_53;
LABEL_42:
  v22 = 2654435761 * self->_bikingAvoidBusyRoads;
  if ((*(_WORD *)&v12 & 0x8000) == 0)
    goto LABEL_54;
LABEL_43:
  v23 = 2654435761 * self->_directionsWakeDevice;
  return v32 ^ v33 ^ v31 ^ v30 ^ v29 ^ v28 ^ v27 ^ v26 ^ v4 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9 ^ v10 ^ v13 ^ v14 ^ v15 ^ v16 ^ v17 ^ v18 ^ v11 ^ v19 ^ v20 ^ v21 ^ v22 ^ v23;
}

- (void)mergeFrom:(id)a3
{
  id v4;
  int v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  int v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(v4, "readAll:", 0);
  v5 = *((_DWORD *)v4 + 15);
  if ((v5 & 0x10) != 0)
  {
    self->_preferredTransportMode = *((_DWORD *)v4 + 8);
    *(_DWORD *)&self->_flags |= 0x10u;
    v5 = *((_DWORD *)v4 + 15);
    if ((v5 & 0x800) == 0)
    {
LABEL_3:
      if ((v5 & 0x100) == 0)
        goto LABEL_4;
      goto LABEL_39;
    }
  }
  else if ((v5 & 0x800) == 0)
  {
    goto LABEL_3;
  }
  self->_avoidTolls = *((_BYTE *)v4 + 45);
  *(_DWORD *)&self->_flags |= 0x800u;
  v5 = *((_DWORD *)v4 + 15);
  if ((v5 & 0x100) == 0)
  {
LABEL_4:
    if ((v5 & 0x40000) == 0)
      goto LABEL_5;
    goto LABEL_40;
  }
LABEL_39:
  self->_avoidHighways = *((_BYTE *)v4 + 42);
  *(_DWORD *)&self->_flags |= 0x100u;
  v5 = *((_DWORD *)v4 + 15);
  if ((v5 & 0x40000) == 0)
  {
LABEL_5:
    if ((v5 & 0x200000) == 0)
      goto LABEL_6;
    goto LABEL_41;
  }
LABEL_40:
  self->_headingEnabled = *((_BYTE *)v4 + 52);
  *(_DWORD *)&self->_flags |= 0x40000u;
  v5 = *((_DWORD *)v4 + 15);
  if ((v5 & 0x200000) == 0)
  {
LABEL_6:
    if ((v5 & 8) == 0)
      goto LABEL_7;
    goto LABEL_42;
  }
LABEL_41:
  self->_speedLimitEnabled = *((_BYTE *)v4 + 55);
  *(_DWORD *)&self->_flags |= 0x200000u;
  v5 = *((_DWORD *)v4 + 15);
  if ((v5 & 8) == 0)
  {
LABEL_7:
    if ((v5 & 0x100000) == 0)
      goto LABEL_8;
    goto LABEL_43;
  }
LABEL_42:
  self->_navVoiceVolume = *((_DWORD *)v4 + 7);
  *(_DWORD *)&self->_flags |= 8u;
  v5 = *((_DWORD *)v4 + 15);
  if ((v5 & 0x100000) == 0)
  {
LABEL_8:
    if ((v5 & 0x20000) == 0)
      goto LABEL_9;
    goto LABEL_44;
  }
LABEL_43:
  self->_pauseSpokenAudioEnabled = *((_BYTE *)v4 + 54);
  *(_DWORD *)&self->_flags |= 0x100000u;
  v5 = *((_DWORD *)v4 + 15);
  if ((v5 & 0x20000) == 0)
  {
LABEL_9:
    if ((v5 & 0x400000) == 0)
      goto LABEL_10;
    goto LABEL_45;
  }
LABEL_44:
  self->_findMyCarEnabled = *((_BYTE *)v4 + 51);
  *(_DWORD *)&self->_flags |= 0x20000u;
  v5 = *((_DWORD *)v4 + 15);
  if ((v5 & 0x400000) == 0)
  {
LABEL_10:
    if ((v5 & 0x80000) == 0)
      goto LABEL_11;
    goto LABEL_46;
  }
LABEL_45:
  self->_trafficEnabled = *((_BYTE *)v4 + 56);
  *(_DWORD *)&self->_flags |= 0x400000u;
  v5 = *((_DWORD *)v4 + 15);
  if ((v5 & 0x80000) == 0)
  {
LABEL_11:
    if ((v5 & 0x200) == 0)
      goto LABEL_12;
    goto LABEL_47;
  }
LABEL_46:
  self->_labelEnabled = *((_BYTE *)v4 + 53);
  *(_DWORD *)&self->_flags |= 0x80000u;
  v5 = *((_DWORD *)v4 + 15);
  if ((v5 & 0x200) == 0)
  {
LABEL_12:
    if ((v5 & 0x400) == 0)
      goto LABEL_13;
    goto LABEL_48;
  }
LABEL_47:
  self->_avoidHills = *((_BYTE *)v4 + 43);
  *(_DWORD *)&self->_flags |= 0x200u;
  v5 = *((_DWORD *)v4 + 15);
  if ((v5 & 0x400) == 0)
  {
LABEL_13:
    if ((v5 & 0x80) == 0)
      goto LABEL_14;
    goto LABEL_49;
  }
LABEL_48:
  self->_avoidStairs = *((_BYTE *)v4 + 44);
  *(_DWORD *)&self->_flags |= 0x400u;
  v5 = *((_DWORD *)v4 + 15);
  if ((v5 & 0x80) == 0)
  {
LABEL_14:
    if ((v5 & 4) == 0)
      goto LABEL_15;
    goto LABEL_50;
  }
LABEL_49:
  self->_avoidBusyRoads = *((_BYTE *)v4 + 41);
  *(_DWORD *)&self->_flags |= 0x80u;
  v5 = *((_DWORD *)v4 + 15);
  if ((v5 & 4) == 0)
  {
LABEL_15:
    if ((v5 & 0x10000) == 0)
      goto LABEL_17;
    goto LABEL_16;
  }
LABEL_50:
  self->_locationType = *((_DWORD *)v4 + 6);
  *(_DWORD *)&self->_flags |= 4u;
  if ((*((_DWORD *)v4 + 15) & 0x10000) != 0)
  {
LABEL_16:
    self->_eBike = *((_BYTE *)v4 + 50);
    *(_DWORD *)&self->_flags |= 0x10000u;
  }
LABEL_17:
  v14 = 0u;
  v15 = 0u;
  v12 = 0u;
  v13 = 0u;
  v6 = *((id *)v4 + 1);
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v13;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v13 != v9)
          objc_enumerationMutation(v6);
        -[GEOLogMsgStateMapSettings addNavVoiceSettings:](self, "addNavVoiceSettings:", *(_QWORD *)(*((_QWORD *)&v12 + 1) + 8 * v10++), (_QWORD)v12);
      }
      while (v8 != v10);
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v8);
  }

  v11 = *((_DWORD *)v4 + 15);
  if ((v11 & 0x40) != 0)
  {
    self->_hFPEnabled = *((_BYTE *)v4 + 40);
    *(_DWORD *)&self->_flags |= 0x40u;
    v11 = *((_DWORD *)v4 + 15);
    if ((v11 & 2) == 0)
    {
LABEL_26:
      if ((v11 & 0x20) == 0)
        goto LABEL_27;
      goto LABEL_54;
    }
  }
  else if ((v11 & 2) == 0)
  {
    goto LABEL_26;
  }
  self->_drivingVoiceSettings = *((_DWORD *)v4 + 5);
  *(_DWORD *)&self->_flags |= 2u;
  v11 = *((_DWORD *)v4 + 15);
  if ((v11 & 0x20) == 0)
  {
LABEL_27:
    if ((v11 & 1) == 0)
      goto LABEL_28;
    goto LABEL_55;
  }
LABEL_54:
  self->_walkingVoiceSettings = *((_DWORD *)v4 + 9);
  *(_DWORD *)&self->_flags |= 0x20u;
  v11 = *((_DWORD *)v4 + 15);
  if ((v11 & 1) == 0)
  {
LABEL_28:
    if ((v11 & 0x1000000) == 0)
      goto LABEL_29;
    goto LABEL_56;
  }
LABEL_55:
  self->_cyclingVoiceSettings = *((_DWORD *)v4 + 4);
  *(_DWORD *)&self->_flags |= 1u;
  v11 = *((_DWORD *)v4 + 15);
  if ((v11 & 0x1000000) == 0)
  {
LABEL_29:
    if ((v11 & 0x800000) == 0)
      goto LABEL_30;
    goto LABEL_57;
  }
LABEL_56:
  self->_walkingAvoidHills = *((_BYTE *)v4 + 58);
  *(_DWORD *)&self->_flags |= 0x1000000u;
  v11 = *((_DWORD *)v4 + 15);
  if ((v11 & 0x800000) == 0)
  {
LABEL_30:
    if ((v11 & 0x2000000) == 0)
      goto LABEL_31;
    goto LABEL_58;
  }
LABEL_57:
  self->_walkingAvoidBusyRoads = *((_BYTE *)v4 + 57);
  *(_DWORD *)&self->_flags |= 0x800000u;
  v11 = *((_DWORD *)v4 + 15);
  if ((v11 & 0x2000000) == 0)
  {
LABEL_31:
    if ((v11 & 0x2000) == 0)
      goto LABEL_32;
    goto LABEL_59;
  }
LABEL_58:
  self->_walkingAvoidStairs = *((_BYTE *)v4 + 59);
  *(_DWORD *)&self->_flags |= 0x2000000u;
  v11 = *((_DWORD *)v4 + 15);
  if ((v11 & 0x2000) == 0)
  {
LABEL_32:
    if ((v11 & 0x4000) == 0)
      goto LABEL_33;
    goto LABEL_60;
  }
LABEL_59:
  self->_bikingAvoidHills = *((_BYTE *)v4 + 47);
  *(_DWORD *)&self->_flags |= 0x2000u;
  v11 = *((_DWORD *)v4 + 15);
  if ((v11 & 0x4000) == 0)
  {
LABEL_33:
    if ((v11 & 0x1000) == 0)
      goto LABEL_34;
LABEL_61:
    self->_bikingAvoidBusyRoads = *((_BYTE *)v4 + 46);
    *(_DWORD *)&self->_flags |= 0x1000u;
    if ((*((_DWORD *)v4 + 15) & 0x8000) == 0)
      goto LABEL_36;
    goto LABEL_35;
  }
LABEL_60:
  self->_bikingAvoidStairs = *((_BYTE *)v4 + 48);
  *(_DWORD *)&self->_flags |= 0x4000u;
  v11 = *((_DWORD *)v4 + 15);
  if ((v11 & 0x1000) != 0)
    goto LABEL_61;
LABEL_34:
  if ((v11 & 0x8000) != 0)
  {
LABEL_35:
    self->_directionsWakeDevice = *((_BYTE *)v4 + 49);
    *(_DWORD *)&self->_flags |= 0x8000u;
  }
LABEL_36:

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_navVoiceSettings, 0);
}

@end
