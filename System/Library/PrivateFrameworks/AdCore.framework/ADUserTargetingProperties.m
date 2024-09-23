@implementation ADUserTargetingProperties

- (void)dealloc
{
  objc_super v3;

  PBRepeatedInt32Clear();
  PBRepeatedInt32Clear();
  PBRepeatedInt32Clear();
  v3.receiver = self;
  v3.super_class = (Class)ADUserTargetingProperties;
  -[ADUserTargetingProperties dealloc](&v3, sel_dealloc);
}

- (void)setClientClockTime:(double)a3
{
  *(_WORD *)&self->_has |= 1u;
  self->_clientClockTime = a3;
}

- (void)setHasClientClockTime:(BOOL)a3
{
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFFE | a3;
}

- (BOOL)hasClientClockTime
{
  return *(_WORD *)&self->_has & 1;
}

- (BOOL)hasAppID
{
  return self->_appID != 0;
}

- (BOOL)hasDeviceModel
{
  return self->_deviceModel != 0;
}

- (void)setTimezone:(float)a3
{
  *(_WORD *)&self->_has |= 0x200u;
  self->_timezone = a3;
}

- (void)setHasTimezone:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 512;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFDFF | v3;
}

- (BOOL)hasTimezone
{
  return (*(_WORD *)&self->_has >> 9) & 1;
}

- (int)runState
{
  if ((*(_WORD *)&self->_has & 0x100) != 0)
    return self->_runState;
  else
    return 0;
}

- (void)setRunState:(int)a3
{
  *(_WORD *)&self->_has |= 0x100u;
  self->_runState = a3;
}

- (void)setHasRunState:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 256;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFEFF | v3;
}

- (BOOL)hasRunState
{
  return HIBYTE(*(_WORD *)&self->_has) & 1;
}

- (id)runStateAsString:(int)a3
{
  if (a3 < 3)
    return off_1E82B2438[a3];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (int)StringAsRunState:(id)a3
{
  id v3;
  int v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("Simulator")) & 1) != 0)
  {
    v4 = 0;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("DevelopmentDevice")) & 1) != 0)
  {
    v4 = 1;
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("ConsumerDevice")))
  {
    v4 = 2;
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (BOOL)hasAppVersion
{
  return self->_appVersion != 0;
}

- (BOOL)hasOsVersionAndBuild
{
  return self->_osVersionAndBuild != 0;
}

- (BOOL)hasITunesStore
{
  return self->_iTunesStore != 0;
}

- (BOOL)hasLocaleIdentifier
{
  return self->_localeIdentifier != 0;
}

- (void)clearUserKeyboards
{
  -[NSMutableArray removeAllObjects](self->_userKeyboards, "removeAllObjects");
}

- (void)addUserKeyboard:(id)a3
{
  id v4;
  NSMutableArray *userKeyboards;
  NSMutableArray *v6;
  NSMutableArray *v7;
  id v8;

  v4 = a3;
  userKeyboards = self->_userKeyboards;
  v8 = v4;
  if (!userKeyboards)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v7 = self->_userKeyboards;
    self->_userKeyboards = v6;

    v4 = v8;
    userKeyboards = self->_userKeyboards;
  }
  -[NSMutableArray addObject:](userKeyboards, "addObject:", v4);

}

- (unint64_t)userKeyboardsCount
{
  return -[NSMutableArray count](self->_userKeyboards, "count");
}

- (id)userKeyboardAtIndex:(unint64_t)a3
{
  return (id)-[NSMutableArray objectAtIndex:](self->_userKeyboards, "objectAtIndex:", a3);
}

+ (Class)userKeyboardType
{
  return (Class)objc_opt_class();
}

- (void)setAppsRank:(int)a3
{
  *(_WORD *)&self->_has |= 4u;
  self->_appsRank = a3;
}

- (void)setHasAppsRank:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 4;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFFB | v3;
}

- (BOOL)hasAppsRank
{
  return (*(_WORD *)&self->_has >> 2) & 1;
}

- (unint64_t)deviceModesCount
{
  return self->_deviceModes.count;
}

- (int)deviceModes
{
  return self->_deviceModes.list;
}

- (void)clearDeviceModes
{
  PBRepeatedInt32Clear();
}

- (void)addDeviceMode:(int)a3
{
  PBRepeatedInt32Add();
}

- (int)deviceModeAtIndex:(unint64_t)a3
{
  $27AAA0BB14FCB8642CC83DAEBE69EA4A *p_deviceModes;
  unint64_t count;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;

  p_deviceModes = &self->_deviceModes;
  count = self->_deviceModes.count;
  if (count <= a3)
  {
    v6 = (void *)MEMORY[0x1E0C99DA0];
    v7 = *MEMORY[0x1E0C99858];
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("idx (%lu) is out of range (%lu)"), a3, count);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "exceptionWithName:reason:userInfo:", v7, v8, 0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "raise");

  }
  return p_deviceModes->list[a3];
}

- (void)setDeviceModes:(int *)a3 count:(unint64_t)a4
{
  PBRepeatedInt32Set();
}

- (id)deviceModesAsString:(int)a3
{
  if (a3 < 3)
    return off_1E82B2450[a3];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (int)StringAsDeviceModes:(id)a3
{
  id v3;
  int v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("Default")) & 1) != 0)
  {
    v4 = 0;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("EducationMode")) & 1) != 0)
  {
    v4 = 1;
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("GuestMode")))
  {
    v4 = 2;
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (unint64_t)accountTypesCount
{
  return self->_accountTypes.count;
}

- (int)accountTypes
{
  return self->_accountTypes.list;
}

- (void)clearAccountTypes
{
  PBRepeatedInt32Clear();
}

- (void)addAccountType:(int)a3
{
  PBRepeatedInt32Add();
}

- (int)accountTypeAtIndex:(unint64_t)a3
{
  $27AAA0BB14FCB8642CC83DAEBE69EA4A *p_accountTypes;
  unint64_t count;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;

  p_accountTypes = &self->_accountTypes;
  count = self->_accountTypes.count;
  if (count <= a3)
  {
    v6 = (void *)MEMORY[0x1E0C99DA0];
    v7 = *MEMORY[0x1E0C99858];
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("idx (%lu) is out of range (%lu)"), a3, count);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "exceptionWithName:reason:userInfo:", v7, v8, 0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "raise");

  }
  return p_accountTypes->list[a3];
}

- (void)setAccountTypes:(int *)a3 count:(unint64_t)a4
{
  PBRepeatedInt32Set();
}

- (id)accountTypesAsString:(int)a3
{
  if (a3 < 8)
    return off_1E82B2468[a3];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (int)StringAsAccountTypes:(id)a3
{
  id v3;
  int v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("NoAccount")) & 1) != 0)
  {
    v4 = 0;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("Consumer")) & 1) != 0)
  {
    v4 = 1;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("ManagedAccount")) & 1) != 0)
  {
    v4 = 2;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("U13")) & 1) != 0)
  {
    v4 = 3;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("T13")) & 1) != 0)
  {
    v4 = 4;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("U18")) & 1) != 0)
  {
    v4 = 5;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("Unknown_Age")) & 1) != 0)
  {
    v4 = 6;
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("SensitiveContentEligible")))
  {
    v4 = 7;
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (void)setLatitude:(float)a3
{
  *(_WORD *)&self->_has |= 0x20u;
  self->_latitude = a3;
}

- (void)setHasLatitude:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 32;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFDF | v3;
}

- (BOOL)hasLatitude
{
  return (*(_WORD *)&self->_has >> 5) & 1;
}

- (void)setLongitude:(float)a3
{
  *(_WORD *)&self->_has |= 0x40u;
  self->_longitude = a3;
}

- (void)setHasLongitude:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 64;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFBF | v3;
}

- (BOOL)hasLongitude
{
  return (*(_WORD *)&self->_has >> 6) & 1;
}

- (void)setHorizontalAccuracy:(float)a3
{
  *(_WORD *)&self->_has |= 0x10u;
  self->_horizontalAccuracy = a3;
}

- (void)setHasHorizontalAccuracy:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 16;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFEF | v3;
}

- (BOOL)hasHorizontalAccuracy
{
  return (*(_WORD *)&self->_has >> 4) & 1;
}

- (BOOL)hasIsoCountryCode
{
  return self->_isoCountryCode != 0;
}

- (void)clearTargetings
{
  -[NSMutableArray removeAllObjects](self->_targetings, "removeAllObjects");
}

- (void)addTargeting:(id)a3
{
  id v4;
  NSMutableArray *targetings;
  NSMutableArray *v6;
  NSMutableArray *v7;
  id v8;

  v4 = a3;
  targetings = self->_targetings;
  v8 = v4;
  if (!targetings)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v7 = self->_targetings;
    self->_targetings = v6;

    v4 = v8;
    targetings = self->_targetings;
  }
  -[NSMutableArray addObject:](targetings, "addObject:", v4);

}

- (unint64_t)targetingsCount
{
  return -[NSMutableArray count](self->_targetings, "count");
}

- (id)targetingAtIndex:(unint64_t)a3
{
  return (id)-[NSMutableArray objectAtIndex:](self->_targetings, "objectAtIndex:", a3);
}

+ (Class)targetingType
{
  return (Class)objc_opt_class();
}

- (void)setLimitAdTracking:(BOOL)a3
{
  *(_WORD *)&self->_has |= 0x800u;
  self->_limitAdTracking = a3;
}

- (void)setHasLimitAdTracking:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 2048;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xF7FF | v3;
}

- (BOOL)hasLimitAdTracking
{
  return (*(_WORD *)&self->_has >> 11) & 1;
}

- (BOOL)hasToroIDString
{
  return self->_toroIDString != 0;
}

- (BOOL)hasIAdIDString
{
  return self->_iAdIDString != 0;
}

- (BOOL)hasAlgoId
{
  return self->_algoId != 0;
}

- (BOOL)hasDPIDString
{
  return self->_dPIDString != 0;
}

- (BOOL)hasPostalCode
{
  return self->_postalCode != 0;
}

- (BOOL)hasAdministrativeArea
{
  return self->_administrativeArea != 0;
}

- (BOOL)hasLocality
{
  return self->_locality != 0;
}

- (BOOL)hasSubAdministrativeArea
{
  return self->_subAdministrativeArea != 0;
}

- (void)setAdvertisingIdentifierMonthResetCount:(int)a3
{
  *(_WORD *)&self->_has |= 2u;
  self->_advertisingIdentifierMonthResetCount = a3;
}

- (void)setHasAdvertisingIdentifierMonthResetCount:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFFD | v3;
}

- (BOOL)hasAdvertisingIdentifierMonthResetCount
{
  return (*(_WORD *)&self->_has >> 1) & 1;
}

- (BOOL)hasDeviceRequestID
{
  return self->_deviceRequestID != 0;
}

- (BOOL)hasCarrierMNC
{
  return self->_carrierMNC != 0;
}

- (BOOL)hasCarrierMCC
{
  return self->_carrierMCC != 0;
}

- (BOOL)hasCurrentCarrierMNC
{
  return self->_currentCarrierMNC != 0;
}

- (BOOL)hasCurrentCarrierMCC
{
  return self->_currentCarrierMCC != 0;
}

- (void)setIsOnInternationalDataRoaming:(BOOL)a3
{
  *(_WORD *)&self->_has |= 0x400u;
  self->_isOnInternationalDataRoaming = a3;
}

- (void)setHasIsOnInternationalDataRoaming:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 1024;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFBFF | v3;
}

- (BOOL)hasIsOnInternationalDataRoaming
{
  return (*(_WORD *)&self->_has >> 10) & 1;
}

- (int)connectionType
{
  if ((*(_WORD *)&self->_has & 8) != 0)
    return self->_connectionType;
  else
    return 0;
}

- (void)setConnectionType:(int)a3
{
  *(_WORD *)&self->_has |= 8u;
  self->_connectionType = a3;
}

- (void)setHasConnectionType:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 8;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFF7 | v3;
}

- (BOOL)hasConnectionType
{
  return (*(_WORD *)&self->_has >> 3) & 1;
}

- (id)connectionTypeAsString:(int)a3
{
  if (a3 < 0xB)
    return off_1E82B24A8[a3];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (int)StringAsConnectionType:(id)a3
{
  id v3;
  int v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("UnknownConnection")) & 1) != 0)
  {
    v4 = 0;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("None")) & 1) != 0)
  {
    v4 = 1;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("WiFi")) & 1) != 0)
  {
    v4 = 2;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("Cellular_2_G")) & 1) != 0)
  {
    v4 = 3;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("Cellular_2_5G")) & 1) != 0)
  {
    v4 = 4;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("Cellular_3_G")) & 1) != 0)
  {
    v4 = 5;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("Cellular_3_5G")) & 1) != 0)
  {
    v4 = 6;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("Cellular_3_75G")) & 1) != 0)
  {
    v4 = 7;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("Cellular_H_Plus")) & 1) != 0)
  {
    v4 = 8;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("Cellular_4G")) & 1) != 0)
  {
    v4 = 9;
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("Cellular_5G")))
  {
    v4 = 10;
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (BOOL)hasStoreFrontLanguageLocaleIdentifier
{
  return self->_storeFrontLanguageLocaleIdentifier != 0;
}

- (unint64_t)accountStatesCount
{
  return self->_accountStates.count;
}

- (int)accountStates
{
  return self->_accountStates.list;
}

- (void)clearAccountStates
{
  PBRepeatedInt32Clear();
}

- (void)addAccountState:(int)a3
{
  PBRepeatedInt32Add();
}

- (int)accountStateAtIndex:(unint64_t)a3
{
  $27AAA0BB14FCB8642CC83DAEBE69EA4A *p_accountStates;
  unint64_t count;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;

  p_accountStates = &self->_accountStates;
  count = self->_accountStates.count;
  if (count <= a3)
  {
    v6 = (void *)MEMORY[0x1E0C99DA0];
    v7 = *MEMORY[0x1E0C99858];
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("idx (%lu) is out of range (%lu)"), a3, count);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "exceptionWithName:reason:userInfo:", v7, v8, 0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "raise");

  }
  return p_accountStates->list[a3];
}

- (void)setAccountStates:(int *)a3 count:(unint64_t)a4
{
  PBRepeatedInt32Set();
}

- (id)accountStatesAsString:(int)a3
{
  if (a3 < 3)
    return off_1E82B2500[a3];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (int)StringAsAccountStates:(id)a3
{
  id v3;
  int v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("No_iCloud")) & 1) != 0)
  {
    v4 = 0;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("Same_iCloud")) & 1) != 0)
  {
    v4 = 1;
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("Diff_iCloud")))
  {
    v4 = 2;
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (int)overrideType
{
  if ((*(_WORD *)&self->_has & 0x80) != 0)
    return self->_overrideType;
  else
    return 11000;
}

- (void)setOverrideType:(int)a3
{
  *(_WORD *)&self->_has |= 0x80u;
  self->_overrideType = a3;
}

- (void)setHasOverrideType:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 128;
  else
    v3 = 0;
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFF7F | v3;
}

- (BOOL)hasOverrideType
{
  return (*(_WORD *)&self->_has >> 7) & 1;
}

- (id)overrideTypeAsString:(int)a3
{
  __CFString *v3;

  if (a3 == 11000)
    return CFSTR("NoOverride");
  if (a3 == 11001)
  {
    v3 = CFSTR("ODMLData");
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3);
    v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  return v3;
}

- (int)StringAsOverrideType:(id)a3
{
  id v3;
  int v4;

  v3 = a3;
  v4 = 11000;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("NoOverride")) & 1) == 0)
  {
    if (objc_msgSend(v3, "isEqualToString:", CFSTR("ODMLData")))
      v4 = 11001;
    else
      v4 = 11000;
  }

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
  v8.super_class = (Class)ADUserTargetingProperties;
  -[ADUserTargetingProperties description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[ADUserTargetingProperties dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  double v4;
  void *v5;
  NSString *appID;
  NSString *deviceModel;
  __int16 has;
  void *v9;
  uint64_t runState;
  __CFString *v11;
  NSString *appVersion;
  NSString *osVersionAndBuild;
  NSString *iTunesStore;
  NSString *localeIdentifier;
  NSMutableArray *userKeyboards;
  void *v17;
  $27AAA0BB14FCB8642CC83DAEBE69EA4A *p_deviceModes;
  void *v19;
  unint64_t v20;
  uint64_t v21;
  __CFString *v22;
  $27AAA0BB14FCB8642CC83DAEBE69EA4A *p_accountTypes;
  void *v24;
  unint64_t v25;
  uint64_t v26;
  __CFString *v27;
  __int16 v28;
  void *v29;
  NSString *isoCountryCode;
  void *v31;
  NSMutableArray *v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t i;
  void *v37;
  void *v38;
  NSString *toroIDString;
  NSString *iAdIDString;
  NSString *algoId;
  NSString *dPIDString;
  NSString *postalCode;
  NSString *administrativeArea;
  NSString *locality;
  NSString *subAdministrativeArea;
  void *v47;
  NSString *deviceRequestID;
  NSString *carrierMNC;
  NSString *carrierMCC;
  NSString *currentCarrierMNC;
  NSString *currentCarrierMCC;
  __int16 v53;
  void *v54;
  uint64_t connectionType;
  __CFString *v56;
  void *v57;
  void *v58;
  NSString *storeFrontLanguageLocaleIdentifier;
  $27AAA0BB14FCB8642CC83DAEBE69EA4A *p_accountStates;
  void *v61;
  unint64_t v62;
  uint64_t v63;
  __CFString *v64;
  int overrideType;
  __CFString *v66;
  id v67;
  __int128 v69;
  __int128 v70;
  __int128 v71;
  __int128 v72;
  _BYTE v73[128];
  uint64_t v74;

  v74 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((*(_WORD *)&self->_has & 1) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_clientClockTime);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v5, CFSTR("clientClockTime"));

  }
  appID = self->_appID;
  if (appID)
    objc_msgSend(v3, "setObject:forKey:", appID, CFSTR("appID"));
  deviceModel = self->_deviceModel;
  if (deviceModel)
    objc_msgSend(v3, "setObject:forKey:", deviceModel, CFSTR("deviceModel"));
  has = (__int16)self->_has;
  if ((has & 0x200) != 0)
  {
    *(float *)&v4 = self->_timezone;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v4);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v9, CFSTR("timezone"));

    has = (__int16)self->_has;
  }
  if ((has & 0x100) != 0)
  {
    runState = self->_runState;
    if (runState >= 3)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), self->_runState);
      v11 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v11 = off_1E82B2438[runState];
    }
    objc_msgSend(v3, "setObject:forKey:", v11, CFSTR("runState"));

  }
  appVersion = self->_appVersion;
  if (appVersion)
    objc_msgSend(v3, "setObject:forKey:", appVersion, CFSTR("appVersion"));
  osVersionAndBuild = self->_osVersionAndBuild;
  if (osVersionAndBuild)
    objc_msgSend(v3, "setObject:forKey:", osVersionAndBuild, CFSTR("osVersionAndBuild"));
  iTunesStore = self->_iTunesStore;
  if (iTunesStore)
    objc_msgSend(v3, "setObject:forKey:", iTunesStore, CFSTR("iTunesStore"));
  localeIdentifier = self->_localeIdentifier;
  if (localeIdentifier)
    objc_msgSend(v3, "setObject:forKey:", localeIdentifier, CFSTR("localeIdentifier"));
  userKeyboards = self->_userKeyboards;
  if (userKeyboards)
    objc_msgSend(v3, "setObject:forKey:", userKeyboards, CFSTR("userKeyboard"));
  if ((*(_WORD *)&self->_has & 4) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", self->_appsRank);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v17, CFSTR("appsRank"));

  }
  p_deviceModes = &self->_deviceModes;
  if (self->_deviceModes.count)
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    if (self->_deviceModes.count)
    {
      v20 = 0;
      do
      {
        v21 = p_deviceModes->list[v20];
        if (v21 >= 3)
        {
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), p_deviceModes->list[v20]);
          v22 = (__CFString *)objc_claimAutoreleasedReturnValue();
        }
        else
        {
          v22 = off_1E82B2450[v21];
        }
        objc_msgSend(v19, "addObject:", v22);

        ++v20;
      }
      while (v20 < self->_deviceModes.count);
    }
    objc_msgSend(v3, "setObject:forKey:", v19, CFSTR("deviceMode"));

  }
  p_accountTypes = &self->_accountTypes;
  if (self->_accountTypes.count)
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    if (self->_accountTypes.count)
    {
      v25 = 0;
      do
      {
        v26 = p_accountTypes->list[v25];
        if (v26 >= 8)
        {
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), p_accountTypes->list[v25]);
          v27 = (__CFString *)objc_claimAutoreleasedReturnValue();
        }
        else
        {
          v27 = off_1E82B2468[v26];
        }
        objc_msgSend(v24, "addObject:", v27);

        ++v25;
      }
      while (v25 < self->_accountTypes.count);
    }
    objc_msgSend(v3, "setObject:forKey:", v24, CFSTR("accountType"));

  }
  v28 = (__int16)self->_has;
  if ((v28 & 0x20) != 0)
  {
    *(float *)&v4 = self->_latitude;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v4);
    v57 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v57, CFSTR("latitude"));

    v28 = (__int16)self->_has;
    if ((v28 & 0x40) == 0)
    {
LABEL_44:
      if ((v28 & 0x10) == 0)
        goto LABEL_46;
      goto LABEL_45;
    }
  }
  else if ((v28 & 0x40) == 0)
  {
    goto LABEL_44;
  }
  *(float *)&v4 = self->_longitude;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v4);
  v58 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v58, CFSTR("longitude"));

  if ((*(_WORD *)&self->_has & 0x10) != 0)
  {
LABEL_45:
    *(float *)&v4 = self->_horizontalAccuracy;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v4);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v29, CFSTR("horizontalAccuracy"));

  }
LABEL_46:
  isoCountryCode = self->_isoCountryCode;
  if (isoCountryCode)
    objc_msgSend(v3, "setObject:forKey:", isoCountryCode, CFSTR("isoCountryCode"));
  if (-[NSMutableArray count](self->_targetings, "count"))
  {
    v31 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", -[NSMutableArray count](self->_targetings, "count"));
    v69 = 0u;
    v70 = 0u;
    v71 = 0u;
    v72 = 0u;
    v32 = self->_targetings;
    v33 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v32, "countByEnumeratingWithState:objects:count:", &v69, v73, 16);
    if (v33)
    {
      v34 = v33;
      v35 = *(_QWORD *)v70;
      do
      {
        for (i = 0; i != v34; ++i)
        {
          if (*(_QWORD *)v70 != v35)
            objc_enumerationMutation(v32);
          objc_msgSend(*(id *)(*((_QWORD *)&v69 + 1) + 8 * i), "dictionaryRepresentation");
          v37 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v31, "addObject:", v37);

        }
        v34 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v32, "countByEnumeratingWithState:objects:count:", &v69, v73, 16);
      }
      while (v34);
    }

    objc_msgSend(v3, "setObject:forKey:", v31, CFSTR("targeting"));
  }
  if ((*(_WORD *)&self->_has & 0x800) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_limitAdTracking);
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v38, CFSTR("limitAdTracking"));

  }
  toroIDString = self->_toroIDString;
  if (toroIDString)
    objc_msgSend(v3, "setObject:forKey:", toroIDString, CFSTR("toroIDString"));
  iAdIDString = self->_iAdIDString;
  if (iAdIDString)
    objc_msgSend(v3, "setObject:forKey:", iAdIDString, CFSTR("iAdIDString"));
  algoId = self->_algoId;
  if (algoId)
    objc_msgSend(v3, "setObject:forKey:", algoId, CFSTR("algoId"));
  dPIDString = self->_dPIDString;
  if (dPIDString)
    objc_msgSend(v3, "setObject:forKey:", dPIDString, CFSTR("DPIDString"));
  postalCode = self->_postalCode;
  if (postalCode)
    objc_msgSend(v3, "setObject:forKey:", postalCode, CFSTR("postalCode"));
  administrativeArea = self->_administrativeArea;
  if (administrativeArea)
    objc_msgSend(v3, "setObject:forKey:", administrativeArea, CFSTR("administrativeArea"));
  locality = self->_locality;
  if (locality)
    objc_msgSend(v3, "setObject:forKey:", locality, CFSTR("locality"));
  subAdministrativeArea = self->_subAdministrativeArea;
  if (subAdministrativeArea)
    objc_msgSend(v3, "setObject:forKey:", subAdministrativeArea, CFSTR("subAdministrativeArea"));
  if ((*(_WORD *)&self->_has & 2) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", self->_advertisingIdentifierMonthResetCount);
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v47, CFSTR("advertisingIdentifierMonthResetCount"));

  }
  deviceRequestID = self->_deviceRequestID;
  if (deviceRequestID)
    objc_msgSend(v3, "setObject:forKey:", deviceRequestID, CFSTR("deviceRequestID"));
  carrierMNC = self->_carrierMNC;
  if (carrierMNC)
    objc_msgSend(v3, "setObject:forKey:", carrierMNC, CFSTR("carrierMNC"));
  carrierMCC = self->_carrierMCC;
  if (carrierMCC)
    objc_msgSend(v3, "setObject:forKey:", carrierMCC, CFSTR("carrierMCC"));
  currentCarrierMNC = self->_currentCarrierMNC;
  if (currentCarrierMNC)
    objc_msgSend(v3, "setObject:forKey:", currentCarrierMNC, CFSTR("currentCarrierMNC"));
  currentCarrierMCC = self->_currentCarrierMCC;
  if (currentCarrierMCC)
    objc_msgSend(v3, "setObject:forKey:", currentCarrierMCC, CFSTR("currentCarrierMCC"));
  v53 = (__int16)self->_has;
  if ((v53 & 0x400) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_isOnInternationalDataRoaming);
    v54 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v54, CFSTR("isOnInternationalDataRoaming"));

    v53 = (__int16)self->_has;
  }
  if ((v53 & 8) != 0)
  {
    connectionType = self->_connectionType;
    if (connectionType >= 0xB)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), self->_connectionType);
      v56 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v56 = off_1E82B24A8[connectionType];
    }
    objc_msgSend(v3, "setObject:forKey:", v56, CFSTR("connectionType"));

  }
  storeFrontLanguageLocaleIdentifier = self->_storeFrontLanguageLocaleIdentifier;
  if (storeFrontLanguageLocaleIdentifier)
    objc_msgSend(v3, "setObject:forKey:", storeFrontLanguageLocaleIdentifier, CFSTR("storeFrontLanguageLocaleIdentifier"));
  p_accountStates = &self->_accountStates;
  if (self->_accountStates.count)
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:");
    v61 = (void *)objc_claimAutoreleasedReturnValue();
    if (self->_accountStates.count)
    {
      v62 = 0;
      do
      {
        v63 = p_accountStates->list[v62];
        if (v63 >= 3)
        {
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), p_accountStates->list[v62]);
          v64 = (__CFString *)objc_claimAutoreleasedReturnValue();
        }
        else
        {
          v64 = off_1E82B2500[v63];
        }
        objc_msgSend(v61, "addObject:", v64);

        ++v62;
      }
      while (v62 < self->_accountStates.count);
    }
    objc_msgSend(v3, "setObject:forKey:", v61, CFSTR("accountState"));

  }
  if ((*(_WORD *)&self->_has & 0x80) != 0)
  {
    overrideType = self->_overrideType;
    if (overrideType == 11000)
    {
      v66 = CFSTR("NoOverride");
    }
    else if (overrideType == 11001)
    {
      v66 = CFSTR("ODMLData");
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), self->_overrideType);
      v66 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(v3, "setObject:forKey:", v66, CFSTR("overrideType"));

  }
  v67 = v3;

  return v67;
}

- (BOOL)readFrom:(id)a3
{
  return ADUserTargetingPropertiesReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4;
  __int16 has;
  NSMutableArray *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  unint64_t v11;
  unint64_t v12;
  __int16 v13;
  NSMutableArray *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t j;
  __int16 v19;
  unint64_t v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  _BYTE v29[128];
  _BYTE v30[128];
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if ((*(_WORD *)&self->_has & 1) != 0)
    PBDataWriterWriteDoubleField();
  if (self->_appID)
    PBDataWriterWriteStringField();
  if (self->_deviceModel)
    PBDataWriterWriteStringField();
  has = (__int16)self->_has;
  if ((has & 0x200) != 0)
  {
    PBDataWriterWriteFloatField();
    has = (__int16)self->_has;
  }
  if ((has & 0x100) != 0)
    PBDataWriterWriteInt32Field();
  if (self->_appVersion)
    PBDataWriterWriteStringField();
  if (self->_osVersionAndBuild)
    PBDataWriterWriteStringField();
  if (self->_iTunesStore)
    PBDataWriterWriteStringField();
  if (self->_localeIdentifier)
    PBDataWriterWriteStringField();
  v27 = 0u;
  v28 = 0u;
  v25 = 0u;
  v26 = 0u;
  v6 = self->_userKeyboards;
  v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v25, v30, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v26;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v26 != v9)
          objc_enumerationMutation(v6);
        PBDataWriterWriteStringField();
      }
      v8 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v25, v30, 16);
    }
    while (v8);
  }

  if ((*(_WORD *)&self->_has & 4) != 0)
    PBDataWriterWriteInt32Field();
  if (self->_deviceModes.count)
  {
    v11 = 0;
    do
    {
      PBDataWriterWriteInt32Field();
      ++v11;
    }
    while (v11 < self->_deviceModes.count);
  }
  if (self->_accountTypes.count)
  {
    v12 = 0;
    do
    {
      PBDataWriterWriteInt32Field();
      ++v12;
    }
    while (v12 < self->_accountTypes.count);
  }
  v13 = (__int16)self->_has;
  if ((v13 & 0x20) != 0)
  {
    PBDataWriterWriteFloatField();
    v13 = (__int16)self->_has;
    if ((v13 & 0x40) == 0)
    {
LABEL_36:
      if ((v13 & 0x10) == 0)
        goto LABEL_38;
      goto LABEL_37;
    }
  }
  else if ((v13 & 0x40) == 0)
  {
    goto LABEL_36;
  }
  PBDataWriterWriteFloatField();
  if ((*(_WORD *)&self->_has & 0x10) != 0)
LABEL_37:
    PBDataWriterWriteFloatField();
LABEL_38:
  if (self->_isoCountryCode)
    PBDataWriterWriteStringField();
  v23 = 0u;
  v24 = 0u;
  v21 = 0u;
  v22 = 0u;
  v14 = self->_targetings;
  v15 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v14, "countByEnumeratingWithState:objects:count:", &v21, v29, 16);
  if (v15)
  {
    v16 = v15;
    v17 = *(_QWORD *)v22;
    do
    {
      for (j = 0; j != v16; ++j)
      {
        if (*(_QWORD *)v22 != v17)
          objc_enumerationMutation(v14);
        PBDataWriterWriteSubmessage();
      }
      v16 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v14, "countByEnumeratingWithState:objects:count:", &v21, v29, 16);
    }
    while (v16);
  }

  if ((*(_WORD *)&self->_has & 0x800) != 0)
    PBDataWriterWriteBOOLField();
  if (self->_toroIDString)
    PBDataWriterWriteStringField();
  if (self->_iAdIDString)
    PBDataWriterWriteStringField();
  if (self->_algoId)
    PBDataWriterWriteStringField();
  if (self->_dPIDString)
    PBDataWriterWriteStringField();
  if (self->_postalCode)
    PBDataWriterWriteStringField();
  if (self->_administrativeArea)
    PBDataWriterWriteStringField();
  if (self->_locality)
    PBDataWriterWriteStringField();
  if (self->_subAdministrativeArea)
    PBDataWriterWriteStringField();
  if ((*(_WORD *)&self->_has & 2) != 0)
    PBDataWriterWriteInt32Field();
  if (self->_deviceRequestID)
    PBDataWriterWriteStringField();
  if (self->_carrierMNC)
    PBDataWriterWriteStringField();
  if (self->_carrierMCC)
    PBDataWriterWriteStringField();
  if (self->_currentCarrierMNC)
    PBDataWriterWriteStringField();
  if (self->_currentCarrierMCC)
    PBDataWriterWriteStringField();
  v19 = (__int16)self->_has;
  if ((v19 & 0x400) != 0)
  {
    PBDataWriterWriteBOOLField();
    v19 = (__int16)self->_has;
  }
  if ((v19 & 8) != 0)
    PBDataWriterWriteInt32Field();
  if (self->_storeFrontLanguageLocaleIdentifier)
    PBDataWriterWriteStringField();
  if (self->_accountStates.count)
  {
    v20 = 0;
    do
    {
      PBDataWriterWriteInt32Field();
      ++v20;
    }
    while (v20 < self->_accountStates.count);
  }
  if ((*(_WORD *)&self->_has & 0x80) != 0)
    PBDataWriterWriteInt32Field();

}

- (void)copyTo:(id)a3
{
  _QWORD *v4;
  __int16 has;
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
  __int16 v16;
  unint64_t v17;
  unint64_t v18;
  uint64_t m;
  void *v20;
  _DWORD *v21;
  __int16 v22;
  unint64_t v23;
  unint64_t v24;
  uint64_t n;
  _QWORD *v26;

  v4 = a3;
  if ((*(_WORD *)&self->_has & 1) != 0)
  {
    v4[10] = *(_QWORD *)&self->_clientClockTime;
    *((_WORD *)v4 + 174) |= 1u;
  }
  v26 = v4;
  if (self->_appID)
  {
    objc_msgSend(v4, "setAppID:");
    v4 = v26;
  }
  if (self->_deviceModel)
  {
    objc_msgSend(v26, "setDeviceModel:");
    v4 = v26;
  }
  has = (__int16)self->_has;
  if ((has & 0x200) != 0)
  {
    *((_DWORD *)v4 + 80) = LODWORD(self->_timezone);
    *((_WORD *)v4 + 174) |= 0x200u;
    has = (__int16)self->_has;
  }
  if ((has & 0x100) != 0)
  {
    *((_DWORD *)v4 + 72) = self->_runState;
    *((_WORD *)v4 + 174) |= 0x100u;
  }
  if (self->_appVersion)
    objc_msgSend(v26, "setAppVersion:");
  if (self->_osVersionAndBuild)
    objc_msgSend(v26, "setOsVersionAndBuild:");
  if (self->_iTunesStore)
    objc_msgSend(v26, "setITunesStore:");
  if (self->_localeIdentifier)
    objc_msgSend(v26, "setLocaleIdentifier:");
  if (-[ADUserTargetingProperties userKeyboardsCount](self, "userKeyboardsCount"))
  {
    objc_msgSend(v26, "clearUserKeyboards");
    v6 = -[ADUserTargetingProperties userKeyboardsCount](self, "userKeyboardsCount");
    if (v6)
    {
      v7 = v6;
      for (i = 0; i != v7; ++i)
      {
        -[ADUserTargetingProperties userKeyboardAtIndex:](self, "userKeyboardAtIndex:", i);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v26, "addUserKeyboard:", v9);

      }
    }
  }
  if ((*(_WORD *)&self->_has & 4) != 0)
  {
    *((_DWORD *)v26 + 32) = self->_appsRank;
    *((_WORD *)v26 + 174) |= 4u;
  }
  if (-[ADUserTargetingProperties deviceModesCount](self, "deviceModesCount"))
  {
    objc_msgSend(v26, "clearDeviceModes");
    v10 = -[ADUserTargetingProperties deviceModesCount](self, "deviceModesCount");
    if (v10)
    {
      v11 = v10;
      for (j = 0; j != v11; ++j)
        objc_msgSend(v26, "addDeviceMode:", -[ADUserTargetingProperties deviceModeAtIndex:](self, "deviceModeAtIndex:", j));
    }
  }
  if (-[ADUserTargetingProperties accountTypesCount](self, "accountTypesCount"))
  {
    objc_msgSend(v26, "clearAccountTypes");
    v13 = -[ADUserTargetingProperties accountTypesCount](self, "accountTypesCount");
    if (v13)
    {
      v14 = v13;
      for (k = 0; k != v14; ++k)
        objc_msgSend(v26, "addAccountType:", -[ADUserTargetingProperties accountTypeAtIndex:](self, "accountTypeAtIndex:", k));
    }
  }
  v16 = (__int16)self->_has;
  if ((v16 & 0x20) != 0)
  {
    *((_DWORD *)v26 + 58) = LODWORD(self->_latitude);
    *((_WORD *)v26 + 174) |= 0x20u;
    v16 = (__int16)self->_has;
    if ((v16 & 0x40) == 0)
    {
LABEL_35:
      if ((v16 & 0x10) == 0)
        goto LABEL_37;
      goto LABEL_36;
    }
  }
  else if ((v16 & 0x40) == 0)
  {
    goto LABEL_35;
  }
  *((_DWORD *)v26 + 64) = LODWORD(self->_longitude);
  *((_WORD *)v26 + 174) |= 0x40u;
  if ((*(_WORD *)&self->_has & 0x10) != 0)
  {
LABEL_36:
    *((_DWORD *)v26 + 50) = LODWORD(self->_horizontalAccuracy);
    *((_WORD *)v26 + 174) |= 0x10u;
  }
LABEL_37:
  if (self->_isoCountryCode)
    objc_msgSend(v26, "setIsoCountryCode:");
  if (-[ADUserTargetingProperties targetingsCount](self, "targetingsCount"))
  {
    objc_msgSend(v26, "clearTargetings");
    v17 = -[ADUserTargetingProperties targetingsCount](self, "targetingsCount");
    if (v17)
    {
      v18 = v17;
      for (m = 0; m != v18; ++m)
      {
        -[ADUserTargetingProperties targetingAtIndex:](self, "targetingAtIndex:", m);
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v26, "addTargeting:", v20);

      }
    }
  }
  v21 = v26;
  if ((*(_WORD *)&self->_has & 0x800) != 0)
  {
    *((_BYTE *)v26 + 345) = self->_limitAdTracking;
    *((_WORD *)v26 + 174) |= 0x800u;
  }
  if (self->_toroIDString)
  {
    objc_msgSend(v26, "setToroIDString:");
    v21 = v26;
  }
  if (self->_iAdIDString)
  {
    objc_msgSend(v26, "setIAdIDString:");
    v21 = v26;
  }
  if (self->_algoId)
  {
    objc_msgSend(v26, "setAlgoId:");
    v21 = v26;
  }
  if (self->_dPIDString)
  {
    objc_msgSend(v26, "setDPIDString:");
    v21 = v26;
  }
  if (self->_postalCode)
  {
    objc_msgSend(v26, "setPostalCode:");
    v21 = v26;
  }
  if (self->_administrativeArea)
  {
    objc_msgSend(v26, "setAdministrativeArea:");
    v21 = v26;
  }
  if (self->_locality)
  {
    objc_msgSend(v26, "setLocality:");
    v21 = v26;
  }
  if (self->_subAdministrativeArea)
  {
    objc_msgSend(v26, "setSubAdministrativeArea:");
    v21 = v26;
  }
  if ((*(_WORD *)&self->_has & 2) != 0)
  {
    v21[24] = self->_advertisingIdentifierMonthResetCount;
    *((_WORD *)v21 + 174) |= 2u;
  }
  if (self->_deviceRequestID)
  {
    objc_msgSend(v26, "setDeviceRequestID:");
    v21 = v26;
  }
  if (self->_carrierMNC)
  {
    objc_msgSend(v26, "setCarrierMNC:");
    v21 = v26;
  }
  if (self->_carrierMCC)
  {
    objc_msgSend(v26, "setCarrierMCC:");
    v21 = v26;
  }
  if (self->_currentCarrierMNC)
  {
    objc_msgSend(v26, "setCurrentCarrierMNC:");
    v21 = v26;
  }
  if (self->_currentCarrierMCC)
  {
    objc_msgSend(v26, "setCurrentCarrierMCC:");
    v21 = v26;
  }
  v22 = (__int16)self->_has;
  if ((v22 & 0x400) != 0)
  {
    *((_BYTE *)v21 + 344) = self->_isOnInternationalDataRoaming;
    *((_WORD *)v21 + 174) |= 0x400u;
    v22 = (__int16)self->_has;
  }
  if ((v22 & 8) != 0)
  {
    v21[38] = self->_connectionType;
    *((_WORD *)v21 + 174) |= 8u;
  }
  if (self->_storeFrontLanguageLocaleIdentifier)
    objc_msgSend(v26, "setStoreFrontLanguageLocaleIdentifier:");
  if (-[ADUserTargetingProperties accountStatesCount](self, "accountStatesCount"))
  {
    objc_msgSend(v26, "clearAccountStates");
    v23 = -[ADUserTargetingProperties accountStatesCount](self, "accountStatesCount");
    if (v23)
    {
      v24 = v23;
      for (n = 0; n != v24; ++n)
        objc_msgSend(v26, "addAccountState:", -[ADUserTargetingProperties accountStateAtIndex:](self, "accountStateAtIndex:", n));
    }
  }
  if ((*(_WORD *)&self->_has & 0x80) != 0)
  {
    *((_DWORD *)v26 + 68) = self->_overrideType;
    *((_WORD *)v26 + 174) |= 0x80u;
  }

}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  __int16 has;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  void *v19;
  NSMutableArray *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t i;
  void *v25;
  __int16 v26;
  uint64_t v27;
  void *v28;
  NSMutableArray *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t j;
  void *v34;
  uint64_t v35;
  void *v36;
  uint64_t v37;
  void *v38;
  uint64_t v39;
  void *v40;
  uint64_t v41;
  void *v42;
  uint64_t v43;
  void *v44;
  uint64_t v45;
  void *v46;
  uint64_t v47;
  void *v48;
  uint64_t v49;
  void *v50;
  uint64_t v51;
  void *v52;
  uint64_t v53;
  void *v54;
  uint64_t v55;
  void *v56;
  uint64_t v57;
  void *v58;
  uint64_t v59;
  void *v60;
  __int16 v61;
  uint64_t v62;
  void *v63;
  __int128 v65;
  __int128 v66;
  __int128 v67;
  __int128 v68;
  __int128 v69;
  __int128 v70;
  __int128 v71;
  __int128 v72;
  _BYTE v73[128];
  _BYTE v74[128];
  uint64_t v75;

  v75 = *MEMORY[0x1E0C80C00];
  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = v5;
  if ((*(_WORD *)&self->_has & 1) != 0)
  {
    *(double *)(v5 + 80) = self->_clientClockTime;
    *(_WORD *)(v5 + 348) |= 1u;
  }
  v7 = -[NSString copyWithZone:](self->_appID, "copyWithZone:", a3);
  v8 = *(void **)(v6 + 112);
  *(_QWORD *)(v6 + 112) = v7;

  v9 = -[NSString copyWithZone:](self->_deviceModel, "copyWithZone:", a3);
  v10 = *(void **)(v6 + 184);
  *(_QWORD *)(v6 + 184) = v9;

  has = (__int16)self->_has;
  if ((has & 0x200) != 0)
  {
    *(float *)(v6 + 320) = self->_timezone;
    *(_WORD *)(v6 + 348) |= 0x200u;
    has = (__int16)self->_has;
  }
  if ((has & 0x100) != 0)
  {
    *(_DWORD *)(v6 + 288) = self->_runState;
    *(_WORD *)(v6 + 348) |= 0x100u;
  }
  v12 = -[NSString copyWithZone:](self->_appVersion, "copyWithZone:", a3);
  v13 = *(void **)(v6 + 120);
  *(_QWORD *)(v6 + 120) = v12;

  v14 = -[NSString copyWithZone:](self->_osVersionAndBuild, "copyWithZone:", a3);
  v15 = *(void **)(v6 + 264);
  *(_QWORD *)(v6 + 264) = v14;

  v16 = -[NSString copyWithZone:](self->_iTunesStore, "copyWithZone:", a3);
  v17 = *(void **)(v6 + 216);
  *(_QWORD *)(v6 + 216) = v16;

  v18 = -[NSString copyWithZone:](self->_localeIdentifier, "copyWithZone:", a3);
  v19 = *(void **)(v6 + 240);
  *(_QWORD *)(v6 + 240) = v18;

  v71 = 0u;
  v72 = 0u;
  v69 = 0u;
  v70 = 0u;
  v20 = self->_userKeyboards;
  v21 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v20, "countByEnumeratingWithState:objects:count:", &v69, v74, 16);
  if (v21)
  {
    v22 = v21;
    v23 = *(_QWORD *)v70;
    do
    {
      for (i = 0; i != v22; ++i)
      {
        if (*(_QWORD *)v70 != v23)
          objc_enumerationMutation(v20);
        v25 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v69 + 1) + 8 * i), "copyWithZone:", a3);
        objc_msgSend((id)v6, "addUserKeyboard:", v25);

      }
      v22 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v20, "countByEnumeratingWithState:objects:count:", &v69, v74, 16);
    }
    while (v22);
  }

  if ((*(_WORD *)&self->_has & 4) != 0)
  {
    *(_DWORD *)(v6 + 128) = self->_appsRank;
    *(_WORD *)(v6 + 348) |= 4u;
  }
  PBRepeatedInt32Copy();
  PBRepeatedInt32Copy();
  v26 = (__int16)self->_has;
  if ((v26 & 0x20) != 0)
  {
    *(float *)(v6 + 232) = self->_latitude;
    *(_WORD *)(v6 + 348) |= 0x20u;
    v26 = (__int16)self->_has;
    if ((v26 & 0x40) == 0)
    {
LABEL_18:
      if ((v26 & 0x10) == 0)
        goto LABEL_20;
      goto LABEL_19;
    }
  }
  else if ((v26 & 0x40) == 0)
  {
    goto LABEL_18;
  }
  *(float *)(v6 + 256) = self->_longitude;
  *(_WORD *)(v6 + 348) |= 0x40u;
  if ((*(_WORD *)&self->_has & 0x10) != 0)
  {
LABEL_19:
    *(float *)(v6 + 200) = self->_horizontalAccuracy;
    *(_WORD *)(v6 + 348) |= 0x10u;
  }
LABEL_20:
  v27 = -[NSString copyWithZone:](self->_isoCountryCode, "copyWithZone:", a3);
  v28 = *(void **)(v6 + 224);
  *(_QWORD *)(v6 + 224) = v27;

  v67 = 0u;
  v68 = 0u;
  v65 = 0u;
  v66 = 0u;
  v29 = self->_targetings;
  v30 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v29, "countByEnumeratingWithState:objects:count:", &v65, v73, 16);
  if (v30)
  {
    v31 = v30;
    v32 = *(_QWORD *)v66;
    do
    {
      for (j = 0; j != v31; ++j)
      {
        if (*(_QWORD *)v66 != v32)
          objc_enumerationMutation(v29);
        v34 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v65 + 1) + 8 * j), "copyWithZone:", a3, (_QWORD)v65);
        objc_msgSend((id)v6, "addTargeting:", v34);

      }
      v31 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v29, "countByEnumeratingWithState:objects:count:", &v65, v73, 16);
    }
    while (v31);
  }

  if ((*(_WORD *)&self->_has & 0x800) != 0)
  {
    *(_BYTE *)(v6 + 345) = self->_limitAdTracking;
    *(_WORD *)(v6 + 348) |= 0x800u;
  }
  v35 = -[NSString copyWithZone:](self->_toroIDString, "copyWithZone:", a3, (_QWORD)v65);
  v36 = *(void **)(v6 + 328);
  *(_QWORD *)(v6 + 328) = v35;

  v37 = -[NSString copyWithZone:](self->_iAdIDString, "copyWithZone:", a3);
  v38 = *(void **)(v6 + 208);
  *(_QWORD *)(v6 + 208) = v37;

  v39 = -[NSString copyWithZone:](self->_algoId, "copyWithZone:", a3);
  v40 = *(void **)(v6 + 104);
  *(_QWORD *)(v6 + 104) = v39;

  v41 = -[NSString copyWithZone:](self->_dPIDString, "copyWithZone:", a3);
  v42 = *(void **)(v6 + 176);
  *(_QWORD *)(v6 + 176) = v41;

  v43 = -[NSString copyWithZone:](self->_postalCode, "copyWithZone:", a3);
  v44 = *(void **)(v6 + 280);
  *(_QWORD *)(v6 + 280) = v43;

  v45 = -[NSString copyWithZone:](self->_administrativeArea, "copyWithZone:", a3);
  v46 = *(void **)(v6 + 88);
  *(_QWORD *)(v6 + 88) = v45;

  v47 = -[NSString copyWithZone:](self->_locality, "copyWithZone:", a3);
  v48 = *(void **)(v6 + 248);
  *(_QWORD *)(v6 + 248) = v47;

  v49 = -[NSString copyWithZone:](self->_subAdministrativeArea, "copyWithZone:", a3);
  v50 = *(void **)(v6 + 304);
  *(_QWORD *)(v6 + 304) = v49;

  if ((*(_WORD *)&self->_has & 2) != 0)
  {
    *(_DWORD *)(v6 + 96) = self->_advertisingIdentifierMonthResetCount;
    *(_WORD *)(v6 + 348) |= 2u;
  }
  v51 = -[NSString copyWithZone:](self->_deviceRequestID, "copyWithZone:", a3);
  v52 = *(void **)(v6 + 192);
  *(_QWORD *)(v6 + 192) = v51;

  v53 = -[NSString copyWithZone:](self->_carrierMNC, "copyWithZone:", a3);
  v54 = *(void **)(v6 + 144);
  *(_QWORD *)(v6 + 144) = v53;

  v55 = -[NSString copyWithZone:](self->_carrierMCC, "copyWithZone:", a3);
  v56 = *(void **)(v6 + 136);
  *(_QWORD *)(v6 + 136) = v55;

  v57 = -[NSString copyWithZone:](self->_currentCarrierMNC, "copyWithZone:", a3);
  v58 = *(void **)(v6 + 168);
  *(_QWORD *)(v6 + 168) = v57;

  v59 = -[NSString copyWithZone:](self->_currentCarrierMCC, "copyWithZone:", a3);
  v60 = *(void **)(v6 + 160);
  *(_QWORD *)(v6 + 160) = v59;

  v61 = (__int16)self->_has;
  if ((v61 & 0x400) != 0)
  {
    *(_BYTE *)(v6 + 344) = self->_isOnInternationalDataRoaming;
    *(_WORD *)(v6 + 348) |= 0x400u;
    v61 = (__int16)self->_has;
  }
  if ((v61 & 8) != 0)
  {
    *(_DWORD *)(v6 + 152) = self->_connectionType;
    *(_WORD *)(v6 + 348) |= 8u;
  }
  v62 = -[NSString copyWithZone:](self->_storeFrontLanguageLocaleIdentifier, "copyWithZone:", a3);
  v63 = *(void **)(v6 + 296);
  *(_QWORD *)(v6 + 296) = v62;

  PBRepeatedInt32Copy();
  if ((*(_WORD *)&self->_has & 0x80) != 0)
  {
    *(_DWORD *)(v6 + 272) = self->_overrideType;
    *(_WORD *)(v6 + 348) |= 0x80u;
  }
  return (id)v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  __int16 v5;
  NSString *appID;
  NSString *deviceModel;
  NSString *appVersion;
  NSString *osVersionAndBuild;
  NSString *iTunesStore;
  NSString *localeIdentifier;
  NSMutableArray *userKeyboards;
  __int16 v13;
  __int16 has;
  __int16 v15;
  NSString *isoCountryCode;
  NSMutableArray *targetings;
  NSString *toroIDString;
  NSString *iAdIDString;
  NSString *algoId;
  NSString *dPIDString;
  NSString *postalCode;
  NSString *administrativeArea;
  NSString *locality;
  NSString *subAdministrativeArea;
  __int16 v26;
  NSString *deviceRequestID;
  NSString *carrierMNC;
  NSString *carrierMCC;
  NSString *currentCarrierMNC;
  NSString *currentCarrierMCC;
  __int16 v32;
  __int16 v33;
  NSString *storeFrontLanguageLocaleIdentifier;
  __int16 v35;
  BOOL v36;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_117;
  v5 = *((_WORD *)v4 + 174);
  if ((*(_WORD *)&self->_has & 1) != 0)
  {
    if ((v5 & 1) == 0 || self->_clientClockTime != *((double *)v4 + 10))
      goto LABEL_117;
  }
  else if ((v5 & 1) != 0)
  {
    goto LABEL_117;
  }
  appID = self->_appID;
  if ((unint64_t)appID | *((_QWORD *)v4 + 14) && !-[NSString isEqual:](appID, "isEqual:"))
    goto LABEL_117;
  deviceModel = self->_deviceModel;
  if ((unint64_t)deviceModel | *((_QWORD *)v4 + 23))
  {
    if (!-[NSString isEqual:](deviceModel, "isEqual:"))
      goto LABEL_117;
  }
  if ((*(_WORD *)&self->_has & 0x200) != 0)
  {
    if ((*((_WORD *)v4 + 174) & 0x200) == 0 || self->_timezone != *((float *)v4 + 80))
      goto LABEL_117;
  }
  else if ((*((_WORD *)v4 + 174) & 0x200) != 0)
  {
    goto LABEL_117;
  }
  if ((*(_WORD *)&self->_has & 0x100) != 0)
  {
    if ((*((_WORD *)v4 + 174) & 0x100) == 0 || self->_runState != *((_DWORD *)v4 + 72))
      goto LABEL_117;
  }
  else if ((*((_WORD *)v4 + 174) & 0x100) != 0)
  {
    goto LABEL_117;
  }
  appVersion = self->_appVersion;
  if ((unint64_t)appVersion | *((_QWORD *)v4 + 15)
    && !-[NSString isEqual:](appVersion, "isEqual:"))
  {
    goto LABEL_117;
  }
  osVersionAndBuild = self->_osVersionAndBuild;
  if ((unint64_t)osVersionAndBuild | *((_QWORD *)v4 + 33))
  {
    if (!-[NSString isEqual:](osVersionAndBuild, "isEqual:"))
      goto LABEL_117;
  }
  iTunesStore = self->_iTunesStore;
  if ((unint64_t)iTunesStore | *((_QWORD *)v4 + 27))
  {
    if (!-[NSString isEqual:](iTunesStore, "isEqual:"))
      goto LABEL_117;
  }
  localeIdentifier = self->_localeIdentifier;
  if ((unint64_t)localeIdentifier | *((_QWORD *)v4 + 30))
  {
    if (!-[NSString isEqual:](localeIdentifier, "isEqual:"))
      goto LABEL_117;
  }
  userKeyboards = self->_userKeyboards;
  if ((unint64_t)userKeyboards | *((_QWORD *)v4 + 42))
  {
    if (!-[NSMutableArray isEqual:](userKeyboards, "isEqual:"))
      goto LABEL_117;
  }
  v13 = *((_WORD *)v4 + 174);
  if ((*(_WORD *)&self->_has & 4) != 0)
  {
    if ((v13 & 4) == 0 || self->_appsRank != *((_DWORD *)v4 + 32))
      goto LABEL_117;
  }
  else if ((v13 & 4) != 0)
  {
    goto LABEL_117;
  }
  if (!PBRepeatedInt32IsEqual() || !PBRepeatedInt32IsEqual())
    goto LABEL_117;
  has = (__int16)self->_has;
  v15 = *((_WORD *)v4 + 174);
  if ((has & 0x20) != 0)
  {
    if ((v15 & 0x20) == 0 || self->_latitude != *((float *)v4 + 58))
      goto LABEL_117;
  }
  else if ((v15 & 0x20) != 0)
  {
    goto LABEL_117;
  }
  if ((has & 0x40) != 0)
  {
    if ((v15 & 0x40) == 0 || self->_longitude != *((float *)v4 + 64))
      goto LABEL_117;
  }
  else if ((v15 & 0x40) != 0)
  {
    goto LABEL_117;
  }
  if ((has & 0x10) != 0)
  {
    if ((v15 & 0x10) == 0 || self->_horizontalAccuracy != *((float *)v4 + 50))
      goto LABEL_117;
  }
  else if ((v15 & 0x10) != 0)
  {
    goto LABEL_117;
  }
  isoCountryCode = self->_isoCountryCode;
  if ((unint64_t)isoCountryCode | *((_QWORD *)v4 + 28)
    && !-[NSString isEqual:](isoCountryCode, "isEqual:"))
  {
    goto LABEL_117;
  }
  targetings = self->_targetings;
  if ((unint64_t)targetings | *((_QWORD *)v4 + 39))
  {
    if (!-[NSMutableArray isEqual:](targetings, "isEqual:"))
      goto LABEL_117;
  }
  if ((*(_WORD *)&self->_has & 0x800) != 0)
  {
    if ((*((_WORD *)v4 + 174) & 0x800) == 0)
      goto LABEL_117;
    if (self->_limitAdTracking)
    {
      if (!*((_BYTE *)v4 + 345))
        goto LABEL_117;
    }
    else if (*((_BYTE *)v4 + 345))
    {
      goto LABEL_117;
    }
  }
  else if ((*((_WORD *)v4 + 174) & 0x800) != 0)
  {
    goto LABEL_117;
  }
  toroIDString = self->_toroIDString;
  if ((unint64_t)toroIDString | *((_QWORD *)v4 + 41)
    && !-[NSString isEqual:](toroIDString, "isEqual:"))
  {
    goto LABEL_117;
  }
  iAdIDString = self->_iAdIDString;
  if ((unint64_t)iAdIDString | *((_QWORD *)v4 + 26))
  {
    if (!-[NSString isEqual:](iAdIDString, "isEqual:"))
      goto LABEL_117;
  }
  algoId = self->_algoId;
  if ((unint64_t)algoId | *((_QWORD *)v4 + 13))
  {
    if (!-[NSString isEqual:](algoId, "isEqual:"))
      goto LABEL_117;
  }
  dPIDString = self->_dPIDString;
  if ((unint64_t)dPIDString | *((_QWORD *)v4 + 22))
  {
    if (!-[NSString isEqual:](dPIDString, "isEqual:"))
      goto LABEL_117;
  }
  postalCode = self->_postalCode;
  if ((unint64_t)postalCode | *((_QWORD *)v4 + 35))
  {
    if (!-[NSString isEqual:](postalCode, "isEqual:"))
      goto LABEL_117;
  }
  administrativeArea = self->_administrativeArea;
  if ((unint64_t)administrativeArea | *((_QWORD *)v4 + 11))
  {
    if (!-[NSString isEqual:](administrativeArea, "isEqual:"))
      goto LABEL_117;
  }
  locality = self->_locality;
  if ((unint64_t)locality | *((_QWORD *)v4 + 31))
  {
    if (!-[NSString isEqual:](locality, "isEqual:"))
      goto LABEL_117;
  }
  subAdministrativeArea = self->_subAdministrativeArea;
  if ((unint64_t)subAdministrativeArea | *((_QWORD *)v4 + 38))
  {
    if (!-[NSString isEqual:](subAdministrativeArea, "isEqual:"))
      goto LABEL_117;
  }
  v26 = *((_WORD *)v4 + 174);
  if ((*(_WORD *)&self->_has & 2) != 0)
  {
    if ((v26 & 2) == 0 || self->_advertisingIdentifierMonthResetCount != *((_DWORD *)v4 + 24))
      goto LABEL_117;
  }
  else if ((v26 & 2) != 0)
  {
    goto LABEL_117;
  }
  deviceRequestID = self->_deviceRequestID;
  if ((unint64_t)deviceRequestID | *((_QWORD *)v4 + 24)
    && !-[NSString isEqual:](deviceRequestID, "isEqual:"))
  {
    goto LABEL_117;
  }
  carrierMNC = self->_carrierMNC;
  if ((unint64_t)carrierMNC | *((_QWORD *)v4 + 18))
  {
    if (!-[NSString isEqual:](carrierMNC, "isEqual:"))
      goto LABEL_117;
  }
  carrierMCC = self->_carrierMCC;
  if ((unint64_t)carrierMCC | *((_QWORD *)v4 + 17))
  {
    if (!-[NSString isEqual:](carrierMCC, "isEqual:"))
      goto LABEL_117;
  }
  currentCarrierMNC = self->_currentCarrierMNC;
  if ((unint64_t)currentCarrierMNC | *((_QWORD *)v4 + 21))
  {
    if (!-[NSString isEqual:](currentCarrierMNC, "isEqual:"))
      goto LABEL_117;
  }
  currentCarrierMCC = self->_currentCarrierMCC;
  if ((unint64_t)currentCarrierMCC | *((_QWORD *)v4 + 20))
  {
    if (!-[NSString isEqual:](currentCarrierMCC, "isEqual:"))
      goto LABEL_117;
  }
  v32 = (__int16)self->_has;
  v33 = *((_WORD *)v4 + 174);
  if ((v32 & 0x400) != 0)
  {
    if ((*((_WORD *)v4 + 174) & 0x400) != 0)
    {
      if (self->_isOnInternationalDataRoaming)
      {
        if (!*((_BYTE *)v4 + 344))
          goto LABEL_117;
        goto LABEL_104;
      }
      if (!*((_BYTE *)v4 + 344))
        goto LABEL_104;
    }
LABEL_117:
    v36 = 0;
    goto LABEL_118;
  }
  if ((*((_WORD *)v4 + 174) & 0x400) != 0)
    goto LABEL_117;
LABEL_104:
  if ((v32 & 8) != 0)
  {
    if ((v33 & 8) == 0 || self->_connectionType != *((_DWORD *)v4 + 38))
      goto LABEL_117;
  }
  else if ((v33 & 8) != 0)
  {
    goto LABEL_117;
  }
  storeFrontLanguageLocaleIdentifier = self->_storeFrontLanguageLocaleIdentifier;
  if ((unint64_t)storeFrontLanguageLocaleIdentifier | *((_QWORD *)v4 + 37)
    && !-[NSString isEqual:](storeFrontLanguageLocaleIdentifier, "isEqual:")
    || !PBRepeatedInt32IsEqual())
  {
    goto LABEL_117;
  }
  v35 = *((_WORD *)v4 + 174);
  if ((*(_WORD *)&self->_has & 0x80) != 0)
  {
    if ((v35 & 0x80) == 0 || self->_overrideType != *((_DWORD *)v4 + 68))
      goto LABEL_117;
    v36 = 1;
  }
  else
  {
    v36 = (v35 & 0x80) == 0;
  }
LABEL_118:

  return v36;
}

- (unint64_t)hash
{
  double clientClockTime;
  double v4;
  long double v5;
  double v6;
  double v7;
  unint64_t v8;
  unint64_t v9;
  unint64_t v10;
  __int16 has;
  float timezone;
  float v13;
  float v14;
  float v15;
  unint64_t v16;
  __int16 v17;
  unint64_t v18;
  float latitude;
  float v20;
  float v21;
  float v22;
  unint64_t v23;
  float longitude;
  float v25;
  float v26;
  float v27;
  float horizontalAccuracy;
  float v29;
  float v30;
  float v31;
  float v32;
  unint64_t v33;
  unint64_t v34;
  unint64_t v35;
  NSUInteger v36;
  NSUInteger v37;
  NSUInteger v38;
  __int16 v39;
  uint64_t v40;
  uint64_t v41;
  NSUInteger v42;
  uint64_t v43;
  uint64_t v44;
  NSUInteger v46;
  NSUInteger v47;
  uint64_t v48;
  NSUInteger v49;
  NSUInteger v50;
  NSUInteger v51;
  NSUInteger v52;
  NSUInteger v53;
  NSUInteger v54;
  NSUInteger v55;
  NSUInteger v56;
  uint64_t v57;
  uint64_t v58;
  NSUInteger v59;
  unint64_t v60;
  unint64_t v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  NSUInteger v66;
  NSUInteger v67;
  NSUInteger v68;
  NSUInteger v69;
  uint64_t v70;
  unint64_t v71;
  NSUInteger v72;
  NSUInteger v73;
  unint64_t v74;

  if ((*(_WORD *)&self->_has & 1) != 0)
  {
    clientClockTime = self->_clientClockTime;
    v4 = -clientClockTime;
    if (clientClockTime >= 0.0)
      v4 = self->_clientClockTime;
    v5 = floor(v4 + 0.5);
    v6 = (v4 - v5) * 1.84467441e19;
    v7 = fmod(v5, 1.84467441e19);
    v8 = 2654435761u * (unint64_t)v7;
    v9 = v8 + (unint64_t)v6;
    if (v6 <= 0.0)
      v9 = 2654435761u * (unint64_t)v7;
    v10 = v8 - (unint64_t)fabs(v6);
    if (v6 >= 0.0)
      v10 = v9;
    v74 = v10;
  }
  else
  {
    v74 = 0;
  }
  v73 = -[NSString hash](self->_appID, "hash");
  v72 = -[NSString hash](self->_deviceModel, "hash");
  has = (__int16)self->_has;
  if ((has & 0x200) != 0)
  {
    timezone = self->_timezone;
    v13 = -timezone;
    if (timezone >= 0.0)
      v13 = self->_timezone;
    v14 = floorf(v13 + 0.5);
    v15 = (float)(v13 - v14) * 1.8447e19;
    v16 = 2654435761u * (unint64_t)fmodf(v14, 1.8447e19);
    if (v15 >= 0.0)
    {
      if (v15 > 0.0)
        v16 += (unint64_t)v15;
    }
    else
    {
      v16 -= (unint64_t)fabsf(v15);
    }
    v71 = v16;
    if ((has & 0x100) != 0)
      goto LABEL_12;
  }
  else
  {
    v71 = 0;
    if ((*(_WORD *)&self->_has & 0x100) != 0)
    {
LABEL_12:
      v70 = 2654435761 * self->_runState;
      goto LABEL_21;
    }
  }
  v70 = 0;
LABEL_21:
  v69 = -[NSString hash](self->_appVersion, "hash");
  v68 = -[NSString hash](self->_osVersionAndBuild, "hash");
  v67 = -[NSString hash](self->_iTunesStore, "hash");
  v66 = -[NSString hash](self->_localeIdentifier, "hash");
  v65 = -[NSMutableArray hash](self->_userKeyboards, "hash");
  if ((*(_WORD *)&self->_has & 4) != 0)
    v64 = 2654435761 * self->_appsRank;
  else
    v64 = 0;
  v63 = PBRepeatedInt32Hash();
  v62 = PBRepeatedInt32Hash();
  v17 = (__int16)self->_has;
  if ((v17 & 0x20) != 0)
  {
    latitude = self->_latitude;
    v20 = -latitude;
    if (latitude >= 0.0)
      v20 = self->_latitude;
    v21 = floorf(v20 + 0.5);
    v22 = (float)(v20 - v21) * 1.8447e19;
    v18 = 2654435761u * (unint64_t)fmodf(v21, 1.8447e19);
    if (v22 >= 0.0)
    {
      if (v22 > 0.0)
        v18 += (unint64_t)v22;
    }
    else
    {
      v18 -= (unint64_t)fabsf(v22);
    }
  }
  else
  {
    v18 = 0;
  }
  if ((v17 & 0x40) != 0)
  {
    longitude = self->_longitude;
    v25 = -longitude;
    if (longitude >= 0.0)
      v25 = self->_longitude;
    v26 = floorf(v25 + 0.5);
    v27 = (float)(v25 - v26) * 1.8447e19;
    v23 = 2654435761u * (unint64_t)fmodf(v26, 1.8447e19);
    if (v27 >= 0.0)
    {
      if (v27 > 0.0)
        v23 += (unint64_t)v27;
    }
    else
    {
      v23 -= (unint64_t)fabsf(v27);
    }
  }
  else
  {
    v23 = 0;
  }
  v61 = v23;
  if ((v17 & 0x10) != 0)
  {
    horizontalAccuracy = self->_horizontalAccuracy;
    v29 = -horizontalAccuracy;
    if (horizontalAccuracy >= 0.0)
      v29 = self->_horizontalAccuracy;
    v30 = floorf(v29 + 0.5);
    v31 = (float)(v29 - v30) * 1.8447e19;
    v32 = fmodf(v30, 1.8447e19);
    v33 = 2654435761u * (unint64_t)v32;
    v34 = v33 + (unint64_t)v31;
    if (v31 <= 0.0)
      v34 = 2654435761u * (unint64_t)v32;
    v35 = v33 - (unint64_t)fabsf(v31);
    if (v31 >= 0.0)
      v35 = v34;
    v60 = v35;
  }
  else
  {
    v60 = 0;
  }
  v59 = -[NSString hash](self->_isoCountryCode, "hash");
  v58 = -[NSMutableArray hash](self->_targetings, "hash");
  if ((*(_WORD *)&self->_has & 0x800) != 0)
    v57 = 2654435761 * self->_limitAdTracking;
  else
    v57 = 0;
  v56 = -[NSString hash](self->_toroIDString, "hash");
  v55 = -[NSString hash](self->_iAdIDString, "hash");
  v54 = -[NSString hash](self->_algoId, "hash");
  v53 = -[NSString hash](self->_dPIDString, "hash");
  v52 = -[NSString hash](self->_postalCode, "hash");
  v51 = -[NSString hash](self->_administrativeArea, "hash");
  v50 = -[NSString hash](self->_locality, "hash");
  v49 = -[NSString hash](self->_subAdministrativeArea, "hash");
  if ((*(_WORD *)&self->_has & 2) != 0)
    v48 = 2654435761 * self->_advertisingIdentifierMonthResetCount;
  else
    v48 = 0;
  v47 = -[NSString hash](self->_deviceRequestID, "hash");
  v46 = -[NSString hash](self->_carrierMNC, "hash");
  v36 = -[NSString hash](self->_carrierMCC, "hash");
  v37 = -[NSString hash](self->_currentCarrierMNC, "hash");
  v38 = -[NSString hash](self->_currentCarrierMCC, "hash");
  v39 = (__int16)self->_has;
  if ((v39 & 0x400) != 0)
  {
    v40 = 2654435761 * self->_isOnInternationalDataRoaming;
    if ((v39 & 8) != 0)
      goto LABEL_57;
  }
  else
  {
    v40 = 0;
    if ((v39 & 8) != 0)
    {
LABEL_57:
      v41 = 2654435761 * self->_connectionType;
      goto LABEL_60;
    }
  }
  v41 = 0;
LABEL_60:
  v42 = -[NSString hash](self->_storeFrontLanguageLocaleIdentifier, "hash");
  v43 = PBRepeatedInt32Hash();
  if ((*(_WORD *)&self->_has & 0x80) != 0)
    v44 = 2654435761 * self->_overrideType;
  else
    v44 = 0;
  return v73 ^ v74 ^ v72 ^ v71 ^ v70 ^ v69 ^ v68 ^ v67 ^ v66 ^ v65 ^ v64 ^ v63 ^ v62 ^ v18 ^ v61 ^ v60 ^ v59 ^ v58 ^ v57 ^ v56 ^ v55 ^ v54 ^ v53 ^ v52 ^ v51 ^ v50 ^ v49 ^ v48 ^ v47 ^ v46 ^ v36 ^ v37 ^ v38 ^ v40 ^ v41 ^ v42 ^ v43 ^ v44;
}

- (void)mergeFrom:(id)a3
{
  double *v4;
  double *v5;
  __int16 v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  uint64_t v12;
  uint64_t v13;
  uint64_t j;
  uint64_t v15;
  uint64_t v16;
  uint64_t k;
  __int16 v18;
  id v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t m;
  __int16 v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t n;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  _BYTE v36[128];
  _BYTE v37[128];
  uint64_t v38;

  v38 = *MEMORY[0x1E0C80C00];
  v4 = (double *)a3;
  v5 = v4;
  if ((*((_WORD *)v4 + 174) & 1) != 0)
  {
    self->_clientClockTime = v4[10];
    *(_WORD *)&self->_has |= 1u;
  }
  if (*((_QWORD *)v4 + 14))
    -[ADUserTargetingProperties setAppID:](self, "setAppID:");
  if (*((_QWORD *)v5 + 23))
    -[ADUserTargetingProperties setDeviceModel:](self, "setDeviceModel:");
  v6 = *((_WORD *)v5 + 174);
  if ((v6 & 0x200) != 0)
  {
    self->_timezone = *((float *)v5 + 80);
    *(_WORD *)&self->_has |= 0x200u;
    v6 = *((_WORD *)v5 + 174);
  }
  if ((v6 & 0x100) != 0)
  {
    self->_runState = *((_DWORD *)v5 + 72);
    *(_WORD *)&self->_has |= 0x100u;
  }
  if (*((_QWORD *)v5 + 15))
    -[ADUserTargetingProperties setAppVersion:](self, "setAppVersion:");
  if (*((_QWORD *)v5 + 33))
    -[ADUserTargetingProperties setOsVersionAndBuild:](self, "setOsVersionAndBuild:");
  if (*((_QWORD *)v5 + 27))
    -[ADUserTargetingProperties setITunesStore:](self, "setITunesStore:");
  if (*((_QWORD *)v5 + 30))
    -[ADUserTargetingProperties setLocaleIdentifier:](self, "setLocaleIdentifier:");
  v34 = 0u;
  v35 = 0u;
  v32 = 0u;
  v33 = 0u;
  v7 = *((id *)v5 + 42);
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v32, v37, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v33;
    do
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v33 != v10)
          objc_enumerationMutation(v7);
        -[ADUserTargetingProperties addUserKeyboard:](self, "addUserKeyboard:", *(_QWORD *)(*((_QWORD *)&v32 + 1) + 8 * i));
      }
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v32, v37, 16);
    }
    while (v9);
  }

  if ((*((_WORD *)v5 + 174) & 4) != 0)
  {
    self->_appsRank = *((_DWORD *)v5 + 32);
    *(_WORD *)&self->_has |= 4u;
  }
  v12 = objc_msgSend(v5, "deviceModesCount");
  if (v12)
  {
    v13 = v12;
    for (j = 0; j != v13; ++j)
      -[ADUserTargetingProperties addDeviceMode:](self, "addDeviceMode:", objc_msgSend(v5, "deviceModeAtIndex:", j));
  }
  v15 = objc_msgSend(v5, "accountTypesCount");
  if (v15)
  {
    v16 = v15;
    for (k = 0; k != v16; ++k)
      -[ADUserTargetingProperties addAccountType:](self, "addAccountType:", objc_msgSend(v5, "accountTypeAtIndex:", k));
  }
  v18 = *((_WORD *)v5 + 174);
  if ((v18 & 0x20) != 0)
  {
    self->_latitude = *((float *)v5 + 58);
    *(_WORD *)&self->_has |= 0x20u;
    v18 = *((_WORD *)v5 + 174);
    if ((v18 & 0x40) == 0)
    {
LABEL_36:
      if ((v18 & 0x10) == 0)
        goto LABEL_38;
      goto LABEL_37;
    }
  }
  else if ((v18 & 0x40) == 0)
  {
    goto LABEL_36;
  }
  self->_longitude = *((float *)v5 + 64);
  *(_WORD *)&self->_has |= 0x40u;
  if ((*((_WORD *)v5 + 174) & 0x10) != 0)
  {
LABEL_37:
    self->_horizontalAccuracy = *((float *)v5 + 50);
    *(_WORD *)&self->_has |= 0x10u;
  }
LABEL_38:
  if (*((_QWORD *)v5 + 28))
    -[ADUserTargetingProperties setIsoCountryCode:](self, "setIsoCountryCode:");
  v30 = 0u;
  v31 = 0u;
  v28 = 0u;
  v29 = 0u;
  v19 = *((id *)v5 + 39);
  v20 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v28, v36, 16);
  if (v20)
  {
    v21 = v20;
    v22 = *(_QWORD *)v29;
    do
    {
      for (m = 0; m != v21; ++m)
      {
        if (*(_QWORD *)v29 != v22)
          objc_enumerationMutation(v19);
        -[ADUserTargetingProperties addTargeting:](self, "addTargeting:", *(_QWORD *)(*((_QWORD *)&v28 + 1) + 8 * m), (_QWORD)v28);
      }
      v21 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v28, v36, 16);
    }
    while (v21);
  }

  if ((*((_WORD *)v5 + 174) & 0x800) != 0)
  {
    self->_limitAdTracking = *((_BYTE *)v5 + 345);
    *(_WORD *)&self->_has |= 0x800u;
  }
  if (*((_QWORD *)v5 + 41))
    -[ADUserTargetingProperties setToroIDString:](self, "setToroIDString:");
  if (*((_QWORD *)v5 + 26))
    -[ADUserTargetingProperties setIAdIDString:](self, "setIAdIDString:");
  if (*((_QWORD *)v5 + 13))
    -[ADUserTargetingProperties setAlgoId:](self, "setAlgoId:");
  if (*((_QWORD *)v5 + 22))
    -[ADUserTargetingProperties setDPIDString:](self, "setDPIDString:");
  if (*((_QWORD *)v5 + 35))
    -[ADUserTargetingProperties setPostalCode:](self, "setPostalCode:");
  if (*((_QWORD *)v5 + 11))
    -[ADUserTargetingProperties setAdministrativeArea:](self, "setAdministrativeArea:");
  if (*((_QWORD *)v5 + 31))
    -[ADUserTargetingProperties setLocality:](self, "setLocality:");
  if (*((_QWORD *)v5 + 38))
    -[ADUserTargetingProperties setSubAdministrativeArea:](self, "setSubAdministrativeArea:");
  if ((*((_WORD *)v5 + 174) & 2) != 0)
  {
    self->_advertisingIdentifierMonthResetCount = *((_DWORD *)v5 + 24);
    *(_WORD *)&self->_has |= 2u;
  }
  if (*((_QWORD *)v5 + 24))
    -[ADUserTargetingProperties setDeviceRequestID:](self, "setDeviceRequestID:");
  if (*((_QWORD *)v5 + 18))
    -[ADUserTargetingProperties setCarrierMNC:](self, "setCarrierMNC:");
  if (*((_QWORD *)v5 + 17))
    -[ADUserTargetingProperties setCarrierMCC:](self, "setCarrierMCC:");
  if (*((_QWORD *)v5 + 21))
    -[ADUserTargetingProperties setCurrentCarrierMNC:](self, "setCurrentCarrierMNC:");
  if (*((_QWORD *)v5 + 20))
    -[ADUserTargetingProperties setCurrentCarrierMCC:](self, "setCurrentCarrierMCC:");
  v24 = *((_WORD *)v5 + 174);
  if ((v24 & 0x400) != 0)
  {
    self->_isOnInternationalDataRoaming = *((_BYTE *)v5 + 344);
    *(_WORD *)&self->_has |= 0x400u;
    v24 = *((_WORD *)v5 + 174);
  }
  if ((v24 & 8) != 0)
  {
    self->_connectionType = *((_DWORD *)v5 + 38);
    *(_WORD *)&self->_has |= 8u;
  }
  if (*((_QWORD *)v5 + 37))
    -[ADUserTargetingProperties setStoreFrontLanguageLocaleIdentifier:](self, "setStoreFrontLanguageLocaleIdentifier:");
  v25 = objc_msgSend(v5, "accountStatesCount", (_QWORD)v28);
  if (v25)
  {
    v26 = v25;
    for (n = 0; n != v26; ++n)
      -[ADUserTargetingProperties addAccountState:](self, "addAccountState:", objc_msgSend(v5, "accountStateAtIndex:", n));
  }
  if ((*((_WORD *)v5 + 174) & 0x80) != 0)
  {
    self->_overrideType = *((_DWORD *)v5 + 68);
    *(_WORD *)&self->_has |= 0x80u;
  }

}

- (double)clientClockTime
{
  return self->_clientClockTime;
}

- (NSString)appID
{
  return self->_appID;
}

- (void)setAppID:(id)a3
{
  objc_storeStrong((id *)&self->_appID, a3);
}

- (NSString)deviceModel
{
  return self->_deviceModel;
}

- (void)setDeviceModel:(id)a3
{
  objc_storeStrong((id *)&self->_deviceModel, a3);
}

- (float)timezone
{
  return self->_timezone;
}

- (NSString)appVersion
{
  return self->_appVersion;
}

- (void)setAppVersion:(id)a3
{
  objc_storeStrong((id *)&self->_appVersion, a3);
}

- (NSString)osVersionAndBuild
{
  return self->_osVersionAndBuild;
}

- (void)setOsVersionAndBuild:(id)a3
{
  objc_storeStrong((id *)&self->_osVersionAndBuild, a3);
}

- (NSString)iTunesStore
{
  return self->_iTunesStore;
}

- (void)setITunesStore:(id)a3
{
  objc_storeStrong((id *)&self->_iTunesStore, a3);
}

- (NSString)localeIdentifier
{
  return self->_localeIdentifier;
}

- (void)setLocaleIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_localeIdentifier, a3);
}

- (NSMutableArray)userKeyboards
{
  return self->_userKeyboards;
}

- (void)setUserKeyboards:(id)a3
{
  objc_storeStrong((id *)&self->_userKeyboards, a3);
}

- (int)appsRank
{
  return self->_appsRank;
}

- (float)latitude
{
  return self->_latitude;
}

- (float)longitude
{
  return self->_longitude;
}

- (float)horizontalAccuracy
{
  return self->_horizontalAccuracy;
}

- (NSString)isoCountryCode
{
  return self->_isoCountryCode;
}

- (void)setIsoCountryCode:(id)a3
{
  objc_storeStrong((id *)&self->_isoCountryCode, a3);
}

- (NSMutableArray)targetings
{
  return self->_targetings;
}

- (void)setTargetings:(id)a3
{
  objc_storeStrong((id *)&self->_targetings, a3);
}

- (BOOL)limitAdTracking
{
  return self->_limitAdTracking;
}

- (NSString)toroIDString
{
  return self->_toroIDString;
}

- (void)setToroIDString:(id)a3
{
  objc_storeStrong((id *)&self->_toroIDString, a3);
}

- (NSString)iAdIDString
{
  return self->_iAdIDString;
}

- (void)setIAdIDString:(id)a3
{
  objc_storeStrong((id *)&self->_iAdIDString, a3);
}

- (NSString)algoId
{
  return self->_algoId;
}

- (void)setAlgoId:(id)a3
{
  objc_storeStrong((id *)&self->_algoId, a3);
}

- (NSString)dPIDString
{
  return self->_dPIDString;
}

- (void)setDPIDString:(id)a3
{
  objc_storeStrong((id *)&self->_dPIDString, a3);
}

- (NSString)postalCode
{
  return self->_postalCode;
}

- (void)setPostalCode:(id)a3
{
  objc_storeStrong((id *)&self->_postalCode, a3);
}

- (NSString)administrativeArea
{
  return self->_administrativeArea;
}

- (void)setAdministrativeArea:(id)a3
{
  objc_storeStrong((id *)&self->_administrativeArea, a3);
}

- (NSString)locality
{
  return self->_locality;
}

- (void)setLocality:(id)a3
{
  objc_storeStrong((id *)&self->_locality, a3);
}

- (NSString)subAdministrativeArea
{
  return self->_subAdministrativeArea;
}

- (void)setSubAdministrativeArea:(id)a3
{
  objc_storeStrong((id *)&self->_subAdministrativeArea, a3);
}

- (int)advertisingIdentifierMonthResetCount
{
  return self->_advertisingIdentifierMonthResetCount;
}

- (NSString)deviceRequestID
{
  return self->_deviceRequestID;
}

- (void)setDeviceRequestID:(id)a3
{
  objc_storeStrong((id *)&self->_deviceRequestID, a3);
}

- (NSString)carrierMNC
{
  return self->_carrierMNC;
}

- (void)setCarrierMNC:(id)a3
{
  objc_storeStrong((id *)&self->_carrierMNC, a3);
}

- (NSString)carrierMCC
{
  return self->_carrierMCC;
}

- (void)setCarrierMCC:(id)a3
{
  objc_storeStrong((id *)&self->_carrierMCC, a3);
}

- (NSString)currentCarrierMNC
{
  return self->_currentCarrierMNC;
}

- (void)setCurrentCarrierMNC:(id)a3
{
  objc_storeStrong((id *)&self->_currentCarrierMNC, a3);
}

- (NSString)currentCarrierMCC
{
  return self->_currentCarrierMCC;
}

- (void)setCurrentCarrierMCC:(id)a3
{
  objc_storeStrong((id *)&self->_currentCarrierMCC, a3);
}

- (BOOL)isOnInternationalDataRoaming
{
  return self->_isOnInternationalDataRoaming;
}

- (NSString)storeFrontLanguageLocaleIdentifier
{
  return self->_storeFrontLanguageLocaleIdentifier;
}

- (void)setStoreFrontLanguageLocaleIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_storeFrontLanguageLocaleIdentifier, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_userKeyboards, 0);
  objc_storeStrong((id *)&self->_toroIDString, 0);
  objc_storeStrong((id *)&self->_targetings, 0);
  objc_storeStrong((id *)&self->_subAdministrativeArea, 0);
  objc_storeStrong((id *)&self->_storeFrontLanguageLocaleIdentifier, 0);
  objc_storeStrong((id *)&self->_postalCode, 0);
  objc_storeStrong((id *)&self->_osVersionAndBuild, 0);
  objc_storeStrong((id *)&self->_locality, 0);
  objc_storeStrong((id *)&self->_localeIdentifier, 0);
  objc_storeStrong((id *)&self->_isoCountryCode, 0);
  objc_storeStrong((id *)&self->_iTunesStore, 0);
  objc_storeStrong((id *)&self->_iAdIDString, 0);
  objc_storeStrong((id *)&self->_deviceRequestID, 0);
  objc_storeStrong((id *)&self->_deviceModel, 0);
  objc_storeStrong((id *)&self->_dPIDString, 0);
  objc_storeStrong((id *)&self->_currentCarrierMNC, 0);
  objc_storeStrong((id *)&self->_currentCarrierMCC, 0);
  objc_storeStrong((id *)&self->_carrierMNC, 0);
  objc_storeStrong((id *)&self->_carrierMCC, 0);
  objc_storeStrong((id *)&self->_appVersion, 0);
  objc_storeStrong((id *)&self->_appID, 0);
  objc_storeStrong((id *)&self->_algoId, 0);
  objc_storeStrong((id *)&self->_administrativeArea, 0);
}

@end
