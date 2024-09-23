@implementation BLTPBSectionInfo

- (id)requestWithKeypaths:(id)a3
{
  id v4;
  BLTPBSetSectionInfoRequest *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = objc_alloc_init(BLTPBSetSectionInfoRequest);
  -[BLTPBSetSectionInfoRequest setSectionInfo:](v5, "setSectionInfo:", self);
  v16 = 0u;
  v17 = 0u;
  v14 = 0u;
  v15 = 0u;
  v6 = v4;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v15;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v15 != v9)
          objc_enumerationMutation(v6);
        -[BLTPBSetSectionInfoRequest addKeypaths:](v5, "addKeypaths:", *(_QWORD *)(*((_QWORD *)&v14 + 1) + 8 * v10++), (_QWORD)v14);
      }
      while (v8 != v10);
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v8);
  }

  -[BLTPBSectionInfo icon](self, "icon");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (v11)
  {
    v12 = (void *)-[BLTPBSectionInfo copy](self, "copy");
    objc_msgSend(v12, "setIcon:", 0);
    objc_msgSend(v12, "setIconsStripped:", 1);
    -[BLTPBSetSectionInfoRequest setSectionInfo:](v5, "setSectionInfo:", v12);

  }
  return v5;
}

- (BOOL)hasSectionID
{
  return self->_sectionID != 0;
}

- (BOOL)hasSubsectionID
{
  return self->_subsectionID != 0;
}

- (void)setSectionType:(int)a3
{
  *(_DWORD *)&self->_has |= 0x800u;
  self->_sectionType = a3;
}

- (void)setHasSectionType:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 2048;
  else
    v3 = 0;
  self->_has = ($DDB6F6B01A4DE5A47F3A13CA47B8E55C)(*(_DWORD *)&self->_has & 0xFFFFF7FF | v3);
}

- (BOOL)hasSectionType
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 3) & 1;
}

- (void)setSectionCategory:(int)a3
{
  *(_DWORD *)&self->_has |= 0x400u;
  self->_sectionCategory = a3;
}

- (void)setHasSectionCategory:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 1024;
  else
    v3 = 0;
  self->_has = ($DDB6F6B01A4DE5A47F3A13CA47B8E55C)(*(_DWORD *)&self->_has & 0xFFFFFBFF | v3);
}

- (BOOL)hasSectionCategory
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 2) & 1;
}

- (void)setSuppressFromSettings:(BOOL)a3
{
  *(_DWORD *)&self->_has |= 0x4000000u;
  self->_suppressFromSettings = a3;
}

- (void)setHasSuppressFromSettings:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 0x4000000;
  else
    v3 = 0;
  self->_has = ($DDB6F6B01A4DE5A47F3A13CA47B8E55C)(*(_DWORD *)&self->_has & 0xFBFFFFFF | v3);
}

- (BOOL)hasSuppressFromSettings
{
  return (*((unsigned __int8 *)&self->_has + 3) >> 2) & 1;
}

- (void)setShowsInNotificationCenter:(BOOL)a3
{
  *(_DWORD *)&self->_has |= 0x800000u;
  self->_showsInNotificationCenter = a3;
}

- (void)setHasShowsInNotificationCenter:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 0x800000;
  else
    v3 = 0;
  self->_has = ($DDB6F6B01A4DE5A47F3A13CA47B8E55C)(*(_DWORD *)&self->_has & 0xFF7FFFFF | v3);
}

- (BOOL)hasShowsInNotificationCenter
{
  return *((unsigned __int8 *)&self->_has + 2) >> 7;
}

- (void)setShowsInLockScreen:(BOOL)a3
{
  *(_DWORD *)&self->_has |= 0x400000u;
  self->_showsInLockScreen = a3;
}

- (void)setHasShowsInLockScreen:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 0x400000;
  else
    v3 = 0;
  self->_has = ($DDB6F6B01A4DE5A47F3A13CA47B8E55C)(*(_DWORD *)&self->_has & 0xFFBFFFFF | v3);
}

- (BOOL)hasShowsInLockScreen
{
  return (*((unsigned __int8 *)&self->_has + 2) >> 6) & 1;
}

- (void)setShowsOnExternalDevices:(BOOL)a3
{
  *(_DWORD *)&self->_has |= 0x2000000u;
  self->_showsOnExternalDevices = a3;
}

- (void)setHasShowsOnExternalDevices:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 0x2000000;
  else
    v3 = 0;
  self->_has = ($DDB6F6B01A4DE5A47F3A13CA47B8E55C)(*(_DWORD *)&self->_has & 0xFDFFFFFF | v3);
}

- (BOOL)hasShowsOnExternalDevices
{
  return (*((unsigned __int8 *)&self->_has + 3) >> 1) & 1;
}

- (void)setNotificationCenterLimit:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 0x40u;
  self->_notificationCenterLimit = a3;
}

- (void)setHasNotificationCenterLimit:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 64;
  else
    v3 = 0;
  self->_has = ($DDB6F6B01A4DE5A47F3A13CA47B8E55C)(*(_DWORD *)&self->_has & 0xFFFFFFBF | v3);
}

- (BOOL)hasNotificationCenterLimit
{
  return (*(_BYTE *)&self->_has >> 6) & 1;
}

- (void)setPushSettings:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 0x200u;
  self->_pushSettings = a3;
}

- (void)setHasPushSettings:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 512;
  else
    v3 = 0;
  self->_has = ($DDB6F6B01A4DE5A47F3A13CA47B8E55C)(*(_DWORD *)&self->_has & 0xFFFFFDFF | v3);
}

- (BOOL)hasPushSettings
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 1) & 1;
}

- (void)setAlertType:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 4u;
  self->_alertType = a3;
}

- (void)setHasAlertType:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 4;
  else
    v3 = 0;
  self->_has = ($DDB6F6B01A4DE5A47F3A13CA47B8E55C)(*(_DWORD *)&self->_has & 0xFFFFFFFB | v3);
}

- (BOOL)hasAlertType
{
  return (*(_BYTE *)&self->_has >> 2) & 1;
}

- (void)setShowsMessagePreview:(BOOL)a3
{
  *(_DWORD *)&self->_has |= 0x1000000u;
  self->_showsMessagePreview = a3;
}

- (void)setHasShowsMessagePreview:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 0x1000000;
  else
    v3 = 0;
  self->_has = ($DDB6F6B01A4DE5A47F3A13CA47B8E55C)(*(_DWORD *)&self->_has & 0xFEFFFFFF | v3);
}

- (BOOL)hasShowsMessagePreview
{
  return *((_BYTE *)&self->_has + 3) & 1;
}

- (void)setAllowsNotifications:(BOOL)a3
{
  *(_DWORD *)&self->_has |= 0x10000u;
  self->_allowsNotifications = a3;
}

- (void)setHasAllowsNotifications:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 0x10000;
  else
    v3 = 0;
  self->_has = ($DDB6F6B01A4DE5A47F3A13CA47B8E55C)(*(_DWORD *)&self->_has & 0xFFFEFFFF | v3);
}

- (BOOL)hasAllowsNotifications
{
  return *((_BYTE *)&self->_has + 2) & 1;
}

- (void)setSuppressedSettings:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 0x4000u;
  self->_suppressedSettings = a3;
}

- (void)setHasSuppressedSettings:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 0x4000;
  else
    v3 = 0;
  self->_has = ($DDB6F6B01A4DE5A47F3A13CA47B8E55C)(*(_DWORD *)&self->_has & 0xFFFFBFFF | v3);
}

- (BOOL)hasSuppressedSettings
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 6) & 1;
}

- (BOOL)hasDisplayName
{
  return self->_displayName != 0;
}

- (void)setDisplaysCriticalBulletinsLegacy:(BOOL)a3
{
  *(_DWORD *)&self->_has |= 0x40000u;
  self->_displaysCriticalBulletinsLegacy = a3;
}

- (void)setHasDisplaysCriticalBulletinsLegacy:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 0x40000;
  else
    v3 = 0;
  self->_has = ($DDB6F6B01A4DE5A47F3A13CA47B8E55C)(*(_DWORD *)&self->_has & 0xFFFBFFFF | v3);
}

- (BOOL)hasDisplaysCriticalBulletinsLegacy
{
  return (*((unsigned __int8 *)&self->_has + 2) >> 2) & 1;
}

- (void)clearSubsections
{
  -[NSMutableArray removeAllObjects](self->_subsections, "removeAllObjects");
}

- (void)addSubsections:(id)a3
{
  id v4;
  NSMutableArray *subsections;
  NSMutableArray *v6;
  NSMutableArray *v7;
  id v8;

  v4 = a3;
  subsections = self->_subsections;
  v8 = v4;
  if (!subsections)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x24BDBCEB8]);
    v7 = self->_subsections;
    self->_subsections = v6;

    v4 = v8;
    subsections = self->_subsections;
  }
  -[NSMutableArray addObject:](subsections, "addObject:", v4);

}

- (unint64_t)subsectionsCount
{
  return -[NSMutableArray count](self->_subsections, "count");
}

- (id)subsectionsAtIndex:(unint64_t)a3
{
  return (id)-[NSMutableArray objectAtIndex:](self->_subsections, "objectAtIndex:", a3);
}

+ (Class)subsectionsType
{
  return (Class)objc_opt_class();
}

- (void)setSubsectionPriority:(int)a3
{
  *(_DWORD *)&self->_has |= 0x2000u;
  self->_subsectionPriority = a3;
}

- (void)setHasSubsectionPriority:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 0x2000;
  else
    v3 = 0;
  self->_has = ($DDB6F6B01A4DE5A47F3A13CA47B8E55C)(*(_DWORD *)&self->_has & 0xFFFFDFFF | v3);
}

- (BOOL)hasSubsectionPriority
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 5) & 1;
}

- (void)setVersion:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 0x8000u;
  self->_version = a3;
}

- (void)setHasVersion:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 0x8000;
  else
    v3 = 0;
  self->_has = ($DDB6F6B01A4DE5A47F3A13CA47B8E55C)(*(_DWORD *)&self->_has & 0xFFFF7FFF | v3);
}

- (BOOL)hasVersion
{
  return *((unsigned __int8 *)&self->_has + 1) >> 7;
}

- (BOOL)hasFactorySectionID
{
  return self->_factorySectionID != 0;
}

- (BOOL)hasUniversalSectionID
{
  return self->_universalSectionID != 0;
}

- (BOOL)hasIcon
{
  return self->_icon != 0;
}

- (void)setIconsStripped:(BOOL)a3
{
  *(_DWORD *)&self->_has |= 0x100000u;
  self->_iconsStripped = a3;
}

- (void)setHasIconsStripped:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 0x100000;
  else
    v3 = 0;
  self->_has = ($DDB6F6B01A4DE5A47F3A13CA47B8E55C)(*(_DWORD *)&self->_has & 0xFFEFFFFF | v3);
}

- (BOOL)hasIconsStripped
{
  return (*((unsigned __int8 *)&self->_has + 2) >> 4) & 1;
}

- (void)setPhoneAllowsNotifications:(BOOL)a3
{
  *(_DWORD *)&self->_has |= 0x200000u;
  self->_phoneAllowsNotifications = a3;
}

- (void)setHasPhoneAllowsNotifications:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 0x200000;
  else
    v3 = 0;
  self->_has = ($DDB6F6B01A4DE5A47F3A13CA47B8E55C)(*(_DWORD *)&self->_has & 0xFFDFFFFF | v3);
}

- (BOOL)hasPhoneAllowsNotifications
{
  return (*((unsigned __int8 *)&self->_has + 2) >> 5) & 1;
}

- (void)setCriticalAlertSetting:(BOOL)a3
{
  *(_DWORD *)&self->_has |= 0x20000u;
  self->_criticalAlertSetting = a3;
}

- (void)setHasCriticalAlertSetting:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 0x20000;
  else
    v3 = 0;
  self->_has = ($DDB6F6B01A4DE5A47F3A13CA47B8E55C)(*(_DWORD *)&self->_has & 0xFFFDFFFF | v3);
}

- (BOOL)hasCriticalAlertSetting
{
  return (*((unsigned __int8 *)&self->_has + 2) >> 1) & 1;
}

- (int)groupingSetting
{
  if ((*(_BYTE *)&self->_has & 0x10) != 0)
    return self->_groupingSetting;
  else
    return 0;
}

- (void)setGroupingSetting:(int)a3
{
  *(_DWORD *)&self->_has |= 0x10u;
  self->_groupingSetting = a3;
}

- (void)setHasGroupingSetting:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 16;
  else
    v3 = 0;
  self->_has = ($DDB6F6B01A4DE5A47F3A13CA47B8E55C)(*(_DWORD *)&self->_has & 0xFFFFFFEF | v3);
}

- (BOOL)hasGroupingSetting
{
  return (*(_BYTE *)&self->_has >> 4) & 1;
}

- (id)groupingSettingAsString:(int)a3
{
  if (a3 < 3)
    return off_24D763050[a3];
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (int)StringAsGroupingSetting:(id)a3
{
  id v3;
  int v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("Default")) & 1) != 0)
  {
    v4 = 0;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("Section")) & 1) != 0)
  {
    v4 = 1;
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("Off")))
  {
    v4 = 2;
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (void)setExcludeFromBulletinBoard:(BOOL)a3
{
  *(_DWORD *)&self->_has |= 0x80000u;
  self->_excludeFromBulletinBoard = a3;
}

- (void)setHasExcludeFromBulletinBoard:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 0x80000;
  else
    v3 = 0;
  self->_has = ($DDB6F6B01A4DE5A47F3A13CA47B8E55C)(*(_DWORD *)&self->_has & 0xFFF7FFFF | v3);
}

- (BOOL)hasExcludeFromBulletinBoard
{
  return (*((unsigned __int8 *)&self->_has + 2) >> 3) & 1;
}

- (void)setAuthorizationStatus:(int)a3
{
  *(_DWORD *)&self->_has |= 8u;
  self->_authorizationStatus = a3;
}

- (void)setHasAuthorizationStatus:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 8;
  else
    v3 = 0;
  self->_has = ($DDB6F6B01A4DE5A47F3A13CA47B8E55C)(*(_DWORD *)&self->_has & 0xFFFFFFF7 | v3);
}

- (BOOL)hasAuthorizationStatus
{
  return (*(_BYTE *)&self->_has >> 3) & 1;
}

- (void)setPhoneAuthorizationStatus:(int)a3
{
  *(_DWORD *)&self->_has |= 0x100u;
  self->_phoneAuthorizationStatus = a3;
}

- (void)setHasPhoneAuthorizationStatus:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 256;
  else
    v3 = 0;
  self->_has = ($DDB6F6B01A4DE5A47F3A13CA47B8E55C)(*(_DWORD *)&self->_has & 0xFFFFFEFF | v3);
}

- (BOOL)hasPhoneAuthorizationStatus
{
  return *((_BYTE *)&self->_has + 1) & 1;
}

- (int)lockScreenSetting
{
  if ((*(_BYTE *)&self->_has & 0x20) != 0)
    return self->_lockScreenSetting;
  else
    return 0;
}

- (void)setLockScreenSetting:(int)a3
{
  *(_DWORD *)&self->_has |= 0x20u;
  self->_lockScreenSetting = a3;
}

- (void)setHasLockScreenSetting:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 32;
  else
    v3 = 0;
  self->_has = ($DDB6F6B01A4DE5A47F3A13CA47B8E55C)(*(_DWORD *)&self->_has & 0xFFFFFFDF | v3);
}

- (BOOL)hasLockScreenSetting
{
  return (*(_BYTE *)&self->_has >> 5) & 1;
}

- (id)lockScreenSettingAsString:(int)a3
{
  if (a3 < 3)
    return off_24D763068[a3];
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (int)StringAsLockScreenSetting:(id)a3
{
  id v3;
  int v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("NotSupported")) & 1) != 0)
  {
    v4 = 0;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("Disabled")) & 1) != 0)
  {
    v4 = 1;
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("Enabled")))
  {
    v4 = 2;
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (int)notificationCenterSetting
{
  if ((*(_BYTE *)&self->_has & 0x80) != 0)
    return self->_notificationCenterSetting;
  else
    return 0;
}

- (void)setNotificationCenterSetting:(int)a3
{
  *(_DWORD *)&self->_has |= 0x80u;
  self->_notificationCenterSetting = a3;
}

- (void)setHasNotificationCenterSetting:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 128;
  else
    v3 = 0;
  self->_has = ($DDB6F6B01A4DE5A47F3A13CA47B8E55C)(*(_DWORD *)&self->_has & 0xFFFFFF7F | v3);
}

- (BOOL)hasNotificationCenterSetting
{
  return *(_BYTE *)&self->_has >> 7;
}

- (id)notificationCenterSettingAsString:(int)a3
{
  if (a3 < 3)
    return off_24D763068[a3];
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (int)StringAsNotificationCenterSetting:(id)a3
{
  id v3;
  int v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("NotSupported")) & 1) != 0)
  {
    v4 = 0;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("Disabled")) & 1) != 0)
  {
    v4 = 1;
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("Enabled")))
  {
    v4 = 2;
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (int)spokenNotificationSetting
{
  if ((*((_BYTE *)&self->_has + 1) & 0x10) != 0)
    return self->_spokenNotificationSetting;
  else
    return 0;
}

- (void)setSpokenNotificationSetting:(int)a3
{
  *(_DWORD *)&self->_has |= 0x1000u;
  self->_spokenNotificationSetting = a3;
}

- (void)setHasSpokenNotificationSetting:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 4096;
  else
    v3 = 0;
  self->_has = ($DDB6F6B01A4DE5A47F3A13CA47B8E55C)(*(_DWORD *)&self->_has & 0xFFFFEFFF | v3);
}

- (BOOL)hasSpokenNotificationSetting
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 4) & 1;
}

- (id)spokenNotificationSettingAsString:(int)a3
{
  if (a3 < 3)
    return off_24D763068[a3];
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (int)StringAsSpokenNotificationSetting:(id)a3
{
  id v3;
  int v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("NotSupported")) & 1) != 0)
  {
    v4 = 0;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("Disabled")) & 1) != 0)
  {
    v4 = 1;
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("Enabled")))
  {
    v4 = 2;
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (BOOL)hasWatchSectionID
{
  return self->_watchSectionID != 0;
}

- (void)setAuthorizationExpirationDate:(double)a3
{
  *(_DWORD *)&self->_has |= 1u;
  self->_authorizationExpirationDate = a3;
}

- (void)setHasAuthorizationExpirationDate:(BOOL)a3
{
  self->_has = ($DDB6F6B01A4DE5A47F3A13CA47B8E55C)(*(_DWORD *)&self->_has & 0xFFFFFFFE | a3);
}

- (BOOL)hasAuthorizationExpirationDate
{
  return *(_DWORD *)&self->_has & 1;
}

- (void)setLastUserGrantedAuthorizationDate:(double)a3
{
  *(_DWORD *)&self->_has |= 2u;
  self->_lastUserGrantedAuthorizationDate = a3;
}

- (void)setHasLastUserGrantedAuthorizationDate:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  self->_has = ($DDB6F6B01A4DE5A47F3A13CA47B8E55C)(*(_DWORD *)&self->_has & 0xFFFFFFFD | v3);
}

- (BOOL)hasLastUserGrantedAuthorizationDate
{
  return (*(_BYTE *)&self->_has >> 1) & 1;
}

- (BOOL)hasSectionInfoSettings
{
  return self->_sectionInfoSettings != 0;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v8;

  v3 = (void *)MEMORY[0x24BDD17C8];
  v8.receiver = self;
  v8.super_class = (Class)BLTPBSectionInfo;
  -[BLTPBSectionInfo description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[BLTPBSectionInfo dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;
  NSString *sectionID;
  NSString *subsectionID;
  $DDB6F6B01A4DE5A47F3A13CA47B8E55C has;
  void *v8;
  NSString *displayName;
  void *v10;
  void *v11;
  NSMutableArray *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t i;
  void *v17;
  $DDB6F6B01A4DE5A47F3A13CA47B8E55C v18;
  void *v19;
  void *v20;
  NSString *factorySectionID;
  NSString *universalSectionID;
  BLTPBSectionIcon *icon;
  void *v24;
  $DDB6F6B01A4DE5A47F3A13CA47B8E55C v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  uint64_t groupingSetting;
  __CFString *v41;
  void *v42;
  void *v43;
  void *v44;
  uint64_t lockScreenSetting;
  __CFString *v46;
  uint64_t notificationCenterSetting;
  __CFString *v48;
  uint64_t spokenNotificationSetting;
  __CFString *v50;
  NSString *watchSectionID;
  $DDB6F6B01A4DE5A47F3A13CA47B8E55C v52;
  void *v53;
  void *v54;
  BLTPBSectionInfoSettings *sectionInfoSettings;
  void *v56;
  id v57;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  _BYTE v63[128];
  uint64_t v64;

  v64 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  sectionID = self->_sectionID;
  if (sectionID)
    objc_msgSend(v3, "setObject:forKey:", sectionID, CFSTR("sectionID"));
  subsectionID = self->_subsectionID;
  if (subsectionID)
    objc_msgSend(v4, "setObject:forKey:", subsectionID, CFSTR("subsectionID"));
  has = self->_has;
  if ((*(_WORD *)&has & 0x800) != 0)
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", self->_sectionType);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v26, CFSTR("sectionType"));

    has = self->_has;
    if ((*(_WORD *)&has & 0x400) == 0)
    {
LABEL_7:
      if ((*(_DWORD *)&has & 0x4000000) == 0)
        goto LABEL_8;
      goto LABEL_54;
    }
  }
  else if ((*(_WORD *)&has & 0x400) == 0)
  {
    goto LABEL_7;
  }
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", self->_sectionCategory);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKey:", v27, CFSTR("sectionCategory"));

  has = self->_has;
  if ((*(_DWORD *)&has & 0x4000000) == 0)
  {
LABEL_8:
    if ((*(_DWORD *)&has & 0x800000) == 0)
      goto LABEL_9;
    goto LABEL_55;
  }
LABEL_54:
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", self->_suppressFromSettings);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKey:", v28, CFSTR("suppressFromSettings"));

  has = self->_has;
  if ((*(_DWORD *)&has & 0x800000) == 0)
  {
LABEL_9:
    if ((*(_DWORD *)&has & 0x400000) == 0)
      goto LABEL_10;
    goto LABEL_56;
  }
LABEL_55:
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", self->_showsInNotificationCenter);
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKey:", v29, CFSTR("showsInNotificationCenter"));

  has = self->_has;
  if ((*(_DWORD *)&has & 0x400000) == 0)
  {
LABEL_10:
    if ((*(_DWORD *)&has & 0x2000000) == 0)
      goto LABEL_11;
    goto LABEL_57;
  }
LABEL_56:
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", self->_showsInLockScreen);
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKey:", v30, CFSTR("showsInLockScreen"));

  has = self->_has;
  if ((*(_DWORD *)&has & 0x2000000) == 0)
  {
LABEL_11:
    if ((*(_BYTE *)&has & 0x40) == 0)
      goto LABEL_12;
    goto LABEL_58;
  }
LABEL_57:
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", self->_showsOnExternalDevices);
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKey:", v31, CFSTR("showsOnExternalDevices"));

  has = self->_has;
  if ((*(_BYTE *)&has & 0x40) == 0)
  {
LABEL_12:
    if ((*(_WORD *)&has & 0x200) == 0)
      goto LABEL_13;
    goto LABEL_59;
  }
LABEL_58:
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", self->_notificationCenterLimit);
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKey:", v32, CFSTR("notificationCenterLimit"));

  has = self->_has;
  if ((*(_WORD *)&has & 0x200) == 0)
  {
LABEL_13:
    if ((*(_BYTE *)&has & 4) == 0)
      goto LABEL_14;
    goto LABEL_60;
  }
LABEL_59:
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", self->_pushSettings);
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKey:", v33, CFSTR("pushSettings"));

  has = self->_has;
  if ((*(_BYTE *)&has & 4) == 0)
  {
LABEL_14:
    if ((*(_DWORD *)&has & 0x1000000) == 0)
      goto LABEL_15;
    goto LABEL_61;
  }
LABEL_60:
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", self->_alertType);
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKey:", v34, CFSTR("alertType"));

  has = self->_has;
  if ((*(_DWORD *)&has & 0x1000000) == 0)
  {
LABEL_15:
    if ((*(_DWORD *)&has & 0x10000) == 0)
      goto LABEL_16;
    goto LABEL_62;
  }
LABEL_61:
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", self->_showsMessagePreview);
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKey:", v35, CFSTR("showsMessagePreview"));

  has = self->_has;
  if ((*(_DWORD *)&has & 0x10000) == 0)
  {
LABEL_16:
    if ((*(_WORD *)&has & 0x4000) == 0)
      goto LABEL_18;
    goto LABEL_17;
  }
LABEL_62:
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", self->_allowsNotifications);
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKey:", v36, CFSTR("allowsNotifications"));

  if ((*(_DWORD *)&self->_has & 0x4000) != 0)
  {
LABEL_17:
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", self->_suppressedSettings);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v8, CFSTR("suppressedSettings"));

  }
LABEL_18:
  displayName = self->_displayName;
  if (displayName)
    objc_msgSend(v4, "setObject:forKey:", displayName, CFSTR("displayName"));
  if ((*((_BYTE *)&self->_has + 2) & 4) != 0)
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", self->_displaysCriticalBulletinsLegacy);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v10, CFSTR("displaysCriticalBulletinsLegacy"));

  }
  if (-[NSMutableArray count](self->_subsections, "count"))
  {
    v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCEB8]), "initWithCapacity:", -[NSMutableArray count](self->_subsections, "count"));
    v59 = 0u;
    v60 = 0u;
    v61 = 0u;
    v62 = 0u;
    v12 = self->_subsections;
    v13 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v12, "countByEnumeratingWithState:objects:count:", &v59, v63, 16);
    if (v13)
    {
      v14 = v13;
      v15 = *(_QWORD *)v60;
      do
      {
        for (i = 0; i != v14; ++i)
        {
          if (*(_QWORD *)v60 != v15)
            objc_enumerationMutation(v12);
          objc_msgSend(*(id *)(*((_QWORD *)&v59 + 1) + 8 * i), "dictionaryRepresentation");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v11, "addObject:", v17);

        }
        v14 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v12, "countByEnumeratingWithState:objects:count:", &v59, v63, 16);
      }
      while (v14);
    }

    objc_msgSend(v4, "setObject:forKey:", v11, CFSTR("subsections"));
  }
  v18 = self->_has;
  if ((*(_WORD *)&v18 & 0x2000) != 0)
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", self->_subsectionPriority);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v19, CFSTR("subsectionPriority"));

    v18 = self->_has;
  }
  if ((*(_WORD *)&v18 & 0x8000) != 0)
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", self->_version);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v20, CFSTR("version"));

  }
  factorySectionID = self->_factorySectionID;
  if (factorySectionID)
    objc_msgSend(v4, "setObject:forKey:", factorySectionID, CFSTR("factorySectionID"));
  universalSectionID = self->_universalSectionID;
  if (universalSectionID)
    objc_msgSend(v4, "setObject:forKey:", universalSectionID, CFSTR("universalSectionID"));
  icon = self->_icon;
  if (icon)
  {
    -[BLTPBSectionIcon dictionaryRepresentation](icon, "dictionaryRepresentation");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v24, CFSTR("icon"));

  }
  v25 = self->_has;
  if ((*(_DWORD *)&v25 & 0x100000) != 0)
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", self->_iconsStripped);
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v37, CFSTR("iconsStripped"));

    v25 = self->_has;
    if ((*(_DWORD *)&v25 & 0x200000) == 0)
    {
LABEL_43:
      if ((*(_DWORD *)&v25 & 0x20000) == 0)
        goto LABEL_44;
      goto LABEL_66;
    }
  }
  else if ((*(_DWORD *)&v25 & 0x200000) == 0)
  {
    goto LABEL_43;
  }
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", self->_phoneAllowsNotifications);
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKey:", v38, CFSTR("phoneAllowsNotifications"));

  v25 = self->_has;
  if ((*(_DWORD *)&v25 & 0x20000) == 0)
  {
LABEL_44:
    if ((*(_BYTE *)&v25 & 0x10) == 0)
      goto LABEL_45;
    goto LABEL_67;
  }
LABEL_66:
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", self->_criticalAlertSetting);
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKey:", v39, CFSTR("criticalAlertSetting"));

  v25 = self->_has;
  if ((*(_BYTE *)&v25 & 0x10) == 0)
  {
LABEL_45:
    if ((*(_DWORD *)&v25 & 0x80000) == 0)
      goto LABEL_46;
    goto LABEL_71;
  }
LABEL_67:
  groupingSetting = self->_groupingSetting;
  if (groupingSetting >= 3)
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("(unknown: %i)"), self->_groupingSetting);
    v41 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v41 = off_24D763050[groupingSetting];
  }
  objc_msgSend(v4, "setObject:forKey:", v41, CFSTR("groupingSetting"));

  v25 = self->_has;
  if ((*(_DWORD *)&v25 & 0x80000) == 0)
  {
LABEL_46:
    if ((*(_BYTE *)&v25 & 8) == 0)
      goto LABEL_47;
    goto LABEL_72;
  }
LABEL_71:
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", self->_excludeFromBulletinBoard);
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKey:", v42, CFSTR("excludeFromBulletinBoard"));

  v25 = self->_has;
  if ((*(_BYTE *)&v25 & 8) == 0)
  {
LABEL_47:
    if ((*(_WORD *)&v25 & 0x100) == 0)
      goto LABEL_48;
    goto LABEL_73;
  }
LABEL_72:
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", self->_authorizationStatus);
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKey:", v43, CFSTR("authorizationStatus"));

  v25 = self->_has;
  if ((*(_WORD *)&v25 & 0x100) == 0)
  {
LABEL_48:
    if ((*(_BYTE *)&v25 & 0x20) == 0)
      goto LABEL_49;
    goto LABEL_74;
  }
LABEL_73:
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", self->_phoneAuthorizationStatus);
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKey:", v44, CFSTR("phoneAuthorizationStatus"));

  v25 = self->_has;
  if ((*(_BYTE *)&v25 & 0x20) == 0)
  {
LABEL_49:
    if ((*(_BYTE *)&v25 & 0x80) == 0)
      goto LABEL_50;
    goto LABEL_78;
  }
LABEL_74:
  lockScreenSetting = self->_lockScreenSetting;
  if (lockScreenSetting >= 3)
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("(unknown: %i)"), self->_lockScreenSetting);
    v46 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v46 = off_24D763068[lockScreenSetting];
  }
  objc_msgSend(v4, "setObject:forKey:", v46, CFSTR("lockScreenSetting"));

  v25 = self->_has;
  if ((*(_BYTE *)&v25 & 0x80) == 0)
  {
LABEL_50:
    if ((*(_WORD *)&v25 & 0x1000) == 0)
      goto LABEL_86;
    goto LABEL_82;
  }
LABEL_78:
  notificationCenterSetting = self->_notificationCenterSetting;
  if (notificationCenterSetting >= 3)
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("(unknown: %i)"), self->_notificationCenterSetting);
    v48 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v48 = off_24D763068[notificationCenterSetting];
  }
  objc_msgSend(v4, "setObject:forKey:", v48, CFSTR("notificationCenterSetting"));

  if ((*(_DWORD *)&self->_has & 0x1000) != 0)
  {
LABEL_82:
    spokenNotificationSetting = self->_spokenNotificationSetting;
    if (spokenNotificationSetting >= 3)
    {
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("(unknown: %i)"), self->_spokenNotificationSetting);
      v50 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v50 = off_24D763068[spokenNotificationSetting];
    }
    objc_msgSend(v4, "setObject:forKey:", v50, CFSTR("spokenNotificationSetting"));

  }
LABEL_86:
  watchSectionID = self->_watchSectionID;
  if (watchSectionID)
    objc_msgSend(v4, "setObject:forKey:", watchSectionID, CFSTR("watchSectionID"));
  v52 = self->_has;
  if ((*(_BYTE *)&v52 & 1) != 0)
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", self->_authorizationExpirationDate);
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v53, CFSTR("authorizationExpirationDate"));

    v52 = self->_has;
  }
  if ((*(_BYTE *)&v52 & 2) != 0)
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", self->_lastUserGrantedAuthorizationDate);
    v54 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v54, CFSTR("lastUserGrantedAuthorizationDate"));

  }
  sectionInfoSettings = self->_sectionInfoSettings;
  if (sectionInfoSettings)
  {
    -[BLTPBSectionInfoSettings dictionaryRepresentation](sectionInfoSettings, "dictionaryRepresentation");
    v56 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v56, CFSTR("sectionInfoSettings"));

  }
  v57 = v4;

  return v57;
}

- (BOOL)readFrom:(id)a3
{
  return BLTPBSectionInfoReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4;
  $DDB6F6B01A4DE5A47F3A13CA47B8E55C has;
  NSMutableArray *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  $DDB6F6B01A4DE5A47F3A13CA47B8E55C v11;
  $DDB6F6B01A4DE5A47F3A13CA47B8E55C v12;
  $DDB6F6B01A4DE5A47F3A13CA47B8E55C v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  if (self->_sectionID)
    PBDataWriterWriteStringField();
  if (self->_subsectionID)
    PBDataWriterWriteStringField();
  has = self->_has;
  if ((*(_WORD *)&has & 0x800) != 0)
  {
    PBDataWriterWriteInt32Field();
    has = self->_has;
    if ((*(_WORD *)&has & 0x400) == 0)
    {
LABEL_7:
      if ((*(_DWORD *)&has & 0x4000000) == 0)
        goto LABEL_8;
      goto LABEL_61;
    }
  }
  else if ((*(_WORD *)&has & 0x400) == 0)
  {
    goto LABEL_7;
  }
  PBDataWriterWriteInt32Field();
  has = self->_has;
  if ((*(_DWORD *)&has & 0x4000000) == 0)
  {
LABEL_8:
    if ((*(_DWORD *)&has & 0x800000) == 0)
      goto LABEL_9;
    goto LABEL_62;
  }
LABEL_61:
  PBDataWriterWriteBOOLField();
  has = self->_has;
  if ((*(_DWORD *)&has & 0x800000) == 0)
  {
LABEL_9:
    if ((*(_DWORD *)&has & 0x400000) == 0)
      goto LABEL_10;
    goto LABEL_63;
  }
LABEL_62:
  PBDataWriterWriteBOOLField();
  has = self->_has;
  if ((*(_DWORD *)&has & 0x400000) == 0)
  {
LABEL_10:
    if ((*(_DWORD *)&has & 0x2000000) == 0)
      goto LABEL_11;
    goto LABEL_64;
  }
LABEL_63:
  PBDataWriterWriteBOOLField();
  has = self->_has;
  if ((*(_DWORD *)&has & 0x2000000) == 0)
  {
LABEL_11:
    if ((*(_BYTE *)&has & 0x40) == 0)
      goto LABEL_12;
    goto LABEL_65;
  }
LABEL_64:
  PBDataWriterWriteBOOLField();
  has = self->_has;
  if ((*(_BYTE *)&has & 0x40) == 0)
  {
LABEL_12:
    if ((*(_WORD *)&has & 0x200) == 0)
      goto LABEL_13;
    goto LABEL_66;
  }
LABEL_65:
  PBDataWriterWriteUint32Field();
  has = self->_has;
  if ((*(_WORD *)&has & 0x200) == 0)
  {
LABEL_13:
    if ((*(_BYTE *)&has & 4) == 0)
      goto LABEL_14;
    goto LABEL_67;
  }
LABEL_66:
  PBDataWriterWriteUint32Field();
  has = self->_has;
  if ((*(_BYTE *)&has & 4) == 0)
  {
LABEL_14:
    if ((*(_DWORD *)&has & 0x1000000) == 0)
      goto LABEL_15;
    goto LABEL_68;
  }
LABEL_67:
  PBDataWriterWriteUint32Field();
  has = self->_has;
  if ((*(_DWORD *)&has & 0x1000000) == 0)
  {
LABEL_15:
    if ((*(_DWORD *)&has & 0x10000) == 0)
      goto LABEL_16;
    goto LABEL_69;
  }
LABEL_68:
  PBDataWriterWriteBOOLField();
  has = self->_has;
  if ((*(_DWORD *)&has & 0x10000) == 0)
  {
LABEL_16:
    if ((*(_WORD *)&has & 0x4000) == 0)
      goto LABEL_18;
    goto LABEL_17;
  }
LABEL_69:
  PBDataWriterWriteBOOLField();
  if ((*(_DWORD *)&self->_has & 0x4000) != 0)
LABEL_17:
    PBDataWriterWriteUint32Field();
LABEL_18:
  if (self->_displayName)
    PBDataWriterWriteStringField();
  if ((*((_BYTE *)&self->_has + 2) & 4) != 0)
    PBDataWriterWriteBOOLField();
  v16 = 0u;
  v17 = 0u;
  v14 = 0u;
  v15 = 0u;
  v6 = self->_subsections;
  v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v15;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v15 != v9)
          objc_enumerationMutation(v6);
        PBDataWriterWriteSubmessage();
        ++v10;
      }
      while (v8 != v10);
      v8 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v8);
  }

  v11 = self->_has;
  if ((*(_WORD *)&v11 & 0x2000) != 0)
  {
    PBDataWriterWriteInt32Field();
    v11 = self->_has;
  }
  if ((*(_WORD *)&v11 & 0x8000) != 0)
    PBDataWriterWriteUint32Field();
  if (self->_factorySectionID)
    PBDataWriterWriteStringField();
  if (self->_universalSectionID)
    PBDataWriterWriteStringField();
  if (self->_icon)
    PBDataWriterWriteSubmessage();
  v12 = self->_has;
  if ((*(_DWORD *)&v12 & 0x100000) != 0)
  {
    PBDataWriterWriteBOOLField();
    v12 = self->_has;
    if ((*(_DWORD *)&v12 & 0x200000) == 0)
    {
LABEL_41:
      if ((*(_DWORD *)&v12 & 0x20000) == 0)
        goto LABEL_42;
      goto LABEL_73;
    }
  }
  else if ((*(_DWORD *)&v12 & 0x200000) == 0)
  {
    goto LABEL_41;
  }
  PBDataWriterWriteBOOLField();
  v12 = self->_has;
  if ((*(_DWORD *)&v12 & 0x20000) == 0)
  {
LABEL_42:
    if ((*(_BYTE *)&v12 & 0x10) == 0)
      goto LABEL_43;
    goto LABEL_74;
  }
LABEL_73:
  PBDataWriterWriteBOOLField();
  v12 = self->_has;
  if ((*(_BYTE *)&v12 & 0x10) == 0)
  {
LABEL_43:
    if ((*(_DWORD *)&v12 & 0x80000) == 0)
      goto LABEL_44;
    goto LABEL_75;
  }
LABEL_74:
  PBDataWriterWriteInt32Field();
  v12 = self->_has;
  if ((*(_DWORD *)&v12 & 0x80000) == 0)
  {
LABEL_44:
    if ((*(_BYTE *)&v12 & 8) == 0)
      goto LABEL_45;
    goto LABEL_76;
  }
LABEL_75:
  PBDataWriterWriteBOOLField();
  v12 = self->_has;
  if ((*(_BYTE *)&v12 & 8) == 0)
  {
LABEL_45:
    if ((*(_WORD *)&v12 & 0x100) == 0)
      goto LABEL_46;
    goto LABEL_77;
  }
LABEL_76:
  PBDataWriterWriteInt32Field();
  v12 = self->_has;
  if ((*(_WORD *)&v12 & 0x100) == 0)
  {
LABEL_46:
    if ((*(_BYTE *)&v12 & 0x20) == 0)
      goto LABEL_47;
    goto LABEL_78;
  }
LABEL_77:
  PBDataWriterWriteInt32Field();
  v12 = self->_has;
  if ((*(_BYTE *)&v12 & 0x20) == 0)
  {
LABEL_47:
    if ((*(_BYTE *)&v12 & 0x80) == 0)
      goto LABEL_48;
    goto LABEL_79;
  }
LABEL_78:
  PBDataWriterWriteInt32Field();
  v12 = self->_has;
  if ((*(_BYTE *)&v12 & 0x80) == 0)
  {
LABEL_48:
    if ((*(_WORD *)&v12 & 0x1000) == 0)
      goto LABEL_50;
    goto LABEL_49;
  }
LABEL_79:
  PBDataWriterWriteInt32Field();
  if ((*(_DWORD *)&self->_has & 0x1000) != 0)
LABEL_49:
    PBDataWriterWriteInt32Field();
LABEL_50:
  if (self->_watchSectionID)
    PBDataWriterWriteStringField();
  v13 = self->_has;
  if ((*(_BYTE *)&v13 & 1) != 0)
  {
    PBDataWriterWriteDoubleField();
    v13 = self->_has;
  }
  if ((*(_BYTE *)&v13 & 2) != 0)
    PBDataWriterWriteDoubleField();
  if (self->_sectionInfoSettings)
    PBDataWriterWriteSubmessage();

}

- (void)copyTo:(id)a3
{
  _DWORD *v4;
  $DDB6F6B01A4DE5A47F3A13CA47B8E55C has;
  unint64_t v6;
  unint64_t v7;
  uint64_t i;
  void *v9;
  $DDB6F6B01A4DE5A47F3A13CA47B8E55C v10;
  _DWORD *v11;
  $DDB6F6B01A4DE5A47F3A13CA47B8E55C v12;
  $DDB6F6B01A4DE5A47F3A13CA47B8E55C v13;
  _DWORD *v14;

  v4 = a3;
  v14 = v4;
  if (self->_sectionID)
  {
    objc_msgSend(v4, "setSectionID:");
    v4 = v14;
  }
  if (self->_subsectionID)
  {
    objc_msgSend(v14, "setSubsectionID:");
    v4 = v14;
  }
  has = self->_has;
  if ((*(_WORD *)&has & 0x800) != 0)
  {
    v4[26] = self->_sectionType;
    v4[45] |= 0x800u;
    has = self->_has;
    if ((*(_WORD *)&has & 0x400) == 0)
    {
LABEL_7:
      if ((*(_DWORD *)&has & 0x4000000) == 0)
        goto LABEL_8;
      goto LABEL_58;
    }
  }
  else if ((*(_WORD *)&has & 0x400) == 0)
  {
    goto LABEL_7;
  }
  v4[21] = self->_sectionCategory;
  v4[45] |= 0x400u;
  has = self->_has;
  if ((*(_DWORD *)&has & 0x4000000) == 0)
  {
LABEL_8:
    if ((*(_DWORD *)&has & 0x800000) == 0)
      goto LABEL_9;
    goto LABEL_59;
  }
LABEL_58:
  *((_BYTE *)v4 + 178) = self->_suppressFromSettings;
  v4[45] |= 0x4000000u;
  has = self->_has;
  if ((*(_DWORD *)&has & 0x800000) == 0)
  {
LABEL_9:
    if ((*(_DWORD *)&has & 0x400000) == 0)
      goto LABEL_10;
    goto LABEL_60;
  }
LABEL_59:
  *((_BYTE *)v4 + 175) = self->_showsInNotificationCenter;
  v4[45] |= 0x800000u;
  has = self->_has;
  if ((*(_DWORD *)&has & 0x400000) == 0)
  {
LABEL_10:
    if ((*(_DWORD *)&has & 0x2000000) == 0)
      goto LABEL_11;
    goto LABEL_61;
  }
LABEL_60:
  *((_BYTE *)v4 + 174) = self->_showsInLockScreen;
  v4[45] |= 0x400000u;
  has = self->_has;
  if ((*(_DWORD *)&has & 0x2000000) == 0)
  {
LABEL_11:
    if ((*(_BYTE *)&has & 0x40) == 0)
      goto LABEL_12;
    goto LABEL_62;
  }
LABEL_61:
  *((_BYTE *)v4 + 177) = self->_showsOnExternalDevices;
  v4[45] |= 0x2000000u;
  has = self->_has;
  if ((*(_BYTE *)&has & 0x40) == 0)
  {
LABEL_12:
    if ((*(_WORD *)&has & 0x200) == 0)
      goto LABEL_13;
    goto LABEL_63;
  }
LABEL_62:
  v4[17] = self->_notificationCenterLimit;
  v4[45] |= 0x40u;
  has = self->_has;
  if ((*(_WORD *)&has & 0x200) == 0)
  {
LABEL_13:
    if ((*(_BYTE *)&has & 4) == 0)
      goto LABEL_14;
    goto LABEL_64;
  }
LABEL_63:
  v4[20] = self->_pushSettings;
  v4[45] |= 0x200u;
  has = self->_has;
  if ((*(_BYTE *)&has & 4) == 0)
  {
LABEL_14:
    if ((*(_DWORD *)&has & 0x1000000) == 0)
      goto LABEL_15;
    goto LABEL_65;
  }
LABEL_64:
  v4[6] = self->_alertType;
  v4[45] |= 4u;
  has = self->_has;
  if ((*(_DWORD *)&has & 0x1000000) == 0)
  {
LABEL_15:
    if ((*(_DWORD *)&has & 0x10000) == 0)
      goto LABEL_16;
    goto LABEL_66;
  }
LABEL_65:
  *((_BYTE *)v4 + 176) = self->_showsMessagePreview;
  v4[45] |= 0x1000000u;
  has = self->_has;
  if ((*(_DWORD *)&has & 0x10000) == 0)
  {
LABEL_16:
    if ((*(_WORD *)&has & 0x4000) == 0)
      goto LABEL_18;
    goto LABEL_17;
  }
LABEL_66:
  *((_BYTE *)v4 + 168) = self->_allowsNotifications;
  v4[45] |= 0x10000u;
  if ((*(_DWORD *)&self->_has & 0x4000) != 0)
  {
LABEL_17:
    v4[34] = self->_suppressedSettings;
    v4[45] |= 0x4000u;
  }
LABEL_18:
  if (self->_displayName)
  {
    objc_msgSend(v14, "setDisplayName:");
    v4 = v14;
  }
  if ((*((_BYTE *)&self->_has + 2) & 4) != 0)
  {
    *((_BYTE *)v4 + 170) = self->_displaysCriticalBulletinsLegacy;
    v4[45] |= 0x40000u;
  }
  if (-[BLTPBSectionInfo subsectionsCount](self, "subsectionsCount"))
  {
    objc_msgSend(v14, "clearSubsections");
    v6 = -[BLTPBSectionInfo subsectionsCount](self, "subsectionsCount");
    if (v6)
    {
      v7 = v6;
      for (i = 0; i != v7; ++i)
      {
        -[BLTPBSectionInfo subsectionsAtIndex:](self, "subsectionsAtIndex:", i);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "addSubsections:", v9);

      }
    }
  }
  v10 = self->_has;
  v11 = v14;
  if ((*(_WORD *)&v10 & 0x2000) != 0)
  {
    v14[30] = self->_subsectionPriority;
    v14[45] |= 0x2000u;
    v10 = self->_has;
  }
  if ((*(_WORD *)&v10 & 0x8000) != 0)
  {
    v14[38] = self->_version;
    v14[45] |= 0x8000u;
  }
  if (self->_factorySectionID)
  {
    objc_msgSend(v14, "setFactorySectionID:");
    v11 = v14;
  }
  if (self->_universalSectionID)
  {
    objc_msgSend(v14, "setUniversalSectionID:");
    v11 = v14;
  }
  if (self->_icon)
  {
    objc_msgSend(v14, "setIcon:");
    v11 = v14;
  }
  v12 = self->_has;
  if ((*(_DWORD *)&v12 & 0x100000) != 0)
  {
    *((_BYTE *)v11 + 172) = self->_iconsStripped;
    v11[45] |= 0x100000u;
    v12 = self->_has;
    if ((*(_DWORD *)&v12 & 0x200000) == 0)
    {
LABEL_38:
      if ((*(_DWORD *)&v12 & 0x20000) == 0)
        goto LABEL_39;
      goto LABEL_70;
    }
  }
  else if ((*(_DWORD *)&v12 & 0x200000) == 0)
  {
    goto LABEL_38;
  }
  *((_BYTE *)v11 + 173) = self->_phoneAllowsNotifications;
  v11[45] |= 0x200000u;
  v12 = self->_has;
  if ((*(_DWORD *)&v12 & 0x20000) == 0)
  {
LABEL_39:
    if ((*(_BYTE *)&v12 & 0x10) == 0)
      goto LABEL_40;
    goto LABEL_71;
  }
LABEL_70:
  *((_BYTE *)v11 + 169) = self->_criticalAlertSetting;
  v11[45] |= 0x20000u;
  v12 = self->_has;
  if ((*(_BYTE *)&v12 & 0x10) == 0)
  {
LABEL_40:
    if ((*(_DWORD *)&v12 & 0x80000) == 0)
      goto LABEL_41;
    goto LABEL_72;
  }
LABEL_71:
  v11[12] = self->_groupingSetting;
  v11[45] |= 0x10u;
  v12 = self->_has;
  if ((*(_DWORD *)&v12 & 0x80000) == 0)
  {
LABEL_41:
    if ((*(_BYTE *)&v12 & 8) == 0)
      goto LABEL_42;
    goto LABEL_73;
  }
LABEL_72:
  *((_BYTE *)v11 + 171) = self->_excludeFromBulletinBoard;
  v11[45] |= 0x80000u;
  v12 = self->_has;
  if ((*(_BYTE *)&v12 & 8) == 0)
  {
LABEL_42:
    if ((*(_WORD *)&v12 & 0x100) == 0)
      goto LABEL_43;
    goto LABEL_74;
  }
LABEL_73:
  v11[7] = self->_authorizationStatus;
  v11[45] |= 8u;
  v12 = self->_has;
  if ((*(_WORD *)&v12 & 0x100) == 0)
  {
LABEL_43:
    if ((*(_BYTE *)&v12 & 0x20) == 0)
      goto LABEL_44;
    goto LABEL_75;
  }
LABEL_74:
  v11[19] = self->_phoneAuthorizationStatus;
  v11[45] |= 0x100u;
  v12 = self->_has;
  if ((*(_BYTE *)&v12 & 0x20) == 0)
  {
LABEL_44:
    if ((*(_BYTE *)&v12 & 0x80) == 0)
      goto LABEL_45;
    goto LABEL_76;
  }
LABEL_75:
  v11[16] = self->_lockScreenSetting;
  v11[45] |= 0x20u;
  v12 = self->_has;
  if ((*(_BYTE *)&v12 & 0x80) == 0)
  {
LABEL_45:
    if ((*(_WORD *)&v12 & 0x1000) == 0)
      goto LABEL_47;
    goto LABEL_46;
  }
LABEL_76:
  v11[18] = self->_notificationCenterSetting;
  v11[45] |= 0x80u;
  if ((*(_DWORD *)&self->_has & 0x1000) != 0)
  {
LABEL_46:
    v11[27] = self->_spokenNotificationSetting;
    v11[45] |= 0x1000u;
  }
LABEL_47:
  if (self->_watchSectionID)
  {
    objc_msgSend(v14, "setWatchSectionID:");
    v11 = v14;
  }
  v13 = self->_has;
  if ((*(_BYTE *)&v13 & 1) != 0)
  {
    *((_QWORD *)v11 + 1) = *(_QWORD *)&self->_authorizationExpirationDate;
    v11[45] |= 1u;
    v13 = self->_has;
  }
  if ((*(_BYTE *)&v13 & 2) != 0)
  {
    *((_QWORD *)v11 + 2) = *(_QWORD *)&self->_lastUserGrantedAuthorizationDate;
    v11[45] |= 2u;
  }
  if (self->_sectionInfoSettings)
  {
    objc_msgSend(v14, "setSectionInfoSettings:");
    v11 = v14;
  }

}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  $DDB6F6B01A4DE5A47F3A13CA47B8E55C has;
  uint64_t v11;
  void *v12;
  NSMutableArray *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  $DDB6F6B01A4DE5A47F3A13CA47B8E55C v19;
  uint64_t v20;
  void *v21;
  uint64_t v22;
  void *v23;
  id v24;
  void *v25;
  $DDB6F6B01A4DE5A47F3A13CA47B8E55C v26;
  uint64_t v27;
  void *v28;
  $DDB6F6B01A4DE5A47F3A13CA47B8E55C v29;
  id v30;
  void *v31;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  _BYTE v37[128];
  uint64_t v38;

  v38 = *MEMORY[0x24BDAC8D0];
  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = -[NSString copyWithZone:](self->_sectionID, "copyWithZone:", a3);
  v7 = *(void **)(v5 + 88);
  *(_QWORD *)(v5 + 88) = v6;

  v8 = -[NSString copyWithZone:](self->_subsectionID, "copyWithZone:", a3);
  v9 = *(void **)(v5 + 112);
  *(_QWORD *)(v5 + 112) = v8;

  has = self->_has;
  if ((*(_WORD *)&has & 0x800) != 0)
  {
    *(_DWORD *)(v5 + 104) = self->_sectionType;
    *(_DWORD *)(v5 + 180) |= 0x800u;
    has = self->_has;
    if ((*(_WORD *)&has & 0x400) == 0)
    {
LABEL_3:
      if ((*(_DWORD *)&has & 0x4000000) == 0)
        goto LABEL_4;
      goto LABEL_45;
    }
  }
  else if ((*(_WORD *)&has & 0x400) == 0)
  {
    goto LABEL_3;
  }
  *(_DWORD *)(v5 + 84) = self->_sectionCategory;
  *(_DWORD *)(v5 + 180) |= 0x400u;
  has = self->_has;
  if ((*(_DWORD *)&has & 0x4000000) == 0)
  {
LABEL_4:
    if ((*(_DWORD *)&has & 0x800000) == 0)
      goto LABEL_5;
    goto LABEL_46;
  }
LABEL_45:
  *(_BYTE *)(v5 + 178) = self->_suppressFromSettings;
  *(_DWORD *)(v5 + 180) |= 0x4000000u;
  has = self->_has;
  if ((*(_DWORD *)&has & 0x800000) == 0)
  {
LABEL_5:
    if ((*(_DWORD *)&has & 0x400000) == 0)
      goto LABEL_6;
    goto LABEL_47;
  }
LABEL_46:
  *(_BYTE *)(v5 + 175) = self->_showsInNotificationCenter;
  *(_DWORD *)(v5 + 180) |= 0x800000u;
  has = self->_has;
  if ((*(_DWORD *)&has & 0x400000) == 0)
  {
LABEL_6:
    if ((*(_DWORD *)&has & 0x2000000) == 0)
      goto LABEL_7;
    goto LABEL_48;
  }
LABEL_47:
  *(_BYTE *)(v5 + 174) = self->_showsInLockScreen;
  *(_DWORD *)(v5 + 180) |= 0x400000u;
  has = self->_has;
  if ((*(_DWORD *)&has & 0x2000000) == 0)
  {
LABEL_7:
    if ((*(_BYTE *)&has & 0x40) == 0)
      goto LABEL_8;
    goto LABEL_49;
  }
LABEL_48:
  *(_BYTE *)(v5 + 177) = self->_showsOnExternalDevices;
  *(_DWORD *)(v5 + 180) |= 0x2000000u;
  has = self->_has;
  if ((*(_BYTE *)&has & 0x40) == 0)
  {
LABEL_8:
    if ((*(_WORD *)&has & 0x200) == 0)
      goto LABEL_9;
    goto LABEL_50;
  }
LABEL_49:
  *(_DWORD *)(v5 + 68) = self->_notificationCenterLimit;
  *(_DWORD *)(v5 + 180) |= 0x40u;
  has = self->_has;
  if ((*(_WORD *)&has & 0x200) == 0)
  {
LABEL_9:
    if ((*(_BYTE *)&has & 4) == 0)
      goto LABEL_10;
    goto LABEL_51;
  }
LABEL_50:
  *(_DWORD *)(v5 + 80) = self->_pushSettings;
  *(_DWORD *)(v5 + 180) |= 0x200u;
  has = self->_has;
  if ((*(_BYTE *)&has & 4) == 0)
  {
LABEL_10:
    if ((*(_DWORD *)&has & 0x1000000) == 0)
      goto LABEL_11;
    goto LABEL_52;
  }
LABEL_51:
  *(_DWORD *)(v5 + 24) = self->_alertType;
  *(_DWORD *)(v5 + 180) |= 4u;
  has = self->_has;
  if ((*(_DWORD *)&has & 0x1000000) == 0)
  {
LABEL_11:
    if ((*(_DWORD *)&has & 0x10000) == 0)
      goto LABEL_12;
    goto LABEL_53;
  }
LABEL_52:
  *(_BYTE *)(v5 + 176) = self->_showsMessagePreview;
  *(_DWORD *)(v5 + 180) |= 0x1000000u;
  has = self->_has;
  if ((*(_DWORD *)&has & 0x10000) == 0)
  {
LABEL_12:
    if ((*(_WORD *)&has & 0x4000) == 0)
      goto LABEL_14;
    goto LABEL_13;
  }
LABEL_53:
  *(_BYTE *)(v5 + 168) = self->_allowsNotifications;
  *(_DWORD *)(v5 + 180) |= 0x10000u;
  if ((*(_DWORD *)&self->_has & 0x4000) != 0)
  {
LABEL_13:
    *(_DWORD *)(v5 + 136) = self->_suppressedSettings;
    *(_DWORD *)(v5 + 180) |= 0x4000u;
  }
LABEL_14:
  v11 = -[NSString copyWithZone:](self->_displayName, "copyWithZone:", a3);
  v12 = *(void **)(v5 + 32);
  *(_QWORD *)(v5 + 32) = v11;

  if ((*((_BYTE *)&self->_has + 2) & 4) != 0)
  {
    *(_BYTE *)(v5 + 170) = self->_displaysCriticalBulletinsLegacy;
    *(_DWORD *)(v5 + 180) |= 0x40000u;
  }
  v35 = 0u;
  v36 = 0u;
  v33 = 0u;
  v34 = 0u;
  v13 = self->_subsections;
  v14 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v13, "countByEnumeratingWithState:objects:count:", &v33, v37, 16);
  if (v14)
  {
    v15 = v14;
    v16 = *(_QWORD *)v34;
    do
    {
      v17 = 0;
      do
      {
        if (*(_QWORD *)v34 != v16)
          objc_enumerationMutation(v13);
        v18 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v33 + 1) + 8 * v17), "copyWithZone:", a3, (_QWORD)v33);
        objc_msgSend((id)v5, "addSubsections:", v18);

        ++v17;
      }
      while (v15 != v17);
      v15 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v13, "countByEnumeratingWithState:objects:count:", &v33, v37, 16);
    }
    while (v15);
  }

  v19 = self->_has;
  if ((*(_WORD *)&v19 & 0x2000) != 0)
  {
    *(_DWORD *)(v5 + 120) = self->_subsectionPriority;
    *(_DWORD *)(v5 + 180) |= 0x2000u;
    v19 = self->_has;
  }
  if ((*(_WORD *)&v19 & 0x8000) != 0)
  {
    *(_DWORD *)(v5 + 152) = self->_version;
    *(_DWORD *)(v5 + 180) |= 0x8000u;
  }
  v20 = -[NSString copyWithZone:](self->_factorySectionID, "copyWithZone:", a3, (_QWORD)v33);
  v21 = *(void **)(v5 + 40);
  *(_QWORD *)(v5 + 40) = v20;

  v22 = -[NSString copyWithZone:](self->_universalSectionID, "copyWithZone:", a3);
  v23 = *(void **)(v5 + 144);
  *(_QWORD *)(v5 + 144) = v22;

  v24 = -[BLTPBSectionIcon copyWithZone:](self->_icon, "copyWithZone:", a3);
  v25 = *(void **)(v5 + 56);
  *(_QWORD *)(v5 + 56) = v24;

  v26 = self->_has;
  if ((*(_DWORD *)&v26 & 0x100000) != 0)
  {
    *(_BYTE *)(v5 + 172) = self->_iconsStripped;
    *(_DWORD *)(v5 + 180) |= 0x100000u;
    v26 = self->_has;
    if ((*(_DWORD *)&v26 & 0x200000) == 0)
    {
LABEL_29:
      if ((*(_DWORD *)&v26 & 0x20000) == 0)
        goto LABEL_30;
      goto LABEL_57;
    }
  }
  else if ((*(_DWORD *)&v26 & 0x200000) == 0)
  {
    goto LABEL_29;
  }
  *(_BYTE *)(v5 + 173) = self->_phoneAllowsNotifications;
  *(_DWORD *)(v5 + 180) |= 0x200000u;
  v26 = self->_has;
  if ((*(_DWORD *)&v26 & 0x20000) == 0)
  {
LABEL_30:
    if ((*(_BYTE *)&v26 & 0x10) == 0)
      goto LABEL_31;
    goto LABEL_58;
  }
LABEL_57:
  *(_BYTE *)(v5 + 169) = self->_criticalAlertSetting;
  *(_DWORD *)(v5 + 180) |= 0x20000u;
  v26 = self->_has;
  if ((*(_BYTE *)&v26 & 0x10) == 0)
  {
LABEL_31:
    if ((*(_DWORD *)&v26 & 0x80000) == 0)
      goto LABEL_32;
    goto LABEL_59;
  }
LABEL_58:
  *(_DWORD *)(v5 + 48) = self->_groupingSetting;
  *(_DWORD *)(v5 + 180) |= 0x10u;
  v26 = self->_has;
  if ((*(_DWORD *)&v26 & 0x80000) == 0)
  {
LABEL_32:
    if ((*(_BYTE *)&v26 & 8) == 0)
      goto LABEL_33;
    goto LABEL_60;
  }
LABEL_59:
  *(_BYTE *)(v5 + 171) = self->_excludeFromBulletinBoard;
  *(_DWORD *)(v5 + 180) |= 0x80000u;
  v26 = self->_has;
  if ((*(_BYTE *)&v26 & 8) == 0)
  {
LABEL_33:
    if ((*(_WORD *)&v26 & 0x100) == 0)
      goto LABEL_34;
    goto LABEL_61;
  }
LABEL_60:
  *(_DWORD *)(v5 + 28) = self->_authorizationStatus;
  *(_DWORD *)(v5 + 180) |= 8u;
  v26 = self->_has;
  if ((*(_WORD *)&v26 & 0x100) == 0)
  {
LABEL_34:
    if ((*(_BYTE *)&v26 & 0x20) == 0)
      goto LABEL_35;
    goto LABEL_62;
  }
LABEL_61:
  *(_DWORD *)(v5 + 76) = self->_phoneAuthorizationStatus;
  *(_DWORD *)(v5 + 180) |= 0x100u;
  v26 = self->_has;
  if ((*(_BYTE *)&v26 & 0x20) == 0)
  {
LABEL_35:
    if ((*(_BYTE *)&v26 & 0x80) == 0)
      goto LABEL_36;
    goto LABEL_63;
  }
LABEL_62:
  *(_DWORD *)(v5 + 64) = self->_lockScreenSetting;
  *(_DWORD *)(v5 + 180) |= 0x20u;
  v26 = self->_has;
  if ((*(_BYTE *)&v26 & 0x80) == 0)
  {
LABEL_36:
    if ((*(_WORD *)&v26 & 0x1000) == 0)
      goto LABEL_38;
    goto LABEL_37;
  }
LABEL_63:
  *(_DWORD *)(v5 + 72) = self->_notificationCenterSetting;
  *(_DWORD *)(v5 + 180) |= 0x80u;
  if ((*(_DWORD *)&self->_has & 0x1000) != 0)
  {
LABEL_37:
    *(_DWORD *)(v5 + 108) = self->_spokenNotificationSetting;
    *(_DWORD *)(v5 + 180) |= 0x1000u;
  }
LABEL_38:
  v27 = -[NSString copyWithZone:](self->_watchSectionID, "copyWithZone:", a3);
  v28 = *(void **)(v5 + 160);
  *(_QWORD *)(v5 + 160) = v27;

  v29 = self->_has;
  if ((*(_BYTE *)&v29 & 1) != 0)
  {
    *(double *)(v5 + 8) = self->_authorizationExpirationDate;
    *(_DWORD *)(v5 + 180) |= 1u;
    v29 = self->_has;
  }
  if ((*(_BYTE *)&v29 & 2) != 0)
  {
    *(double *)(v5 + 16) = self->_lastUserGrantedAuthorizationDate;
    *(_DWORD *)(v5 + 180) |= 2u;
  }
  v30 = -[BLTPBSectionInfoSettings copyWithZone:](self->_sectionInfoSettings, "copyWithZone:", a3);
  v31 = *(void **)(v5 + 96);
  *(_QWORD *)(v5 + 96) = v30;

  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  NSString *sectionID;
  NSString *subsectionID;
  $DDB6F6B01A4DE5A47F3A13CA47B8E55C has;
  int v8;
  NSString *displayName;
  int v10;
  NSMutableArray *subsections;
  int v12;
  NSString *factorySectionID;
  NSString *universalSectionID;
  BLTPBSectionIcon *icon;
  $DDB6F6B01A4DE5A47F3A13CA47B8E55C v16;
  int v17;
  NSString *watchSectionID;
  int v19;
  BLTPBSectionInfoSettings *sectionInfoSettings;
  char v21;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_191;
  sectionID = self->_sectionID;
  if ((unint64_t)sectionID | *((_QWORD *)v4 + 11))
  {
    if (!-[NSString isEqual:](sectionID, "isEqual:"))
      goto LABEL_191;
  }
  subsectionID = self->_subsectionID;
  if ((unint64_t)subsectionID | *((_QWORD *)v4 + 14))
  {
    if (!-[NSString isEqual:](subsectionID, "isEqual:"))
      goto LABEL_191;
  }
  has = self->_has;
  v8 = *((_DWORD *)v4 + 45);
  if ((*(_WORD *)&has & 0x800) != 0)
  {
    if ((v8 & 0x800) == 0 || self->_sectionType != *((_DWORD *)v4 + 26))
      goto LABEL_191;
  }
  else if ((v8 & 0x800) != 0)
  {
    goto LABEL_191;
  }
  if ((*(_WORD *)&has & 0x400) != 0)
  {
    if ((v8 & 0x400) == 0 || self->_sectionCategory != *((_DWORD *)v4 + 21))
      goto LABEL_191;
  }
  else if ((v8 & 0x400) != 0)
  {
    goto LABEL_191;
  }
  if ((*(_DWORD *)&has & 0x4000000) != 0)
  {
    if ((v8 & 0x4000000) == 0)
      goto LABEL_191;
    if (self->_suppressFromSettings)
    {
      if (!*((_BYTE *)v4 + 178))
        goto LABEL_191;
    }
    else if (*((_BYTE *)v4 + 178))
    {
      goto LABEL_191;
    }
  }
  else if ((v8 & 0x4000000) != 0)
  {
    goto LABEL_191;
  }
  if ((*(_DWORD *)&has & 0x800000) != 0)
  {
    if ((v8 & 0x800000) == 0)
      goto LABEL_191;
    if (self->_showsInNotificationCenter)
    {
      if (!*((_BYTE *)v4 + 175))
        goto LABEL_191;
    }
    else if (*((_BYTE *)v4 + 175))
    {
      goto LABEL_191;
    }
  }
  else if ((v8 & 0x800000) != 0)
  {
    goto LABEL_191;
  }
  if ((*(_DWORD *)&has & 0x400000) != 0)
  {
    if ((v8 & 0x400000) == 0)
      goto LABEL_191;
    if (self->_showsInLockScreen)
    {
      if (!*((_BYTE *)v4 + 174))
        goto LABEL_191;
    }
    else if (*((_BYTE *)v4 + 174))
    {
      goto LABEL_191;
    }
  }
  else if ((v8 & 0x400000) != 0)
  {
    goto LABEL_191;
  }
  if ((*(_DWORD *)&has & 0x2000000) != 0)
  {
    if ((v8 & 0x2000000) == 0)
      goto LABEL_191;
    if (self->_showsOnExternalDevices)
    {
      if (!*((_BYTE *)v4 + 177))
        goto LABEL_191;
    }
    else if (*((_BYTE *)v4 + 177))
    {
      goto LABEL_191;
    }
  }
  else if ((v8 & 0x2000000) != 0)
  {
    goto LABEL_191;
  }
  if ((*(_BYTE *)&has & 0x40) != 0)
  {
    if ((v8 & 0x40) == 0 || self->_notificationCenterLimit != *((_DWORD *)v4 + 17))
      goto LABEL_191;
  }
  else if ((v8 & 0x40) != 0)
  {
    goto LABEL_191;
  }
  if ((*(_WORD *)&has & 0x200) != 0)
  {
    if ((v8 & 0x200) == 0 || self->_pushSettings != *((_DWORD *)v4 + 20))
      goto LABEL_191;
  }
  else if ((v8 & 0x200) != 0)
  {
    goto LABEL_191;
  }
  if ((*(_BYTE *)&has & 4) != 0)
  {
    if ((v8 & 4) == 0 || self->_alertType != *((_DWORD *)v4 + 6))
      goto LABEL_191;
  }
  else if ((v8 & 4) != 0)
  {
    goto LABEL_191;
  }
  if ((*(_DWORD *)&has & 0x1000000) != 0)
  {
    if ((v8 & 0x1000000) == 0)
      goto LABEL_191;
    if (self->_showsMessagePreview)
    {
      if (!*((_BYTE *)v4 + 176))
        goto LABEL_191;
    }
    else if (*((_BYTE *)v4 + 176))
    {
      goto LABEL_191;
    }
  }
  else if ((v8 & 0x1000000) != 0)
  {
    goto LABEL_191;
  }
  if ((*(_DWORD *)&has & 0x10000) != 0)
  {
    if ((v8 & 0x10000) == 0)
      goto LABEL_191;
    if (self->_allowsNotifications)
    {
      if (!*((_BYTE *)v4 + 168))
        goto LABEL_191;
    }
    else if (*((_BYTE *)v4 + 168))
    {
      goto LABEL_191;
    }
  }
  else if ((v8 & 0x10000) != 0)
  {
    goto LABEL_191;
  }
  if ((*(_WORD *)&has & 0x4000) != 0)
  {
    if ((v8 & 0x4000) == 0 || self->_suppressedSettings != *((_DWORD *)v4 + 34))
      goto LABEL_191;
  }
  else if ((v8 & 0x4000) != 0)
  {
    goto LABEL_191;
  }
  displayName = self->_displayName;
  if ((unint64_t)displayName | *((_QWORD *)v4 + 4))
  {
    if (!-[NSString isEqual:](displayName, "isEqual:"))
      goto LABEL_191;
    has = self->_has;
  }
  v10 = *((_DWORD *)v4 + 45);
  if ((*(_DWORD *)&has & 0x40000) != 0)
  {
    if ((v10 & 0x40000) == 0)
      goto LABEL_191;
    if (self->_displaysCriticalBulletinsLegacy)
    {
      if (!*((_BYTE *)v4 + 170))
        goto LABEL_191;
    }
    else if (*((_BYTE *)v4 + 170))
    {
      goto LABEL_191;
    }
  }
  else if ((v10 & 0x40000) != 0)
  {
    goto LABEL_191;
  }
  subsections = self->_subsections;
  if ((unint64_t)subsections | *((_QWORD *)v4 + 16))
  {
    if (!-[NSMutableArray isEqual:](subsections, "isEqual:"))
      goto LABEL_191;
    has = self->_has;
  }
  v12 = *((_DWORD *)v4 + 45);
  if ((*(_WORD *)&has & 0x2000) != 0)
  {
    if ((v12 & 0x2000) == 0 || self->_subsectionPriority != *((_DWORD *)v4 + 30))
      goto LABEL_191;
  }
  else if ((v12 & 0x2000) != 0)
  {
    goto LABEL_191;
  }
  if ((*(_WORD *)&has & 0x8000) != 0)
  {
    if ((v12 & 0x8000) == 0 || self->_version != *((_DWORD *)v4 + 38))
      goto LABEL_191;
  }
  else if ((v12 & 0x8000) != 0)
  {
    goto LABEL_191;
  }
  factorySectionID = self->_factorySectionID;
  if ((unint64_t)factorySectionID | *((_QWORD *)v4 + 5)
    && !-[NSString isEqual:](factorySectionID, "isEqual:"))
  {
    goto LABEL_191;
  }
  universalSectionID = self->_universalSectionID;
  if ((unint64_t)universalSectionID | *((_QWORD *)v4 + 18))
  {
    if (!-[NSString isEqual:](universalSectionID, "isEqual:"))
      goto LABEL_191;
  }
  icon = self->_icon;
  if ((unint64_t)icon | *((_QWORD *)v4 + 7))
  {
    if (!-[BLTPBSectionIcon isEqual:](icon, "isEqual:"))
      goto LABEL_191;
  }
  v16 = self->_has;
  v17 = *((_DWORD *)v4 + 45);
  if ((*(_DWORD *)&v16 & 0x100000) != 0)
  {
    if ((v17 & 0x100000) == 0)
      goto LABEL_191;
    if (self->_iconsStripped)
    {
      if (!*((_BYTE *)v4 + 172))
        goto LABEL_191;
    }
    else if (*((_BYTE *)v4 + 172))
    {
      goto LABEL_191;
    }
  }
  else if ((v17 & 0x100000) != 0)
  {
    goto LABEL_191;
  }
  if ((*(_DWORD *)&v16 & 0x200000) != 0)
  {
    if ((v17 & 0x200000) == 0)
      goto LABEL_191;
    if (self->_phoneAllowsNotifications)
    {
      if (!*((_BYTE *)v4 + 173))
        goto LABEL_191;
    }
    else if (*((_BYTE *)v4 + 173))
    {
      goto LABEL_191;
    }
  }
  else if ((v17 & 0x200000) != 0)
  {
    goto LABEL_191;
  }
  if ((*(_DWORD *)&v16 & 0x20000) != 0)
  {
    if ((v17 & 0x20000) == 0)
      goto LABEL_191;
    if (self->_criticalAlertSetting)
    {
      if (!*((_BYTE *)v4 + 169))
        goto LABEL_191;
    }
    else if (*((_BYTE *)v4 + 169))
    {
      goto LABEL_191;
    }
  }
  else if ((v17 & 0x20000) != 0)
  {
    goto LABEL_191;
  }
  if ((*(_BYTE *)&v16 & 0x10) != 0)
  {
    if ((v17 & 0x10) == 0 || self->_groupingSetting != *((_DWORD *)v4 + 12))
      goto LABEL_191;
  }
  else if ((v17 & 0x10) != 0)
  {
    goto LABEL_191;
  }
  if ((*(_DWORD *)&v16 & 0x80000) != 0)
  {
    if ((v17 & 0x80000) == 0)
      goto LABEL_191;
    if (self->_excludeFromBulletinBoard)
    {
      if (!*((_BYTE *)v4 + 171))
        goto LABEL_191;
    }
    else if (*((_BYTE *)v4 + 171))
    {
      goto LABEL_191;
    }
  }
  else if ((v17 & 0x80000) != 0)
  {
    goto LABEL_191;
  }
  if ((*(_BYTE *)&v16 & 8) != 0)
  {
    if ((v17 & 8) == 0 || self->_authorizationStatus != *((_DWORD *)v4 + 7))
      goto LABEL_191;
  }
  else if ((v17 & 8) != 0)
  {
    goto LABEL_191;
  }
  if ((*(_WORD *)&v16 & 0x100) != 0)
  {
    if ((v17 & 0x100) == 0 || self->_phoneAuthorizationStatus != *((_DWORD *)v4 + 19))
      goto LABEL_191;
  }
  else if ((v17 & 0x100) != 0)
  {
    goto LABEL_191;
  }
  if ((*(_BYTE *)&v16 & 0x20) != 0)
  {
    if ((v17 & 0x20) == 0 || self->_lockScreenSetting != *((_DWORD *)v4 + 16))
      goto LABEL_191;
  }
  else if ((v17 & 0x20) != 0)
  {
    goto LABEL_191;
  }
  if ((*(_BYTE *)&v16 & 0x80) != 0)
  {
    if ((v17 & 0x80) == 0 || self->_notificationCenterSetting != *((_DWORD *)v4 + 18))
      goto LABEL_191;
  }
  else if ((v17 & 0x80) != 0)
  {
    goto LABEL_191;
  }
  if ((*(_WORD *)&v16 & 0x1000) != 0)
  {
    if ((v17 & 0x1000) == 0 || self->_spokenNotificationSetting != *((_DWORD *)v4 + 27))
      goto LABEL_191;
  }
  else if ((v17 & 0x1000) != 0)
  {
    goto LABEL_191;
  }
  watchSectionID = self->_watchSectionID;
  if ((unint64_t)watchSectionID | *((_QWORD *)v4 + 20))
  {
    if (-[NSString isEqual:](watchSectionID, "isEqual:"))
    {
      v16 = self->_has;
      goto LABEL_179;
    }
LABEL_191:
    v21 = 0;
    goto LABEL_192;
  }
LABEL_179:
  v19 = *((_DWORD *)v4 + 45);
  if ((*(_BYTE *)&v16 & 1) != 0)
  {
    if ((v19 & 1) == 0 || self->_authorizationExpirationDate != *((double *)v4 + 1))
      goto LABEL_191;
  }
  else if ((v19 & 1) != 0)
  {
    goto LABEL_191;
  }
  if ((*(_BYTE *)&v16 & 2) != 0)
  {
    if ((v19 & 2) == 0 || self->_lastUserGrantedAuthorizationDate != *((double *)v4 + 2))
      goto LABEL_191;
  }
  else if ((v19 & 2) != 0)
  {
    goto LABEL_191;
  }
  sectionInfoSettings = self->_sectionInfoSettings;
  if ((unint64_t)sectionInfoSettings | *((_QWORD *)v4 + 12))
    v21 = -[BLTPBSectionInfoSettings isEqual:](sectionInfoSettings, "isEqual:");
  else
    v21 = 1;
LABEL_192:

  return v21;
}

- (unint64_t)hash
{
  $DDB6F6B01A4DE5A47F3A13CA47B8E55C has;
  $DDB6F6B01A4DE5A47F3A13CA47B8E55C v4;
  $DDB6F6B01A4DE5A47F3A13CA47B8E55C v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  NSUInteger v11;
  $DDB6F6B01A4DE5A47F3A13CA47B8E55C v12;
  unint64_t v13;
  double authorizationExpirationDate;
  double v15;
  long double v16;
  double v17;
  unint64_t v18;
  double lastUserGrantedAuthorizationDate;
  double v20;
  long double v21;
  double v22;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  unint64_t v30;
  NSUInteger v31;
  NSUInteger v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  NSUInteger v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  NSUInteger v50;
  NSUInteger v51;

  v51 = -[NSString hash](self->_sectionID, "hash");
  v50 = -[NSString hash](self->_subsectionID, "hash");
  has = self->_has;
  if ((*(_WORD *)&has & 0x800) != 0)
  {
    v49 = 2654435761 * self->_sectionType;
    if ((*(_WORD *)&has & 0x400) != 0)
    {
LABEL_3:
      v48 = 2654435761 * self->_sectionCategory;
      if ((*(_DWORD *)&has & 0x4000000) != 0)
        goto LABEL_4;
      goto LABEL_16;
    }
  }
  else
  {
    v49 = 0;
    if ((*(_WORD *)&has & 0x400) != 0)
      goto LABEL_3;
  }
  v48 = 0;
  if ((*(_DWORD *)&has & 0x4000000) != 0)
  {
LABEL_4:
    v47 = 2654435761 * self->_suppressFromSettings;
    if ((*(_DWORD *)&has & 0x800000) != 0)
      goto LABEL_5;
    goto LABEL_17;
  }
LABEL_16:
  v47 = 0;
  if ((*(_DWORD *)&has & 0x800000) != 0)
  {
LABEL_5:
    v46 = 2654435761 * self->_showsInNotificationCenter;
    if ((*(_DWORD *)&has & 0x400000) != 0)
      goto LABEL_6;
    goto LABEL_18;
  }
LABEL_17:
  v46 = 0;
  if ((*(_DWORD *)&has & 0x400000) != 0)
  {
LABEL_6:
    v45 = 2654435761 * self->_showsInLockScreen;
    if ((*(_DWORD *)&has & 0x2000000) != 0)
      goto LABEL_7;
    goto LABEL_19;
  }
LABEL_18:
  v45 = 0;
  if ((*(_DWORD *)&has & 0x2000000) != 0)
  {
LABEL_7:
    v44 = 2654435761 * self->_showsOnExternalDevices;
    if ((*(_BYTE *)&has & 0x40) != 0)
      goto LABEL_8;
    goto LABEL_20;
  }
LABEL_19:
  v44 = 0;
  if ((*(_BYTE *)&has & 0x40) != 0)
  {
LABEL_8:
    v43 = 2654435761 * self->_notificationCenterLimit;
    if ((*(_WORD *)&has & 0x200) != 0)
      goto LABEL_9;
    goto LABEL_21;
  }
LABEL_20:
  v43 = 0;
  if ((*(_WORD *)&has & 0x200) != 0)
  {
LABEL_9:
    v42 = 2654435761 * self->_pushSettings;
    if ((*(_BYTE *)&has & 4) != 0)
      goto LABEL_10;
    goto LABEL_22;
  }
LABEL_21:
  v42 = 0;
  if ((*(_BYTE *)&has & 4) != 0)
  {
LABEL_10:
    v41 = 2654435761 * self->_alertType;
    if ((*(_DWORD *)&has & 0x1000000) != 0)
      goto LABEL_11;
    goto LABEL_23;
  }
LABEL_22:
  v41 = 0;
  if ((*(_DWORD *)&has & 0x1000000) != 0)
  {
LABEL_11:
    v40 = 2654435761 * self->_showsMessagePreview;
    if ((*(_DWORD *)&has & 0x10000) != 0)
      goto LABEL_12;
LABEL_24:
    v39 = 0;
    if ((*(_WORD *)&has & 0x4000) != 0)
      goto LABEL_13;
    goto LABEL_25;
  }
LABEL_23:
  v40 = 0;
  if ((*(_DWORD *)&has & 0x10000) == 0)
    goto LABEL_24;
LABEL_12:
  v39 = 2654435761 * self->_allowsNotifications;
  if ((*(_WORD *)&has & 0x4000) != 0)
  {
LABEL_13:
    v38 = 2654435761 * self->_suppressedSettings;
    goto LABEL_26;
  }
LABEL_25:
  v38 = 0;
LABEL_26:
  v37 = -[NSString hash](self->_displayName, "hash");
  if ((*((_BYTE *)&self->_has + 2) & 4) != 0)
    v36 = 2654435761 * self->_displaysCriticalBulletinsLegacy;
  else
    v36 = 0;
  v35 = -[NSMutableArray hash](self->_subsections, "hash");
  v4 = self->_has;
  if ((*(_WORD *)&v4 & 0x2000) != 0)
  {
    v34 = 2654435761 * self->_subsectionPriority;
    if ((*(_WORD *)&v4 & 0x8000) != 0)
      goto LABEL_31;
  }
  else
  {
    v34 = 0;
    if ((*(_WORD *)&v4 & 0x8000) != 0)
    {
LABEL_31:
      v33 = 2654435761 * self->_version;
      goto LABEL_34;
    }
  }
  v33 = 0;
LABEL_34:
  v32 = -[NSString hash](self->_factorySectionID, "hash");
  v31 = -[NSString hash](self->_universalSectionID, "hash");
  v30 = -[BLTPBSectionIcon hash](self->_icon, "hash");
  v5 = self->_has;
  if ((*(_DWORD *)&v5 & 0x100000) != 0)
  {
    v29 = 2654435761 * self->_iconsStripped;
    if ((*(_DWORD *)&v5 & 0x200000) != 0)
    {
LABEL_36:
      v28 = 2654435761 * self->_phoneAllowsNotifications;
      if ((*(_DWORD *)&v5 & 0x20000) != 0)
        goto LABEL_37;
      goto LABEL_47;
    }
  }
  else
  {
    v29 = 0;
    if ((*(_DWORD *)&v5 & 0x200000) != 0)
      goto LABEL_36;
  }
  v28 = 0;
  if ((*(_DWORD *)&v5 & 0x20000) != 0)
  {
LABEL_37:
    v27 = 2654435761 * self->_criticalAlertSetting;
    if ((*(_BYTE *)&v5 & 0x10) != 0)
      goto LABEL_38;
    goto LABEL_48;
  }
LABEL_47:
  v27 = 0;
  if ((*(_BYTE *)&v5 & 0x10) != 0)
  {
LABEL_38:
    v26 = 2654435761 * self->_groupingSetting;
    if ((*(_DWORD *)&v5 & 0x80000) != 0)
      goto LABEL_39;
    goto LABEL_49;
  }
LABEL_48:
  v26 = 0;
  if ((*(_DWORD *)&v5 & 0x80000) != 0)
  {
LABEL_39:
    v24 = 2654435761 * self->_excludeFromBulletinBoard;
    if ((*(_BYTE *)&v5 & 8) != 0)
      goto LABEL_40;
    goto LABEL_50;
  }
LABEL_49:
  v24 = 0;
  if ((*(_BYTE *)&v5 & 8) != 0)
  {
LABEL_40:
    v6 = 2654435761 * self->_authorizationStatus;
    if ((*(_WORD *)&v5 & 0x100) != 0)
      goto LABEL_41;
    goto LABEL_51;
  }
LABEL_50:
  v6 = 0;
  if ((*(_WORD *)&v5 & 0x100) != 0)
  {
LABEL_41:
    v7 = 2654435761 * self->_phoneAuthorizationStatus;
    if ((*(_BYTE *)&v5 & 0x20) != 0)
      goto LABEL_42;
    goto LABEL_52;
  }
LABEL_51:
  v7 = 0;
  if ((*(_BYTE *)&v5 & 0x20) != 0)
  {
LABEL_42:
    v8 = 2654435761 * self->_lockScreenSetting;
    if ((*(_BYTE *)&v5 & 0x80) != 0)
      goto LABEL_43;
LABEL_53:
    v9 = 0;
    if ((*(_WORD *)&v5 & 0x1000) != 0)
      goto LABEL_44;
    goto LABEL_54;
  }
LABEL_52:
  v8 = 0;
  if ((*(_BYTE *)&v5 & 0x80) == 0)
    goto LABEL_53;
LABEL_43:
  v9 = 2654435761 * self->_notificationCenterSetting;
  if ((*(_WORD *)&v5 & 0x1000) != 0)
  {
LABEL_44:
    v10 = 2654435761 * self->_spokenNotificationSetting;
    goto LABEL_55;
  }
LABEL_54:
  v10 = 0;
LABEL_55:
  v11 = -[NSString hash](self->_watchSectionID, "hash", v24);
  v12 = self->_has;
  if ((*(_BYTE *)&v12 & 1) != 0)
  {
    authorizationExpirationDate = self->_authorizationExpirationDate;
    v15 = -authorizationExpirationDate;
    if (authorizationExpirationDate >= 0.0)
      v15 = self->_authorizationExpirationDate;
    v16 = floor(v15 + 0.5);
    v17 = (v15 - v16) * 1.84467441e19;
    v13 = 2654435761u * (unint64_t)fmod(v16, 1.84467441e19);
    if (v17 >= 0.0)
    {
      if (v17 > 0.0)
        v13 += (unint64_t)v17;
    }
    else
    {
      v13 -= (unint64_t)fabs(v17);
    }
  }
  else
  {
    v13 = 0;
  }
  if ((*(_BYTE *)&v12 & 2) != 0)
  {
    lastUserGrantedAuthorizationDate = self->_lastUserGrantedAuthorizationDate;
    v20 = -lastUserGrantedAuthorizationDate;
    if (lastUserGrantedAuthorizationDate >= 0.0)
      v20 = self->_lastUserGrantedAuthorizationDate;
    v21 = floor(v20 + 0.5);
    v22 = (v20 - v21) * 1.84467441e19;
    v18 = 2654435761u * (unint64_t)fmod(v21, 1.84467441e19);
    if (v22 >= 0.0)
    {
      if (v22 > 0.0)
        v18 += (unint64_t)v22;
    }
    else
    {
      v18 -= (unint64_t)fabs(v22);
    }
  }
  else
  {
    v18 = 0;
  }
  return v50 ^ v51 ^ v49 ^ v48 ^ v47 ^ v46 ^ v45 ^ v44 ^ v43 ^ v42 ^ v41 ^ v40 ^ v39 ^ v38 ^ v37 ^ v36 ^ v35 ^ v34 ^ v33 ^ v32 ^ v31 ^ v30 ^ v29 ^ v28 ^ v27 ^ v26 ^ v25 ^ v6 ^ v7 ^ v8 ^ v9 ^ v10 ^ v11 ^ v13 ^ v18 ^ -[BLTPBSectionInfoSettings hash](self->_sectionInfoSettings, "hash");
}

- (void)mergeFrom:(id)a3
{
  id v4;
  int v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  int v11;
  BLTPBSectionIcon *icon;
  uint64_t v13;
  int v14;
  int v15;
  BLTPBSectionInfoSettings *sectionInfoSettings;
  uint64_t v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  if (*((_QWORD *)v4 + 11))
    -[BLTPBSectionInfo setSectionID:](self, "setSectionID:");
  if (*((_QWORD *)v4 + 14))
    -[BLTPBSectionInfo setSubsectionID:](self, "setSubsectionID:");
  v5 = *((_DWORD *)v4 + 45);
  if ((v5 & 0x800) != 0)
  {
    self->_sectionType = *((_DWORD *)v4 + 26);
    *(_DWORD *)&self->_has |= 0x800u;
    v5 = *((_DWORD *)v4 + 45);
    if ((v5 & 0x400) == 0)
    {
LABEL_7:
      if ((v5 & 0x4000000) == 0)
        goto LABEL_8;
      goto LABEL_42;
    }
  }
  else if ((v5 & 0x400) == 0)
  {
    goto LABEL_7;
  }
  self->_sectionCategory = *((_DWORD *)v4 + 21);
  *(_DWORD *)&self->_has |= 0x400u;
  v5 = *((_DWORD *)v4 + 45);
  if ((v5 & 0x4000000) == 0)
  {
LABEL_8:
    if ((v5 & 0x800000) == 0)
      goto LABEL_9;
    goto LABEL_43;
  }
LABEL_42:
  self->_suppressFromSettings = *((_BYTE *)v4 + 178);
  *(_DWORD *)&self->_has |= 0x4000000u;
  v5 = *((_DWORD *)v4 + 45);
  if ((v5 & 0x800000) == 0)
  {
LABEL_9:
    if ((v5 & 0x400000) == 0)
      goto LABEL_10;
    goto LABEL_44;
  }
LABEL_43:
  self->_showsInNotificationCenter = *((_BYTE *)v4 + 175);
  *(_DWORD *)&self->_has |= 0x800000u;
  v5 = *((_DWORD *)v4 + 45);
  if ((v5 & 0x400000) == 0)
  {
LABEL_10:
    if ((v5 & 0x2000000) == 0)
      goto LABEL_11;
    goto LABEL_45;
  }
LABEL_44:
  self->_showsInLockScreen = *((_BYTE *)v4 + 174);
  *(_DWORD *)&self->_has |= 0x400000u;
  v5 = *((_DWORD *)v4 + 45);
  if ((v5 & 0x2000000) == 0)
  {
LABEL_11:
    if ((v5 & 0x40) == 0)
      goto LABEL_12;
    goto LABEL_46;
  }
LABEL_45:
  self->_showsOnExternalDevices = *((_BYTE *)v4 + 177);
  *(_DWORD *)&self->_has |= 0x2000000u;
  v5 = *((_DWORD *)v4 + 45);
  if ((v5 & 0x40) == 0)
  {
LABEL_12:
    if ((v5 & 0x200) == 0)
      goto LABEL_13;
    goto LABEL_47;
  }
LABEL_46:
  self->_notificationCenterLimit = *((_DWORD *)v4 + 17);
  *(_DWORD *)&self->_has |= 0x40u;
  v5 = *((_DWORD *)v4 + 45);
  if ((v5 & 0x200) == 0)
  {
LABEL_13:
    if ((v5 & 4) == 0)
      goto LABEL_14;
    goto LABEL_48;
  }
LABEL_47:
  self->_pushSettings = *((_DWORD *)v4 + 20);
  *(_DWORD *)&self->_has |= 0x200u;
  v5 = *((_DWORD *)v4 + 45);
  if ((v5 & 4) == 0)
  {
LABEL_14:
    if ((v5 & 0x1000000) == 0)
      goto LABEL_15;
    goto LABEL_49;
  }
LABEL_48:
  self->_alertType = *((_DWORD *)v4 + 6);
  *(_DWORD *)&self->_has |= 4u;
  v5 = *((_DWORD *)v4 + 45);
  if ((v5 & 0x1000000) == 0)
  {
LABEL_15:
    if ((v5 & 0x10000) == 0)
      goto LABEL_16;
    goto LABEL_50;
  }
LABEL_49:
  self->_showsMessagePreview = *((_BYTE *)v4 + 176);
  *(_DWORD *)&self->_has |= 0x1000000u;
  v5 = *((_DWORD *)v4 + 45);
  if ((v5 & 0x10000) == 0)
  {
LABEL_16:
    if ((v5 & 0x4000) == 0)
      goto LABEL_18;
    goto LABEL_17;
  }
LABEL_50:
  self->_allowsNotifications = *((_BYTE *)v4 + 168);
  *(_DWORD *)&self->_has |= 0x10000u;
  if ((*((_DWORD *)v4 + 45) & 0x4000) != 0)
  {
LABEL_17:
    self->_suppressedSettings = *((_DWORD *)v4 + 34);
    *(_DWORD *)&self->_has |= 0x4000u;
  }
LABEL_18:
  if (*((_QWORD *)v4 + 4))
    -[BLTPBSectionInfo setDisplayName:](self, "setDisplayName:");
  if ((*((_BYTE *)v4 + 182) & 4) != 0)
  {
    self->_displaysCriticalBulletinsLegacy = *((_BYTE *)v4 + 170);
    *(_DWORD *)&self->_has |= 0x40000u;
  }
  v20 = 0u;
  v21 = 0u;
  v18 = 0u;
  v19 = 0u;
  v6 = *((id *)v4 + 16);
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v19;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v19 != v9)
          objc_enumerationMutation(v6);
        -[BLTPBSectionInfo addSubsections:](self, "addSubsections:", *(_QWORD *)(*((_QWORD *)&v18 + 1) + 8 * i), (_QWORD)v18);
      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
    }
    while (v8);
  }

  v11 = *((_DWORD *)v4 + 45);
  if ((v11 & 0x2000) != 0)
  {
    self->_subsectionPriority = *((_DWORD *)v4 + 30);
    *(_DWORD *)&self->_has |= 0x2000u;
    v11 = *((_DWORD *)v4 + 45);
  }
  if ((v11 & 0x8000) != 0)
  {
    self->_version = *((_DWORD *)v4 + 38);
    *(_DWORD *)&self->_has |= 0x8000u;
  }
  if (*((_QWORD *)v4 + 5))
    -[BLTPBSectionInfo setFactorySectionID:](self, "setFactorySectionID:");
  if (*((_QWORD *)v4 + 18))
    -[BLTPBSectionInfo setUniversalSectionID:](self, "setUniversalSectionID:");
  icon = self->_icon;
  v13 = *((_QWORD *)v4 + 7);
  if (icon)
  {
    if (v13)
      -[BLTPBSectionIcon mergeFrom:](icon, "mergeFrom:");
  }
  else if (v13)
  {
    -[BLTPBSectionInfo setIcon:](self, "setIcon:");
  }
  v14 = *((_DWORD *)v4 + 45);
  if ((v14 & 0x100000) != 0)
  {
    self->_iconsStripped = *((_BYTE *)v4 + 172);
    *(_DWORD *)&self->_has |= 0x100000u;
    v14 = *((_DWORD *)v4 + 45);
    if ((v14 & 0x200000) == 0)
    {
LABEL_56:
      if ((v14 & 0x20000) == 0)
        goto LABEL_57;
      goto LABEL_76;
    }
  }
  else if ((v14 & 0x200000) == 0)
  {
    goto LABEL_56;
  }
  self->_phoneAllowsNotifications = *((_BYTE *)v4 + 173);
  *(_DWORD *)&self->_has |= 0x200000u;
  v14 = *((_DWORD *)v4 + 45);
  if ((v14 & 0x20000) == 0)
  {
LABEL_57:
    if ((v14 & 0x10) == 0)
      goto LABEL_58;
    goto LABEL_77;
  }
LABEL_76:
  self->_criticalAlertSetting = *((_BYTE *)v4 + 169);
  *(_DWORD *)&self->_has |= 0x20000u;
  v14 = *((_DWORD *)v4 + 45);
  if ((v14 & 0x10) == 0)
  {
LABEL_58:
    if ((v14 & 0x80000) == 0)
      goto LABEL_59;
    goto LABEL_78;
  }
LABEL_77:
  self->_groupingSetting = *((_DWORD *)v4 + 12);
  *(_DWORD *)&self->_has |= 0x10u;
  v14 = *((_DWORD *)v4 + 45);
  if ((v14 & 0x80000) == 0)
  {
LABEL_59:
    if ((v14 & 8) == 0)
      goto LABEL_60;
    goto LABEL_79;
  }
LABEL_78:
  self->_excludeFromBulletinBoard = *((_BYTE *)v4 + 171);
  *(_DWORD *)&self->_has |= 0x80000u;
  v14 = *((_DWORD *)v4 + 45);
  if ((v14 & 8) == 0)
  {
LABEL_60:
    if ((v14 & 0x100) == 0)
      goto LABEL_61;
    goto LABEL_80;
  }
LABEL_79:
  self->_authorizationStatus = *((_DWORD *)v4 + 7);
  *(_DWORD *)&self->_has |= 8u;
  v14 = *((_DWORD *)v4 + 45);
  if ((v14 & 0x100) == 0)
  {
LABEL_61:
    if ((v14 & 0x20) == 0)
      goto LABEL_62;
    goto LABEL_81;
  }
LABEL_80:
  self->_phoneAuthorizationStatus = *((_DWORD *)v4 + 19);
  *(_DWORD *)&self->_has |= 0x100u;
  v14 = *((_DWORD *)v4 + 45);
  if ((v14 & 0x20) == 0)
  {
LABEL_62:
    if ((v14 & 0x80) == 0)
      goto LABEL_63;
    goto LABEL_82;
  }
LABEL_81:
  self->_lockScreenSetting = *((_DWORD *)v4 + 16);
  *(_DWORD *)&self->_has |= 0x20u;
  v14 = *((_DWORD *)v4 + 45);
  if ((v14 & 0x80) == 0)
  {
LABEL_63:
    if ((v14 & 0x1000) == 0)
      goto LABEL_65;
    goto LABEL_64;
  }
LABEL_82:
  self->_notificationCenterSetting = *((_DWORD *)v4 + 18);
  *(_DWORD *)&self->_has |= 0x80u;
  if ((*((_DWORD *)v4 + 45) & 0x1000) != 0)
  {
LABEL_64:
    self->_spokenNotificationSetting = *((_DWORD *)v4 + 27);
    *(_DWORD *)&self->_has |= 0x1000u;
  }
LABEL_65:
  if (*((_QWORD *)v4 + 20))
    -[BLTPBSectionInfo setWatchSectionID:](self, "setWatchSectionID:");
  v15 = *((_DWORD *)v4 + 45);
  if ((v15 & 1) != 0)
  {
    self->_authorizationExpirationDate = *((double *)v4 + 1);
    *(_DWORD *)&self->_has |= 1u;
    v15 = *((_DWORD *)v4 + 45);
  }
  if ((v15 & 2) != 0)
  {
    self->_lastUserGrantedAuthorizationDate = *((double *)v4 + 2);
    *(_DWORD *)&self->_has |= 2u;
  }
  sectionInfoSettings = self->_sectionInfoSettings;
  v17 = *((_QWORD *)v4 + 12);
  if (sectionInfoSettings)
  {
    if (v17)
      -[BLTPBSectionInfoSettings mergeFrom:](sectionInfoSettings, "mergeFrom:");
  }
  else if (v17)
  {
    -[BLTPBSectionInfo setSectionInfoSettings:](self, "setSectionInfoSettings:");
  }

}

- (NSString)sectionID
{
  return self->_sectionID;
}

- (void)setSectionID:(id)a3
{
  objc_storeStrong((id *)&self->_sectionID, a3);
}

- (NSString)subsectionID
{
  return self->_subsectionID;
}

- (void)setSubsectionID:(id)a3
{
  objc_storeStrong((id *)&self->_subsectionID, a3);
}

- (int)sectionType
{
  return self->_sectionType;
}

- (int)sectionCategory
{
  return self->_sectionCategory;
}

- (BOOL)suppressFromSettings
{
  return self->_suppressFromSettings;
}

- (BOOL)showsInNotificationCenter
{
  return self->_showsInNotificationCenter;
}

- (BOOL)showsInLockScreen
{
  return self->_showsInLockScreen;
}

- (BOOL)showsOnExternalDevices
{
  return self->_showsOnExternalDevices;
}

- (unsigned)notificationCenterLimit
{
  return self->_notificationCenterLimit;
}

- (unsigned)pushSettings
{
  return self->_pushSettings;
}

- (unsigned)alertType
{
  return self->_alertType;
}

- (BOOL)showsMessagePreview
{
  return self->_showsMessagePreview;
}

- (BOOL)allowsNotifications
{
  return self->_allowsNotifications;
}

- (unsigned)suppressedSettings
{
  return self->_suppressedSettings;
}

- (NSString)displayName
{
  return self->_displayName;
}

- (void)setDisplayName:(id)a3
{
  objc_storeStrong((id *)&self->_displayName, a3);
}

- (BOOL)displaysCriticalBulletinsLegacy
{
  return self->_displaysCriticalBulletinsLegacy;
}

- (NSMutableArray)subsections
{
  return self->_subsections;
}

- (void)setSubsections:(id)a3
{
  objc_storeStrong((id *)&self->_subsections, a3);
}

- (int)subsectionPriority
{
  return self->_subsectionPriority;
}

- (unsigned)version
{
  return self->_version;
}

- (NSString)factorySectionID
{
  return self->_factorySectionID;
}

- (void)setFactorySectionID:(id)a3
{
  objc_storeStrong((id *)&self->_factorySectionID, a3);
}

- (NSString)universalSectionID
{
  return self->_universalSectionID;
}

- (void)setUniversalSectionID:(id)a3
{
  objc_storeStrong((id *)&self->_universalSectionID, a3);
}

- (BLTPBSectionIcon)icon
{
  return self->_icon;
}

- (void)setIcon:(id)a3
{
  objc_storeStrong((id *)&self->_icon, a3);
}

- (BOOL)iconsStripped
{
  return self->_iconsStripped;
}

- (BOOL)phoneAllowsNotifications
{
  return self->_phoneAllowsNotifications;
}

- (BOOL)criticalAlertSetting
{
  return self->_criticalAlertSetting;
}

- (BOOL)excludeFromBulletinBoard
{
  return self->_excludeFromBulletinBoard;
}

- (int)authorizationStatus
{
  return self->_authorizationStatus;
}

- (int)phoneAuthorizationStatus
{
  return self->_phoneAuthorizationStatus;
}

- (NSString)watchSectionID
{
  return self->_watchSectionID;
}

- (void)setWatchSectionID:(id)a3
{
  objc_storeStrong((id *)&self->_watchSectionID, a3);
}

- (double)authorizationExpirationDate
{
  return self->_authorizationExpirationDate;
}

- (double)lastUserGrantedAuthorizationDate
{
  return self->_lastUserGrantedAuthorizationDate;
}

- (BLTPBSectionInfoSettings)sectionInfoSettings
{
  return self->_sectionInfoSettings;
}

- (void)setSectionInfoSettings:(id)a3
{
  objc_storeStrong((id *)&self->_sectionInfoSettings, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_watchSectionID, 0);
  objc_storeStrong((id *)&self->_universalSectionID, 0);
  objc_storeStrong((id *)&self->_subsections, 0);
  objc_storeStrong((id *)&self->_subsectionID, 0);
  objc_storeStrong((id *)&self->_sectionInfoSettings, 0);
  objc_storeStrong((id *)&self->_sectionID, 0);
  objc_storeStrong((id *)&self->_icon, 0);
  objc_storeStrong((id *)&self->_factorySectionID, 0);
  objc_storeStrong((id *)&self->_displayName, 0);
}

@end
