@implementation BLTSectionConfigurationItem

- (BLTSectionConfigurationItem)initWithDictionary:(id)a3
{
  id v4;
  BLTSectionConfigurationItem *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  char v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  char v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  NSArray *allowListedSubtypes;
  void *v20;
  uint64_t v21;
  NSArray *denyListedCategories;
  void *v23;
  uint64_t v24;
  NSMutableDictionary *denyListedCategoriesWithVersion;
  id v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t i;
  void *v31;
  uint64_t v32;
  void *v33;
  void *v34;
  void *v35;
  NSMutableDictionary *v36;
  void *v37;
  void *v38;
  uint64_t v39;
  NSArray *allowListedCategories;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  uint64_t v55;
  NSNumber *watchVersionThatUsesUserInfoForContext;
  uint64_t v57;
  NSArray *additionalBridgeSectionIDs;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  void *v64;
  void *v65;
  void *v66;
  uint64_t v67;
  NSNumber *watchVersionThatUsesAttachmentURL;
  void *v70;
  id v71;
  __int128 v72;
  __int128 v73;
  __int128 v74;
  __int128 v75;
  objc_super v76;
  _BYTE v77[128];
  uint64_t v78;

  v78 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v76.receiver = self;
  v76.super_class = (Class)BLTSectionConfigurationItem;
  v5 = -[BLTSectionConfigurationItem init](&v76, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("OptOutOfCoordination"));
    v6 = objc_claimAutoreleasedReturnValue();
    if (v6
      && (v7 = (void *)v6,
          objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("OptOutOfCoordination")),
          v8 = (void *)objc_claimAutoreleasedReturnValue(),
          v9 = objc_msgSend(v8, "BOOLValue"),
          v8,
          v7,
          (v9 & 1) != 0))
    {
      v10 = 2;
    }
    else
    {
      objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("OptOutOfCoordinationForwardOnly"));
      v11 = objc_claimAutoreleasedReturnValue();
      v10 = 0;
      if (v11)
      {
        v12 = (void *)v11;
        objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("OptOutOfCoordinationForwardOnly"));
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v14 = objc_msgSend(v13, "BOOLValue");

        if ((v14 & 1) != 0)
          v10 = 1;
      }
    }
    v5->_coordinationType = v10;
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("OptOutOfAttachmentTransmission"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    if (v15)
    {
      objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("OptOutOfAttachmentTransmission"));
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v5->_optOutOfAttachmentTransmission = objc_msgSend(v16, "BOOLValue");

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("AllowListedSubtypes"));
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    if (v17)
    {
      objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("AllowListedSubtypes"));
      v18 = objc_claimAutoreleasedReturnValue();
      allowListedSubtypes = v5->_allowListedSubtypes;
      v5->_allowListedSubtypes = (NSArray *)v18;

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("DenyListedCategories"));
    v20 = (void *)objc_claimAutoreleasedReturnValue();

    if (v20)
    {
      objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("DenyListedCategories"));
      v21 = objc_claimAutoreleasedReturnValue();
      denyListedCategories = v5->_denyListedCategories;
      v5->_denyListedCategories = (NSArray *)v21;

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("DenyListedCategoriesWithVersion"));
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    if (v23)
    {
      v71 = v4;
      objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
      v24 = objc_claimAutoreleasedReturnValue();
      denyListedCategoriesWithVersion = v5->_denyListedCategoriesWithVersion;
      v5->_denyListedCategoriesWithVersion = (NSMutableDictionary *)v24;

      v74 = 0u;
      v75 = 0u;
      v72 = 0u;
      v73 = 0u;
      v70 = v23;
      v26 = v23;
      v27 = objc_msgSend(v26, "countByEnumeratingWithState:objects:count:", &v72, v77, 16);
      if (v27)
      {
        v28 = v27;
        v29 = *(_QWORD *)v73;
        do
        {
          for (i = 0; i != v28; ++i)
          {
            if (*(_QWORD *)v73 != v29)
              objc_enumerationMutation(v26);
            v31 = *(void **)(*((_QWORD *)&v72 + 1) + 8 * i);
            objc_msgSend(v31, "objectForKeyedSubscript:", CFSTR("Version"), v70);
            v32 = objc_claimAutoreleasedReturnValue();
            if (v32)
            {
              v33 = (void *)v32;
              objc_msgSend(v31, "objectForKeyedSubscript:", CFSTR("DenyListedCategories"));
              v34 = (void *)objc_claimAutoreleasedReturnValue();

              if (v34)
              {
                objc_msgSend(v31, "objectForKeyedSubscript:", CFSTR("DenyListedCategories"));
                v35 = (void *)objc_claimAutoreleasedReturnValue();
                v36 = v5->_denyListedCategoriesWithVersion;
                objc_msgSend(v31, "objectForKeyedSubscript:", CFSTR("Version"));
                v37 = (void *)objc_claimAutoreleasedReturnValue();
                -[NSMutableDictionary setObject:forKeyedSubscript:](v36, "setObject:forKeyedSubscript:", v35, v37);

              }
            }
          }
          v28 = objc_msgSend(v26, "countByEnumeratingWithState:objects:count:", &v72, v77, 16);
        }
        while (v28);
      }

      v23 = v70;
      v4 = v71;
    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("AllowListedCategories"), v70);
    v38 = (void *)objc_claimAutoreleasedReturnValue();

    if (v38)
    {
      objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("AllowListedCategories"));
      v39 = objc_claimAutoreleasedReturnValue();
      allowListedCategories = v5->_allowListedCategories;
      v5->_allowListedCategories = (NSArray *)v39;

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("AlwaysSyncSettings"));
    v41 = (void *)objc_claimAutoreleasedReturnValue();

    if (v41)
    {
      objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("AlwaysSyncSettings"));
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      v5->_alwaysSyncSettings = objc_msgSend(v42, "BOOLValue");

    }
    else
    {
      v5->_alwaysSyncSettings = 0;
    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("AlwaysAlert"));
    v43 = (void *)objc_claimAutoreleasedReturnValue();

    if (v43)
    {
      objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("AlwaysAlert"));
      v44 = (void *)objc_claimAutoreleasedReturnValue();
      v5->_alwaysAlert = objc_msgSend(v44, "BOOLValue");

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("OptOutOfWaitForUserIdle"));
    v45 = (void *)objc_claimAutoreleasedReturnValue();

    if (v45)
    {
      objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("OptOutOfWaitForUserIdle"));
      v46 = (void *)objc_claimAutoreleasedReturnValue();
      v5->_optOutOfWaitForUserIdle = objc_msgSend(v46, "BOOLValue");

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("ApplyAllowListToChildSections"));
    v47 = (void *)objc_claimAutoreleasedReturnValue();

    if (v47)
    {
      objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("ApplyAllowListToChildSections"));
      v48 = (void *)objc_claimAutoreleasedReturnValue();
      v5->_applyAllowListToChildSections = objc_msgSend(v48, "BOOLValue");

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("OptOutOfNotificationTuning"));
    v49 = (void *)objc_claimAutoreleasedReturnValue();

    if (v49)
    {
      objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("OptOutOfNotificationTuning"));
      v50 = (void *)objc_claimAutoreleasedReturnValue();
      v5->_optOutOfNotificationTuning = objc_msgSend(v50, "BOOLValue");

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("HasLegacyMapInUserInfo"));
    v51 = (void *)objc_claimAutoreleasedReturnValue();

    if (v51)
    {
      objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("HasLegacyMapInUserInfo"));
      v52 = (void *)objc_claimAutoreleasedReturnValue();
      v5->_hasLegacyMapInUserInfo = objc_msgSend(v52, "BOOLValue");

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("HasLegacyMapInContext"));
    v53 = (void *)objc_claimAutoreleasedReturnValue();

    if (v53)
    {
      objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("HasLegacyMapInContext"));
      v54 = (void *)objc_claimAutoreleasedReturnValue();
      v5->_hasLegacyMapInContext = objc_msgSend(v54, "BOOLValue");

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("WatchVersionThatUsesUserInfoForContext"));
    v55 = objc_claimAutoreleasedReturnValue();
    watchVersionThatUsesUserInfoForContext = v5->_watchVersionThatUsesUserInfoForContext;
    v5->_watchVersionThatUsesUserInfoForContext = (NSNumber *)v55;

    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("AdditionalBridgeSectionIDs"));
    v57 = objc_claimAutoreleasedReturnValue();
    additionalBridgeSectionIDs = v5->_additionalBridgeSectionIDs;
    v5->_additionalBridgeSectionIDs = (NSArray *)v57;

    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("OptOutOfSubtitleRemovalForOlderWatches"));
    v59 = (void *)objc_claimAutoreleasedReturnValue();

    if (v59)
    {
      objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("OptOutOfSubtitleRemovalForOlderWatches"));
      v60 = (void *)objc_claimAutoreleasedReturnValue();
      v5->_optOutOfSubtitleRemovalForOlderWatches = objc_msgSend(v60, "BOOLValue");

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("ShouldUsePhoneExpirationDate"));
    v61 = (void *)objc_claimAutoreleasedReturnValue();

    if (v61)
    {
      objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("ShouldUsePhoneExpirationDate"));
      v62 = (void *)objc_claimAutoreleasedReturnValue();
      v5->_shouldUsePhoneExpirationDate = objc_msgSend(v62, "BOOLValue");

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("OptOutOfSettingsCoordination"));
    v63 = (void *)objc_claimAutoreleasedReturnValue();

    if (v63)
    {
      objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("OptOutOfSettingsCoordination"));
      v64 = (void *)objc_claimAutoreleasedReturnValue();
      v5->_optOutOfSettingsCoordination = objc_msgSend(v64, "BOOLValue");

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("OverrideAppliesToCoordinationOptOut"));
    v65 = (void *)objc_claimAutoreleasedReturnValue();

    if (v65)
    {
      objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("OverrideAppliesToCoordinationOptOut"));
      v66 = (void *)objc_claimAutoreleasedReturnValue();
      v5->_overrideAppliesToCoordinationOptOut = objc_msgSend(v66, "BOOLValue");

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("WatchVersionThatUsesAttachmentURL"));
    v67 = objc_claimAutoreleasedReturnValue();
    watchVersionThatUsesAttachmentURL = v5->_watchVersionThatUsesAttachmentURL;
    v5->_watchVersionThatUsesAttachmentURL = (NSNumber *)v67;

  }
  return v5;
}

- (id)description
{
  void *v3;
  unint64_t v4;
  const __CFString *v5;

  v3 = (void *)MEMORY[0x24BDD17C8];
  v4 = -[BLTSectionConfigurationItem coordinationType](self, "coordinationType");
  if (v4 > 2)
    v5 = CFSTR("Unknown");
  else
    v5 = off_24D762310[v4];
  return (id)objc_msgSend(v3, "stringWithFormat:", CFSTR("Coordinate: %@, Attachments: %d, Always sync settings: %d Always alert: %d Wait For User Idle: %d Apply AllowList to Child Sections: %d Notification Tuning: %d"), v5, !self->_optOutOfAttachmentTransmission, self->_alwaysSyncSettings, self->_alwaysAlert, !self->_optOutOfWaitForUserIdle, self->_applyAllowListToChildSections, !self->_optOutOfNotificationTuning);
}

- (BOOL)hasDisplayedCriticalBulletins
{
  return 0;
}

- (BOOL)updateCoordinationType:(unint64_t)a3
{
  if (!self->_overrideAppliesToCoordinationOptOut)
    return 0;
  -[BLTSectionConfigurationItem setCoordinationType:](self, "setCoordinationType:", a3);
  return self->_overrideAppliesToCoordinationOptOut;
}

- (unint64_t)coordinationType
{
  return self->_coordinationType;
}

- (void)setCoordinationType:(unint64_t)a3
{
  self->_coordinationType = a3;
}

- (BOOL)optOutOfAttachmentTransmission
{
  return self->_optOutOfAttachmentTransmission;
}

- (void)setOptOutOfAttachmentTransmission:(BOOL)a3
{
  self->_optOutOfAttachmentTransmission = a3;
}

- (BOOL)alwaysSyncSettings
{
  return self->_alwaysSyncSettings;
}

- (void)setAlwaysSyncSettings:(BOOL)a3
{
  self->_alwaysSyncSettings = a3;
}

- (NSArray)allowListedSubtypes
{
  return self->_allowListedSubtypes;
}

- (void)setAllowListedSubtypes:(id)a3
{
  objc_storeStrong((id *)&self->_allowListedSubtypes, a3);
}

- (NSArray)denyListedCategories
{
  return self->_denyListedCategories;
}

- (void)setDenyListedCategories:(id)a3
{
  objc_storeStrong((id *)&self->_denyListedCategories, a3);
}

- (NSArray)allowListedCategories
{
  return self->_allowListedCategories;
}

- (void)setAllowListedCategories:(id)a3
{
  objc_storeStrong((id *)&self->_allowListedCategories, a3);
}

- (BOOL)alwaysAlert
{
  return self->_alwaysAlert;
}

- (void)setAlwaysAlert:(BOOL)a3
{
  self->_alwaysAlert = a3;
}

- (BOOL)optOutOfWaitForUserIdle
{
  return self->_optOutOfWaitForUserIdle;
}

- (void)setOptOutOfWaitForUserIdle:(BOOL)a3
{
  self->_optOutOfWaitForUserIdle = a3;
}

- (BOOL)applyAllowListToChildSections
{
  return self->_applyAllowListToChildSections;
}

- (void)setApplyAllowListToChildSections:(BOOL)a3
{
  self->_applyAllowListToChildSections = a3;
}

- (BOOL)optOutOfNotificationTuning
{
  return self->_optOutOfNotificationTuning;
}

- (void)setOptOutOfNotificationTuning:(BOOL)a3
{
  self->_optOutOfNotificationTuning = a3;
}

- (BOOL)hasLegacyMapInUserInfo
{
  return self->_hasLegacyMapInUserInfo;
}

- (void)setHasLegacyMapInUserInfo:(BOOL)a3
{
  self->_hasLegacyMapInUserInfo = a3;
}

- (BOOL)hasLegacyMapInContext
{
  return self->_hasLegacyMapInContext;
}

- (void)setHasLegacyMapInContext:(BOOL)a3
{
  self->_hasLegacyMapInContext = a3;
}

- (NSNumber)watchVersionThatUsesUserInfoForContext
{
  return self->_watchVersionThatUsesUserInfoForContext;
}

- (void)setWatchVersionThatUsesUserInfoForContext:(id)a3
{
  objc_storeStrong((id *)&self->_watchVersionThatUsesUserInfoForContext, a3);
}

- (NSArray)additionalBridgeSectionIDs
{
  return self->_additionalBridgeSectionIDs;
}

- (void)setAdditionalBridgeSectionIDs:(id)a3
{
  objc_storeStrong((id *)&self->_additionalBridgeSectionIDs, a3);
}

- (BOOL)optOutOfSubtitleRemovalForOlderWatches
{
  return self->_optOutOfSubtitleRemovalForOlderWatches;
}

- (void)setOptOutOfSubtitleRemovalForOlderWatches:(BOOL)a3
{
  self->_optOutOfSubtitleRemovalForOlderWatches = a3;
}

- (BOOL)shouldUsePhoneExpirationDate
{
  return self->_shouldUsePhoneExpirationDate;
}

- (void)setShouldUsePhoneExpirationDate:(BOOL)a3
{
  self->_shouldUsePhoneExpirationDate = a3;
}

- (BOOL)optOutOfSettingsCoordination
{
  return self->_optOutOfSettingsCoordination;
}

- (void)setOptOutOfSettingsCoordination:(BOOL)a3
{
  self->_optOutOfSettingsCoordination = a3;
}

- (BOOL)overrideAppliesToCoordinationOptOut
{
  return self->_overrideAppliesToCoordinationOptOut;
}

- (void)setOverrideAppliesToCoordinationOptOut:(BOOL)a3
{
  self->_overrideAppliesToCoordinationOptOut = a3;
}

- (NSNumber)watchVersionThatUsesAttachmentURL
{
  return self->_watchVersionThatUsesAttachmentURL;
}

- (void)setWatchVersionThatUsesAttachmentURL:(id)a3
{
  objc_storeStrong((id *)&self->_watchVersionThatUsesAttachmentURL, a3);
}

- (NSMutableDictionary)denyListedCategoriesWithVersion
{
  return self->_denyListedCategoriesWithVersion;
}

- (void)setDenyListedCategoriesWithVersion:(id)a3
{
  objc_storeStrong((id *)&self->_denyListedCategoriesWithVersion, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_denyListedCategoriesWithVersion, 0);
  objc_storeStrong((id *)&self->_watchVersionThatUsesAttachmentURL, 0);
  objc_storeStrong((id *)&self->_additionalBridgeSectionIDs, 0);
  objc_storeStrong((id *)&self->_watchVersionThatUsesUserInfoForContext, 0);
  objc_storeStrong((id *)&self->_allowListedCategories, 0);
  objc_storeStrong((id *)&self->_denyListedCategories, 0);
  objc_storeStrong((id *)&self->_allowListedSubtypes, 0);
}

@end
