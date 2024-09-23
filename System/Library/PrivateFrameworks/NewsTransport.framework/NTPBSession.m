@implementation NTPBSession

- (void)dealloc
{
  objc_super v3;

  PBRepeatedInt64Clear();
  PBRepeatedInt32Clear();
  v3.receiver = self;
  v3.super_class = (Class)NTPBSession;
  -[NTPBSession dealloc](&v3, sel_dealloc);
}

- (BOOL)hasDeviceModel
{
  return self->_deviceModel != 0;
}

- (BOOL)hasDevicePlatform
{
  return self->_devicePlatform != 0;
}

- (BOOL)hasOsVersion
{
  return self->_osVersion != 0;
}

- (BOOL)hasAppVersion
{
  return self->_appVersion != 0;
}

- (void)setAppBuild:(int64_t)a3
{
  *(_QWORD *)&self->_has |= 1uLL;
  self->_appBuild = a3;
}

- (void)setHasAppBuild:(BOOL)a3
{
  self->_has = ($D75F02CFEA0A7AA1FE16F60BA2FB852A)(*(_QWORD *)&self->_has & 0xFFFFFFFFFFFFFFFELL | a3);
}

- (BOOL)hasAppBuild
{
  return *(_DWORD *)&self->_has & 1;
}

- (void)setUtcOffset:(int)a3
{
  *(_QWORD *)&self->_has |= 0x100000uLL;
  self->_utcOffset = a3;
}

- (void)setHasUtcOffset:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x100000;
  if (!a3)
    v3 = 0;
  self->_has = ($D75F02CFEA0A7AA1FE16F60BA2FB852A)(*(_QWORD *)&self->_has & 0xFFFFFFFFFFEFFFFFLL | v3);
}

- (BOOL)hasUtcOffset
{
  return (*((unsigned __int8 *)&self->_has + 2) >> 4) & 1;
}

- (BOOL)hasCountryCode
{
  return self->_countryCode != 0;
}

- (BOOL)hasLanguageCode
{
  return self->_languageCode != 0;
}

- (BOOL)hasCarrier
{
  return self->_carrier != 0;
}

- (int)reachabilityStatus
{
  if ((*((_BYTE *)&self->_has + 2) & 4) != 0)
    return self->_reachabilityStatus;
  else
    return 0;
}

- (void)setReachabilityStatus:(int)a3
{
  *(_QWORD *)&self->_has |= 0x40000uLL;
  self->_reachabilityStatus = a3;
}

- (void)setHasReachabilityStatus:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x40000;
  if (!a3)
    v3 = 0;
  self->_has = ($D75F02CFEA0A7AA1FE16F60BA2FB852A)(*(_QWORD *)&self->_has & 0xFFFFFFFFFFFBFFFFLL | v3);
}

- (BOOL)hasReachabilityStatus
{
  return (*((unsigned __int8 *)&self->_has + 2) >> 2) & 1;
}

- (id)reachabilityStatusAsString:(int)a3
{
  if (a3 < 5)
    return off_24CD4F700[a3];
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (int)StringAsReachabilityStatus:(id)a3
{
  id v3;
  int v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("UNKNOWN_REACHABILITY_STATUS")) & 1) != 0)
  {
    v4 = 0;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("UNREACHABLE_REACHABILITY_STATUS")) & 1) != 0)
  {
    v4 = 1;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("REACHABLE_VIA_WIFI_REACHABILITY_STATUS")) & 1) != 0)
  {
    v4 = 2;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("REACHABLE_VIA_CELLULAR_REACHABILITY_STATUS")) & 1) != 0)
  {
    v4 = 3;
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("REACHABLE_VIA_OTHER_REACHABILITY_STATUS")))
  {
    v4 = 4;
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (int)cellularRadioAccessTechnology
{
  if ((*((_BYTE *)&self->_has + 1) & 1) != 0)
    return self->_cellularRadioAccessTechnology;
  else
    return 0;
}

- (void)setCellularRadioAccessTechnology:(int)a3
{
  *(_QWORD *)&self->_has |= 0x100uLL;
  self->_cellularRadioAccessTechnology = a3;
}

- (void)setHasCellularRadioAccessTechnology:(BOOL)a3
{
  uint64_t v3;

  v3 = 256;
  if (!a3)
    v3 = 0;
  self->_has = ($D75F02CFEA0A7AA1FE16F60BA2FB852A)(*(_QWORD *)&self->_has & 0xFFFFFFFFFFFFFEFFLL | v3);
}

- (BOOL)hasCellularRadioAccessTechnology
{
  return *((_BYTE *)&self->_has + 1) & 1;
}

- (id)cellularRadioAccessTechnologyAsString:(int)a3
{
  if (a3 < 0xE)
    return off_24CD4F728[a3];
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (int)StringAsCellularRadioAccessTechnology:(id)a3
{
  id v3;
  int v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("UNKNOWN_CELLULAR_RADIO_ACCESS_TECHNOLOGY")) & 1) != 0)
  {
    v4 = 0;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("GPRS_CELLULAR_RADIO_ACCESS_TECHNOLOGY")) & 1) != 0)
  {
    v4 = 1;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("EDGE_CELLULAR_RADIO_ACCESS_TECHNOLOGY")) & 1) != 0)
  {
    v4 = 2;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("WCDMA_CELLULAR_RADIO_ACCESS_TECHNOLOGY")) & 1) != 0)
  {
    v4 = 3;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("HSDPA_CELLULAR_RADIO_ACCESS_TECHNOLOGY")) & 1) != 0)
  {
    v4 = 4;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("HSUPA_CELLULAR_RADIO_ACCESS_TECHNOLOGY")) & 1) != 0)
  {
    v4 = 5;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("CDMA1x_CELLULAR_RADIO_ACCESS_TECHNOLOGY")) & 1) != 0)
  {
    v4 = 6;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("CDMAEVDORev0_CELLULAR_RADIO_ACCESS_TECHNOLOGY")) & 1) != 0)
  {
    v4 = 7;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("CDMAEVDORevA_CELLULAR_RADIO_ACCESS_TECHNOLOGY")) & 1) != 0)
  {
    v4 = 8;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("CDMAEVDORevB_CELLULAR_RADIO_ACCESS_TECHNOLOGY")) & 1) != 0)
  {
    v4 = 9;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("eHRPD_CELLULAR_RADIO_ACCESS_TECHNOLOGY")) & 1) != 0)
  {
    v4 = 10;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("LTE_CELLULAR_RADIO_ACCESS_TECHNOLOGY")) & 1) != 0)
  {
    v4 = 11;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("NRNSA_CELLULAR_RADIO_ACCESS_TECHNOLOGY")) & 1) != 0)
  {
    v4 = 12;
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("NR_CELLULAR_RADIO_ACCESS_TECHNOLOGY")))
  {
    v4 = 13;
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (void)setTextSize:(int)a3
{
  *(_QWORD *)&self->_has |= 0x80000uLL;
  self->_textSize = a3;
}

- (void)setHasTextSize:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x80000;
  if (!a3)
    v3 = 0;
  self->_has = ($D75F02CFEA0A7AA1FE16F60BA2FB852A)(*(_QWORD *)&self->_has & 0xFFFFFFFFFFF7FFFFLL | v3);
}

- (BOOL)hasTextSize
{
  return (*((unsigned __int8 *)&self->_has + 2) >> 3) & 1;
}

- (BOOL)hasSessionId
{
  return self->_sessionId != 0;
}

- (BOOL)hasUserId
{
  return self->_userId != 0;
}

- (BOOL)hasUserStorefrontId
{
  return self->_userStorefrontId != 0;
}

- (void)setIsNewUser:(BOOL)a3
{
  *(_QWORD *)&self->_has |= 0x80000000uLL;
  self->_isNewUser = a3;
}

- (void)setHasIsNewUser:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x80000000;
  if (!a3)
    v3 = 0;
  self->_has = ($D75F02CFEA0A7AA1FE16F60BA2FB852A)(*(_QWORD *)&self->_has & 0xFFFFFFFF7FFFFFFFLL | v3);
}

- (BOOL)hasIsNewUser
{
  return *((unsigned __int8 *)&self->_has + 3) >> 7;
}

- (void)setUserStartDate:(int64_t)a3
{
  *(_QWORD *)&self->_has |= 0x10uLL;
  self->_userStartDate = a3;
}

- (void)setHasUserStartDate:(BOOL)a3
{
  uint64_t v3;

  v3 = 16;
  if (!a3)
    v3 = 0;
  self->_has = ($D75F02CFEA0A7AA1FE16F60BA2FB852A)(*(_QWORD *)&self->_has & 0xFFFFFFFFFFFFFFEFLL | v3);
}

- (BOOL)hasUserStartDate
{
  return (*(_BYTE *)&self->_has >> 4) & 1;
}

- (void)setLastAppOpenDate:(int64_t)a3
{
  *(_QWORD *)&self->_has |= 4uLL;
  self->_lastAppOpenDate = a3;
}

- (void)setHasLastAppOpenDate:(BOOL)a3
{
  uint64_t v3;

  v3 = 4;
  if (!a3)
    v3 = 0;
  self->_has = ($D75F02CFEA0A7AA1FE16F60BA2FB852A)(*(_QWORD *)&self->_has & 0xFFFFFFFFFFFFFFFBLL | v3);
}

- (BOOL)hasLastAppOpenDate
{
  return (*(_BYTE *)&self->_has >> 2) & 1;
}

- (void)setRunningObsolete:(BOOL)a3
{
  *(_QWORD *)&self->_has |= 0x40000000000uLL;
  self->_runningObsolete = a3;
}

- (void)setHasRunningObsolete:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x40000000000;
  if (!a3)
    v3 = 0;
  self->_has = ($D75F02CFEA0A7AA1FE16F60BA2FB852A)(*(_QWORD *)&self->_has & 0xFFFFFBFFFFFFFFFFLL | v3);
}

- (BOOL)hasRunningObsolete
{
  return (*((unsigned __int8 *)&self->_has + 5) >> 2) & 1;
}

- (void)setUpgradedFromObsolete:(BOOL)a3
{
  *(_QWORD *)&self->_has |= 0x200000000000uLL;
  self->_upgradedFromObsolete = a3;
}

- (void)setHasUpgradedFromObsolete:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x200000000000;
  if (!a3)
    v3 = 0;
  self->_has = ($D75F02CFEA0A7AA1FE16F60BA2FB852A)(*(_QWORD *)&self->_has & 0xFFFFDFFFFFFFFFFFLL | v3);
}

- (BOOL)hasUpgradedFromObsolete
{
  return (*((unsigned __int8 *)&self->_has + 5) >> 5) & 1;
}

- (BOOL)hasPreviousAppVersion
{
  return self->_previousAppVersion != 0;
}

- (BOOL)hasPreviousOsVersion
{
  return self->_previousOsVersion != 0;
}

- (void)setSignedIntoIcloud:(BOOL)a3
{
  *(_QWORD *)&self->_has |= 0x100000000000uLL;
  self->_signedIntoIcloud = a3;
}

- (void)setHasSignedIntoIcloud:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x100000000000;
  if (!a3)
    v3 = 0;
  self->_has = ($D75F02CFEA0A7AA1FE16F60BA2FB852A)(*(_QWORD *)&self->_has & 0xFFFFEFFFFFFFFFFFLL | v3);
}

- (BOOL)hasSignedIntoIcloud
{
  return (*((unsigned __int8 *)&self->_has + 5) >> 4) & 1;
}

- (int)osInstallVariant
{
  if ((*((_BYTE *)&self->_has + 2) & 1) != 0)
    return self->_osInstallVariant;
  else
    return 0;
}

- (void)setOsInstallVariant:(int)a3
{
  *(_QWORD *)&self->_has |= 0x10000uLL;
  self->_osInstallVariant = a3;
}

- (void)setHasOsInstallVariant:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x10000;
  if (!a3)
    v3 = 0;
  self->_has = ($D75F02CFEA0A7AA1FE16F60BA2FB852A)(*(_QWORD *)&self->_has & 0xFFFFFFFFFFFEFFFFLL | v3);
}

- (BOOL)hasOsInstallVariant
{
  return *((_BYTE *)&self->_has + 2) & 1;
}

- (id)osInstallVariantAsString:(int)a3
{
  if (a3 < 3)
    return off_24CD4F798[a3];
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (int)StringAsOsInstallVariant:(id)a3
{
  id v3;
  int v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("UNKNOWN_OS_INSTALL_VARIANT")) & 1) != 0)
  {
    v4 = 0;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("INTERNAL_OS_INSTALL_VARIANT")) & 1) != 0)
  {
    v4 = 1;
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("EXTERNAL_OS_INSTALL_VARIANT")))
  {
    v4 = 2;
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (BOOL)hasCampaignId
{
  return self->_campaignId != 0;
}

- (int)campaignType
{
  if ((*(_BYTE *)&self->_has & 0x80) != 0)
    return self->_campaignType;
  else
    return 0;
}

- (void)setCampaignType:(int)a3
{
  *(_QWORD *)&self->_has |= 0x80uLL;
  self->_campaignType = a3;
}

- (void)setHasCampaignType:(BOOL)a3
{
  uint64_t v3;

  v3 = 128;
  if (!a3)
    v3 = 0;
  self->_has = ($D75F02CFEA0A7AA1FE16F60BA2FB852A)(*(_QWORD *)&self->_has & 0xFFFFFFFFFFFFFF7FLL | v3);
}

- (BOOL)hasCampaignType
{
  return *(_BYTE *)&self->_has >> 7;
}

- (id)campaignTypeAsString:(int)a3
{
  if (a3 < 3)
    return off_24CD4F7B0[a3];
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (int)StringAsCampaignType:(id)a3
{
  id v3;
  int v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("UNKNOWN_CAMPAIGN_TYPE")) & 1) != 0)
  {
    v4 = 0;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("EMAIL_CAMPAIGN_TYPE")) & 1) != 0)
  {
    v4 = 1;
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("PUSH_NOTIFICATION_CAMPAIGN_TYPE")))
  {
    v4 = 2;
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (void)setPrivateDataSyncOn:(BOOL)a3
{
  *(_QWORD *)&self->_has |= 0x10000000000uLL;
  self->_privateDataSyncOn = a3;
}

- (void)setHasPrivateDataSyncOn:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x10000000000;
  if (!a3)
    v3 = 0;
  self->_has = ($D75F02CFEA0A7AA1FE16F60BA2FB852A)(*(_QWORD *)&self->_has & 0xFFFFFEFFFFFFFFFFLL | v3);
}

- (BOOL)hasPrivateDataSyncOn
{
  return *((_BYTE *)&self->_has + 5) & 1;
}

- (void)setIsPaidSubscriber:(BOOL)a3
{
  *(_QWORD *)&self->_has |= 0x100000000uLL;
  self->_isPaidSubscriber = a3;
}

- (void)setHasIsPaidSubscriber:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x100000000;
  if (!a3)
    v3 = 0;
  self->_has = ($D75F02CFEA0A7AA1FE16F60BA2FB852A)(*(_QWORD *)&self->_has & 0xFFFFFFFEFFFFFFFFLL | v3);
}

- (BOOL)hasIsPaidSubscriber
{
  return *((_BYTE *)&self->_has + 4) & 1;
}

- (void)setIsPaidSubscriberFromNews:(BOOL)a3
{
  *(_QWORD *)&self->_has |= 0x400000000uLL;
  self->_isPaidSubscriberFromNews = a3;
}

- (void)setHasIsPaidSubscriberFromNews:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x400000000;
  if (!a3)
    v3 = 0;
  self->_has = ($D75F02CFEA0A7AA1FE16F60BA2FB852A)(*(_QWORD *)&self->_has & 0xFFFFFFFBFFFFFFFFLL | v3);
}

- (BOOL)hasIsPaidSubscriberFromNews
{
  return (*((unsigned __int8 *)&self->_has + 4) >> 2) & 1;
}

- (void)setIsPaidSubscriberFromAppStore:(BOOL)a3
{
  *(_QWORD *)&self->_has |= 0x200000000uLL;
  self->_isPaidSubscriberFromAppStore = a3;
}

- (void)setHasIsPaidSubscriberFromAppStore:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x200000000;
  if (!a3)
    v3 = 0;
  self->_has = ($D75F02CFEA0A7AA1FE16F60BA2FB852A)(*(_QWORD *)&self->_has & 0xFFFFFFFDFFFFFFFFLL | v3);
}

- (BOOL)hasIsPaidSubscriberFromAppStore
{
  return (*((unsigned __int8 *)&self->_has + 4) >> 1) & 1;
}

- (void)setIsPaidSubscriberFromThirdParty:(BOOL)a3
{
  *(_QWORD *)&self->_has |= 0x800000000uLL;
  self->_isPaidSubscriberFromThirdParty = a3;
}

- (void)setHasIsPaidSubscriberFromThirdParty:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x800000000;
  if (!a3)
    v3 = 0;
  self->_has = ($D75F02CFEA0A7AA1FE16F60BA2FB852A)(*(_QWORD *)&self->_has & 0xFFFFFFF7FFFFFFFFLL | v3);
}

- (BOOL)hasIsPaidSubscriberFromThirdParty
{
  return (*((unsigned __int8 *)&self->_has + 4) >> 3) & 1;
}

- (void)setNotificationsEnabled:(BOOL)a3
{
  *(_QWORD *)&self->_has |= 0x4000000000uLL;
  self->_notificationsEnabled = a3;
}

- (void)setHasNotificationsEnabled:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x4000000000;
  if (!a3)
    v3 = 0;
  self->_has = ($D75F02CFEA0A7AA1FE16F60BA2FB852A)(*(_QWORD *)&self->_has & 0xFFFFFFBFFFFFFFFFLL | v3);
}

- (BOOL)hasNotificationsEnabled
{
  return (*((unsigned __int8 *)&self->_has + 4) >> 6) & 1;
}

- (BOOL)hasOriginatingCampaignId
{
  return self->_originatingCampaignId != 0;
}

- (BOOL)hasOriginatingCampaignType
{
  return self->_originatingCampaignType != 0;
}

- (BOOL)hasOriginatingCreativeId
{
  return self->_originatingCreativeId != 0;
}

- (void)setIosSettingsNotificationsEnabled:(BOOL)a3
{
  *(_QWORD *)&self->_has |= 0x2000000uLL;
  self->_iosSettingsNotificationsEnabled = a3;
}

- (void)setHasIosSettingsNotificationsEnabled:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x2000000;
  if (!a3)
    v3 = 0;
  self->_has = ($D75F02CFEA0A7AA1FE16F60BA2FB852A)(*(_QWORD *)&self->_has & 0xFFFFFFFFFDFFFFFFLL | v3);
}

- (BOOL)hasIosSettingsNotificationsEnabled
{
  return (*((unsigned __int8 *)&self->_has + 3) >> 1) & 1;
}

- (int)widgetModeType
{
  if ((*((_BYTE *)&self->_has + 2) & 0x80) != 0)
    return self->_widgetModeType;
  else
    return 0;
}

- (void)setWidgetModeType:(int)a3
{
  *(_QWORD *)&self->_has |= 0x800000uLL;
  self->_widgetModeType = a3;
}

- (void)setHasWidgetModeType:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x800000;
  if (!a3)
    v3 = 0;
  self->_has = ($D75F02CFEA0A7AA1FE16F60BA2FB852A)(*(_QWORD *)&self->_has & 0xFFFFFFFFFF7FFFFFLL | v3);
}

- (BOOL)hasWidgetModeType
{
  return *((unsigned __int8 *)&self->_has + 2) >> 7;
}

- (id)widgetModeTypeAsString:(int)a3
{
  if (a3 < 3)
    return off_24CD4F7C8[a3];
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (int)StringAsWidgetModeType:(id)a3
{
  id v3;
  int v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("UNKNOWN_WIDGET_MODE_TYPE")) & 1) != 0)
  {
    v4 = 0;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("PARSEC_WIDGET_MODE_TYPE")) & 1) != 0)
  {
    v4 = 1;
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("NEWS_TODAY_WIDGET_MODE_TYPE")))
  {
    v4 = 2;
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (void)setLocationPermissionGranted:(BOOL)a3
{
  *(_QWORD *)&self->_has |= 0x2000000000uLL;
  self->_locationPermissionGranted = a3;
}

- (void)setHasLocationPermissionGranted:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x2000000000;
  if (!a3)
    v3 = 0;
  self->_has = ($D75F02CFEA0A7AA1FE16F60BA2FB852A)(*(_QWORD *)&self->_has & 0xFFFFFFDFFFFFFFFFLL | v3);
}

- (BOOL)hasLocationPermissionGranted
{
  return (*((unsigned __int8 *)&self->_has + 4) >> 5) & 1;
}

- (int)newsWidgetModeGroup
{
  if ((*((_BYTE *)&self->_has + 1) & 0x80) != 0)
    return self->_newsWidgetModeGroup;
  else
    return 0;
}

- (void)setNewsWidgetModeGroup:(int)a3
{
  *(_QWORD *)&self->_has |= 0x8000uLL;
  self->_newsWidgetModeGroup = a3;
}

- (void)setHasNewsWidgetModeGroup:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x8000;
  if (!a3)
    v3 = 0;
  self->_has = ($D75F02CFEA0A7AA1FE16F60BA2FB852A)(*(_QWORD *)&self->_has & 0xFFFFFFFFFFFF7FFFLL | v3);
}

- (BOOL)hasNewsWidgetModeGroup
{
  return *((unsigned __int8 *)&self->_has + 1) >> 7;
}

- (id)newsWidgetModeGroupAsString:(int)a3
{
  if (a3 < 3)
    return off_24CD4F7E0[a3];
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (int)StringAsNewsWidgetModeGroup:(id)a3
{
  id v3;
  int v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("UNKNOWN_NEWS_WIDGET_MODE_GROUP")) & 1) != 0)
  {
    v4 = 0;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("GROUP_A_NEWS_WIDGET_MODE_GROUP")) & 1) != 0)
  {
    v4 = 1;
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("GROUP_B_NEWS_WIDGET_MODE_GROUP")))
  {
    v4 = 2;
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (BOOL)hasNewsWidgetModeGroupId
{
  return self->_newsWidgetModeGroupId != 0;
}

- (void)setAgeBracket:(int)a3
{
  *(_QWORD *)&self->_has |= 0x20uLL;
  self->_ageBracket = a3;
}

- (void)setHasAgeBracket:(BOOL)a3
{
  uint64_t v3;

  v3 = 32;
  if (!a3)
    v3 = 0;
  self->_has = ($D75F02CFEA0A7AA1FE16F60BA2FB852A)(*(_QWORD *)&self->_has & 0xFFFFFFFFFFFFFFDFLL | v3);
}

- (BOOL)hasAgeBracket
{
  return (*(_BYTE *)&self->_has >> 5) & 1;
}

- (void)setAgeBracketConfidenceLevel:(float)a3
{
  *(_QWORD *)&self->_has |= 0x40uLL;
  self->_ageBracketConfidenceLevel = a3;
}

- (void)setHasAgeBracketConfidenceLevel:(BOOL)a3
{
  uint64_t v3;

  v3 = 64;
  if (!a3)
    v3 = 0;
  self->_has = ($D75F02CFEA0A7AA1FE16F60BA2FB852A)(*(_QWORD *)&self->_has & 0xFFFFFFFFFFFFFFBFLL | v3);
}

- (BOOL)hasAgeBracketConfidenceLevel
{
  return (*(_BYTE *)&self->_has >> 6) & 1;
}

- (void)setGender:(int)a3
{
  *(_QWORD *)&self->_has |= 0x800uLL;
  self->_gender = a3;
}

- (void)setHasGender:(BOOL)a3
{
  uint64_t v3;

  v3 = 2048;
  if (!a3)
    v3 = 0;
  self->_has = ($D75F02CFEA0A7AA1FE16F60BA2FB852A)(*(_QWORD *)&self->_has & 0xFFFFFFFFFFFFF7FFLL | v3);
}

- (BOOL)hasGender
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 3) & 1;
}

- (void)setGenderConfidenceLevel:(float)a3
{
  *(_QWORD *)&self->_has |= 0x1000uLL;
  self->_genderConfidenceLevel = a3;
}

- (void)setHasGenderConfidenceLevel:(BOOL)a3
{
  uint64_t v3;

  v3 = 4096;
  if (!a3)
    v3 = 0;
  self->_has = ($D75F02CFEA0A7AA1FE16F60BA2FB852A)(*(_QWORD *)&self->_has & 0xFFFFFFFFFFFFEFFFLL | v3);
}

- (BOOL)hasGenderConfidenceLevel
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 4) & 1;
}

- (void)setIncomeBracket:(int)a3
{
  *(_QWORD *)&self->_has |= 0x2000uLL;
  self->_incomeBracket = a3;
}

- (void)setHasIncomeBracket:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x2000;
  if (!a3)
    v3 = 0;
  self->_has = ($D75F02CFEA0A7AA1FE16F60BA2FB852A)(*(_QWORD *)&self->_has & 0xFFFFFFFFFFFFDFFFLL | v3);
}

- (BOOL)hasIncomeBracket
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 5) & 1;
}

- (void)setIncomeBracketConfidenceLevel:(float)a3
{
  *(_QWORD *)&self->_has |= 0x4000uLL;
  self->_incomeBracketConfidenceLevel = a3;
}

- (void)setHasIncomeBracketConfidenceLevel:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x4000;
  if (!a3)
    v3 = 0;
  self->_has = ($D75F02CFEA0A7AA1FE16F60BA2FB852A)(*(_QWORD *)&self->_has & 0xFFFFFFFFFFFFBFFFLL | v3);
}

- (BOOL)hasIncomeBracketConfidenceLevel
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 6) & 1;
}

- (void)setEthnicity:(int)a3
{
  *(_QWORD *)&self->_has |= 0x200uLL;
  self->_ethnicity = a3;
}

- (void)setHasEthnicity:(BOOL)a3
{
  uint64_t v3;

  v3 = 512;
  if (!a3)
    v3 = 0;
  self->_has = ($D75F02CFEA0A7AA1FE16F60BA2FB852A)(*(_QWORD *)&self->_has & 0xFFFFFFFFFFFFFDFFLL | v3);
}

- (BOOL)hasEthnicity
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 1) & 1;
}

- (void)setEthnicityConfidenceLevel:(float)a3
{
  *(_QWORD *)&self->_has |= 0x400uLL;
  self->_ethnicityConfidenceLevel = a3;
}

- (void)setHasEthnicityConfidenceLevel:(BOOL)a3
{
  uint64_t v3;

  v3 = 1024;
  if (!a3)
    v3 = 0;
  self->_has = ($D75F02CFEA0A7AA1FE16F60BA2FB852A)(*(_QWORD *)&self->_has & 0xFFFFFFFFFFFFFBFFLL | v3);
}

- (BOOL)hasEthnicityConfidenceLevel
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 2) & 1;
}

- (void)setAppConfigTreatmentId:(int64_t)a3
{
  *(_QWORD *)&self->_has |= 2uLL;
  self->_appConfigTreatmentId = a3;
}

- (void)setHasAppConfigTreatmentId:(BOOL)a3
{
  uint64_t v3;

  v3 = 2;
  if (!a3)
    v3 = 0;
  self->_has = ($D75F02CFEA0A7AA1FE16F60BA2FB852A)(*(_QWORD *)&self->_has & 0xFFFFFFFFFFFFFFFDLL | v3);
}

- (BOOL)hasAppConfigTreatmentId
{
  return (*(_BYTE *)&self->_has >> 1) & 1;
}

- (BOOL)hasClientName
{
  return self->_clientName != 0;
}

- (BOOL)hasClientVersion
{
  return self->_clientVersion != 0;
}

- (BOOL)hasBrowserLanguage
{
  return self->_browserLanguage != 0;
}

- (BOOL)hasNotwUserId
{
  return self->_notwUserId != 0;
}

- (void)setPrivateDataEncrypted:(BOOL)a3
{
  *(_QWORD *)&self->_has |= 0x8000000000uLL;
  self->_privateDataEncrypted = a3;
}

- (void)setHasPrivateDataEncrypted:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x8000000000;
  if (!a3)
    v3 = 0;
  self->_has = ($D75F02CFEA0A7AA1FE16F60BA2FB852A)(*(_QWORD *)&self->_has & 0xFFFFFF7FFFFFFFFFLL | v3);
}

- (BOOL)hasPrivateDataEncrypted
{
  return *((unsigned __int8 *)&self->_has + 4) >> 7;
}

- (void)setProgressivePersonalizationAllowed:(BOOL)a3
{
  *(_QWORD *)&self->_has |= 0x20000000000uLL;
  self->_progressivePersonalizationAllowed = a3;
}

- (void)setHasProgressivePersonalizationAllowed:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x20000000000;
  if (!a3)
    v3 = 0;
  self->_has = ($D75F02CFEA0A7AA1FE16F60BA2FB852A)(*(_QWORD *)&self->_has & 0xFFFFFDFFFFFFFFFFLL | v3);
}

- (BOOL)hasProgressivePersonalizationAllowed
{
  return (*((unsigned __int8 *)&self->_has + 5) >> 1) & 1;
}

- (BOOL)hasWatchSessionId
{
  return self->_watchSessionId != 0;
}

- (BOOL)hasSessionIdWatch
{
  return self->_sessionIdWatch != 0;
}

- (BOOL)hasWidgetSessionId
{
  return self->_widgetSessionId != 0;
}

- (int)widgetDisplayMode
{
  if ((*((_BYTE *)&self->_has + 2) & 0x20) != 0)
    return self->_widgetDisplayMode;
  else
    return 0;
}

- (void)setWidgetDisplayMode:(int)a3
{
  *(_QWORD *)&self->_has |= 0x200000uLL;
  self->_widgetDisplayMode = a3;
}

- (void)setHasWidgetDisplayMode:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x200000;
  if (!a3)
    v3 = 0;
  self->_has = ($D75F02CFEA0A7AA1FE16F60BA2FB852A)(*(_QWORD *)&self->_has & 0xFFFFFFFFFFDFFFFFLL | v3);
}

- (BOOL)hasWidgetDisplayMode
{
  return (*((unsigned __int8 *)&self->_has + 2) >> 5) & 1;
}

- (id)widgetDisplayModeAsString:(int)a3
{
  if (a3 < 8)
    return off_24CD4F7F8[a3];
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (int)StringAsWidgetDisplayMode:(id)a3
{
  id v3;
  int v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("UNKNOWN_WIDGET_DISPLAY_MODE")) & 1) != 0)
  {
    v4 = 0;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("COMPACT_WIDGET_DISPLAY_MODE")) & 1) != 0)
  {
    v4 = 1;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("EXPANDED_WIDGET_DISPLAY_MODE")) & 1) != 0)
  {
    v4 = 2;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("TWO_BY_TWO_WIDGET_DISPLAY_MODE")) & 1) != 0)
  {
    v4 = 3;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("TWO_BY_FOUR_WIDGET_DISPLAY_MODE")) & 1) != 0)
  {
    v4 = 4;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("FOUR_BY_FOUR_WIDGET_DISPLAY_MODE")) & 1) != 0)
  {
    v4 = 5;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("SIX_BY_FOUR_WIDGET_DISPLAY_MODE")) & 1) != 0)
  {
    v4 = 6;
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("ONE_BY_TWO_WIDGET_DISPLAY_MODE")))
  {
    v4 = 7;
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (BOOL)hasPersonalizationPortraitVariantName
{
  return self->_personalizationPortraitVariantName != 0;
}

- (BOOL)hasAppProcessLifetimeId
{
  return self->_appProcessLifetimeId != 0;
}

- (void)setTestBucket:(int64_t)a3
{
  *(_QWORD *)&self->_has |= 8uLL;
  self->_testBucket = a3;
}

- (void)setHasTestBucket:(BOOL)a3
{
  uint64_t v3;

  v3 = 8;
  if (!a3)
    v3 = 0;
  self->_has = ($D75F02CFEA0A7AA1FE16F60BA2FB852A)(*(_QWORD *)&self->_has & 0xFFFFFFFFFFFFFFF7 | v3);
}

- (BOOL)hasTestBucket
{
  return (*(_BYTE *)&self->_has >> 3) & 1;
}

- (BOOL)hasWidgetUserId
{
  return self->_widgetUserId != 0;
}

- (BOOL)hasProductType
{
  return self->_productType != 0;
}

- (unint64_t)userSegmentationTreatmentIdsCount
{
  return self->_userSegmentationTreatmentIds.count;
}

- (int64_t)userSegmentationTreatmentIds
{
  return self->_userSegmentationTreatmentIds.list;
}

- (void)clearUserSegmentationTreatmentIds
{
  PBRepeatedInt64Clear();
}

- (void)addUserSegmentationTreatmentIds:(int64_t)a3
{
  PBRepeatedInt64Add();
}

- (int64_t)userSegmentationTreatmentIdsAtIndex:(unint64_t)a3
{
  $A58966F474337DCABE012981F76706F5 *p_userSegmentationTreatmentIds;
  unint64_t count;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;

  p_userSegmentationTreatmentIds = &self->_userSegmentationTreatmentIds;
  count = self->_userSegmentationTreatmentIds.count;
  if (count <= a3)
  {
    v6 = (void *)MEMORY[0x24BDBCE88];
    v7 = *MEMORY[0x24BDBCB78];
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("idx (%lu) is out of range (%lu)"), a3, count);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "exceptionWithName:reason:userInfo:", v7, v8, 0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "raise");

  }
  return p_userSegmentationTreatmentIds->list[a3];
}

- (void)setUserSegmentationTreatmentIds:(int64_t *)a3 count:(unint64_t)a4
{
  PBRepeatedInt64Set();
}

- (unint64_t)userSegmentationSegmentSetIdsCount
{
  return self->_userSegmentationSegmentSetIds.count;
}

- (int)userSegmentationSegmentSetIds
{
  return self->_userSegmentationSegmentSetIds.list;
}

- (void)clearUserSegmentationSegmentSetIds
{
  PBRepeatedInt32Clear();
}

- (void)addUserSegmentationSegmentSetIds:(int)a3
{
  PBRepeatedInt32Add();
}

- (int)userSegmentationSegmentSetIdsAtIndex:(unint64_t)a3
{
  $27AAA0BB14FCB8642CC83DAEBE69EA4A *p_userSegmentationSegmentSetIds;
  unint64_t count;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;

  p_userSegmentationSegmentSetIds = &self->_userSegmentationSegmentSetIds;
  count = self->_userSegmentationSegmentSetIds.count;
  if (count <= a3)
  {
    v6 = (void *)MEMORY[0x24BDBCE88];
    v7 = *MEMORY[0x24BDBCB78];
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("idx (%lu) is out of range (%lu)"), a3, count);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "exceptionWithName:reason:userInfo:", v7, v8, 0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "raise");

  }
  return p_userSegmentationSegmentSetIds->list[a3];
}

- (void)setUserSegmentationSegmentSetIds:(int *)a3 count:(unint64_t)a4
{
  PBRepeatedInt32Set();
}

- (void)setIosSettingsNotificationsSoundEnabled:(BOOL)a3
{
  *(_QWORD *)&self->_has |= 0x20000000uLL;
  self->_iosSettingsNotificationsSoundEnabled = a3;
}

- (void)setHasIosSettingsNotificationsSoundEnabled:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x20000000;
  if (!a3)
    v3 = 0;
  self->_has = ($D75F02CFEA0A7AA1FE16F60BA2FB852A)(*(_QWORD *)&self->_has & 0xFFFFFFFFDFFFFFFFLL | v3);
}

- (BOOL)hasIosSettingsNotificationsSoundEnabled
{
  return (*((unsigned __int8 *)&self->_has + 3) >> 5) & 1;
}

- (void)setIosSettingsNotificationsBadgeAppIconEnabled:(BOOL)a3
{
  *(_QWORD *)&self->_has |= 0x1000000uLL;
  self->_iosSettingsNotificationsBadgeAppIconEnabled = a3;
}

- (void)setHasIosSettingsNotificationsBadgeAppIconEnabled:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x1000000;
  if (!a3)
    v3 = 0;
  self->_has = ($D75F02CFEA0A7AA1FE16F60BA2FB852A)(*(_QWORD *)&self->_has & 0xFFFFFFFFFEFFFFFFLL | v3);
}

- (BOOL)hasIosSettingsNotificationsBadgeAppIconEnabled
{
  return *((_BYTE *)&self->_has + 3) & 1;
}

- (void)setIosSettingsNotificationsShowOnLockScreenEnabled:(BOOL)a3
{
  *(_QWORD *)&self->_has |= 0x10000000uLL;
  self->_iosSettingsNotificationsShowOnLockScreenEnabled = a3;
}

- (void)setHasIosSettingsNotificationsShowOnLockScreenEnabled:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x10000000;
  if (!a3)
    v3 = 0;
  self->_has = ($D75F02CFEA0A7AA1FE16F60BA2FB852A)(*(_QWORD *)&self->_has & 0xFFFFFFFFEFFFFFFFLL | v3);
}

- (BOOL)hasIosSettingsNotificationsShowOnLockScreenEnabled
{
  return (*((unsigned __int8 *)&self->_has + 3) >> 4) & 1;
}

- (void)setIosSettingsNotificationsShowInHistoryEnabled:(BOOL)a3
{
  *(_QWORD *)&self->_has |= 0x8000000uLL;
  self->_iosSettingsNotificationsShowInHistoryEnabled = a3;
}

- (void)setHasIosSettingsNotificationsShowInHistoryEnabled:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x8000000;
  if (!a3)
    v3 = 0;
  self->_has = ($D75F02CFEA0A7AA1FE16F60BA2FB852A)(*(_QWORD *)&self->_has & 0xFFFFFFFFF7FFFFFFLL | v3);
}

- (BOOL)hasIosSettingsNotificationsShowInHistoryEnabled
{
  return (*((unsigned __int8 *)&self->_has + 3) >> 3) & 1;
}

- (void)setIosSettingsNotificationsShowAsBannersEnabled:(BOOL)a3
{
  *(_QWORD *)&self->_has |= 0x4000000uLL;
  self->_iosSettingsNotificationsShowAsBannersEnabled = a3;
}

- (void)setHasIosSettingsNotificationsShowAsBannersEnabled:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x4000000;
  if (!a3)
    v3 = 0;
  self->_has = ($D75F02CFEA0A7AA1FE16F60BA2FB852A)(*(_QWORD *)&self->_has & 0xFFFFFFFFFBFFFFFFLL | v3);
}

- (BOOL)hasIosSettingsNotificationsShowAsBannersEnabled
{
  return (*((unsigned __int8 *)&self->_has + 3) >> 2) & 1;
}

- (int)widgetDisplayModeSessionEnd
{
  if ((*((_BYTE *)&self->_has + 2) & 0x40) != 0)
    return self->_widgetDisplayModeSessionEnd;
  else
    return 0;
}

- (void)setWidgetDisplayModeSessionEnd:(int)a3
{
  *(_QWORD *)&self->_has |= 0x400000uLL;
  self->_widgetDisplayModeSessionEnd = a3;
}

- (void)setHasWidgetDisplayModeSessionEnd:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x400000;
  if (!a3)
    v3 = 0;
  self->_has = ($D75F02CFEA0A7AA1FE16F60BA2FB852A)(*(_QWORD *)&self->_has & 0xFFFFFFFFFFBFFFFFLL | v3);
}

- (BOOL)hasWidgetDisplayModeSessionEnd
{
  return (*((unsigned __int8 *)&self->_has + 2) >> 6) & 1;
}

- (id)widgetDisplayModeSessionEndAsString:(int)a3
{
  if (a3 < 8)
    return off_24CD4F7F8[a3];
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (int)StringAsWidgetDisplayModeSessionEnd:(id)a3
{
  id v3;
  int v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("UNKNOWN_WIDGET_DISPLAY_MODE")) & 1) != 0)
  {
    v4 = 0;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("COMPACT_WIDGET_DISPLAY_MODE")) & 1) != 0)
  {
    v4 = 1;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("EXPANDED_WIDGET_DISPLAY_MODE")) & 1) != 0)
  {
    v4 = 2;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("TWO_BY_TWO_WIDGET_DISPLAY_MODE")) & 1) != 0)
  {
    v4 = 3;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("TWO_BY_FOUR_WIDGET_DISPLAY_MODE")) & 1) != 0)
  {
    v4 = 4;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("FOUR_BY_FOUR_WIDGET_DISPLAY_MODE")) & 1) != 0)
  {
    v4 = 5;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("SIX_BY_FOUR_WIDGET_DISPLAY_MODE")) & 1) != 0)
  {
    v4 = 6;
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("ONE_BY_TWO_WIDGET_DISPLAY_MODE")))
  {
    v4 = 7;
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (void)setSignedIntoITunes:(BOOL)a3
{
  *(_QWORD *)&self->_has |= 0x80000000000uLL;
  self->_signedIntoITunes = a3;
}

- (void)setHasSignedIntoITunes:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x80000000000;
  if (!a3)
    v3 = 0;
  self->_has = ($D75F02CFEA0A7AA1FE16F60BA2FB852A)(*(_QWORD *)&self->_has & 0xFFFFF7FFFFFFFFFFLL | v3);
}

- (BOOL)hasSignedIntoITunes
{
  return (*((unsigned __int8 *)&self->_has + 5) >> 3) & 1;
}

- (void)setIsStoreDemoModeEnabled:(BOOL)a3
{
  *(_QWORD *)&self->_has |= 0x1000000000uLL;
  self->_isStoreDemoModeEnabled = a3;
}

- (void)setHasIsStoreDemoModeEnabled:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x1000000000;
  if (!a3)
    v3 = 0;
  self->_has = ($D75F02CFEA0A7AA1FE16F60BA2FB852A)(*(_QWORD *)&self->_has & 0xFFFFFFEFFFFFFFFFLL | v3);
}

- (BOOL)hasIsStoreDemoModeEnabled
{
  return (*((unsigned __int8 *)&self->_has + 4) >> 4) & 1;
}

- (void)setIsDiagnosticsUsageEnabled:(BOOL)a3
{
  *(_QWORD *)&self->_has |= 0x40000000uLL;
  self->_isDiagnosticsUsageEnabled = a3;
}

- (void)setHasIsDiagnosticsUsageEnabled:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x40000000;
  if (!a3)
    v3 = 0;
  self->_has = ($D75F02CFEA0A7AA1FE16F60BA2FB852A)(*(_QWORD *)&self->_has & 0xFFFFFFFFBFFFFFFFLL | v3);
}

- (BOOL)hasIsDiagnosticsUsageEnabled
{
  return (*((unsigned __int8 *)&self->_has + 3) >> 6) & 1;
}

- (void)clearRegionIds
{
  -[NSMutableArray removeAllObjects](self->_regionIds, "removeAllObjects");
}

- (void)addRegionIds:(id)a3
{
  id v4;
  NSMutableArray *regionIds;
  NSMutableArray *v6;
  NSMutableArray *v7;
  id v8;

  v4 = a3;
  regionIds = self->_regionIds;
  v8 = v4;
  if (!regionIds)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x24BDBCEB8]);
    v7 = self->_regionIds;
    self->_regionIds = v6;

    v4 = v8;
    regionIds = self->_regionIds;
  }
  -[NSMutableArray addObject:](regionIds, "addObject:", v4);

}

- (unint64_t)regionIdsCount
{
  return -[NSMutableArray count](self->_regionIds, "count");
}

- (id)regionIdsAtIndex:(unint64_t)a3
{
  return (id)-[NSMutableArray objectAtIndex:](self->_regionIds, "objectAtIndex:", a3);
}

+ (Class)regionIdsType
{
  return (Class)objc_opt_class();
}

- (BOOL)hasAppBuildNumber
{
  return self->_appBuildNumber != 0;
}

- (BOOL)hasAmsPurchaseId
{
  return self->_amsPurchaseId != 0;
}

- (BOOL)hasAmsCampaignId
{
  return self->_amsCampaignId != 0;
}

- (int)paywallConfigType
{
  if ((*((_BYTE *)&self->_has + 2) & 2) != 0)
    return self->_paywallConfigType;
  else
    return 0;
}

- (void)setPaywallConfigType:(int)a3
{
  *(_QWORD *)&self->_has |= 0x20000uLL;
  self->_paywallConfigType = a3;
}

- (void)setHasPaywallConfigType:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x20000;
  if (!a3)
    v3 = 0;
  self->_has = ($D75F02CFEA0A7AA1FE16F60BA2FB852A)(*(_QWORD *)&self->_has & 0xFFFFFFFFFFFDFFFFLL | v3);
}

- (BOOL)hasPaywallConfigType
{
  return (*((unsigned __int8 *)&self->_has + 2) >> 1) & 1;
}

- (id)paywallConfigTypeAsString:(int)a3
{
  if (a3 < 5)
    return off_24CD4F838[a3];
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (int)StringAsPaywallConfigType:(id)a3
{
  id v3;
  int v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("UNKNOWN_PAYWALL_CONFIG_TYPE")) & 1) != 0)
  {
    v4 = 0;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("NEWS_PLUS_PAYWALL_CONFIG_TYPE")) & 1) != 0)
  {
    v4 = 1;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("B_OFFER_PAYWALL_CONFIG_TYPE")) & 1) != 0)
  {
    v4 = 2;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("S_BUNDLE_PAYWALL_CONFIG_TYPE")) & 1) != 0)
  {
    v4 = 3;
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("P_DELTA_PAYWALL_CONFIG_TYPE")))
  {
    v4 = 4;
  }
  else
  {
    v4 = 0;
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

  v3 = (void *)MEMORY[0x24BDD17C8];
  v8.receiver = self;
  v8.super_class = (Class)NTPBSession;
  -[NTPBSession description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[NTPBSession dictionaryRepresentation](self, "dictionaryRepresentation");
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
  NSString *deviceModel;
  NSString *devicePlatform;
  NSString *osVersion;
  NSString *appVersion;
  $D75F02CFEA0A7AA1FE16F60BA2FB852A has;
  void *v11;
  void *v12;
  NSString *countryCode;
  NSString *languageCode;
  NSString *carrier;
  $D75F02CFEA0A7AA1FE16F60BA2FB852A v16;
  void *v17;
  NSData *sessionId;
  NSString *userId;
  NSString *userStorefrontId;
  $D75F02CFEA0A7AA1FE16F60BA2FB852A v21;
  void *v22;
  NSString *previousAppVersion;
  NSString *previousOsVersion;
  $D75F02CFEA0A7AA1FE16F60BA2FB852A v25;
  void *v26;
  uint64_t osInstallVariant;
  __CFString *v28;
  uint64_t reachabilityStatus;
  __CFString *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  NSString *campaignId;
  $D75F02CFEA0A7AA1FE16F60BA2FB852A v36;
  void *v37;
  NSString *originatingCampaignId;
  NSString *originatingCampaignType;
  NSString *originatingCreativeId;
  $D75F02CFEA0A7AA1FE16F60BA2FB852A v41;
  uint64_t campaignType;
  __CFString *v43;
  void *v44;
  uint64_t widgetModeType;
  __CFString *v46;
  uint64_t cellularRadioAccessTechnology;
  __CFString *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  uint64_t newsWidgetModeGroup;
  __CFString *v56;
  NSString *newsWidgetModeGroupId;
  $D75F02CFEA0A7AA1FE16F60BA2FB852A v58;
  void *v59;
  NSString *clientName;
  NSString *clientVersion;
  NSString *browserLanguage;
  NSString *notwUserId;
  $D75F02CFEA0A7AA1FE16F60BA2FB852A v64;
  void *v65;
  void *v66;
  NSString *watchSessionId;
  NSData *sessionIdWatch;
  NSData *widgetSessionId;
  uint64_t widgetDisplayMode;
  __CFString *v71;
  void *v72;
  void *v73;
  void *v74;
  void *v75;
  void *v76;
  void *v77;
  void *v78;
  void *v79;
  NSString *personalizationPortraitVariantName;
  NSData *appProcessLifetimeId;
  void *v82;
  NSString *widgetUserId;
  NSString *productType;
  void *v85;
  void *v86;
  $D75F02CFEA0A7AA1FE16F60BA2FB852A v87;
  void *v88;
  NSMutableArray *regionIds;
  NSString *appBuildNumber;
  NSString *amsPurchaseId;
  NSString *amsCampaignId;
  uint64_t paywallConfigType;
  __CFString *v94;
  void *v95;
  void *v96;
  void *v97;
  void *v98;
  void *v99;
  uint64_t widgetDisplayModeSessionEnd;
  __CFString *v101;
  id v102;
  void *v104;
  void *v105;

  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v3;
  deviceModel = self->_deviceModel;
  if (deviceModel)
    objc_msgSend(v3, "setObject:forKey:", deviceModel, CFSTR("device_model"));
  devicePlatform = self->_devicePlatform;
  if (devicePlatform)
    objc_msgSend(v5, "setObject:forKey:", devicePlatform, CFSTR("device_platform"));
  osVersion = self->_osVersion;
  if (osVersion)
    objc_msgSend(v5, "setObject:forKey:", osVersion, CFSTR("os_version"));
  appVersion = self->_appVersion;
  if (appVersion)
    objc_msgSend(v5, "setObject:forKey:", appVersion, CFSTR("app_version"));
  has = self->_has;
  if ((*(_BYTE *)&has & 1) != 0)
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithLongLong:", self->_appBuild);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setObject:forKey:", v11, CFSTR("app_build"));

    has = self->_has;
  }
  if ((*(_DWORD *)&has & 0x100000) != 0)
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", self->_utcOffset);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setObject:forKey:", v12, CFSTR("utc_offset"));

  }
  countryCode = self->_countryCode;
  if (countryCode)
    objc_msgSend(v5, "setObject:forKey:", countryCode, CFSTR("country_code"));
  languageCode = self->_languageCode;
  if (languageCode)
    objc_msgSend(v5, "setObject:forKey:", languageCode, CFSTR("language_code"));
  carrier = self->_carrier;
  if (carrier)
    objc_msgSend(v5, "setObject:forKey:", carrier, CFSTR("carrier"));
  v16 = self->_has;
  if ((*(_DWORD *)&v16 & 0x40000) != 0)
  {
    reachabilityStatus = self->_reachabilityStatus;
    if (reachabilityStatus >= 5)
    {
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("(unknown: %i)"), self->_reachabilityStatus);
      v30 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v30 = off_24CD4F700[reachabilityStatus];
    }
    objc_msgSend(v5, "setObject:forKey:", v30, CFSTR("reachability_status"));

    v16 = self->_has;
    if ((*(_WORD *)&v16 & 0x100) == 0)
    {
LABEL_21:
      if ((*(_DWORD *)&v16 & 0x80000) == 0)
        goto LABEL_23;
      goto LABEL_22;
    }
  }
  else if ((*(_WORD *)&v16 & 0x100) == 0)
  {
    goto LABEL_21;
  }
  cellularRadioAccessTechnology = self->_cellularRadioAccessTechnology;
  if (cellularRadioAccessTechnology >= 0xE)
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("(unknown: %i)"), self->_cellularRadioAccessTechnology);
    v48 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v48 = off_24CD4F728[cellularRadioAccessTechnology];
  }
  objc_msgSend(v5, "setObject:forKey:", v48, CFSTR("cellular_radio_access_technology"));

  if ((*(_QWORD *)&self->_has & 0x80000) != 0)
  {
LABEL_22:
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", self->_textSize);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setObject:forKey:", v17, CFSTR("text_size"));

  }
LABEL_23:
  sessionId = self->_sessionId;
  if (sessionId)
    objc_msgSend(v5, "setObject:forKey:", sessionId, CFSTR("session_id"));
  userId = self->_userId;
  if (userId)
    objc_msgSend(v5, "setObject:forKey:", userId, CFSTR("user_id"));
  userStorefrontId = self->_userStorefrontId;
  if (userStorefrontId)
    objc_msgSend(v5, "setObject:forKey:", userStorefrontId, CFSTR("user_storefront_id"));
  v21 = self->_has;
  if ((*(_DWORD *)&v21 & 0x80000000) != 0)
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", self->_isNewUser);
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setObject:forKey:", v31, CFSTR("is_new_user"));

    v21 = self->_has;
    if ((*(_BYTE *)&v21 & 0x10) == 0)
    {
LABEL_31:
      if ((*(_BYTE *)&v21 & 4) == 0)
        goto LABEL_32;
      goto LABEL_48;
    }
  }
  else if ((*(_BYTE *)&v21 & 0x10) == 0)
  {
    goto LABEL_31;
  }
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithLongLong:", self->_userStartDate);
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKey:", v32, CFSTR("user_start_date"));

  v21 = self->_has;
  if ((*(_BYTE *)&v21 & 4) == 0)
  {
LABEL_32:
    if ((*(_QWORD *)&v21 & 0x40000000000) == 0)
      goto LABEL_33;
    goto LABEL_49;
  }
LABEL_48:
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithLongLong:", self->_lastAppOpenDate);
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKey:", v33, CFSTR("last_app_open_date"));

  v21 = self->_has;
  if ((*(_QWORD *)&v21 & 0x40000000000) == 0)
  {
LABEL_33:
    if ((*(_QWORD *)&v21 & 0x200000000000) == 0)
      goto LABEL_35;
    goto LABEL_34;
  }
LABEL_49:
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", self->_runningObsolete);
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKey:", v34, CFSTR("running_obsolete"));

  if ((*(_QWORD *)&self->_has & 0x200000000000) != 0)
  {
LABEL_34:
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", self->_upgradedFromObsolete);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setObject:forKey:", v22, CFSTR("upgraded_from_obsolete"));

  }
LABEL_35:
  previousAppVersion = self->_previousAppVersion;
  if (previousAppVersion)
    objc_msgSend(v5, "setObject:forKey:", previousAppVersion, CFSTR("previous_app_version"));
  previousOsVersion = self->_previousOsVersion;
  if (previousOsVersion)
    objc_msgSend(v5, "setObject:forKey:", previousOsVersion, CFSTR("previous_os_version"));
  v25 = self->_has;
  if ((*(_QWORD *)&v25 & 0x100000000000) != 0)
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", self->_signedIntoIcloud);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setObject:forKey:", v26, CFSTR("signed_into_icloud"));

    v25 = self->_has;
  }
  if ((*(_DWORD *)&v25 & 0x10000) != 0)
  {
    osInstallVariant = self->_osInstallVariant;
    if (osInstallVariant >= 3)
    {
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("(unknown: %i)"), self->_osInstallVariant);
      v28 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v28 = off_24CD4F798[osInstallVariant];
    }
    objc_msgSend(v5, "setObject:forKey:", v28, CFSTR("os_install_variant"));

  }
  campaignId = self->_campaignId;
  if (campaignId)
    objc_msgSend(v5, "setObject:forKey:", campaignId, CFSTR("campaign_id"));
  v36 = self->_has;
  if ((*(_BYTE *)&v36 & 0x80) != 0)
  {
    campaignType = self->_campaignType;
    if (campaignType >= 3)
    {
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("(unknown: %i)"), self->_campaignType);
      v43 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v43 = off_24CD4F7B0[campaignType];
    }
    objc_msgSend(v5, "setObject:forKey:", v43, CFSTR("campaign_type"));

    v36 = self->_has;
    if ((*(_QWORD *)&v36 & 0x10000000000) == 0)
    {
LABEL_57:
      if ((*(_QWORD *)&v36 & 0x100000000) == 0)
        goto LABEL_58;
      goto LABEL_86;
    }
  }
  else if ((*(_QWORD *)&v36 & 0x10000000000) == 0)
  {
    goto LABEL_57;
  }
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", self->_privateDataSyncOn);
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKey:", v49, CFSTR("private_data_sync_on"));

  v36 = self->_has;
  if ((*(_QWORD *)&v36 & 0x100000000) == 0)
  {
LABEL_58:
    if ((*(_QWORD *)&v36 & 0x400000000) == 0)
      goto LABEL_59;
    goto LABEL_87;
  }
LABEL_86:
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", self->_isPaidSubscriber);
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKey:", v50, CFSTR("is_paid_subscriber"));

  v36 = self->_has;
  if ((*(_QWORD *)&v36 & 0x400000000) == 0)
  {
LABEL_59:
    if ((*(_QWORD *)&v36 & 0x200000000) == 0)
      goto LABEL_60;
    goto LABEL_88;
  }
LABEL_87:
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", self->_isPaidSubscriberFromNews);
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKey:", v51, CFSTR("is_paid_subscriber_from_news"));

  v36 = self->_has;
  if ((*(_QWORD *)&v36 & 0x200000000) == 0)
  {
LABEL_60:
    if ((*(_QWORD *)&v36 & 0x800000000) == 0)
      goto LABEL_61;
    goto LABEL_89;
  }
LABEL_88:
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", self->_isPaidSubscriberFromAppStore);
  v52 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKey:", v52, CFSTR("is_paid_subscriber_from_app_store"));

  v36 = self->_has;
  if ((*(_QWORD *)&v36 & 0x800000000) == 0)
  {
LABEL_61:
    if ((*(_QWORD *)&v36 & 0x4000000000) == 0)
      goto LABEL_63;
    goto LABEL_62;
  }
LABEL_89:
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", self->_isPaidSubscriberFromThirdParty);
  v53 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKey:", v53, CFSTR("is_paid_subscriber_from_third_party"));

  if ((*(_QWORD *)&self->_has & 0x4000000000) != 0)
  {
LABEL_62:
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", self->_notificationsEnabled);
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setObject:forKey:", v37, CFSTR("notifications_enabled"));

  }
LABEL_63:
  originatingCampaignId = self->_originatingCampaignId;
  if (originatingCampaignId)
    objc_msgSend(v5, "setObject:forKey:", originatingCampaignId, CFSTR("originating_campaign_id"));
  originatingCampaignType = self->_originatingCampaignType;
  if (originatingCampaignType)
    objc_msgSend(v5, "setObject:forKey:", originatingCampaignType, CFSTR("originating_campaign_type"));
  originatingCreativeId = self->_originatingCreativeId;
  if (originatingCreativeId)
    objc_msgSend(v5, "setObject:forKey:", originatingCreativeId, CFSTR("originating_creative_id"));
  v41 = self->_has;
  if ((*(_DWORD *)&v41 & 0x2000000) != 0)
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", self->_iosSettingsNotificationsEnabled);
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setObject:forKey:", v44, CFSTR("ios_settings_notifications_enabled"));

    v41 = self->_has;
    if ((*(_DWORD *)&v41 & 0x800000) == 0)
    {
LABEL_71:
      if ((*(_QWORD *)&v41 & 0x2000000000) == 0)
        goto LABEL_72;
      goto LABEL_93;
    }
  }
  else if ((*(_DWORD *)&v41 & 0x800000) == 0)
  {
    goto LABEL_71;
  }
  widgetModeType = self->_widgetModeType;
  if (widgetModeType >= 3)
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("(unknown: %i)"), self->_widgetModeType);
    v46 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v46 = off_24CD4F7C8[widgetModeType];
  }
  objc_msgSend(v5, "setObject:forKey:", v46, CFSTR("widget_mode_type"));

  v41 = self->_has;
  if ((*(_QWORD *)&v41 & 0x2000000000) == 0)
  {
LABEL_72:
    if ((*(_WORD *)&v41 & 0x8000) == 0)
      goto LABEL_101;
    goto LABEL_94;
  }
LABEL_93:
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", self->_locationPermissionGranted);
  v54 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKey:", v54, CFSTR("location_permission_granted"));

  if ((*(_QWORD *)&self->_has & 0x8000) == 0)
    goto LABEL_101;
LABEL_94:
  newsWidgetModeGroup = self->_newsWidgetModeGroup;
  if (newsWidgetModeGroup >= 3)
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("(unknown: %i)"), self->_newsWidgetModeGroup);
    v56 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v56 = off_24CD4F7E0[newsWidgetModeGroup];
  }
  objc_msgSend(v5, "setObject:forKey:", v56, CFSTR("news_widget_mode_group"));

LABEL_101:
  newsWidgetModeGroupId = self->_newsWidgetModeGroupId;
  if (newsWidgetModeGroupId)
    objc_msgSend(v5, "setObject:forKey:", newsWidgetModeGroupId, CFSTR("news_widget_mode_group_id"));
  v58 = self->_has;
  if ((*(_BYTE *)&v58 & 0x20) != 0)
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", self->_ageBracket);
    v72 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setObject:forKey:", v72, CFSTR("age_bracket"));

    v58 = self->_has;
    if ((*(_BYTE *)&v58 & 0x40) == 0)
    {
LABEL_105:
      if ((*(_WORD *)&v58 & 0x800) == 0)
        goto LABEL_106;
      goto LABEL_136;
    }
  }
  else if ((*(_BYTE *)&v58 & 0x40) == 0)
  {
    goto LABEL_105;
  }
  *(float *)&v4 = self->_ageBracketConfidenceLevel;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithFloat:", v4);
  v73 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKey:", v73, CFSTR("age_bracket_confidence_level"));

  v58 = self->_has;
  if ((*(_WORD *)&v58 & 0x800) == 0)
  {
LABEL_106:
    if ((*(_WORD *)&v58 & 0x1000) == 0)
      goto LABEL_107;
    goto LABEL_137;
  }
LABEL_136:
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", self->_gender);
  v74 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKey:", v74, CFSTR("gender"));

  v58 = self->_has;
  if ((*(_WORD *)&v58 & 0x1000) == 0)
  {
LABEL_107:
    if ((*(_WORD *)&v58 & 0x2000) == 0)
      goto LABEL_108;
    goto LABEL_138;
  }
LABEL_137:
  *(float *)&v4 = self->_genderConfidenceLevel;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithFloat:", v4);
  v75 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKey:", v75, CFSTR("gender_confidence_level"));

  v58 = self->_has;
  if ((*(_WORD *)&v58 & 0x2000) == 0)
  {
LABEL_108:
    if ((*(_WORD *)&v58 & 0x4000) == 0)
      goto LABEL_109;
    goto LABEL_139;
  }
LABEL_138:
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", self->_incomeBracket);
  v76 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKey:", v76, CFSTR("income_bracket"));

  v58 = self->_has;
  if ((*(_WORD *)&v58 & 0x4000) == 0)
  {
LABEL_109:
    if ((*(_WORD *)&v58 & 0x200) == 0)
      goto LABEL_110;
    goto LABEL_140;
  }
LABEL_139:
  *(float *)&v4 = self->_incomeBracketConfidenceLevel;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithFloat:", v4);
  v77 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKey:", v77, CFSTR("income_bracket_confidence_level"));

  v58 = self->_has;
  if ((*(_WORD *)&v58 & 0x200) == 0)
  {
LABEL_110:
    if ((*(_WORD *)&v58 & 0x400) == 0)
      goto LABEL_111;
    goto LABEL_141;
  }
LABEL_140:
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", self->_ethnicity);
  v78 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKey:", v78, CFSTR("ethnicity"));

  v58 = self->_has;
  if ((*(_WORD *)&v58 & 0x400) == 0)
  {
LABEL_111:
    if ((*(_BYTE *)&v58 & 2) == 0)
      goto LABEL_113;
    goto LABEL_112;
  }
LABEL_141:
  *(float *)&v4 = self->_ethnicityConfidenceLevel;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithFloat:", v4);
  v79 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKey:", v79, CFSTR("ethnicity_confidence_level"));

  if ((*(_QWORD *)&self->_has & 2) != 0)
  {
LABEL_112:
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithLongLong:", self->_appConfigTreatmentId);
    v59 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setObject:forKey:", v59, CFSTR("app_config_treatment_id"));

  }
LABEL_113:
  clientName = self->_clientName;
  if (clientName)
    objc_msgSend(v5, "setObject:forKey:", clientName, CFSTR("client_name"));
  clientVersion = self->_clientVersion;
  if (clientVersion)
    objc_msgSend(v5, "setObject:forKey:", clientVersion, CFSTR("client_version"));
  browserLanguage = self->_browserLanguage;
  if (browserLanguage)
    objc_msgSend(v5, "setObject:forKey:", browserLanguage, CFSTR("browser_language"));
  notwUserId = self->_notwUserId;
  if (notwUserId)
    objc_msgSend(v5, "setObject:forKey:", notwUserId, CFSTR("notw_user_id"));
  v64 = self->_has;
  if ((*(_QWORD *)&v64 & 0x8000000000) != 0)
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", self->_privateDataEncrypted);
    v65 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setObject:forKey:", v65, CFSTR("private_data_encrypted"));

    v64 = self->_has;
  }
  if ((*(_QWORD *)&v64 & 0x20000000000) != 0)
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", self->_progressivePersonalizationAllowed);
    v66 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setObject:forKey:", v66, CFSTR("progressive_personalization_allowed"));

  }
  watchSessionId = self->_watchSessionId;
  if (watchSessionId)
    objc_msgSend(v5, "setObject:forKey:", watchSessionId, CFSTR("watch_session_id"));
  sessionIdWatch = self->_sessionIdWatch;
  if (sessionIdWatch)
    objc_msgSend(v5, "setObject:forKey:", sessionIdWatch, CFSTR("session_id_watch"));
  widgetSessionId = self->_widgetSessionId;
  if (widgetSessionId)
    objc_msgSend(v5, "setObject:forKey:", widgetSessionId, CFSTR("widget_session_id"));
  if ((*((_BYTE *)&self->_has + 2) & 0x20) != 0)
  {
    widgetDisplayMode = self->_widgetDisplayMode;
    if (widgetDisplayMode >= 8)
    {
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("(unknown: %i)"), self->_widgetDisplayMode);
      v71 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v71 = off_24CD4F7F8[widgetDisplayMode];
    }
    objc_msgSend(v5, "setObject:forKey:", v71, CFSTR("widget_display_mode"));

  }
  personalizationPortraitVariantName = self->_personalizationPortraitVariantName;
  if (personalizationPortraitVariantName)
    objc_msgSend(v5, "setObject:forKey:", personalizationPortraitVariantName, CFSTR("personalization_portrait_variant_name"));
  appProcessLifetimeId = self->_appProcessLifetimeId;
  if (appProcessLifetimeId)
    objc_msgSend(v5, "setObject:forKey:", appProcessLifetimeId, CFSTR("app_process_lifetime_id"));
  if ((*(_BYTE *)&self->_has & 8) != 0)
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithLongLong:", self->_testBucket);
    v82 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setObject:forKey:", v82, CFSTR("test_bucket"));

  }
  widgetUserId = self->_widgetUserId;
  if (widgetUserId)
    objc_msgSend(v5, "setObject:forKey:", widgetUserId, CFSTR("widget_user_id"));
  productType = self->_productType;
  if (productType)
    objc_msgSend(v5, "setObject:forKey:", productType, CFSTR("product_type"));
  PBRepeatedInt64NSArray();
  v85 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKey:", v85, CFSTR("user_segmentation_treatment_ids"));

  PBRepeatedInt32NSArray();
  v86 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKey:", v86, CFSTR("user_segmentation_segment_set_ids"));

  v87 = self->_has;
  if ((*(_DWORD *)&v87 & 0x20000000) != 0)
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", self->_iosSettingsNotificationsSoundEnabled);
    v95 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setObject:forKey:", v95, CFSTR("ios_settings_notifications_sound_enabled"));

    v87 = self->_has;
    if ((*(_DWORD *)&v87 & 0x1000000) == 0)
    {
LABEL_157:
      if ((*(_DWORD *)&v87 & 0x10000000) == 0)
        goto LABEL_158;
      goto LABEL_178;
    }
  }
  else if ((*(_DWORD *)&v87 & 0x1000000) == 0)
  {
    goto LABEL_157;
  }
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", self->_iosSettingsNotificationsBadgeAppIconEnabled);
  v96 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKey:", v96, CFSTR("ios_settings_notifications_badge_app_icon_enabled"));

  v87 = self->_has;
  if ((*(_DWORD *)&v87 & 0x10000000) == 0)
  {
LABEL_158:
    if ((*(_DWORD *)&v87 & 0x8000000) == 0)
      goto LABEL_159;
    goto LABEL_179;
  }
LABEL_178:
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", self->_iosSettingsNotificationsShowOnLockScreenEnabled);
  v97 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKey:", v97, CFSTR("ios_settings_notifications_show_on_lock_screen_enabled"));

  v87 = self->_has;
  if ((*(_DWORD *)&v87 & 0x8000000) == 0)
  {
LABEL_159:
    if ((*(_DWORD *)&v87 & 0x4000000) == 0)
      goto LABEL_160;
    goto LABEL_180;
  }
LABEL_179:
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", self->_iosSettingsNotificationsShowInHistoryEnabled);
  v98 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKey:", v98, CFSTR("ios_settings_notifications_show_in_history_enabled"));

  v87 = self->_has;
  if ((*(_DWORD *)&v87 & 0x4000000) == 0)
  {
LABEL_160:
    if ((*(_DWORD *)&v87 & 0x400000) == 0)
      goto LABEL_161;
    goto LABEL_181;
  }
LABEL_180:
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", self->_iosSettingsNotificationsShowAsBannersEnabled);
  v99 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKey:", v99, CFSTR("ios_settings_notifications_show_as_banners_enabled"));

  v87 = self->_has;
  if ((*(_DWORD *)&v87 & 0x400000) == 0)
  {
LABEL_161:
    if ((*(_QWORD *)&v87 & 0x80000000000) == 0)
      goto LABEL_162;
    goto LABEL_188;
  }
LABEL_181:
  widgetDisplayModeSessionEnd = self->_widgetDisplayModeSessionEnd;
  if (widgetDisplayModeSessionEnd >= 8)
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("(unknown: %i)"), self->_widgetDisplayModeSessionEnd);
    v101 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v101 = off_24CD4F7F8[widgetDisplayModeSessionEnd];
  }
  objc_msgSend(v5, "setObject:forKey:", v101, CFSTR("widget_display_mode_session_end"));

  v87 = self->_has;
  if ((*(_QWORD *)&v87 & 0x80000000000) == 0)
  {
LABEL_162:
    if ((*(_QWORD *)&v87 & 0x1000000000) == 0)
      goto LABEL_163;
    goto LABEL_189;
  }
LABEL_188:
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", self->_signedIntoITunes);
  v104 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKey:", v104, CFSTR("signed_into_iTunes"));

  v87 = self->_has;
  if ((*(_QWORD *)&v87 & 0x1000000000) == 0)
  {
LABEL_163:
    if ((*(_DWORD *)&v87 & 0x40000000) == 0)
      goto LABEL_165;
    goto LABEL_164;
  }
LABEL_189:
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", self->_isStoreDemoModeEnabled);
  v105 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKey:", v105, CFSTR("is_store_demo_mode_enabled"));

  if ((*(_QWORD *)&self->_has & 0x40000000) != 0)
  {
LABEL_164:
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", self->_isDiagnosticsUsageEnabled);
    v88 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setObject:forKey:", v88, CFSTR("is_diagnostics_usage_enabled"));

  }
LABEL_165:
  regionIds = self->_regionIds;
  if (regionIds)
    objc_msgSend(v5, "setObject:forKey:", regionIds, CFSTR("region_ids"));
  appBuildNumber = self->_appBuildNumber;
  if (appBuildNumber)
    objc_msgSend(v5, "setObject:forKey:", appBuildNumber, CFSTR("app_build_number"));
  amsPurchaseId = self->_amsPurchaseId;
  if (amsPurchaseId)
    objc_msgSend(v5, "setObject:forKey:", amsPurchaseId, CFSTR("ams_purchase_id"));
  amsCampaignId = self->_amsCampaignId;
  if (amsCampaignId)
    objc_msgSend(v5, "setObject:forKey:", amsCampaignId, CFSTR("ams_campaign_id"));
  if ((*((_BYTE *)&self->_has + 2) & 2) != 0)
  {
    paywallConfigType = self->_paywallConfigType;
    if (paywallConfigType >= 5)
    {
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("(unknown: %i)"), self->_paywallConfigType);
      v94 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v94 = off_24CD4F838[paywallConfigType];
    }
    objc_msgSend(v5, "setObject:forKey:", v94, CFSTR("paywall_config_type"));

  }
  v102 = v5;

  return v102;
}

- (BOOL)readFrom:(id)a3
{
  return NTPBSessionReadFrom(self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4;
  $D75F02CFEA0A7AA1FE16F60BA2FB852A has;
  $D75F02CFEA0A7AA1FE16F60BA2FB852A v6;
  $D75F02CFEA0A7AA1FE16F60BA2FB852A v7;
  $D75F02CFEA0A7AA1FE16F60BA2FB852A v8;
  $D75F02CFEA0A7AA1FE16F60BA2FB852A v9;
  $D75F02CFEA0A7AA1FE16F60BA2FB852A v10;
  $D75F02CFEA0A7AA1FE16F60BA2FB852A v11;
  $D75F02CFEA0A7AA1FE16F60BA2FB852A v12;
  unint64_t v13;
  unint64_t v14;
  $D75F02CFEA0A7AA1FE16F60BA2FB852A v15;
  NSMutableArray *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _BYTE v25[128];
  uint64_t v26;

  v26 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  if (self->_deviceModel)
    PBDataWriterWriteStringField();
  if (self->_devicePlatform)
    PBDataWriterWriteStringField();
  if (self->_osVersion)
    PBDataWriterWriteStringField();
  if (self->_appVersion)
    PBDataWriterWriteStringField();
  has = self->_has;
  if ((*(_BYTE *)&has & 1) != 0)
  {
    PBDataWriterWriteInt64Field();
    has = self->_has;
  }
  if ((*(_DWORD *)&has & 0x100000) != 0)
    PBDataWriterWriteInt32Field();
  if (self->_countryCode)
    PBDataWriterWriteStringField();
  if (self->_languageCode)
    PBDataWriterWriteStringField();
  if (self->_carrier)
    PBDataWriterWriteStringField();
  v6 = self->_has;
  if ((*(_DWORD *)&v6 & 0x40000) != 0)
  {
    PBDataWriterWriteInt32Field();
    v6 = self->_has;
    if ((*(_WORD *)&v6 & 0x100) == 0)
    {
LABEL_21:
      if ((*(_DWORD *)&v6 & 0x80000) == 0)
        goto LABEL_23;
      goto LABEL_22;
    }
  }
  else if ((*(_WORD *)&v6 & 0x100) == 0)
  {
    goto LABEL_21;
  }
  PBDataWriterWriteInt32Field();
  if ((*(_QWORD *)&self->_has & 0x80000) != 0)
LABEL_22:
    PBDataWriterWriteInt32Field();
LABEL_23:
  if (self->_sessionId)
    PBDataWriterWriteDataField();
  if (self->_userId)
    PBDataWriterWriteStringField();
  if (self->_userStorefrontId)
    PBDataWriterWriteStringField();
  v7 = self->_has;
  if ((*(_DWORD *)&v7 & 0x80000000) != 0)
  {
    PBDataWriterWriteBOOLField();
    v7 = self->_has;
    if ((*(_BYTE *)&v7 & 0x10) == 0)
    {
LABEL_31:
      if ((*(_BYTE *)&v7 & 4) == 0)
        goto LABEL_32;
      goto LABEL_143;
    }
  }
  else if ((*(_BYTE *)&v7 & 0x10) == 0)
  {
    goto LABEL_31;
  }
  PBDataWriterWriteInt64Field();
  v7 = self->_has;
  if ((*(_BYTE *)&v7 & 4) == 0)
  {
LABEL_32:
    if ((*(_QWORD *)&v7 & 0x40000000000) == 0)
      goto LABEL_33;
    goto LABEL_144;
  }
LABEL_143:
  PBDataWriterWriteInt64Field();
  v7 = self->_has;
  if ((*(_QWORD *)&v7 & 0x40000000000) == 0)
  {
LABEL_33:
    if ((*(_QWORD *)&v7 & 0x200000000000) == 0)
      goto LABEL_35;
    goto LABEL_34;
  }
LABEL_144:
  PBDataWriterWriteBOOLField();
  if ((*(_QWORD *)&self->_has & 0x200000000000) != 0)
LABEL_34:
    PBDataWriterWriteBOOLField();
LABEL_35:
  if (self->_previousAppVersion)
    PBDataWriterWriteStringField();
  if (self->_previousOsVersion)
    PBDataWriterWriteStringField();
  v8 = self->_has;
  if ((*(_QWORD *)&v8 & 0x100000000000) != 0)
  {
    PBDataWriterWriteBOOLField();
    v8 = self->_has;
  }
  if ((*(_DWORD *)&v8 & 0x10000) != 0)
    PBDataWriterWriteInt32Field();
  if (self->_campaignId)
    PBDataWriterWriteStringField();
  v9 = self->_has;
  if ((*(_BYTE *)&v9 & 0x80) != 0)
  {
    PBDataWriterWriteInt32Field();
    v9 = self->_has;
    if ((*(_QWORD *)&v9 & 0x10000000000) == 0)
    {
LABEL_47:
      if ((*(_QWORD *)&v9 & 0x100000000) == 0)
        goto LABEL_48;
      goto LABEL_148;
    }
  }
  else if ((*(_QWORD *)&v9 & 0x10000000000) == 0)
  {
    goto LABEL_47;
  }
  PBDataWriterWriteBOOLField();
  v9 = self->_has;
  if ((*(_QWORD *)&v9 & 0x100000000) == 0)
  {
LABEL_48:
    if ((*(_QWORD *)&v9 & 0x400000000) == 0)
      goto LABEL_49;
    goto LABEL_149;
  }
LABEL_148:
  PBDataWriterWriteBOOLField();
  v9 = self->_has;
  if ((*(_QWORD *)&v9 & 0x400000000) == 0)
  {
LABEL_49:
    if ((*(_QWORD *)&v9 & 0x200000000) == 0)
      goto LABEL_50;
    goto LABEL_150;
  }
LABEL_149:
  PBDataWriterWriteBOOLField();
  v9 = self->_has;
  if ((*(_QWORD *)&v9 & 0x200000000) == 0)
  {
LABEL_50:
    if ((*(_QWORD *)&v9 & 0x800000000) == 0)
      goto LABEL_51;
    goto LABEL_151;
  }
LABEL_150:
  PBDataWriterWriteBOOLField();
  v9 = self->_has;
  if ((*(_QWORD *)&v9 & 0x800000000) == 0)
  {
LABEL_51:
    if ((*(_QWORD *)&v9 & 0x4000000000) == 0)
      goto LABEL_53;
    goto LABEL_52;
  }
LABEL_151:
  PBDataWriterWriteBOOLField();
  if ((*(_QWORD *)&self->_has & 0x4000000000) != 0)
LABEL_52:
    PBDataWriterWriteBOOLField();
LABEL_53:
  if (self->_originatingCampaignId)
    PBDataWriterWriteStringField();
  if (self->_originatingCampaignType)
    PBDataWriterWriteStringField();
  if (self->_originatingCreativeId)
    PBDataWriterWriteStringField();
  v10 = self->_has;
  if ((*(_DWORD *)&v10 & 0x2000000) != 0)
  {
    PBDataWriterWriteBOOLField();
    v10 = self->_has;
    if ((*(_DWORD *)&v10 & 0x800000) == 0)
    {
LABEL_61:
      if ((*(_QWORD *)&v10 & 0x2000000000) == 0)
        goto LABEL_62;
      goto LABEL_155;
    }
  }
  else if ((*(_DWORD *)&v10 & 0x800000) == 0)
  {
    goto LABEL_61;
  }
  PBDataWriterWriteInt32Field();
  v10 = self->_has;
  if ((*(_QWORD *)&v10 & 0x2000000000) == 0)
  {
LABEL_62:
    if ((*(_WORD *)&v10 & 0x8000) == 0)
      goto LABEL_64;
    goto LABEL_63;
  }
LABEL_155:
  PBDataWriterWriteBOOLField();
  if ((*(_QWORD *)&self->_has & 0x8000) != 0)
LABEL_63:
    PBDataWriterWriteInt32Field();
LABEL_64:
  if (self->_newsWidgetModeGroupId)
    PBDataWriterWriteStringField();
  v11 = self->_has;
  if ((*(_BYTE *)&v11 & 0x20) != 0)
  {
    PBDataWriterWriteInt32Field();
    v11 = self->_has;
    if ((*(_BYTE *)&v11 & 0x40) == 0)
    {
LABEL_68:
      if ((*(_WORD *)&v11 & 0x800) == 0)
        goto LABEL_69;
      goto LABEL_159;
    }
  }
  else if ((*(_BYTE *)&v11 & 0x40) == 0)
  {
    goto LABEL_68;
  }
  PBDataWriterWriteFloatField();
  v11 = self->_has;
  if ((*(_WORD *)&v11 & 0x800) == 0)
  {
LABEL_69:
    if ((*(_WORD *)&v11 & 0x1000) == 0)
      goto LABEL_70;
    goto LABEL_160;
  }
LABEL_159:
  PBDataWriterWriteInt32Field();
  v11 = self->_has;
  if ((*(_WORD *)&v11 & 0x1000) == 0)
  {
LABEL_70:
    if ((*(_WORD *)&v11 & 0x2000) == 0)
      goto LABEL_71;
    goto LABEL_161;
  }
LABEL_160:
  PBDataWriterWriteFloatField();
  v11 = self->_has;
  if ((*(_WORD *)&v11 & 0x2000) == 0)
  {
LABEL_71:
    if ((*(_WORD *)&v11 & 0x4000) == 0)
      goto LABEL_72;
    goto LABEL_162;
  }
LABEL_161:
  PBDataWriterWriteInt32Field();
  v11 = self->_has;
  if ((*(_WORD *)&v11 & 0x4000) == 0)
  {
LABEL_72:
    if ((*(_WORD *)&v11 & 0x200) == 0)
      goto LABEL_73;
    goto LABEL_163;
  }
LABEL_162:
  PBDataWriterWriteFloatField();
  v11 = self->_has;
  if ((*(_WORD *)&v11 & 0x200) == 0)
  {
LABEL_73:
    if ((*(_WORD *)&v11 & 0x400) == 0)
      goto LABEL_74;
    goto LABEL_164;
  }
LABEL_163:
  PBDataWriterWriteInt32Field();
  v11 = self->_has;
  if ((*(_WORD *)&v11 & 0x400) == 0)
  {
LABEL_74:
    if ((*(_BYTE *)&v11 & 2) == 0)
      goto LABEL_76;
    goto LABEL_75;
  }
LABEL_164:
  PBDataWriterWriteFloatField();
  if ((*(_QWORD *)&self->_has & 2) != 0)
LABEL_75:
    PBDataWriterWriteInt64Field();
LABEL_76:
  if (self->_clientName)
    PBDataWriterWriteStringField();
  if (self->_clientVersion)
    PBDataWriterWriteStringField();
  if (self->_browserLanguage)
    PBDataWriterWriteStringField();
  if (self->_notwUserId)
    PBDataWriterWriteStringField();
  v12 = self->_has;
  if ((*(_QWORD *)&v12 & 0x8000000000) != 0)
  {
    PBDataWriterWriteBOOLField();
    v12 = self->_has;
  }
  if ((*(_QWORD *)&v12 & 0x20000000000) != 0)
    PBDataWriterWriteBOOLField();
  if (self->_watchSessionId)
    PBDataWriterWriteStringField();
  if (self->_sessionIdWatch)
    PBDataWriterWriteDataField();
  if (self->_widgetSessionId)
    PBDataWriterWriteDataField();
  if ((*((_BYTE *)&self->_has + 2) & 0x20) != 0)
    PBDataWriterWriteInt32Field();
  if (self->_personalizationPortraitVariantName)
    PBDataWriterWriteStringField();
  if (self->_appProcessLifetimeId)
    PBDataWriterWriteDataField();
  if ((*(_BYTE *)&self->_has & 8) != 0)
    PBDataWriterWriteInt64Field();
  if (self->_widgetUserId)
    PBDataWriterWriteStringField();
  if (self->_productType)
    PBDataWriterWriteStringField();
  if (self->_userSegmentationTreatmentIds.count)
  {
    v13 = 0;
    do
    {
      PBDataWriterWriteInt64Field();
      ++v13;
    }
    while (v13 < self->_userSegmentationTreatmentIds.count);
  }
  if (self->_userSegmentationSegmentSetIds.count)
  {
    v14 = 0;
    do
    {
      PBDataWriterWriteInt32Field();
      ++v14;
    }
    while (v14 < self->_userSegmentationSegmentSetIds.count);
  }
  v15 = self->_has;
  if ((*(_DWORD *)&v15 & 0x20000000) != 0)
  {
    PBDataWriterWriteBOOLField();
    v15 = self->_has;
    if ((*(_DWORD *)&v15 & 0x1000000) == 0)
    {
LABEL_114:
      if ((*(_DWORD *)&v15 & 0x10000000) == 0)
        goto LABEL_115;
      goto LABEL_168;
    }
  }
  else if ((*(_DWORD *)&v15 & 0x1000000) == 0)
  {
    goto LABEL_114;
  }
  PBDataWriterWriteBOOLField();
  v15 = self->_has;
  if ((*(_DWORD *)&v15 & 0x10000000) == 0)
  {
LABEL_115:
    if ((*(_DWORD *)&v15 & 0x8000000) == 0)
      goto LABEL_116;
    goto LABEL_169;
  }
LABEL_168:
  PBDataWriterWriteBOOLField();
  v15 = self->_has;
  if ((*(_DWORD *)&v15 & 0x8000000) == 0)
  {
LABEL_116:
    if ((*(_DWORD *)&v15 & 0x4000000) == 0)
      goto LABEL_117;
    goto LABEL_170;
  }
LABEL_169:
  PBDataWriterWriteBOOLField();
  v15 = self->_has;
  if ((*(_DWORD *)&v15 & 0x4000000) == 0)
  {
LABEL_117:
    if ((*(_DWORD *)&v15 & 0x400000) == 0)
      goto LABEL_118;
    goto LABEL_171;
  }
LABEL_170:
  PBDataWriterWriteBOOLField();
  v15 = self->_has;
  if ((*(_DWORD *)&v15 & 0x400000) == 0)
  {
LABEL_118:
    if ((*(_QWORD *)&v15 & 0x80000000000) == 0)
      goto LABEL_119;
    goto LABEL_172;
  }
LABEL_171:
  PBDataWriterWriteInt32Field();
  v15 = self->_has;
  if ((*(_QWORD *)&v15 & 0x80000000000) == 0)
  {
LABEL_119:
    if ((*(_QWORD *)&v15 & 0x1000000000) == 0)
      goto LABEL_120;
    goto LABEL_173;
  }
LABEL_172:
  PBDataWriterWriteBOOLField();
  v15 = self->_has;
  if ((*(_QWORD *)&v15 & 0x1000000000) == 0)
  {
LABEL_120:
    if ((*(_DWORD *)&v15 & 0x40000000) == 0)
      goto LABEL_122;
    goto LABEL_121;
  }
LABEL_173:
  PBDataWriterWriteBOOLField();
  if ((*(_QWORD *)&self->_has & 0x40000000) != 0)
LABEL_121:
    PBDataWriterWriteBOOLField();
LABEL_122:
  v23 = 0u;
  v24 = 0u;
  v21 = 0u;
  v22 = 0u;
  v16 = self->_regionIds;
  v17 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v16, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
  if (v17)
  {
    v18 = v17;
    v19 = *(_QWORD *)v22;
    do
    {
      v20 = 0;
      do
      {
        if (*(_QWORD *)v22 != v19)
          objc_enumerationMutation(v16);
        PBDataWriterWriteStringField();
        ++v20;
      }
      while (v18 != v20);
      v18 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v16, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
    }
    while (v18);
  }

  if (self->_appBuildNumber)
    PBDataWriterWriteStringField();
  if (self->_amsPurchaseId)
    PBDataWriterWriteStringField();
  if (self->_amsCampaignId)
    PBDataWriterWriteStringField();
  if ((*((_BYTE *)&self->_has + 2) & 2) != 0)
    PBDataWriterWriteInt32Field();

}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  void *v13;
  $D75F02CFEA0A7AA1FE16F60BA2FB852A has;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  void *v20;
  $D75F02CFEA0A7AA1FE16F60BA2FB852A v21;
  uint64_t v22;
  void *v23;
  uint64_t v24;
  void *v25;
  uint64_t v26;
  void *v27;
  $D75F02CFEA0A7AA1FE16F60BA2FB852A v28;
  uint64_t v29;
  void *v30;
  uint64_t v31;
  void *v32;
  $D75F02CFEA0A7AA1FE16F60BA2FB852A v33;
  uint64_t v34;
  void *v35;
  $D75F02CFEA0A7AA1FE16F60BA2FB852A v36;
  uint64_t v37;
  void *v38;
  uint64_t v39;
  void *v40;
  uint64_t v41;
  void *v42;
  $D75F02CFEA0A7AA1FE16F60BA2FB852A v43;
  uint64_t v44;
  void *v45;
  $D75F02CFEA0A7AA1FE16F60BA2FB852A v46;
  uint64_t v47;
  void *v48;
  uint64_t v49;
  void *v50;
  uint64_t v51;
  void *v52;
  uint64_t v53;
  void *v54;
  $D75F02CFEA0A7AA1FE16F60BA2FB852A v55;
  uint64_t v56;
  void *v57;
  uint64_t v58;
  void *v59;
  uint64_t v60;
  void *v61;
  uint64_t v62;
  void *v63;
  uint64_t v64;
  void *v65;
  uint64_t v66;
  void *v67;
  uint64_t v68;
  void *v69;
  $D75F02CFEA0A7AA1FE16F60BA2FB852A v70;
  NSMutableArray *v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t v74;
  uint64_t v75;
  void *v76;
  uint64_t v77;
  void *v78;
  uint64_t v79;
  void *v80;
  uint64_t v81;
  void *v82;
  id v83;
  __int128 v85;
  __int128 v86;
  __int128 v87;
  __int128 v88;
  _BYTE v89[128];
  uint64_t v90;

  v90 = *MEMORY[0x24BDAC8D0];
  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = -[NSString copyWithZone:](self->_deviceModel, "copyWithZone:", a3);
  v7 = *(void **)(v5 + 208);
  *(_QWORD *)(v5 + 208) = v6;

  v8 = -[NSString copyWithZone:](self->_devicePlatform, "copyWithZone:", a3);
  v9 = *(void **)(v5 + 216);
  *(_QWORD *)(v5 + 216) = v8;

  v10 = -[NSString copyWithZone:](self->_osVersion, "copyWithZone:", a3);
  v11 = *(void **)(v5 + 312);
  *(_QWORD *)(v5 + 312) = v10;

  v12 = -[NSString copyWithZone:](self->_appVersion, "copyWithZone:", a3);
  v13 = *(void **)(v5 + 136);
  *(_QWORD *)(v5 + 136) = v12;

  has = self->_has;
  if ((*(_BYTE *)&has & 1) != 0)
  {
    *(_QWORD *)(v5 + 56) = self->_appBuild;
    *(_QWORD *)(v5 + 488) |= 1uLL;
    has = self->_has;
  }
  if ((*(_DWORD *)&has & 0x100000) != 0)
  {
    *(_DWORD *)(v5 + 416) = self->_utcOffset;
    *(_QWORD *)(v5 + 488) |= 0x100000uLL;
  }
  v15 = -[NSString copyWithZone:](self->_countryCode, "copyWithZone:", a3);
  v16 = *(void **)(v5 + 200);
  *(_QWORD *)(v5 + 200) = v15;

  v17 = -[NSString copyWithZone:](self->_languageCode, "copyWithZone:", a3);
  v18 = *(void **)(v5 + 248);
  *(_QWORD *)(v5 + 248) = v17;

  v19 = -[NSString copyWithZone:](self->_carrier, "copyWithZone:", a3);
  v20 = *(void **)(v5 + 168);
  *(_QWORD *)(v5 + 168) = v19;

  v21 = self->_has;
  if ((*(_DWORD *)&v21 & 0x40000) != 0)
  {
    *(_DWORD *)(v5 + 360) = self->_reachabilityStatus;
    *(_QWORD *)(v5 + 488) |= 0x40000uLL;
    v21 = self->_has;
    if ((*(_WORD *)&v21 & 0x100) == 0)
    {
LABEL_7:
      if ((*(_DWORD *)&v21 & 0x80000) == 0)
        goto LABEL_9;
      goto LABEL_8;
    }
  }
  else if ((*(_WORD *)&v21 & 0x100) == 0)
  {
    goto LABEL_7;
  }
  *(_DWORD *)(v5 + 176) = self->_cellularRadioAccessTechnology;
  *(_QWORD *)(v5 + 488) |= 0x100uLL;
  if ((*(_QWORD *)&self->_has & 0x80000) != 0)
  {
LABEL_8:
    *(_DWORD *)(v5 + 392) = self->_textSize;
    *(_QWORD *)(v5 + 488) |= 0x80000uLL;
  }
LABEL_9:
  v22 = -[NSData copyWithZone:](self->_sessionId, "copyWithZone:", a3);
  v23 = *(void **)(v5 + 376);
  *(_QWORD *)(v5 + 376) = v22;

  v24 = -[NSString copyWithZone:](self->_userId, "copyWithZone:", a3);
  v25 = *(void **)(v5 + 400);
  *(_QWORD *)(v5 + 400) = v24;

  v26 = -[NSString copyWithZone:](self->_userStorefrontId, "copyWithZone:", a3);
  v27 = *(void **)(v5 + 408);
  *(_QWORD *)(v5 + 408) = v26;

  v28 = self->_has;
  if ((*(_DWORD *)&v28 & 0x80000000) != 0)
  {
    *(_BYTE *)(v5 + 471) = self->_isNewUser;
    *(_QWORD *)(v5 + 488) |= 0x80000000uLL;
    v28 = self->_has;
    if ((*(_BYTE *)&v28 & 0x10) == 0)
    {
LABEL_11:
      if ((*(_BYTE *)&v28 & 4) == 0)
        goto LABEL_12;
      goto LABEL_75;
    }
  }
  else if ((*(_BYTE *)&v28 & 0x10) == 0)
  {
    goto LABEL_11;
  }
  *(_QWORD *)(v5 + 88) = self->_userStartDate;
  *(_QWORD *)(v5 + 488) |= 0x10uLL;
  v28 = self->_has;
  if ((*(_BYTE *)&v28 & 4) == 0)
  {
LABEL_12:
    if ((*(_QWORD *)&v28 & 0x40000000000) == 0)
      goto LABEL_13;
    goto LABEL_76;
  }
LABEL_75:
  *(_QWORD *)(v5 + 72) = self->_lastAppOpenDate;
  *(_QWORD *)(v5 + 488) |= 4uLL;
  v28 = self->_has;
  if ((*(_QWORD *)&v28 & 0x40000000000) == 0)
  {
LABEL_13:
    if ((*(_QWORD *)&v28 & 0x200000000000) == 0)
      goto LABEL_15;
    goto LABEL_14;
  }
LABEL_76:
  *(_BYTE *)(v5 + 482) = self->_runningObsolete;
  *(_QWORD *)(v5 + 488) |= 0x40000000000uLL;
  if ((*(_QWORD *)&self->_has & 0x200000000000) != 0)
  {
LABEL_14:
    *(_BYTE *)(v5 + 485) = self->_upgradedFromObsolete;
    *(_QWORD *)(v5 + 488) |= 0x200000000000uLL;
  }
LABEL_15:
  v29 = -[NSString copyWithZone:](self->_previousAppVersion, "copyWithZone:", a3);
  v30 = *(void **)(v5 + 336);
  *(_QWORD *)(v5 + 336) = v29;

  v31 = -[NSString copyWithZone:](self->_previousOsVersion, "copyWithZone:", a3);
  v32 = *(void **)(v5 + 344);
  *(_QWORD *)(v5 + 344) = v31;

  v33 = self->_has;
  if ((*(_QWORD *)&v33 & 0x100000000000) != 0)
  {
    *(_BYTE *)(v5 + 484) = self->_signedIntoIcloud;
    *(_QWORD *)(v5 + 488) |= 0x100000000000uLL;
    v33 = self->_has;
  }
  if ((*(_DWORD *)&v33 & 0x10000) != 0)
  {
    *(_DWORD *)(v5 + 304) = self->_osInstallVariant;
    *(_QWORD *)(v5 + 488) |= 0x10000uLL;
  }
  v34 = -[NSString copyWithZone:](self->_campaignId, "copyWithZone:", a3);
  v35 = *(void **)(v5 + 152);
  *(_QWORD *)(v5 + 152) = v34;

  v36 = self->_has;
  if ((*(_BYTE *)&v36 & 0x80) != 0)
  {
    *(_DWORD *)(v5 + 160) = self->_campaignType;
    *(_QWORD *)(v5 + 488) |= 0x80uLL;
    v36 = self->_has;
    if ((*(_QWORD *)&v36 & 0x10000000000) == 0)
    {
LABEL_21:
      if ((*(_QWORD *)&v36 & 0x100000000) == 0)
        goto LABEL_22;
      goto LABEL_80;
    }
  }
  else if ((*(_QWORD *)&v36 & 0x10000000000) == 0)
  {
    goto LABEL_21;
  }
  *(_BYTE *)(v5 + 480) = self->_privateDataSyncOn;
  *(_QWORD *)(v5 + 488) |= 0x10000000000uLL;
  v36 = self->_has;
  if ((*(_QWORD *)&v36 & 0x100000000) == 0)
  {
LABEL_22:
    if ((*(_QWORD *)&v36 & 0x400000000) == 0)
      goto LABEL_23;
    goto LABEL_81;
  }
LABEL_80:
  *(_BYTE *)(v5 + 472) = self->_isPaidSubscriber;
  *(_QWORD *)(v5 + 488) |= 0x100000000uLL;
  v36 = self->_has;
  if ((*(_QWORD *)&v36 & 0x400000000) == 0)
  {
LABEL_23:
    if ((*(_QWORD *)&v36 & 0x200000000) == 0)
      goto LABEL_24;
    goto LABEL_82;
  }
LABEL_81:
  *(_BYTE *)(v5 + 474) = self->_isPaidSubscriberFromNews;
  *(_QWORD *)(v5 + 488) |= 0x400000000uLL;
  v36 = self->_has;
  if ((*(_QWORD *)&v36 & 0x200000000) == 0)
  {
LABEL_24:
    if ((*(_QWORD *)&v36 & 0x800000000) == 0)
      goto LABEL_25;
    goto LABEL_83;
  }
LABEL_82:
  *(_BYTE *)(v5 + 473) = self->_isPaidSubscriberFromAppStore;
  *(_QWORD *)(v5 + 488) |= 0x200000000uLL;
  v36 = self->_has;
  if ((*(_QWORD *)&v36 & 0x800000000) == 0)
  {
LABEL_25:
    if ((*(_QWORD *)&v36 & 0x4000000000) == 0)
      goto LABEL_27;
    goto LABEL_26;
  }
LABEL_83:
  *(_BYTE *)(v5 + 475) = self->_isPaidSubscriberFromThirdParty;
  *(_QWORD *)(v5 + 488) |= 0x800000000uLL;
  if ((*(_QWORD *)&self->_has & 0x4000000000) != 0)
  {
LABEL_26:
    *(_BYTE *)(v5 + 478) = self->_notificationsEnabled;
    *(_QWORD *)(v5 + 488) |= 0x4000000000uLL;
  }
LABEL_27:
  v37 = -[NSString copyWithZone:](self->_originatingCampaignId, "copyWithZone:", a3);
  v38 = *(void **)(v5 + 280);
  *(_QWORD *)(v5 + 280) = v37;

  v39 = -[NSString copyWithZone:](self->_originatingCampaignType, "copyWithZone:", a3);
  v40 = *(void **)(v5 + 288);
  *(_QWORD *)(v5 + 288) = v39;

  v41 = -[NSString copyWithZone:](self->_originatingCreativeId, "copyWithZone:", a3);
  v42 = *(void **)(v5 + 296);
  *(_QWORD *)(v5 + 296) = v41;

  v43 = self->_has;
  if ((*(_DWORD *)&v43 & 0x2000000) != 0)
  {
    *(_BYTE *)(v5 + 465) = self->_iosSettingsNotificationsEnabled;
    *(_QWORD *)(v5 + 488) |= 0x2000000uLL;
    v43 = self->_has;
    if ((*(_DWORD *)&v43 & 0x800000) == 0)
    {
LABEL_29:
      if ((*(_QWORD *)&v43 & 0x2000000000) == 0)
        goto LABEL_30;
      goto LABEL_87;
    }
  }
  else if ((*(_DWORD *)&v43 & 0x800000) == 0)
  {
    goto LABEL_29;
  }
  *(_DWORD *)(v5 + 440) = self->_widgetModeType;
  *(_QWORD *)(v5 + 488) |= 0x800000uLL;
  v43 = self->_has;
  if ((*(_QWORD *)&v43 & 0x2000000000) == 0)
  {
LABEL_30:
    if ((*(_WORD *)&v43 & 0x8000) == 0)
      goto LABEL_32;
    goto LABEL_31;
  }
LABEL_87:
  *(_BYTE *)(v5 + 477) = self->_locationPermissionGranted;
  *(_QWORD *)(v5 + 488) |= 0x2000000000uLL;
  if ((*(_QWORD *)&self->_has & 0x8000) != 0)
  {
LABEL_31:
    *(_DWORD *)(v5 + 256) = self->_newsWidgetModeGroup;
    *(_QWORD *)(v5 + 488) |= 0x8000uLL;
  }
LABEL_32:
  v44 = -[NSString copyWithZone:](self->_newsWidgetModeGroupId, "copyWithZone:", a3);
  v45 = *(void **)(v5 + 264);
  *(_QWORD *)(v5 + 264) = v44;

  v46 = self->_has;
  if ((*(_BYTE *)&v46 & 0x20) != 0)
  {
    *(_DWORD *)(v5 + 96) = self->_ageBracket;
    *(_QWORD *)(v5 + 488) |= 0x20uLL;
    v46 = self->_has;
    if ((*(_BYTE *)&v46 & 0x40) == 0)
    {
LABEL_34:
      if ((*(_WORD *)&v46 & 0x800) == 0)
        goto LABEL_35;
      goto LABEL_91;
    }
  }
  else if ((*(_BYTE *)&v46 & 0x40) == 0)
  {
    goto LABEL_34;
  }
  *(float *)(v5 + 100) = self->_ageBracketConfidenceLevel;
  *(_QWORD *)(v5 + 488) |= 0x40uLL;
  v46 = self->_has;
  if ((*(_WORD *)&v46 & 0x800) == 0)
  {
LABEL_35:
    if ((*(_WORD *)&v46 & 0x1000) == 0)
      goto LABEL_36;
    goto LABEL_92;
  }
LABEL_91:
  *(_DWORD *)(v5 + 232) = self->_gender;
  *(_QWORD *)(v5 + 488) |= 0x800uLL;
  v46 = self->_has;
  if ((*(_WORD *)&v46 & 0x1000) == 0)
  {
LABEL_36:
    if ((*(_WORD *)&v46 & 0x2000) == 0)
      goto LABEL_37;
    goto LABEL_93;
  }
LABEL_92:
  *(float *)(v5 + 236) = self->_genderConfidenceLevel;
  *(_QWORD *)(v5 + 488) |= 0x1000uLL;
  v46 = self->_has;
  if ((*(_WORD *)&v46 & 0x2000) == 0)
  {
LABEL_37:
    if ((*(_WORD *)&v46 & 0x4000) == 0)
      goto LABEL_38;
    goto LABEL_94;
  }
LABEL_93:
  *(_DWORD *)(v5 + 240) = self->_incomeBracket;
  *(_QWORD *)(v5 + 488) |= 0x2000uLL;
  v46 = self->_has;
  if ((*(_WORD *)&v46 & 0x4000) == 0)
  {
LABEL_38:
    if ((*(_WORD *)&v46 & 0x200) == 0)
      goto LABEL_39;
    goto LABEL_95;
  }
LABEL_94:
  *(float *)(v5 + 244) = self->_incomeBracketConfidenceLevel;
  *(_QWORD *)(v5 + 488) |= 0x4000uLL;
  v46 = self->_has;
  if ((*(_WORD *)&v46 & 0x200) == 0)
  {
LABEL_39:
    if ((*(_WORD *)&v46 & 0x400) == 0)
      goto LABEL_40;
    goto LABEL_96;
  }
LABEL_95:
  *(_DWORD *)(v5 + 224) = self->_ethnicity;
  *(_QWORD *)(v5 + 488) |= 0x200uLL;
  v46 = self->_has;
  if ((*(_WORD *)&v46 & 0x400) == 0)
  {
LABEL_40:
    if ((*(_BYTE *)&v46 & 2) == 0)
      goto LABEL_42;
    goto LABEL_41;
  }
LABEL_96:
  *(float *)(v5 + 228) = self->_ethnicityConfidenceLevel;
  *(_QWORD *)(v5 + 488) |= 0x400uLL;
  if ((*(_QWORD *)&self->_has & 2) != 0)
  {
LABEL_41:
    *(_QWORD *)(v5 + 64) = self->_appConfigTreatmentId;
    *(_QWORD *)(v5 + 488) |= 2uLL;
  }
LABEL_42:
  v47 = -[NSString copyWithZone:](self->_clientName, "copyWithZone:", a3);
  v48 = *(void **)(v5 + 184);
  *(_QWORD *)(v5 + 184) = v47;

  v49 = -[NSString copyWithZone:](self->_clientVersion, "copyWithZone:", a3);
  v50 = *(void **)(v5 + 192);
  *(_QWORD *)(v5 + 192) = v49;

  v51 = -[NSString copyWithZone:](self->_browserLanguage, "copyWithZone:", a3);
  v52 = *(void **)(v5 + 144);
  *(_QWORD *)(v5 + 144) = v51;

  v53 = -[NSString copyWithZone:](self->_notwUserId, "copyWithZone:", a3);
  v54 = *(void **)(v5 + 272);
  *(_QWORD *)(v5 + 272) = v53;

  v55 = self->_has;
  if ((*(_QWORD *)&v55 & 0x8000000000) != 0)
  {
    *(_BYTE *)(v5 + 479) = self->_privateDataEncrypted;
    *(_QWORD *)(v5 + 488) |= 0x8000000000uLL;
    v55 = self->_has;
  }
  if ((*(_QWORD *)&v55 & 0x20000000000) != 0)
  {
    *(_BYTE *)(v5 + 481) = self->_progressivePersonalizationAllowed;
    *(_QWORD *)(v5 + 488) |= 0x20000000000uLL;
  }
  v56 = -[NSString copyWithZone:](self->_watchSessionId, "copyWithZone:", a3);
  v57 = *(void **)(v5 + 424);
  *(_QWORD *)(v5 + 424) = v56;

  v58 = -[NSData copyWithZone:](self->_sessionIdWatch, "copyWithZone:", a3);
  v59 = *(void **)(v5 + 384);
  *(_QWORD *)(v5 + 384) = v58;

  v60 = -[NSData copyWithZone:](self->_widgetSessionId, "copyWithZone:", a3);
  v61 = *(void **)(v5 + 448);
  *(_QWORD *)(v5 + 448) = v60;

  if ((*((_BYTE *)&self->_has + 2) & 0x20) != 0)
  {
    *(_DWORD *)(v5 + 432) = self->_widgetDisplayMode;
    *(_QWORD *)(v5 + 488) |= 0x200000uLL;
  }
  v62 = -[NSString copyWithZone:](self->_personalizationPortraitVariantName, "copyWithZone:", a3);
  v63 = *(void **)(v5 + 328);
  *(_QWORD *)(v5 + 328) = v62;

  v64 = -[NSData copyWithZone:](self->_appProcessLifetimeId, "copyWithZone:", a3);
  v65 = *(void **)(v5 + 128);
  *(_QWORD *)(v5 + 128) = v64;

  if ((*(_BYTE *)&self->_has & 8) != 0)
  {
    *(_QWORD *)(v5 + 80) = self->_testBucket;
    *(_QWORD *)(v5 + 488) |= 8uLL;
  }
  v66 = -[NSString copyWithZone:](self->_widgetUserId, "copyWithZone:", a3);
  v67 = *(void **)(v5 + 456);
  *(_QWORD *)(v5 + 456) = v66;

  v68 = -[NSString copyWithZone:](self->_productType, "copyWithZone:", a3);
  v69 = *(void **)(v5 + 352);
  *(_QWORD *)(v5 + 352) = v68;

  PBRepeatedInt64Copy();
  PBRepeatedInt32Copy();
  v70 = self->_has;
  if ((*(_DWORD *)&v70 & 0x20000000) != 0)
  {
    *(_BYTE *)(v5 + 469) = self->_iosSettingsNotificationsSoundEnabled;
    *(_QWORD *)(v5 + 488) |= 0x20000000uLL;
    v70 = self->_has;
    if ((*(_DWORD *)&v70 & 0x1000000) == 0)
    {
LABEL_52:
      if ((*(_DWORD *)&v70 & 0x10000000) == 0)
        goto LABEL_53;
      goto LABEL_100;
    }
  }
  else if ((*(_DWORD *)&v70 & 0x1000000) == 0)
  {
    goto LABEL_52;
  }
  *(_BYTE *)(v5 + 464) = self->_iosSettingsNotificationsBadgeAppIconEnabled;
  *(_QWORD *)(v5 + 488) |= 0x1000000uLL;
  v70 = self->_has;
  if ((*(_DWORD *)&v70 & 0x10000000) == 0)
  {
LABEL_53:
    if ((*(_DWORD *)&v70 & 0x8000000) == 0)
      goto LABEL_54;
    goto LABEL_101;
  }
LABEL_100:
  *(_BYTE *)(v5 + 468) = self->_iosSettingsNotificationsShowOnLockScreenEnabled;
  *(_QWORD *)(v5 + 488) |= 0x10000000uLL;
  v70 = self->_has;
  if ((*(_DWORD *)&v70 & 0x8000000) == 0)
  {
LABEL_54:
    if ((*(_DWORD *)&v70 & 0x4000000) == 0)
      goto LABEL_55;
    goto LABEL_102;
  }
LABEL_101:
  *(_BYTE *)(v5 + 467) = self->_iosSettingsNotificationsShowInHistoryEnabled;
  *(_QWORD *)(v5 + 488) |= 0x8000000uLL;
  v70 = self->_has;
  if ((*(_DWORD *)&v70 & 0x4000000) == 0)
  {
LABEL_55:
    if ((*(_DWORD *)&v70 & 0x400000) == 0)
      goto LABEL_56;
    goto LABEL_103;
  }
LABEL_102:
  *(_BYTE *)(v5 + 466) = self->_iosSettingsNotificationsShowAsBannersEnabled;
  *(_QWORD *)(v5 + 488) |= 0x4000000uLL;
  v70 = self->_has;
  if ((*(_DWORD *)&v70 & 0x400000) == 0)
  {
LABEL_56:
    if ((*(_QWORD *)&v70 & 0x80000000000) == 0)
      goto LABEL_57;
    goto LABEL_104;
  }
LABEL_103:
  *(_DWORD *)(v5 + 436) = self->_widgetDisplayModeSessionEnd;
  *(_QWORD *)(v5 + 488) |= 0x400000uLL;
  v70 = self->_has;
  if ((*(_QWORD *)&v70 & 0x80000000000) == 0)
  {
LABEL_57:
    if ((*(_QWORD *)&v70 & 0x1000000000) == 0)
      goto LABEL_58;
    goto LABEL_105;
  }
LABEL_104:
  *(_BYTE *)(v5 + 483) = self->_signedIntoITunes;
  *(_QWORD *)(v5 + 488) |= 0x80000000000uLL;
  v70 = self->_has;
  if ((*(_QWORD *)&v70 & 0x1000000000) == 0)
  {
LABEL_58:
    if ((*(_DWORD *)&v70 & 0x40000000) == 0)
      goto LABEL_60;
    goto LABEL_59;
  }
LABEL_105:
  *(_BYTE *)(v5 + 476) = self->_isStoreDemoModeEnabled;
  *(_QWORD *)(v5 + 488) |= 0x1000000000uLL;
  if ((*(_QWORD *)&self->_has & 0x40000000) != 0)
  {
LABEL_59:
    *(_BYTE *)(v5 + 470) = self->_isDiagnosticsUsageEnabled;
    *(_QWORD *)(v5 + 488) |= 0x40000000uLL;
  }
LABEL_60:
  v87 = 0u;
  v88 = 0u;
  v85 = 0u;
  v86 = 0u;
  v71 = self->_regionIds;
  v72 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v71, "countByEnumeratingWithState:objects:count:", &v85, v89, 16);
  if (v72)
  {
    v73 = v72;
    v74 = *(_QWORD *)v86;
    do
    {
      v75 = 0;
      do
      {
        if (*(_QWORD *)v86 != v74)
          objc_enumerationMutation(v71);
        v76 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v85 + 1) + 8 * v75), "copyWithZone:", a3, (_QWORD)v85);
        objc_msgSend((id)v5, "addRegionIds:", v76);

        ++v75;
      }
      while (v73 != v75);
      v73 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v71, "countByEnumeratingWithState:objects:count:", &v85, v89, 16);
    }
    while (v73);
  }

  v77 = -[NSString copyWithZone:](self->_appBuildNumber, "copyWithZone:", a3);
  v78 = *(void **)(v5 + 120);
  *(_QWORD *)(v5 + 120) = v77;

  v79 = -[NSString copyWithZone:](self->_amsPurchaseId, "copyWithZone:", a3);
  v80 = *(void **)(v5 + 112);
  *(_QWORD *)(v5 + 112) = v79;

  v81 = -[NSString copyWithZone:](self->_amsCampaignId, "copyWithZone:", a3);
  v82 = *(void **)(v5 + 104);
  *(_QWORD *)(v5 + 104) = v81;

  if ((*((_BYTE *)&self->_has + 2) & 2) != 0)
  {
    *(_DWORD *)(v5 + 320) = self->_paywallConfigType;
    *(_QWORD *)(v5 + 488) |= 0x20000uLL;
  }
  v83 = (id)v5;

  return v83;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  NSString *deviceModel;
  NSString *devicePlatform;
  NSString *osVersion;
  NSString *appVersion;
  $D75F02CFEA0A7AA1FE16F60BA2FB852A has;
  uint64_t v10;
  NSString *countryCode;
  NSString *languageCode;
  NSString *carrier;
  $D75F02CFEA0A7AA1FE16F60BA2FB852A v14;
  uint64_t v15;
  NSData *sessionId;
  NSString *userId;
  NSString *userStorefrontId;
  $D75F02CFEA0A7AA1FE16F60BA2FB852A v19;
  uint64_t v20;
  NSString *previousAppVersion;
  NSString *previousOsVersion;
  $D75F02CFEA0A7AA1FE16F60BA2FB852A v23;
  uint64_t v24;
  NSString *campaignId;
  uint64_t v26;
  NSString *originatingCampaignId;
  NSString *originatingCampaignType;
  NSString *originatingCreativeId;
  $D75F02CFEA0A7AA1FE16F60BA2FB852A v30;
  uint64_t v31;
  NSString *newsWidgetModeGroupId;
  uint64_t v33;
  NSString *clientName;
  NSString *clientVersion;
  NSString *browserLanguage;
  NSString *notwUserId;
  $D75F02CFEA0A7AA1FE16F60BA2FB852A v38;
  uint64_t v39;
  NSString *watchSessionId;
  NSData *sessionIdWatch;
  NSData *widgetSessionId;
  uint64_t v43;
  NSString *personalizationPortraitVariantName;
  NSData *appProcessLifetimeId;
  uint64_t v46;
  NSString *widgetUserId;
  NSString *productType;
  $D75F02CFEA0A7AA1FE16F60BA2FB852A v49;
  uint64_t v50;
  NSMutableArray *regionIds;
  NSString *appBuildNumber;
  NSString *amsPurchaseId;
  NSString *amsCampaignId;
  uint64_t v55;
  BOOL v56;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_366;
  deviceModel = self->_deviceModel;
  if ((unint64_t)deviceModel | *((_QWORD *)v4 + 26))
  {
    if (!-[NSString isEqual:](deviceModel, "isEqual:"))
      goto LABEL_366;
  }
  devicePlatform = self->_devicePlatform;
  if ((unint64_t)devicePlatform | *((_QWORD *)v4 + 27))
  {
    if (!-[NSString isEqual:](devicePlatform, "isEqual:"))
      goto LABEL_366;
  }
  osVersion = self->_osVersion;
  if ((unint64_t)osVersion | *((_QWORD *)v4 + 39))
  {
    if (!-[NSString isEqual:](osVersion, "isEqual:"))
      goto LABEL_366;
  }
  appVersion = self->_appVersion;
  if ((unint64_t)appVersion | *((_QWORD *)v4 + 17))
  {
    if (!-[NSString isEqual:](appVersion, "isEqual:"))
      goto LABEL_366;
  }
  has = self->_has;
  v10 = *((_QWORD *)v4 + 61);
  if ((*(_BYTE *)&has & 1) != 0)
  {
    if ((v10 & 1) == 0 || self->_appBuild != *((_QWORD *)v4 + 7))
      goto LABEL_366;
  }
  else if ((v10 & 1) != 0)
  {
    goto LABEL_366;
  }
  if ((*(_DWORD *)&has & 0x100000) != 0)
  {
    if ((v10 & 0x100000) == 0 || self->_utcOffset != *((_DWORD *)v4 + 104))
      goto LABEL_366;
  }
  else if ((v10 & 0x100000) != 0)
  {
    goto LABEL_366;
  }
  countryCode = self->_countryCode;
  if ((unint64_t)countryCode | *((_QWORD *)v4 + 25)
    && !-[NSString isEqual:](countryCode, "isEqual:"))
  {
    goto LABEL_366;
  }
  languageCode = self->_languageCode;
  if ((unint64_t)languageCode | *((_QWORD *)v4 + 31))
  {
    if (!-[NSString isEqual:](languageCode, "isEqual:"))
      goto LABEL_366;
  }
  carrier = self->_carrier;
  if ((unint64_t)carrier | *((_QWORD *)v4 + 21))
  {
    if (!-[NSString isEqual:](carrier, "isEqual:"))
      goto LABEL_366;
  }
  v14 = self->_has;
  v15 = *((_QWORD *)v4 + 61);
  if ((*(_DWORD *)&v14 & 0x40000) != 0)
  {
    if ((v15 & 0x40000) == 0 || self->_reachabilityStatus != *((_DWORD *)v4 + 90))
      goto LABEL_366;
  }
  else if ((v15 & 0x40000) != 0)
  {
    goto LABEL_366;
  }
  if ((*(_WORD *)&v14 & 0x100) != 0)
  {
    if ((v15 & 0x100) == 0 || self->_cellularRadioAccessTechnology != *((_DWORD *)v4 + 44))
      goto LABEL_366;
  }
  else if ((v15 & 0x100) != 0)
  {
    goto LABEL_366;
  }
  if ((*(_DWORD *)&v14 & 0x80000) != 0)
  {
    if ((v15 & 0x80000) == 0 || self->_textSize != *((_DWORD *)v4 + 98))
      goto LABEL_366;
  }
  else if ((v15 & 0x80000) != 0)
  {
    goto LABEL_366;
  }
  sessionId = self->_sessionId;
  if ((unint64_t)sessionId | *((_QWORD *)v4 + 47) && !-[NSData isEqual:](sessionId, "isEqual:"))
    goto LABEL_366;
  userId = self->_userId;
  if ((unint64_t)userId | *((_QWORD *)v4 + 50))
  {
    if (!-[NSString isEqual:](userId, "isEqual:"))
      goto LABEL_366;
  }
  userStorefrontId = self->_userStorefrontId;
  if ((unint64_t)userStorefrontId | *((_QWORD *)v4 + 51))
  {
    if (!-[NSString isEqual:](userStorefrontId, "isEqual:"))
      goto LABEL_366;
  }
  v19 = self->_has;
  v20 = *((_QWORD *)v4 + 61);
  if ((*(_DWORD *)&v19 & 0x80000000) != 0)
  {
    if ((v20 & 0x80000000) == 0)
      goto LABEL_366;
    if (self->_isNewUser)
    {
      if (!*((_BYTE *)v4 + 471))
        goto LABEL_366;
    }
    else if (*((_BYTE *)v4 + 471))
    {
      goto LABEL_366;
    }
  }
  else if ((v20 & 0x80000000) != 0)
  {
    goto LABEL_366;
  }
  if ((*(_BYTE *)&v19 & 0x10) != 0)
  {
    if ((v20 & 0x10) == 0 || self->_userStartDate != *((_QWORD *)v4 + 11))
      goto LABEL_366;
  }
  else if ((v20 & 0x10) != 0)
  {
    goto LABEL_366;
  }
  if ((*(_BYTE *)&v19 & 4) != 0)
  {
    if ((v20 & 4) == 0 || self->_lastAppOpenDate != *((_QWORD *)v4 + 9))
      goto LABEL_366;
  }
  else if ((v20 & 4) != 0)
  {
    goto LABEL_366;
  }
  if ((*(_QWORD *)&v19 & 0x40000000000) != 0)
  {
    if ((v20 & 0x40000000000) == 0)
      goto LABEL_366;
    if (self->_runningObsolete)
    {
      if (!*((_BYTE *)v4 + 482))
        goto LABEL_366;
    }
    else if (*((_BYTE *)v4 + 482))
    {
      goto LABEL_366;
    }
  }
  else if ((v20 & 0x40000000000) != 0)
  {
    goto LABEL_366;
  }
  if ((*(_QWORD *)&v19 & 0x200000000000) != 0)
  {
    if ((v20 & 0x200000000000) == 0)
      goto LABEL_366;
    if (self->_upgradedFromObsolete)
    {
      if (!*((_BYTE *)v4 + 485))
        goto LABEL_366;
    }
    else if (*((_BYTE *)v4 + 485))
    {
      goto LABEL_366;
    }
  }
  else if ((v20 & 0x200000000000) != 0)
  {
    goto LABEL_366;
  }
  previousAppVersion = self->_previousAppVersion;
  if ((unint64_t)previousAppVersion | *((_QWORD *)v4 + 42)
    && !-[NSString isEqual:](previousAppVersion, "isEqual:"))
  {
    goto LABEL_366;
  }
  previousOsVersion = self->_previousOsVersion;
  if ((unint64_t)previousOsVersion | *((_QWORD *)v4 + 43))
  {
    if (!-[NSString isEqual:](previousOsVersion, "isEqual:"))
      goto LABEL_366;
  }
  v23 = self->_has;
  v24 = *((_QWORD *)v4 + 61);
  if ((*(_QWORD *)&v23 & 0x100000000000) != 0)
  {
    if ((v24 & 0x100000000000) == 0)
      goto LABEL_366;
    if (self->_signedIntoIcloud)
    {
      if (!*((_BYTE *)v4 + 484))
        goto LABEL_366;
    }
    else if (*((_BYTE *)v4 + 484))
    {
      goto LABEL_366;
    }
  }
  else if ((v24 & 0x100000000000) != 0)
  {
    goto LABEL_366;
  }
  if ((*(_DWORD *)&v23 & 0x10000) != 0)
  {
    if ((v24 & 0x10000) == 0 || self->_osInstallVariant != *((_DWORD *)v4 + 76))
      goto LABEL_366;
  }
  else if ((v24 & 0x10000) != 0)
  {
    goto LABEL_366;
  }
  campaignId = self->_campaignId;
  if ((unint64_t)campaignId | *((_QWORD *)v4 + 19))
  {
    if (!-[NSString isEqual:](campaignId, "isEqual:"))
      goto LABEL_366;
    v23 = self->_has;
  }
  v26 = *((_QWORD *)v4 + 61);
  if ((*(_BYTE *)&v23 & 0x80) != 0)
  {
    if ((v26 & 0x80) == 0 || self->_campaignType != *((_DWORD *)v4 + 40))
      goto LABEL_366;
  }
  else if ((v26 & 0x80) != 0)
  {
    goto LABEL_366;
  }
  if ((*(_QWORD *)&v23 & 0x10000000000) != 0)
  {
    if ((v26 & 0x10000000000) == 0)
      goto LABEL_366;
    if (self->_privateDataSyncOn)
    {
      if (!*((_BYTE *)v4 + 480))
        goto LABEL_366;
    }
    else if (*((_BYTE *)v4 + 480))
    {
      goto LABEL_366;
    }
  }
  else if ((v26 & 0x10000000000) != 0)
  {
    goto LABEL_366;
  }
  if ((*(_QWORD *)&v23 & 0x100000000) != 0)
  {
    if ((v26 & 0x100000000) == 0)
      goto LABEL_366;
    if (self->_isPaidSubscriber)
    {
      if (!*((_BYTE *)v4 + 472))
        goto LABEL_366;
    }
    else if (*((_BYTE *)v4 + 472))
    {
      goto LABEL_366;
    }
  }
  else if ((v26 & 0x100000000) != 0)
  {
    goto LABEL_366;
  }
  if ((*(_QWORD *)&v23 & 0x400000000) != 0)
  {
    if ((v26 & 0x400000000) == 0)
      goto LABEL_366;
    if (self->_isPaidSubscriberFromNews)
    {
      if (!*((_BYTE *)v4 + 474))
        goto LABEL_366;
    }
    else if (*((_BYTE *)v4 + 474))
    {
      goto LABEL_366;
    }
  }
  else if ((v26 & 0x400000000) != 0)
  {
    goto LABEL_366;
  }
  if ((*(_QWORD *)&v23 & 0x200000000) != 0)
  {
    if ((v26 & 0x200000000) == 0)
      goto LABEL_366;
    if (self->_isPaidSubscriberFromAppStore)
    {
      if (!*((_BYTE *)v4 + 473))
        goto LABEL_366;
    }
    else if (*((_BYTE *)v4 + 473))
    {
      goto LABEL_366;
    }
  }
  else if ((v26 & 0x200000000) != 0)
  {
    goto LABEL_366;
  }
  if ((*(_QWORD *)&v23 & 0x800000000) != 0)
  {
    if ((v26 & 0x800000000) == 0)
      goto LABEL_366;
    if (self->_isPaidSubscriberFromThirdParty)
    {
      if (!*((_BYTE *)v4 + 475))
        goto LABEL_366;
    }
    else if (*((_BYTE *)v4 + 475))
    {
      goto LABEL_366;
    }
  }
  else if ((v26 & 0x800000000) != 0)
  {
    goto LABEL_366;
  }
  if ((*(_QWORD *)&v23 & 0x4000000000) != 0)
  {
    if ((v26 & 0x4000000000) == 0)
      goto LABEL_366;
    if (self->_notificationsEnabled)
    {
      if (!*((_BYTE *)v4 + 478))
        goto LABEL_366;
    }
    else if (*((_BYTE *)v4 + 478))
    {
      goto LABEL_366;
    }
  }
  else if ((v26 & 0x4000000000) != 0)
  {
    goto LABEL_366;
  }
  originatingCampaignId = self->_originatingCampaignId;
  if ((unint64_t)originatingCampaignId | *((_QWORD *)v4 + 35)
    && !-[NSString isEqual:](originatingCampaignId, "isEqual:"))
  {
    goto LABEL_366;
  }
  originatingCampaignType = self->_originatingCampaignType;
  if ((unint64_t)originatingCampaignType | *((_QWORD *)v4 + 36))
  {
    if (!-[NSString isEqual:](originatingCampaignType, "isEqual:"))
      goto LABEL_366;
  }
  originatingCreativeId = self->_originatingCreativeId;
  if ((unint64_t)originatingCreativeId | *((_QWORD *)v4 + 37))
  {
    if (!-[NSString isEqual:](originatingCreativeId, "isEqual:"))
      goto LABEL_366;
  }
  v30 = self->_has;
  v31 = *((_QWORD *)v4 + 61);
  if ((*(_DWORD *)&v30 & 0x2000000) != 0)
  {
    if ((v31 & 0x2000000) == 0)
      goto LABEL_366;
    if (self->_iosSettingsNotificationsEnabled)
    {
      if (!*((_BYTE *)v4 + 465))
        goto LABEL_366;
    }
    else if (*((_BYTE *)v4 + 465))
    {
      goto LABEL_366;
    }
  }
  else if ((v31 & 0x2000000) != 0)
  {
    goto LABEL_366;
  }
  if ((*(_DWORD *)&v30 & 0x800000) != 0)
  {
    if ((v31 & 0x800000) == 0 || self->_widgetModeType != *((_DWORD *)v4 + 110))
      goto LABEL_366;
  }
  else if ((v31 & 0x800000) != 0)
  {
    goto LABEL_366;
  }
  if ((*(_QWORD *)&v30 & 0x2000000000) != 0)
  {
    if ((v31 & 0x2000000000) == 0)
      goto LABEL_366;
    if (self->_locationPermissionGranted)
    {
      if (!*((_BYTE *)v4 + 477))
        goto LABEL_366;
    }
    else if (*((_BYTE *)v4 + 477))
    {
      goto LABEL_366;
    }
  }
  else if ((v31 & 0x2000000000) != 0)
  {
    goto LABEL_366;
  }
  if ((*(_WORD *)&v30 & 0x8000) != 0)
  {
    if ((v31 & 0x8000) == 0 || self->_newsWidgetModeGroup != *((_DWORD *)v4 + 64))
      goto LABEL_366;
  }
  else if ((v31 & 0x8000) != 0)
  {
    goto LABEL_366;
  }
  newsWidgetModeGroupId = self->_newsWidgetModeGroupId;
  if ((unint64_t)newsWidgetModeGroupId | *((_QWORD *)v4 + 33))
  {
    if (!-[NSString isEqual:](newsWidgetModeGroupId, "isEqual:"))
      goto LABEL_366;
    v30 = self->_has;
  }
  v33 = *((_QWORD *)v4 + 61);
  if ((*(_BYTE *)&v30 & 0x20) != 0)
  {
    if ((v33 & 0x20) == 0 || self->_ageBracket != *((_DWORD *)v4 + 24))
      goto LABEL_366;
  }
  else if ((v33 & 0x20) != 0)
  {
    goto LABEL_366;
  }
  if ((*(_BYTE *)&v30 & 0x40) != 0)
  {
    if ((v33 & 0x40) == 0 || self->_ageBracketConfidenceLevel != *((float *)v4 + 25))
      goto LABEL_366;
  }
  else if ((v33 & 0x40) != 0)
  {
    goto LABEL_366;
  }
  if ((*(_WORD *)&v30 & 0x800) != 0)
  {
    if ((v33 & 0x800) == 0 || self->_gender != *((_DWORD *)v4 + 58))
      goto LABEL_366;
  }
  else if ((v33 & 0x800) != 0)
  {
    goto LABEL_366;
  }
  if ((*(_WORD *)&v30 & 0x1000) != 0)
  {
    if ((v33 & 0x1000) == 0 || self->_genderConfidenceLevel != *((float *)v4 + 59))
      goto LABEL_366;
  }
  else if ((v33 & 0x1000) != 0)
  {
    goto LABEL_366;
  }
  if ((*(_WORD *)&v30 & 0x2000) != 0)
  {
    if ((v33 & 0x2000) == 0 || self->_incomeBracket != *((_DWORD *)v4 + 60))
      goto LABEL_366;
  }
  else if ((v33 & 0x2000) != 0)
  {
    goto LABEL_366;
  }
  if ((*(_WORD *)&v30 & 0x4000) != 0)
  {
    if ((v33 & 0x4000) == 0 || self->_incomeBracketConfidenceLevel != *((float *)v4 + 61))
      goto LABEL_366;
  }
  else if ((v33 & 0x4000) != 0)
  {
    goto LABEL_366;
  }
  if ((*(_WORD *)&v30 & 0x200) != 0)
  {
    if ((v33 & 0x200) == 0 || self->_ethnicity != *((_DWORD *)v4 + 56))
      goto LABEL_366;
  }
  else if ((v33 & 0x200) != 0)
  {
    goto LABEL_366;
  }
  if ((*(_WORD *)&v30 & 0x400) != 0)
  {
    if ((v33 & 0x400) == 0 || self->_ethnicityConfidenceLevel != *((float *)v4 + 57))
      goto LABEL_366;
  }
  else if ((v33 & 0x400) != 0)
  {
    goto LABEL_366;
  }
  if ((*(_BYTE *)&v30 & 2) != 0)
  {
    if ((v33 & 2) == 0 || self->_appConfigTreatmentId != *((_QWORD *)v4 + 8))
      goto LABEL_366;
  }
  else if ((v33 & 2) != 0)
  {
    goto LABEL_366;
  }
  clientName = self->_clientName;
  if ((unint64_t)clientName | *((_QWORD *)v4 + 23)
    && !-[NSString isEqual:](clientName, "isEqual:"))
  {
    goto LABEL_366;
  }
  clientVersion = self->_clientVersion;
  if ((unint64_t)clientVersion | *((_QWORD *)v4 + 24))
  {
    if (!-[NSString isEqual:](clientVersion, "isEqual:"))
      goto LABEL_366;
  }
  browserLanguage = self->_browserLanguage;
  if ((unint64_t)browserLanguage | *((_QWORD *)v4 + 18))
  {
    if (!-[NSString isEqual:](browserLanguage, "isEqual:"))
      goto LABEL_366;
  }
  notwUserId = self->_notwUserId;
  if ((unint64_t)notwUserId | *((_QWORD *)v4 + 34))
  {
    if (!-[NSString isEqual:](notwUserId, "isEqual:"))
      goto LABEL_366;
  }
  v38 = self->_has;
  v39 = *((_QWORD *)v4 + 61);
  if ((*(_QWORD *)&v38 & 0x8000000000) != 0)
  {
    if ((v39 & 0x8000000000) == 0)
      goto LABEL_366;
    if (self->_privateDataEncrypted)
    {
      if (!*((_BYTE *)v4 + 479))
        goto LABEL_366;
    }
    else if (*((_BYTE *)v4 + 479))
    {
      goto LABEL_366;
    }
  }
  else if ((v39 & 0x8000000000) != 0)
  {
    goto LABEL_366;
  }
  if ((*(_QWORD *)&v38 & 0x20000000000) != 0)
  {
    if ((v39 & 0x20000000000) == 0)
      goto LABEL_366;
    if (self->_progressivePersonalizationAllowed)
    {
      if (!*((_BYTE *)v4 + 481))
        goto LABEL_366;
    }
    else if (*((_BYTE *)v4 + 481))
    {
      goto LABEL_366;
    }
  }
  else if ((v39 & 0x20000000000) != 0)
  {
    goto LABEL_366;
  }
  watchSessionId = self->_watchSessionId;
  if ((unint64_t)watchSessionId | *((_QWORD *)v4 + 53)
    && !-[NSString isEqual:](watchSessionId, "isEqual:"))
  {
    goto LABEL_366;
  }
  sessionIdWatch = self->_sessionIdWatch;
  if ((unint64_t)sessionIdWatch | *((_QWORD *)v4 + 48))
  {
    if (!-[NSData isEqual:](sessionIdWatch, "isEqual:"))
      goto LABEL_366;
  }
  widgetSessionId = self->_widgetSessionId;
  if ((unint64_t)widgetSessionId | *((_QWORD *)v4 + 56))
  {
    if (!-[NSData isEqual:](widgetSessionId, "isEqual:"))
      goto LABEL_366;
  }
  v43 = *((_QWORD *)v4 + 61);
  if ((*((_BYTE *)&self->_has + 2) & 0x20) != 0)
  {
    if ((v43 & 0x200000) == 0 || self->_widgetDisplayMode != *((_DWORD *)v4 + 108))
      goto LABEL_366;
  }
  else if ((v43 & 0x200000) != 0)
  {
    goto LABEL_366;
  }
  personalizationPortraitVariantName = self->_personalizationPortraitVariantName;
  if ((unint64_t)personalizationPortraitVariantName | *((_QWORD *)v4 + 41)
    && !-[NSString isEqual:](personalizationPortraitVariantName, "isEqual:"))
  {
    goto LABEL_366;
  }
  appProcessLifetimeId = self->_appProcessLifetimeId;
  if ((unint64_t)appProcessLifetimeId | *((_QWORD *)v4 + 16))
  {
    if (!-[NSData isEqual:](appProcessLifetimeId, "isEqual:"))
      goto LABEL_366;
  }
  v46 = *((_QWORD *)v4 + 61);
  if ((*(_BYTE *)&self->_has & 8) != 0)
  {
    if ((v46 & 8) == 0 || self->_testBucket != *((_QWORD *)v4 + 10))
      goto LABEL_366;
  }
  else if ((v46 & 8) != 0)
  {
    goto LABEL_366;
  }
  widgetUserId = self->_widgetUserId;
  if ((unint64_t)widgetUserId | *((_QWORD *)v4 + 57)
    && !-[NSString isEqual:](widgetUserId, "isEqual:"))
  {
    goto LABEL_366;
  }
  productType = self->_productType;
  if ((unint64_t)productType | *((_QWORD *)v4 + 44))
  {
    if (!-[NSString isEqual:](productType, "isEqual:"))
      goto LABEL_366;
  }
  if (!PBRepeatedInt64IsEqual() || !PBRepeatedInt32IsEqual())
    goto LABEL_366;
  v49 = self->_has;
  v50 = *((_QWORD *)v4 + 61);
  if ((*(_DWORD *)&v49 & 0x20000000) != 0)
  {
    if ((v50 & 0x20000000) == 0)
      goto LABEL_366;
    if (self->_iosSettingsNotificationsSoundEnabled)
    {
      if (!*((_BYTE *)v4 + 469))
        goto LABEL_366;
    }
    else if (*((_BYTE *)v4 + 469))
    {
      goto LABEL_366;
    }
  }
  else if ((v50 & 0x20000000) != 0)
  {
    goto LABEL_366;
  }
  if ((*(_DWORD *)&v49 & 0x1000000) != 0)
  {
    if ((v50 & 0x1000000) == 0)
      goto LABEL_366;
    if (self->_iosSettingsNotificationsBadgeAppIconEnabled)
    {
      if (!*((_BYTE *)v4 + 464))
        goto LABEL_366;
    }
    else if (*((_BYTE *)v4 + 464))
    {
      goto LABEL_366;
    }
  }
  else if ((v50 & 0x1000000) != 0)
  {
    goto LABEL_366;
  }
  if ((*(_DWORD *)&v49 & 0x10000000) != 0)
  {
    if ((v50 & 0x10000000) == 0)
      goto LABEL_366;
    if (self->_iosSettingsNotificationsShowOnLockScreenEnabled)
    {
      if (!*((_BYTE *)v4 + 468))
        goto LABEL_366;
    }
    else if (*((_BYTE *)v4 + 468))
    {
      goto LABEL_366;
    }
  }
  else if ((v50 & 0x10000000) != 0)
  {
    goto LABEL_366;
  }
  if ((*(_DWORD *)&v49 & 0x8000000) != 0)
  {
    if ((v50 & 0x8000000) == 0)
      goto LABEL_366;
    if (self->_iosSettingsNotificationsShowInHistoryEnabled)
    {
      if (!*((_BYTE *)v4 + 467))
        goto LABEL_366;
    }
    else if (*((_BYTE *)v4 + 467))
    {
      goto LABEL_366;
    }
  }
  else if ((v50 & 0x8000000) != 0)
  {
    goto LABEL_366;
  }
  if ((*(_DWORD *)&v49 & 0x4000000) != 0)
  {
    if ((v50 & 0x4000000) == 0)
      goto LABEL_366;
    if (self->_iosSettingsNotificationsShowAsBannersEnabled)
    {
      if (!*((_BYTE *)v4 + 466))
        goto LABEL_366;
    }
    else if (*((_BYTE *)v4 + 466))
    {
      goto LABEL_366;
    }
  }
  else if ((v50 & 0x4000000) != 0)
  {
    goto LABEL_366;
  }
  if ((*(_DWORD *)&v49 & 0x400000) != 0)
  {
    if ((v50 & 0x400000) == 0 || self->_widgetDisplayModeSessionEnd != *((_DWORD *)v4 + 109))
      goto LABEL_366;
  }
  else if ((v50 & 0x400000) != 0)
  {
    goto LABEL_366;
  }
  if ((*(_QWORD *)&v49 & 0x80000000000) != 0)
  {
    if ((v50 & 0x80000000000) == 0)
      goto LABEL_366;
    if (self->_signedIntoITunes)
    {
      if (!*((_BYTE *)v4 + 483))
        goto LABEL_366;
    }
    else if (*((_BYTE *)v4 + 483))
    {
      goto LABEL_366;
    }
  }
  else if ((v50 & 0x80000000000) != 0)
  {
    goto LABEL_366;
  }
  if ((*(_QWORD *)&v49 & 0x1000000000) != 0)
  {
    if ((v50 & 0x1000000000) == 0)
      goto LABEL_366;
    if (self->_isStoreDemoModeEnabled)
    {
      if (!*((_BYTE *)v4 + 476))
        goto LABEL_366;
    }
    else if (*((_BYTE *)v4 + 476))
    {
      goto LABEL_366;
    }
  }
  else if ((v50 & 0x1000000000) != 0)
  {
    goto LABEL_366;
  }
  if ((*(_DWORD *)&v49 & 0x40000000) == 0)
  {
    if ((v50 & 0x40000000) == 0)
      goto LABEL_353;
LABEL_366:
    v56 = 0;
    goto LABEL_367;
  }
  if ((v50 & 0x40000000) == 0)
    goto LABEL_366;
  if (!self->_isDiagnosticsUsageEnabled)
  {
    if (!*((_BYTE *)v4 + 470))
      goto LABEL_353;
    goto LABEL_366;
  }
  if (!*((_BYTE *)v4 + 470))
    goto LABEL_366;
LABEL_353:
  regionIds = self->_regionIds;
  if ((unint64_t)regionIds | *((_QWORD *)v4 + 46)
    && !-[NSMutableArray isEqual:](regionIds, "isEqual:"))
  {
    goto LABEL_366;
  }
  appBuildNumber = self->_appBuildNumber;
  if ((unint64_t)appBuildNumber | *((_QWORD *)v4 + 15))
  {
    if (!-[NSString isEqual:](appBuildNumber, "isEqual:"))
      goto LABEL_366;
  }
  amsPurchaseId = self->_amsPurchaseId;
  if ((unint64_t)amsPurchaseId | *((_QWORD *)v4 + 14))
  {
    if (!-[NSString isEqual:](amsPurchaseId, "isEqual:"))
      goto LABEL_366;
  }
  amsCampaignId = self->_amsCampaignId;
  if ((unint64_t)amsCampaignId | *((_QWORD *)v4 + 13))
  {
    if (!-[NSString isEqual:](amsCampaignId, "isEqual:"))
      goto LABEL_366;
  }
  v55 = *((_QWORD *)v4 + 61);
  if ((*((_BYTE *)&self->_has + 2) & 2) != 0)
  {
    if ((v55 & 0x20000) == 0 || self->_paywallConfigType != *((_DWORD *)v4 + 80))
      goto LABEL_366;
    v56 = 1;
  }
  else
  {
    v56 = (v55 & 0x20000) == 0;
  }
LABEL_367:

  return v56;
}

- (unint64_t)hash
{
  $D75F02CFEA0A7AA1FE16F60BA2FB852A has;
  $D75F02CFEA0A7AA1FE16F60BA2FB852A v4;
  $D75F02CFEA0A7AA1FE16F60BA2FB852A v5;
  $D75F02CFEA0A7AA1FE16F60BA2FB852A v6;
  $D75F02CFEA0A7AA1FE16F60BA2FB852A v7;
  $D75F02CFEA0A7AA1FE16F60BA2FB852A v8;
  $D75F02CFEA0A7AA1FE16F60BA2FB852A v9;
  float ageBracketConfidenceLevel;
  float v11;
  float v12;
  float v13;
  unint64_t v14;
  float genderConfidenceLevel;
  float v16;
  float v17;
  float v18;
  unint64_t v19;
  float incomeBracketConfidenceLevel;
  float v21;
  float v22;
  float v23;
  unint64_t v24;
  float ethnicityConfidenceLevel;
  float v26;
  float v27;
  float v28;
  unint64_t v29;
  $D75F02CFEA0A7AA1FE16F60BA2FB852A v30;
  $D75F02CFEA0A7AA1FE16F60BA2FB852A v31;
  uint64_t v32;
  uint64_t v33;
  NSUInteger v34;
  NSUInteger v35;
  NSUInteger v36;
  uint64_t v37;
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
  uint64_t v52;
  uint64_t v53;
  NSUInteger v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  NSUInteger v58;
  uint64_t v59;
  uint64_t v60;
  NSUInteger v61;
  NSUInteger v62;
  NSUInteger v63;
  NSUInteger v64;
  uint64_t v65;
  unint64_t v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  NSUInteger v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t v74;
  uint64_t v75;
  NSUInteger v76;
  NSUInteger v77;
  NSUInteger v78;
  uint64_t v79;
  uint64_t v80;
  uint64_t v81;
  uint64_t v82;
  uint64_t v83;
  uint64_t v84;
  uint64_t v85;
  NSUInteger v86;
  uint64_t v87;
  uint64_t v88;
  NSUInteger v89;
  NSUInteger v90;
  uint64_t v91;
  uint64_t v92;
  uint64_t v93;
  uint64_t v94;
  uint64_t v95;
  NSUInteger v96;
  NSUInteger v97;
  uint64_t v98;
  uint64_t v99;
  uint64_t v100;
  uint64_t v101;
  NSUInteger v102;
  NSUInteger v103;
  NSUInteger v104;
  uint64_t v105;
  uint64_t v106;
  NSUInteger v107;
  NSUInteger v108;
  NSUInteger v109;
  NSUInteger v110;

  v110 = -[NSString hash](self->_deviceModel, "hash");
  v109 = -[NSString hash](self->_devicePlatform, "hash");
  v108 = -[NSString hash](self->_osVersion, "hash");
  v107 = -[NSString hash](self->_appVersion, "hash");
  has = self->_has;
  if ((*(_BYTE *)&has & 1) != 0)
  {
    v106 = 2654435761 * self->_appBuild;
    if ((*(_DWORD *)&has & 0x100000) != 0)
      goto LABEL_3;
  }
  else
  {
    v106 = 0;
    if ((*(_DWORD *)&has & 0x100000) != 0)
    {
LABEL_3:
      v105 = 2654435761 * self->_utcOffset;
      goto LABEL_6;
    }
  }
  v105 = 0;
LABEL_6:
  v104 = -[NSString hash](self->_countryCode, "hash");
  v103 = -[NSString hash](self->_languageCode, "hash");
  v102 = -[NSString hash](self->_carrier, "hash");
  v4 = self->_has;
  if ((*(_DWORD *)&v4 & 0x40000) == 0)
  {
    v101 = 0;
    if ((*(_WORD *)&v4 & 0x100) != 0)
      goto LABEL_8;
LABEL_11:
    v100 = 0;
    if ((*(_DWORD *)&v4 & 0x80000) != 0)
      goto LABEL_9;
    goto LABEL_12;
  }
  v101 = 2654435761 * self->_reachabilityStatus;
  if ((*(_WORD *)&v4 & 0x100) == 0)
    goto LABEL_11;
LABEL_8:
  v100 = 2654435761 * self->_cellularRadioAccessTechnology;
  if ((*(_DWORD *)&v4 & 0x80000) != 0)
  {
LABEL_9:
    v99 = 2654435761 * self->_textSize;
    goto LABEL_13;
  }
LABEL_12:
  v99 = 0;
LABEL_13:
  v98 = -[NSData hash](self->_sessionId, "hash");
  v97 = -[NSString hash](self->_userId, "hash");
  v96 = -[NSString hash](self->_userStorefrontId, "hash");
  v5 = self->_has;
  if ((*(_DWORD *)&v5 & 0x80000000) != 0)
  {
    v95 = 2654435761 * self->_isNewUser;
    if ((*(_BYTE *)&v5 & 0x10) != 0)
    {
LABEL_15:
      v94 = 2654435761 * self->_userStartDate;
      if ((*(_BYTE *)&v5 & 4) != 0)
        goto LABEL_16;
      goto LABEL_21;
    }
  }
  else
  {
    v95 = 0;
    if ((*(_BYTE *)&v5 & 0x10) != 0)
      goto LABEL_15;
  }
  v94 = 0;
  if ((*(_BYTE *)&v5 & 4) != 0)
  {
LABEL_16:
    v93 = 2654435761 * self->_lastAppOpenDate;
    if ((*(_QWORD *)&v5 & 0x40000000000) != 0)
      goto LABEL_17;
LABEL_22:
    v92 = 0;
    if ((*(_QWORD *)&v5 & 0x200000000000) != 0)
      goto LABEL_18;
    goto LABEL_23;
  }
LABEL_21:
  v93 = 0;
  if ((*(_QWORD *)&v5 & 0x40000000000) == 0)
    goto LABEL_22;
LABEL_17:
  v92 = 2654435761 * self->_runningObsolete;
  if ((*(_QWORD *)&v5 & 0x200000000000) != 0)
  {
LABEL_18:
    v91 = 2654435761 * self->_upgradedFromObsolete;
    goto LABEL_24;
  }
LABEL_23:
  v91 = 0;
LABEL_24:
  v90 = -[NSString hash](self->_previousAppVersion, "hash");
  v89 = -[NSString hash](self->_previousOsVersion, "hash");
  v6 = self->_has;
  if ((*(_QWORD *)&v6 & 0x100000000000) != 0)
  {
    v88 = 2654435761 * self->_signedIntoIcloud;
    if ((*(_DWORD *)&v6 & 0x10000) != 0)
      goto LABEL_26;
  }
  else
  {
    v88 = 0;
    if ((*(_DWORD *)&v6 & 0x10000) != 0)
    {
LABEL_26:
      v87 = 2654435761 * self->_osInstallVariant;
      goto LABEL_29;
    }
  }
  v87 = 0;
LABEL_29:
  v86 = -[NSString hash](self->_campaignId, "hash");
  v7 = self->_has;
  if ((*(_BYTE *)&v7 & 0x80) != 0)
  {
    v85 = 2654435761 * self->_campaignType;
    if ((*(_QWORD *)&v7 & 0x10000000000) != 0)
    {
LABEL_31:
      v84 = 2654435761 * self->_privateDataSyncOn;
      if ((*(_QWORD *)&v7 & 0x100000000) != 0)
        goto LABEL_32;
      goto LABEL_39;
    }
  }
  else
  {
    v85 = 0;
    if ((*(_QWORD *)&v7 & 0x10000000000) != 0)
      goto LABEL_31;
  }
  v84 = 0;
  if ((*(_QWORD *)&v7 & 0x100000000) != 0)
  {
LABEL_32:
    v83 = 2654435761 * self->_isPaidSubscriber;
    if ((*(_QWORD *)&v7 & 0x400000000) != 0)
      goto LABEL_33;
    goto LABEL_40;
  }
LABEL_39:
  v83 = 0;
  if ((*(_QWORD *)&v7 & 0x400000000) != 0)
  {
LABEL_33:
    v82 = 2654435761 * self->_isPaidSubscriberFromNews;
    if ((*(_QWORD *)&v7 & 0x200000000) != 0)
      goto LABEL_34;
    goto LABEL_41;
  }
LABEL_40:
  v82 = 0;
  if ((*(_QWORD *)&v7 & 0x200000000) != 0)
  {
LABEL_34:
    v81 = 2654435761 * self->_isPaidSubscriberFromAppStore;
    if ((*(_QWORD *)&v7 & 0x800000000) != 0)
      goto LABEL_35;
LABEL_42:
    v80 = 0;
    if ((*(_QWORD *)&v7 & 0x4000000000) != 0)
      goto LABEL_36;
    goto LABEL_43;
  }
LABEL_41:
  v81 = 0;
  if ((*(_QWORD *)&v7 & 0x800000000) == 0)
    goto LABEL_42;
LABEL_35:
  v80 = 2654435761 * self->_isPaidSubscriberFromThirdParty;
  if ((*(_QWORD *)&v7 & 0x4000000000) != 0)
  {
LABEL_36:
    v79 = 2654435761 * self->_notificationsEnabled;
    goto LABEL_44;
  }
LABEL_43:
  v79 = 0;
LABEL_44:
  v78 = -[NSString hash](self->_originatingCampaignId, "hash");
  v77 = -[NSString hash](self->_originatingCampaignType, "hash");
  v76 = -[NSString hash](self->_originatingCreativeId, "hash");
  v8 = self->_has;
  if ((*(_DWORD *)&v8 & 0x2000000) != 0)
  {
    v75 = 2654435761 * self->_iosSettingsNotificationsEnabled;
    if ((*(_DWORD *)&v8 & 0x800000) != 0)
    {
LABEL_46:
      v74 = 2654435761 * self->_widgetModeType;
      if ((*(_QWORD *)&v8 & 0x2000000000) != 0)
        goto LABEL_47;
LABEL_51:
      v73 = 0;
      if ((*(_WORD *)&v8 & 0x8000) != 0)
        goto LABEL_48;
      goto LABEL_52;
    }
  }
  else
  {
    v75 = 0;
    if ((*(_DWORD *)&v8 & 0x800000) != 0)
      goto LABEL_46;
  }
  v74 = 0;
  if ((*(_QWORD *)&v8 & 0x2000000000) == 0)
    goto LABEL_51;
LABEL_47:
  v73 = 2654435761 * self->_locationPermissionGranted;
  if ((*(_WORD *)&v8 & 0x8000) != 0)
  {
LABEL_48:
    v72 = 2654435761 * self->_newsWidgetModeGroup;
    goto LABEL_53;
  }
LABEL_52:
  v72 = 0;
LABEL_53:
  v71 = -[NSString hash](self->_newsWidgetModeGroupId, "hash");
  v9 = self->_has;
  if ((*(_BYTE *)&v9 & 0x20) != 0)
  {
    v70 = 2654435761 * self->_ageBracket;
    if ((*(_BYTE *)&v9 & 0x40) != 0)
      goto LABEL_55;
LABEL_60:
    v14 = 0;
    goto LABEL_63;
  }
  v70 = 0;
  if ((*(_BYTE *)&v9 & 0x40) == 0)
    goto LABEL_60;
LABEL_55:
  ageBracketConfidenceLevel = self->_ageBracketConfidenceLevel;
  v11 = -ageBracketConfidenceLevel;
  if (ageBracketConfidenceLevel >= 0.0)
    v11 = self->_ageBracketConfidenceLevel;
  v12 = floorf(v11 + 0.5);
  v13 = (float)(v11 - v12) * 1.8447e19;
  v14 = 2654435761u * (unint64_t)fmodf(v12, 1.8447e19);
  if (v13 >= 0.0)
  {
    if (v13 > 0.0)
      v14 += (unint64_t)v13;
  }
  else
  {
    v14 -= (unint64_t)fabsf(v13);
  }
LABEL_63:
  if ((*(_WORD *)&v9 & 0x800) != 0)
  {
    v69 = 2654435761 * self->_gender;
    if ((*(_WORD *)&v9 & 0x1000) != 0)
      goto LABEL_65;
LABEL_70:
    v19 = 0;
    goto LABEL_73;
  }
  v69 = 0;
  if ((*(_WORD *)&v9 & 0x1000) == 0)
    goto LABEL_70;
LABEL_65:
  genderConfidenceLevel = self->_genderConfidenceLevel;
  v16 = -genderConfidenceLevel;
  if (genderConfidenceLevel >= 0.0)
    v16 = self->_genderConfidenceLevel;
  v17 = floorf(v16 + 0.5);
  v18 = (float)(v16 - v17) * 1.8447e19;
  v19 = 2654435761u * (unint64_t)fmodf(v17, 1.8447e19);
  if (v18 >= 0.0)
  {
    if (v18 > 0.0)
      v19 += (unint64_t)v18;
  }
  else
  {
    v19 -= (unint64_t)fabsf(v18);
  }
LABEL_73:
  if ((*(_WORD *)&v9 & 0x2000) != 0)
  {
    v68 = 2654435761 * self->_incomeBracket;
    if ((*(_WORD *)&v9 & 0x4000) != 0)
      goto LABEL_75;
LABEL_80:
    v24 = 0;
    goto LABEL_83;
  }
  v68 = 0;
  if ((*(_WORD *)&v9 & 0x4000) == 0)
    goto LABEL_80;
LABEL_75:
  incomeBracketConfidenceLevel = self->_incomeBracketConfidenceLevel;
  v21 = -incomeBracketConfidenceLevel;
  if (incomeBracketConfidenceLevel >= 0.0)
    v21 = self->_incomeBracketConfidenceLevel;
  v22 = floorf(v21 + 0.5);
  v23 = (float)(v21 - v22) * 1.8447e19;
  v24 = 2654435761u * (unint64_t)fmodf(v22, 1.8447e19);
  if (v23 >= 0.0)
  {
    if (v23 > 0.0)
      v24 += (unint64_t)v23;
  }
  else
  {
    v24 -= (unint64_t)fabsf(v23);
  }
LABEL_83:
  if ((*(_WORD *)&v9 & 0x200) != 0)
  {
    v67 = 2654435761 * self->_ethnicity;
    if ((*(_WORD *)&v9 & 0x400) != 0)
      goto LABEL_85;
LABEL_90:
    v29 = 0;
    goto LABEL_93;
  }
  v67 = 0;
  if ((*(_WORD *)&v9 & 0x400) == 0)
    goto LABEL_90;
LABEL_85:
  ethnicityConfidenceLevel = self->_ethnicityConfidenceLevel;
  v26 = -ethnicityConfidenceLevel;
  if (ethnicityConfidenceLevel >= 0.0)
    v26 = self->_ethnicityConfidenceLevel;
  v27 = floorf(v26 + 0.5);
  v28 = (float)(v26 - v27) * 1.8447e19;
  v29 = 2654435761u * (unint64_t)fmodf(v27, 1.8447e19);
  if (v28 >= 0.0)
  {
    if (v28 > 0.0)
      v29 += (unint64_t)v28;
  }
  else
  {
    v29 -= (unint64_t)fabsf(v28);
  }
LABEL_93:
  v66 = v29;
  if ((*(_BYTE *)&v9 & 2) != 0)
    v65 = 2654435761 * self->_appConfigTreatmentId;
  else
    v65 = 0;
  v64 = -[NSString hash](self->_clientName, "hash");
  v63 = -[NSString hash](self->_clientVersion, "hash");
  v62 = -[NSString hash](self->_browserLanguage, "hash");
  v61 = -[NSString hash](self->_notwUserId, "hash");
  v30 = self->_has;
  if ((*(_QWORD *)&v30 & 0x8000000000) != 0)
  {
    v60 = 2654435761 * self->_privateDataEncrypted;
    if ((*(_QWORD *)&v30 & 0x20000000000) != 0)
      goto LABEL_98;
  }
  else
  {
    v60 = 0;
    if ((*(_QWORD *)&v30 & 0x20000000000) != 0)
    {
LABEL_98:
      v59 = 2654435761 * self->_progressivePersonalizationAllowed;
      goto LABEL_101;
    }
  }
  v59 = 0;
LABEL_101:
  v58 = -[NSString hash](self->_watchSessionId, "hash");
  v57 = -[NSData hash](self->_sessionIdWatch, "hash");
  v56 = -[NSData hash](self->_widgetSessionId, "hash");
  if ((*((_BYTE *)&self->_has + 2) & 0x20) != 0)
    v55 = 2654435761 * self->_widgetDisplayMode;
  else
    v55 = 0;
  v54 = -[NSString hash](self->_personalizationPortraitVariantName, "hash");
  v53 = -[NSData hash](self->_appProcessLifetimeId, "hash");
  if ((*(_BYTE *)&self->_has & 8) != 0)
    v52 = 2654435761 * self->_testBucket;
  else
    v52 = 0;
  v51 = -[NSString hash](self->_widgetUserId, "hash");
  v50 = -[NSString hash](self->_productType, "hash");
  v49 = PBRepeatedInt64Hash();
  v48 = PBRepeatedInt32Hash();
  v31 = self->_has;
  if ((*(_DWORD *)&v31 & 0x20000000) != 0)
  {
    v47 = 2654435761 * self->_iosSettingsNotificationsSoundEnabled;
    if ((*(_DWORD *)&v31 & 0x1000000) != 0)
    {
LABEL_109:
      v46 = 2654435761 * self->_iosSettingsNotificationsBadgeAppIconEnabled;
      if ((*(_DWORD *)&v31 & 0x10000000) != 0)
        goto LABEL_110;
      goto LABEL_119;
    }
  }
  else
  {
    v47 = 0;
    if ((*(_DWORD *)&v31 & 0x1000000) != 0)
      goto LABEL_109;
  }
  v46 = 0;
  if ((*(_DWORD *)&v31 & 0x10000000) != 0)
  {
LABEL_110:
    v45 = 2654435761 * self->_iosSettingsNotificationsShowOnLockScreenEnabled;
    if ((*(_DWORD *)&v31 & 0x8000000) != 0)
      goto LABEL_111;
    goto LABEL_120;
  }
LABEL_119:
  v45 = 0;
  if ((*(_DWORD *)&v31 & 0x8000000) != 0)
  {
LABEL_111:
    v44 = 2654435761 * self->_iosSettingsNotificationsShowInHistoryEnabled;
    if ((*(_DWORD *)&v31 & 0x4000000) != 0)
      goto LABEL_112;
    goto LABEL_121;
  }
LABEL_120:
  v44 = 0;
  if ((*(_DWORD *)&v31 & 0x4000000) != 0)
  {
LABEL_112:
    v43 = 2654435761 * self->_iosSettingsNotificationsShowAsBannersEnabled;
    if ((*(_DWORD *)&v31 & 0x400000) != 0)
      goto LABEL_113;
    goto LABEL_122;
  }
LABEL_121:
  v43 = 0;
  if ((*(_DWORD *)&v31 & 0x400000) != 0)
  {
LABEL_113:
    v42 = 2654435761 * self->_widgetDisplayModeSessionEnd;
    if ((*(_QWORD *)&v31 & 0x80000000000) != 0)
      goto LABEL_114;
    goto LABEL_123;
  }
LABEL_122:
  v42 = 0;
  if ((*(_QWORD *)&v31 & 0x80000000000) != 0)
  {
LABEL_114:
    v41 = 2654435761 * self->_signedIntoITunes;
    if ((*(_QWORD *)&v31 & 0x1000000000) != 0)
      goto LABEL_115;
LABEL_124:
    v39 = 0;
    if ((*(_DWORD *)&v31 & 0x40000000) != 0)
      goto LABEL_116;
    goto LABEL_125;
  }
LABEL_123:
  v41 = 0;
  if ((*(_QWORD *)&v31 & 0x1000000000) == 0)
    goto LABEL_124;
LABEL_115:
  v39 = 2654435761 * self->_isStoreDemoModeEnabled;
  if ((*(_DWORD *)&v31 & 0x40000000) != 0)
  {
LABEL_116:
    v32 = 2654435761 * self->_isDiagnosticsUsageEnabled;
    goto LABEL_126;
  }
LABEL_125:
  v32 = 0;
LABEL_126:
  v33 = -[NSMutableArray hash](self->_regionIds, "hash", v39);
  v34 = -[NSString hash](self->_appBuildNumber, "hash");
  v35 = -[NSString hash](self->_amsPurchaseId, "hash");
  v36 = -[NSString hash](self->_amsCampaignId, "hash");
  if ((*((_BYTE *)&self->_has + 2) & 2) != 0)
    v37 = 2654435761 * self->_paywallConfigType;
  else
    v37 = 0;
  return v109 ^ v110 ^ v108 ^ v107 ^ v106 ^ v105 ^ v104 ^ v103 ^ v102 ^ v101 ^ v100 ^ v99 ^ v98 ^ v97 ^ v96 ^ v95 ^ v94 ^ v93 ^ v92 ^ v91 ^ v90 ^ v89 ^ v88 ^ v87 ^ v86 ^ v85 ^ v84 ^ v83 ^ v82 ^ v81 ^ v80 ^ v79 ^ v78 ^ v77 ^ v76 ^ v75 ^ v74 ^ v73 ^ v72 ^ v71 ^ v70 ^ v14 ^ v69 ^ v19 ^ v68 ^ v24 ^ v67 ^ v66 ^ v65 ^ v64 ^ v63 ^ v62 ^ v61 ^ v60 ^ v59 ^ v58 ^ v57 ^ v56 ^ v55 ^ v54 ^ v53 ^ v52 ^ v51 ^ v50 ^ v49 ^ v48 ^ v47 ^ v46 ^ v45 ^ v44 ^ v43 ^ v42 ^ v41 ^ v40 ^ v32 ^ v33 ^ v34 ^ v35 ^ v36 ^ v37;
}

- (void)mergeFrom:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t i;
  uint64_t v16;
  uint64_t v17;
  uint64_t j;
  uint64_t v19;
  id v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t k;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  _BYTE v29[128];
  uint64_t v30;

  v30 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  if (*((_QWORD *)v4 + 26))
    -[NTPBSession setDeviceModel:](self, "setDeviceModel:");
  if (*((_QWORD *)v4 + 27))
    -[NTPBSession setDevicePlatform:](self, "setDevicePlatform:");
  if (*((_QWORD *)v4 + 39))
    -[NTPBSession setOsVersion:](self, "setOsVersion:");
  if (*((_QWORD *)v4 + 17))
    -[NTPBSession setAppVersion:](self, "setAppVersion:");
  v5 = *((_QWORD *)v4 + 61);
  if ((v5 & 1) != 0)
  {
    self->_appBuild = *((_QWORD *)v4 + 7);
    *(_QWORD *)&self->_has |= 1uLL;
    v5 = *((_QWORD *)v4 + 61);
  }
  if ((v5 & 0x100000) != 0)
  {
    self->_utcOffset = *((_DWORD *)v4 + 104);
    *(_QWORD *)&self->_has |= 0x100000uLL;
  }
  if (*((_QWORD *)v4 + 25))
    -[NTPBSession setCountryCode:](self, "setCountryCode:");
  if (*((_QWORD *)v4 + 31))
    -[NTPBSession setLanguageCode:](self, "setLanguageCode:");
  if (*((_QWORD *)v4 + 21))
    -[NTPBSession setCarrier:](self, "setCarrier:");
  v6 = *((_QWORD *)v4 + 61);
  if ((v6 & 0x40000) != 0)
  {
    self->_reachabilityStatus = *((_DWORD *)v4 + 90);
    *(_QWORD *)&self->_has |= 0x40000uLL;
    v6 = *((_QWORD *)v4 + 61);
    if ((v6 & 0x100) == 0)
    {
LABEL_21:
      if ((v6 & 0x80000) == 0)
        goto LABEL_23;
      goto LABEL_22;
    }
  }
  else if ((v6 & 0x100) == 0)
  {
    goto LABEL_21;
  }
  self->_cellularRadioAccessTechnology = *((_DWORD *)v4 + 44);
  *(_QWORD *)&self->_has |= 0x100uLL;
  if ((*((_QWORD *)v4 + 61) & 0x80000) != 0)
  {
LABEL_22:
    self->_textSize = *((_DWORD *)v4 + 98);
    *(_QWORD *)&self->_has |= 0x80000uLL;
  }
LABEL_23:
  if (*((_QWORD *)v4 + 47))
    -[NTPBSession setSessionId:](self, "setSessionId:");
  if (*((_QWORD *)v4 + 50))
    -[NTPBSession setUserId:](self, "setUserId:");
  if (*((_QWORD *)v4 + 51))
    -[NTPBSession setUserStorefrontId:](self, "setUserStorefrontId:");
  v7 = *((_QWORD *)v4 + 61);
  if ((v7 & 0x80000000) != 0)
  {
    self->_isNewUser = *((_BYTE *)v4 + 471);
    *(_QWORD *)&self->_has |= 0x80000000uLL;
    v7 = *((_QWORD *)v4 + 61);
    if ((v7 & 0x10) == 0)
    {
LABEL_31:
      if ((v7 & 4) == 0)
        goto LABEL_32;
      goto LABEL_143;
    }
  }
  else if ((v7 & 0x10) == 0)
  {
    goto LABEL_31;
  }
  self->_userStartDate = *((_QWORD *)v4 + 11);
  *(_QWORD *)&self->_has |= 0x10uLL;
  v7 = *((_QWORD *)v4 + 61);
  if ((v7 & 4) == 0)
  {
LABEL_32:
    if ((v7 & 0x40000000000) == 0)
      goto LABEL_33;
    goto LABEL_144;
  }
LABEL_143:
  self->_lastAppOpenDate = *((_QWORD *)v4 + 9);
  *(_QWORD *)&self->_has |= 4uLL;
  v7 = *((_QWORD *)v4 + 61);
  if ((v7 & 0x40000000000) == 0)
  {
LABEL_33:
    if ((v7 & 0x200000000000) == 0)
      goto LABEL_35;
    goto LABEL_34;
  }
LABEL_144:
  self->_runningObsolete = *((_BYTE *)v4 + 482);
  *(_QWORD *)&self->_has |= 0x40000000000uLL;
  if ((*((_QWORD *)v4 + 61) & 0x200000000000) != 0)
  {
LABEL_34:
    self->_upgradedFromObsolete = *((_BYTE *)v4 + 485);
    *(_QWORD *)&self->_has |= 0x200000000000uLL;
  }
LABEL_35:
  if (*((_QWORD *)v4 + 42))
    -[NTPBSession setPreviousAppVersion:](self, "setPreviousAppVersion:");
  if (*((_QWORD *)v4 + 43))
    -[NTPBSession setPreviousOsVersion:](self, "setPreviousOsVersion:");
  v8 = *((_QWORD *)v4 + 61);
  if ((v8 & 0x100000000000) != 0)
  {
    self->_signedIntoIcloud = *((_BYTE *)v4 + 484);
    *(_QWORD *)&self->_has |= 0x100000000000uLL;
    v8 = *((_QWORD *)v4 + 61);
  }
  if ((v8 & 0x10000) != 0)
  {
    self->_osInstallVariant = *((_DWORD *)v4 + 76);
    *(_QWORD *)&self->_has |= 0x10000uLL;
  }
  if (*((_QWORD *)v4 + 19))
    -[NTPBSession setCampaignId:](self, "setCampaignId:");
  v9 = *((_QWORD *)v4 + 61);
  if ((v9 & 0x80) != 0)
  {
    self->_campaignType = *((_DWORD *)v4 + 40);
    *(_QWORD *)&self->_has |= 0x80uLL;
    v9 = *((_QWORD *)v4 + 61);
    if ((v9 & 0x10000000000) == 0)
    {
LABEL_47:
      if ((v9 & 0x100000000) == 0)
        goto LABEL_48;
      goto LABEL_148;
    }
  }
  else if ((v9 & 0x10000000000) == 0)
  {
    goto LABEL_47;
  }
  self->_privateDataSyncOn = *((_BYTE *)v4 + 480);
  *(_QWORD *)&self->_has |= 0x10000000000uLL;
  v9 = *((_QWORD *)v4 + 61);
  if ((v9 & 0x100000000) == 0)
  {
LABEL_48:
    if ((v9 & 0x400000000) == 0)
      goto LABEL_49;
    goto LABEL_149;
  }
LABEL_148:
  self->_isPaidSubscriber = *((_BYTE *)v4 + 472);
  *(_QWORD *)&self->_has |= 0x100000000uLL;
  v9 = *((_QWORD *)v4 + 61);
  if ((v9 & 0x400000000) == 0)
  {
LABEL_49:
    if ((v9 & 0x200000000) == 0)
      goto LABEL_50;
    goto LABEL_150;
  }
LABEL_149:
  self->_isPaidSubscriberFromNews = *((_BYTE *)v4 + 474);
  *(_QWORD *)&self->_has |= 0x400000000uLL;
  v9 = *((_QWORD *)v4 + 61);
  if ((v9 & 0x200000000) == 0)
  {
LABEL_50:
    if ((v9 & 0x800000000) == 0)
      goto LABEL_51;
    goto LABEL_151;
  }
LABEL_150:
  self->_isPaidSubscriberFromAppStore = *((_BYTE *)v4 + 473);
  *(_QWORD *)&self->_has |= 0x200000000uLL;
  v9 = *((_QWORD *)v4 + 61);
  if ((v9 & 0x800000000) == 0)
  {
LABEL_51:
    if ((v9 & 0x4000000000) == 0)
      goto LABEL_53;
    goto LABEL_52;
  }
LABEL_151:
  self->_isPaidSubscriberFromThirdParty = *((_BYTE *)v4 + 475);
  *(_QWORD *)&self->_has |= 0x800000000uLL;
  if ((*((_QWORD *)v4 + 61) & 0x4000000000) != 0)
  {
LABEL_52:
    self->_notificationsEnabled = *((_BYTE *)v4 + 478);
    *(_QWORD *)&self->_has |= 0x4000000000uLL;
  }
LABEL_53:
  if (*((_QWORD *)v4 + 35))
    -[NTPBSession setOriginatingCampaignId:](self, "setOriginatingCampaignId:");
  if (*((_QWORD *)v4 + 36))
    -[NTPBSession setOriginatingCampaignType:](self, "setOriginatingCampaignType:");
  if (*((_QWORD *)v4 + 37))
    -[NTPBSession setOriginatingCreativeId:](self, "setOriginatingCreativeId:");
  v10 = *((_QWORD *)v4 + 61);
  if ((v10 & 0x2000000) != 0)
  {
    self->_iosSettingsNotificationsEnabled = *((_BYTE *)v4 + 465);
    *(_QWORD *)&self->_has |= 0x2000000uLL;
    v10 = *((_QWORD *)v4 + 61);
    if ((v10 & 0x800000) == 0)
    {
LABEL_61:
      if ((v10 & 0x2000000000) == 0)
        goto LABEL_62;
      goto LABEL_155;
    }
  }
  else if ((v10 & 0x800000) == 0)
  {
    goto LABEL_61;
  }
  self->_widgetModeType = *((_DWORD *)v4 + 110);
  *(_QWORD *)&self->_has |= 0x800000uLL;
  v10 = *((_QWORD *)v4 + 61);
  if ((v10 & 0x2000000000) == 0)
  {
LABEL_62:
    if ((v10 & 0x8000) == 0)
      goto LABEL_64;
    goto LABEL_63;
  }
LABEL_155:
  self->_locationPermissionGranted = *((_BYTE *)v4 + 477);
  *(_QWORD *)&self->_has |= 0x2000000000uLL;
  if ((*((_QWORD *)v4 + 61) & 0x8000) != 0)
  {
LABEL_63:
    self->_newsWidgetModeGroup = *((_DWORD *)v4 + 64);
    *(_QWORD *)&self->_has |= 0x8000uLL;
  }
LABEL_64:
  if (*((_QWORD *)v4 + 33))
    -[NTPBSession setNewsWidgetModeGroupId:](self, "setNewsWidgetModeGroupId:");
  v11 = *((_QWORD *)v4 + 61);
  if ((v11 & 0x20) != 0)
  {
    self->_ageBracket = *((_DWORD *)v4 + 24);
    *(_QWORD *)&self->_has |= 0x20uLL;
    v11 = *((_QWORD *)v4 + 61);
    if ((v11 & 0x40) == 0)
    {
LABEL_68:
      if ((v11 & 0x800) == 0)
        goto LABEL_69;
      goto LABEL_159;
    }
  }
  else if ((v11 & 0x40) == 0)
  {
    goto LABEL_68;
  }
  self->_ageBracketConfidenceLevel = *((float *)v4 + 25);
  *(_QWORD *)&self->_has |= 0x40uLL;
  v11 = *((_QWORD *)v4 + 61);
  if ((v11 & 0x800) == 0)
  {
LABEL_69:
    if ((v11 & 0x1000) == 0)
      goto LABEL_70;
    goto LABEL_160;
  }
LABEL_159:
  self->_gender = *((_DWORD *)v4 + 58);
  *(_QWORD *)&self->_has |= 0x800uLL;
  v11 = *((_QWORD *)v4 + 61);
  if ((v11 & 0x1000) == 0)
  {
LABEL_70:
    if ((v11 & 0x2000) == 0)
      goto LABEL_71;
    goto LABEL_161;
  }
LABEL_160:
  self->_genderConfidenceLevel = *((float *)v4 + 59);
  *(_QWORD *)&self->_has |= 0x1000uLL;
  v11 = *((_QWORD *)v4 + 61);
  if ((v11 & 0x2000) == 0)
  {
LABEL_71:
    if ((v11 & 0x4000) == 0)
      goto LABEL_72;
    goto LABEL_162;
  }
LABEL_161:
  self->_incomeBracket = *((_DWORD *)v4 + 60);
  *(_QWORD *)&self->_has |= 0x2000uLL;
  v11 = *((_QWORD *)v4 + 61);
  if ((v11 & 0x4000) == 0)
  {
LABEL_72:
    if ((v11 & 0x200) == 0)
      goto LABEL_73;
    goto LABEL_163;
  }
LABEL_162:
  self->_incomeBracketConfidenceLevel = *((float *)v4 + 61);
  *(_QWORD *)&self->_has |= 0x4000uLL;
  v11 = *((_QWORD *)v4 + 61);
  if ((v11 & 0x200) == 0)
  {
LABEL_73:
    if ((v11 & 0x400) == 0)
      goto LABEL_74;
    goto LABEL_164;
  }
LABEL_163:
  self->_ethnicity = *((_DWORD *)v4 + 56);
  *(_QWORD *)&self->_has |= 0x200uLL;
  v11 = *((_QWORD *)v4 + 61);
  if ((v11 & 0x400) == 0)
  {
LABEL_74:
    if ((v11 & 2) == 0)
      goto LABEL_76;
    goto LABEL_75;
  }
LABEL_164:
  self->_ethnicityConfidenceLevel = *((float *)v4 + 57);
  *(_QWORD *)&self->_has |= 0x400uLL;
  if ((*((_QWORD *)v4 + 61) & 2) != 0)
  {
LABEL_75:
    self->_appConfigTreatmentId = *((_QWORD *)v4 + 8);
    *(_QWORD *)&self->_has |= 2uLL;
  }
LABEL_76:
  if (*((_QWORD *)v4 + 23))
    -[NTPBSession setClientName:](self, "setClientName:");
  if (*((_QWORD *)v4 + 24))
    -[NTPBSession setClientVersion:](self, "setClientVersion:");
  if (*((_QWORD *)v4 + 18))
    -[NTPBSession setBrowserLanguage:](self, "setBrowserLanguage:");
  if (*((_QWORD *)v4 + 34))
    -[NTPBSession setNotwUserId:](self, "setNotwUserId:");
  v12 = *((_QWORD *)v4 + 61);
  if ((v12 & 0x8000000000) != 0)
  {
    self->_privateDataEncrypted = *((_BYTE *)v4 + 479);
    *(_QWORD *)&self->_has |= 0x8000000000uLL;
    v12 = *((_QWORD *)v4 + 61);
  }
  if ((v12 & 0x20000000000) != 0)
  {
    self->_progressivePersonalizationAllowed = *((_BYTE *)v4 + 481);
    *(_QWORD *)&self->_has |= 0x20000000000uLL;
  }
  if (*((_QWORD *)v4 + 53))
    -[NTPBSession setWatchSessionId:](self, "setWatchSessionId:");
  if (*((_QWORD *)v4 + 48))
    -[NTPBSession setSessionIdWatch:](self, "setSessionIdWatch:");
  if (*((_QWORD *)v4 + 56))
    -[NTPBSession setWidgetSessionId:](self, "setWidgetSessionId:");
  if ((*((_BYTE *)v4 + 490) & 0x20) != 0)
  {
    self->_widgetDisplayMode = *((_DWORD *)v4 + 108);
    *(_QWORD *)&self->_has |= 0x200000uLL;
  }
  if (*((_QWORD *)v4 + 41))
    -[NTPBSession setPersonalizationPortraitVariantName:](self, "setPersonalizationPortraitVariantName:");
  if (*((_QWORD *)v4 + 16))
    -[NTPBSession setAppProcessLifetimeId:](self, "setAppProcessLifetimeId:");
  if ((*((_BYTE *)v4 + 488) & 8) != 0)
  {
    self->_testBucket = *((_QWORD *)v4 + 10);
    *(_QWORD *)&self->_has |= 8uLL;
  }
  if (*((_QWORD *)v4 + 57))
    -[NTPBSession setWidgetUserId:](self, "setWidgetUserId:");
  if (*((_QWORD *)v4 + 44))
    -[NTPBSession setProductType:](self, "setProductType:");
  v13 = objc_msgSend(v4, "userSegmentationTreatmentIdsCount");
  if (v13)
  {
    v14 = v13;
    for (i = 0; i != v14; ++i)
      -[NTPBSession addUserSegmentationTreatmentIds:](self, "addUserSegmentationTreatmentIds:", objc_msgSend(v4, "userSegmentationTreatmentIdsAtIndex:", i));
  }
  v16 = objc_msgSend(v4, "userSegmentationSegmentSetIdsCount");
  if (v16)
  {
    v17 = v16;
    for (j = 0; j != v17; ++j)
      -[NTPBSession addUserSegmentationSegmentSetIds:](self, "addUserSegmentationSegmentSetIds:", objc_msgSend(v4, "userSegmentationSegmentSetIdsAtIndex:", j));
  }
  v19 = *((_QWORD *)v4 + 61);
  if ((v19 & 0x20000000) != 0)
  {
    self->_iosSettingsNotificationsSoundEnabled = *((_BYTE *)v4 + 469);
    *(_QWORD *)&self->_has |= 0x20000000uLL;
    v19 = *((_QWORD *)v4 + 61);
    if ((v19 & 0x1000000) == 0)
    {
LABEL_114:
      if ((v19 & 0x10000000) == 0)
        goto LABEL_115;
      goto LABEL_168;
    }
  }
  else if ((v19 & 0x1000000) == 0)
  {
    goto LABEL_114;
  }
  self->_iosSettingsNotificationsBadgeAppIconEnabled = *((_BYTE *)v4 + 464);
  *(_QWORD *)&self->_has |= 0x1000000uLL;
  v19 = *((_QWORD *)v4 + 61);
  if ((v19 & 0x10000000) == 0)
  {
LABEL_115:
    if ((v19 & 0x8000000) == 0)
      goto LABEL_116;
    goto LABEL_169;
  }
LABEL_168:
  self->_iosSettingsNotificationsShowOnLockScreenEnabled = *((_BYTE *)v4 + 468);
  *(_QWORD *)&self->_has |= 0x10000000uLL;
  v19 = *((_QWORD *)v4 + 61);
  if ((v19 & 0x8000000) == 0)
  {
LABEL_116:
    if ((v19 & 0x4000000) == 0)
      goto LABEL_117;
    goto LABEL_170;
  }
LABEL_169:
  self->_iosSettingsNotificationsShowInHistoryEnabled = *((_BYTE *)v4 + 467);
  *(_QWORD *)&self->_has |= 0x8000000uLL;
  v19 = *((_QWORD *)v4 + 61);
  if ((v19 & 0x4000000) == 0)
  {
LABEL_117:
    if ((v19 & 0x400000) == 0)
      goto LABEL_118;
    goto LABEL_171;
  }
LABEL_170:
  self->_iosSettingsNotificationsShowAsBannersEnabled = *((_BYTE *)v4 + 466);
  *(_QWORD *)&self->_has |= 0x4000000uLL;
  v19 = *((_QWORD *)v4 + 61);
  if ((v19 & 0x400000) == 0)
  {
LABEL_118:
    if ((v19 & 0x80000000000) == 0)
      goto LABEL_119;
    goto LABEL_172;
  }
LABEL_171:
  self->_widgetDisplayModeSessionEnd = *((_DWORD *)v4 + 109);
  *(_QWORD *)&self->_has |= 0x400000uLL;
  v19 = *((_QWORD *)v4 + 61);
  if ((v19 & 0x80000000000) == 0)
  {
LABEL_119:
    if ((v19 & 0x1000000000) == 0)
      goto LABEL_120;
    goto LABEL_173;
  }
LABEL_172:
  self->_signedIntoITunes = *((_BYTE *)v4 + 483);
  *(_QWORD *)&self->_has |= 0x80000000000uLL;
  v19 = *((_QWORD *)v4 + 61);
  if ((v19 & 0x1000000000) == 0)
  {
LABEL_120:
    if ((v19 & 0x40000000) == 0)
      goto LABEL_122;
    goto LABEL_121;
  }
LABEL_173:
  self->_isStoreDemoModeEnabled = *((_BYTE *)v4 + 476);
  *(_QWORD *)&self->_has |= 0x1000000000uLL;
  if ((*((_QWORD *)v4 + 61) & 0x40000000) != 0)
  {
LABEL_121:
    self->_isDiagnosticsUsageEnabled = *((_BYTE *)v4 + 470);
    *(_QWORD *)&self->_has |= 0x40000000uLL;
  }
LABEL_122:
  v27 = 0u;
  v28 = 0u;
  v25 = 0u;
  v26 = 0u;
  v20 = *((id *)v4 + 46);
  v21 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
  if (v21)
  {
    v22 = v21;
    v23 = *(_QWORD *)v26;
    do
    {
      for (k = 0; k != v22; ++k)
      {
        if (*(_QWORD *)v26 != v23)
          objc_enumerationMutation(v20);
        -[NTPBSession addRegionIds:](self, "addRegionIds:", *(_QWORD *)(*((_QWORD *)&v25 + 1) + 8 * k), (_QWORD)v25);
      }
      v22 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
    }
    while (v22);
  }

  if (*((_QWORD *)v4 + 15))
    -[NTPBSession setAppBuildNumber:](self, "setAppBuildNumber:");
  if (*((_QWORD *)v4 + 14))
    -[NTPBSession setAmsPurchaseId:](self, "setAmsPurchaseId:");
  if (*((_QWORD *)v4 + 13))
    -[NTPBSession setAmsCampaignId:](self, "setAmsCampaignId:");
  if ((*((_BYTE *)v4 + 490) & 2) != 0)
  {
    self->_paywallConfigType = *((_DWORD *)v4 + 80);
    *(_QWORD *)&self->_has |= 0x20000uLL;
  }

}

- (NSString)deviceModel
{
  return self->_deviceModel;
}

- (void)setDeviceModel:(id)a3
{
  objc_storeStrong((id *)&self->_deviceModel, a3);
}

- (NSString)devicePlatform
{
  return self->_devicePlatform;
}

- (void)setDevicePlatform:(id)a3
{
  objc_storeStrong((id *)&self->_devicePlatform, a3);
}

- (NSString)osVersion
{
  return self->_osVersion;
}

- (void)setOsVersion:(id)a3
{
  objc_storeStrong((id *)&self->_osVersion, a3);
}

- (NSString)appVersion
{
  return self->_appVersion;
}

- (void)setAppVersion:(id)a3
{
  objc_storeStrong((id *)&self->_appVersion, a3);
}

- (int64_t)appBuild
{
  return self->_appBuild;
}

- (int)utcOffset
{
  return self->_utcOffset;
}

- (NSString)countryCode
{
  return self->_countryCode;
}

- (void)setCountryCode:(id)a3
{
  objc_storeStrong((id *)&self->_countryCode, a3);
}

- (NSString)languageCode
{
  return self->_languageCode;
}

- (void)setLanguageCode:(id)a3
{
  objc_storeStrong((id *)&self->_languageCode, a3);
}

- (NSString)carrier
{
  return self->_carrier;
}

- (void)setCarrier:(id)a3
{
  objc_storeStrong((id *)&self->_carrier, a3);
}

- (int)textSize
{
  return self->_textSize;
}

- (NSData)sessionId
{
  return self->_sessionId;
}

- (void)setSessionId:(id)a3
{
  objc_storeStrong((id *)&self->_sessionId, a3);
}

- (NSString)userId
{
  return self->_userId;
}

- (void)setUserId:(id)a3
{
  objc_storeStrong((id *)&self->_userId, a3);
}

- (NSString)userStorefrontId
{
  return self->_userStorefrontId;
}

- (void)setUserStorefrontId:(id)a3
{
  objc_storeStrong((id *)&self->_userStorefrontId, a3);
}

- (BOOL)isNewUser
{
  return self->_isNewUser;
}

- (int64_t)userStartDate
{
  return self->_userStartDate;
}

- (int64_t)lastAppOpenDate
{
  return self->_lastAppOpenDate;
}

- (BOOL)runningObsolete
{
  return self->_runningObsolete;
}

- (BOOL)upgradedFromObsolete
{
  return self->_upgradedFromObsolete;
}

- (NSString)previousAppVersion
{
  return self->_previousAppVersion;
}

- (void)setPreviousAppVersion:(id)a3
{
  objc_storeStrong((id *)&self->_previousAppVersion, a3);
}

- (NSString)previousOsVersion
{
  return self->_previousOsVersion;
}

- (void)setPreviousOsVersion:(id)a3
{
  objc_storeStrong((id *)&self->_previousOsVersion, a3);
}

- (BOOL)signedIntoIcloud
{
  return self->_signedIntoIcloud;
}

- (NSString)campaignId
{
  return self->_campaignId;
}

- (void)setCampaignId:(id)a3
{
  objc_storeStrong((id *)&self->_campaignId, a3);
}

- (BOOL)privateDataSyncOn
{
  return self->_privateDataSyncOn;
}

- (BOOL)isPaidSubscriber
{
  return self->_isPaidSubscriber;
}

- (BOOL)isPaidSubscriberFromNews
{
  return self->_isPaidSubscriberFromNews;
}

- (BOOL)isPaidSubscriberFromAppStore
{
  return self->_isPaidSubscriberFromAppStore;
}

- (BOOL)isPaidSubscriberFromThirdParty
{
  return self->_isPaidSubscriberFromThirdParty;
}

- (BOOL)notificationsEnabled
{
  return self->_notificationsEnabled;
}

- (NSString)originatingCampaignId
{
  return self->_originatingCampaignId;
}

- (void)setOriginatingCampaignId:(id)a3
{
  objc_storeStrong((id *)&self->_originatingCampaignId, a3);
}

- (NSString)originatingCampaignType
{
  return self->_originatingCampaignType;
}

- (void)setOriginatingCampaignType:(id)a3
{
  objc_storeStrong((id *)&self->_originatingCampaignType, a3);
}

- (NSString)originatingCreativeId
{
  return self->_originatingCreativeId;
}

- (void)setOriginatingCreativeId:(id)a3
{
  objc_storeStrong((id *)&self->_originatingCreativeId, a3);
}

- (BOOL)iosSettingsNotificationsEnabled
{
  return self->_iosSettingsNotificationsEnabled;
}

- (BOOL)locationPermissionGranted
{
  return self->_locationPermissionGranted;
}

- (NSString)newsWidgetModeGroupId
{
  return self->_newsWidgetModeGroupId;
}

- (void)setNewsWidgetModeGroupId:(id)a3
{
  objc_storeStrong((id *)&self->_newsWidgetModeGroupId, a3);
}

- (int)ageBracket
{
  return self->_ageBracket;
}

- (float)ageBracketConfidenceLevel
{
  return self->_ageBracketConfidenceLevel;
}

- (int)gender
{
  return self->_gender;
}

- (float)genderConfidenceLevel
{
  return self->_genderConfidenceLevel;
}

- (int)incomeBracket
{
  return self->_incomeBracket;
}

- (float)incomeBracketConfidenceLevel
{
  return self->_incomeBracketConfidenceLevel;
}

- (int)ethnicity
{
  return self->_ethnicity;
}

- (float)ethnicityConfidenceLevel
{
  return self->_ethnicityConfidenceLevel;
}

- (int64_t)appConfigTreatmentId
{
  return self->_appConfigTreatmentId;
}

- (NSString)clientName
{
  return self->_clientName;
}

- (void)setClientName:(id)a3
{
  objc_storeStrong((id *)&self->_clientName, a3);
}

- (NSString)clientVersion
{
  return self->_clientVersion;
}

- (void)setClientVersion:(id)a3
{
  objc_storeStrong((id *)&self->_clientVersion, a3);
}

- (NSString)browserLanguage
{
  return self->_browserLanguage;
}

- (void)setBrowserLanguage:(id)a3
{
  objc_storeStrong((id *)&self->_browserLanguage, a3);
}

- (NSString)notwUserId
{
  return self->_notwUserId;
}

- (void)setNotwUserId:(id)a3
{
  objc_storeStrong((id *)&self->_notwUserId, a3);
}

- (BOOL)privateDataEncrypted
{
  return self->_privateDataEncrypted;
}

- (BOOL)progressivePersonalizationAllowed
{
  return self->_progressivePersonalizationAllowed;
}

- (NSString)watchSessionId
{
  return self->_watchSessionId;
}

- (void)setWatchSessionId:(id)a3
{
  objc_storeStrong((id *)&self->_watchSessionId, a3);
}

- (NSData)sessionIdWatch
{
  return self->_sessionIdWatch;
}

- (void)setSessionIdWatch:(id)a3
{
  objc_storeStrong((id *)&self->_sessionIdWatch, a3);
}

- (NSData)widgetSessionId
{
  return self->_widgetSessionId;
}

- (void)setWidgetSessionId:(id)a3
{
  objc_storeStrong((id *)&self->_widgetSessionId, a3);
}

- (NSString)personalizationPortraitVariantName
{
  return self->_personalizationPortraitVariantName;
}

- (void)setPersonalizationPortraitVariantName:(id)a3
{
  objc_storeStrong((id *)&self->_personalizationPortraitVariantName, a3);
}

- (NSData)appProcessLifetimeId
{
  return self->_appProcessLifetimeId;
}

- (void)setAppProcessLifetimeId:(id)a3
{
  objc_storeStrong((id *)&self->_appProcessLifetimeId, a3);
}

- (int64_t)testBucket
{
  return self->_testBucket;
}

- (NSString)widgetUserId
{
  return self->_widgetUserId;
}

- (void)setWidgetUserId:(id)a3
{
  objc_storeStrong((id *)&self->_widgetUserId, a3);
}

- (NSString)productType
{
  return self->_productType;
}

- (void)setProductType:(id)a3
{
  objc_storeStrong((id *)&self->_productType, a3);
}

- (BOOL)iosSettingsNotificationsSoundEnabled
{
  return self->_iosSettingsNotificationsSoundEnabled;
}

- (BOOL)iosSettingsNotificationsBadgeAppIconEnabled
{
  return self->_iosSettingsNotificationsBadgeAppIconEnabled;
}

- (BOOL)iosSettingsNotificationsShowOnLockScreenEnabled
{
  return self->_iosSettingsNotificationsShowOnLockScreenEnabled;
}

- (BOOL)iosSettingsNotificationsShowInHistoryEnabled
{
  return self->_iosSettingsNotificationsShowInHistoryEnabled;
}

- (BOOL)iosSettingsNotificationsShowAsBannersEnabled
{
  return self->_iosSettingsNotificationsShowAsBannersEnabled;
}

- (BOOL)signedIntoITunes
{
  return self->_signedIntoITunes;
}

- (BOOL)isStoreDemoModeEnabled
{
  return self->_isStoreDemoModeEnabled;
}

- (BOOL)isDiagnosticsUsageEnabled
{
  return self->_isDiagnosticsUsageEnabled;
}

- (NSMutableArray)regionIds
{
  return self->_regionIds;
}

- (void)setRegionIds:(id)a3
{
  objc_storeStrong((id *)&self->_regionIds, a3);
}

- (NSString)appBuildNumber
{
  return self->_appBuildNumber;
}

- (void)setAppBuildNumber:(id)a3
{
  objc_storeStrong((id *)&self->_appBuildNumber, a3);
}

- (NSString)amsPurchaseId
{
  return self->_amsPurchaseId;
}

- (void)setAmsPurchaseId:(id)a3
{
  objc_storeStrong((id *)&self->_amsPurchaseId, a3);
}

- (NSString)amsCampaignId
{
  return self->_amsCampaignId;
}

- (void)setAmsCampaignId:(id)a3
{
  objc_storeStrong((id *)&self->_amsCampaignId, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_widgetUserId, 0);
  objc_storeStrong((id *)&self->_widgetSessionId, 0);
  objc_storeStrong((id *)&self->_watchSessionId, 0);
  objc_storeStrong((id *)&self->_userStorefrontId, 0);
  objc_storeStrong((id *)&self->_userId, 0);
  objc_storeStrong((id *)&self->_sessionIdWatch, 0);
  objc_storeStrong((id *)&self->_sessionId, 0);
  objc_storeStrong((id *)&self->_regionIds, 0);
  objc_storeStrong((id *)&self->_productType, 0);
  objc_storeStrong((id *)&self->_previousOsVersion, 0);
  objc_storeStrong((id *)&self->_previousAppVersion, 0);
  objc_storeStrong((id *)&self->_personalizationPortraitVariantName, 0);
  objc_storeStrong((id *)&self->_osVersion, 0);
  objc_storeStrong((id *)&self->_originatingCreativeId, 0);
  objc_storeStrong((id *)&self->_originatingCampaignType, 0);
  objc_storeStrong((id *)&self->_originatingCampaignId, 0);
  objc_storeStrong((id *)&self->_notwUserId, 0);
  objc_storeStrong((id *)&self->_newsWidgetModeGroupId, 0);
  objc_storeStrong((id *)&self->_languageCode, 0);
  objc_storeStrong((id *)&self->_devicePlatform, 0);
  objc_storeStrong((id *)&self->_deviceModel, 0);
  objc_storeStrong((id *)&self->_countryCode, 0);
  objc_storeStrong((id *)&self->_clientVersion, 0);
  objc_storeStrong((id *)&self->_clientName, 0);
  objc_storeStrong((id *)&self->_carrier, 0);
  objc_storeStrong((id *)&self->_campaignId, 0);
  objc_storeStrong((id *)&self->_browserLanguage, 0);
  objc_storeStrong((id *)&self->_appVersion, 0);
  objc_storeStrong((id *)&self->_appProcessLifetimeId, 0);
  objc_storeStrong((id *)&self->_appBuildNumber, 0);
  objc_storeStrong((id *)&self->_amsPurchaseId, 0);
  objc_storeStrong((id *)&self->_amsCampaignId, 0);
}

@end
