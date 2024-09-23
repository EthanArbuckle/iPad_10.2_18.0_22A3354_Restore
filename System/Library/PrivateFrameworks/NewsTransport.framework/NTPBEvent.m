@implementation NTPBEvent

- (BOOL)hasEventObject
{
  return self->_eventObject != 0;
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

- (void)setStartTimestamp:(int64_t)a3
{
  *(_DWORD *)&self->_has |= 0x10u;
  self->_startTimestamp = a3;
}

- (void)setHasStartTimestamp:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 16;
  else
    v3 = 0;
  self->_has = ($D741C7B20A104483CE535A1F820EC5B8)(*(_DWORD *)&self->_has & 0xFFFFFFEF | v3);
}

- (BOOL)hasStartTimestamp
{
  return (*(_BYTE *)&self->_has >> 4) & 1;
}

- (void)setDuration:(int64_t)a3
{
  *(_DWORD *)&self->_has |= 2u;
  self->_duration = a3;
}

- (void)setHasDuration:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  self->_has = ($D741C7B20A104483CE535A1F820EC5B8)(*(_DWORD *)&self->_has & 0xFFFFFFFD | v3);
}

- (BOOL)hasDuration
{
  return (*(_BYTE *)&self->_has >> 1) & 1;
}

- (int)deviceOrientation
{
  if ((*(_BYTE *)&self->_has & 0x80) != 0)
    return self->_deviceOrientation;
  else
    return 0;
}

- (void)setDeviceOrientation:(int)a3
{
  *(_DWORD *)&self->_has |= 0x80u;
  self->_deviceOrientation = a3;
}

- (void)setHasDeviceOrientation:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 128;
  else
    v3 = 0;
  self->_has = ($D741C7B20A104483CE535A1F820EC5B8)(*(_DWORD *)&self->_has & 0xFFFFFF7F | v3);
}

- (BOOL)hasDeviceOrientation
{
  return *(_BYTE *)&self->_has >> 7;
}

- (BOOL)hasReferringType
{
  return self->_referringType != 0;
}

- (BOOL)hasReferringSource
{
  return self->_referringSource != 0;
}

- (BOOL)hasWindowFrameInScreen
{
  return self->_windowFrameInScreen != 0;
}

- (int)gestureType
{
  if ((*((_BYTE *)&self->_has + 1) & 1) != 0)
    return self->_gestureType;
  else
    return 0;
}

- (void)setGestureType:(int)a3
{
  *(_DWORD *)&self->_has |= 0x100u;
  self->_gestureType = a3;
}

- (void)setHasGestureType:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 256;
  else
    v3 = 0;
  self->_has = ($D741C7B20A104483CE535A1F820EC5B8)(*(_DWORD *)&self->_has & 0xFFFFFEFF | v3);
}

- (BOOL)hasGestureType
{
  return *((_BYTE *)&self->_has + 1) & 1;
}

- (int)interfaceOrientation
{
  if ((*((_BYTE *)&self->_has + 1) & 2) != 0)
    return self->_interfaceOrientation;
  else
    return 0;
}

- (void)setInterfaceOrientation:(int)a3
{
  *(_DWORD *)&self->_has |= 0x200u;
  self->_interfaceOrientation = a3;
}

- (void)setHasInterfaceOrientation:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 512;
  else
    v3 = 0;
  self->_has = ($D741C7B20A104483CE535A1F820EC5B8)(*(_DWORD *)&self->_has & 0xFFFFFDFF | v3);
}

- (BOOL)hasInterfaceOrientation
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 1) & 1;
}

- (int)reachabilityStatus
{
  if ((*((_BYTE *)&self->_has + 1) & 4) != 0)
    return self->_reachabilityStatus;
  else
    return 0;
}

- (void)setReachabilityStatus:(int)a3
{
  *(_DWORD *)&self->_has |= 0x400u;
  self->_reachabilityStatus = a3;
}

- (void)setHasReachabilityStatus:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 1024;
  else
    v3 = 0;
  self->_has = ($D741C7B20A104483CE535A1F820EC5B8)(*(_DWORD *)&self->_has & 0xFFFFFBFF | v3);
}

- (BOOL)hasReachabilityStatus
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 2) & 1;
}

- (id)reachabilityStatusAsString:(int)a3
{
  if (a3 < 5)
    return off_24CD52CC0[a3];
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
  if ((*(_BYTE *)&self->_has & 0x40) != 0)
    return self->_cellularRadioAccessTechnology;
  else
    return 0;
}

- (void)setCellularRadioAccessTechnology:(int)a3
{
  *(_DWORD *)&self->_has |= 0x40u;
  self->_cellularRadioAccessTechnology = a3;
}

- (void)setHasCellularRadioAccessTechnology:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 64;
  else
    v3 = 0;
  self->_has = ($D741C7B20A104483CE535A1F820EC5B8)(*(_DWORD *)&self->_has & 0xFFFFFFBF | v3);
}

- (BOOL)hasCellularRadioAccessTechnology
{
  return (*(_BYTE *)&self->_has >> 6) & 1;
}

- (id)cellularRadioAccessTechnologyAsString:(int)a3
{
  if (a3 < 0xE)
    return off_24CD52CE8[a3];
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

- (void)setPersonalizationTreatmentId:(int64_t)a3
{
  *(_DWORD *)&self->_has |= 4u;
  self->_personalizationTreatmentId = a3;
}

- (void)setHasPersonalizationTreatmentId:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 4;
  else
    v3 = 0;
  self->_has = ($D741C7B20A104483CE535A1F820EC5B8)(*(_DWORD *)&self->_has & 0xFFFFFFFB | v3);
}

- (BOOL)hasPersonalizationTreatmentId
{
  return (*(_BYTE *)&self->_has >> 2) & 1;
}

- (void)setPersonalizedTreatmentId:(int64_t)a3
{
  *(_DWORD *)&self->_has |= 8u;
  self->_personalizedTreatmentId = a3;
}

- (void)setHasPersonalizedTreatmentId:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 8;
  else
    v3 = 0;
  self->_has = ($D741C7B20A104483CE535A1F820EC5B8)(*(_DWORD *)&self->_has & 0xFFFFFFF7 | v3);
}

- (BOOL)hasPersonalizedTreatmentId
{
  return (*(_BYTE *)&self->_has >> 3) & 1;
}

- (void)setIsPaidSubscriberDuringEvent:(BOOL)a3
{
  *(_DWORD *)&self->_has |= 0x2000u;
  self->_isPaidSubscriberDuringEvent = a3;
}

- (void)setHasIsPaidSubscriberDuringEvent:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 0x2000;
  else
    v3 = 0;
  self->_has = ($D741C7B20A104483CE535A1F820EC5B8)(*(_DWORD *)&self->_has & 0xFFFFDFFF | v3);
}

- (BOOL)hasIsPaidSubscriberDuringEvent
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 5) & 1;
}

- (void)setIsPaidSubscriberFromNewsDuringEvent:(BOOL)a3
{
  *(_DWORD *)&self->_has |= 0x8000u;
  self->_isPaidSubscriberFromNewsDuringEvent = a3;
}

- (void)setHasIsPaidSubscriberFromNewsDuringEvent:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 0x8000;
  else
    v3 = 0;
  self->_has = ($D741C7B20A104483CE535A1F820EC5B8)(*(_DWORD *)&self->_has & 0xFFFF7FFF | v3);
}

- (BOOL)hasIsPaidSubscriberFromNewsDuringEvent
{
  return *((unsigned __int8 *)&self->_has + 1) >> 7;
}

- (void)setIsPaidSubscriberFromAppStoreDuringEvent:(BOOL)a3
{
  *(_DWORD *)&self->_has |= 0x4000u;
  self->_isPaidSubscriberFromAppStoreDuringEvent = a3;
}

- (void)setHasIsPaidSubscriberFromAppStoreDuringEvent:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 0x4000;
  else
    v3 = 0;
  self->_has = ($D741C7B20A104483CE535A1F820EC5B8)(*(_DWORD *)&self->_has & 0xFFFFBFFF | v3);
}

- (BOOL)hasIsPaidSubscriberFromAppStoreDuringEvent
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 6) & 1;
}

- (void)setIsPaidSubscriberFromThirdPartyDuringEvent:(BOOL)a3
{
  *(_DWORD *)&self->_has |= 0x10000u;
  self->_isPaidSubscriberFromThirdPartyDuringEvent = a3;
}

- (void)setHasIsPaidSubscriberFromThirdPartyDuringEvent:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 0x10000;
  else
    v3 = 0;
  self->_has = ($D741C7B20A104483CE535A1F820EC5B8)(*(_DWORD *)&self->_has & 0xFFFEFFFF | v3);
}

- (BOOL)hasIsPaidSubscriberFromThirdPartyDuringEvent
{
  return *((_BYTE *)&self->_has + 2) & 1;
}

- (BOOL)hasNotwUserId
{
  return self->_notwUserId != 0;
}

- (BOOL)hasSessionIdWatch
{
  return self->_sessionIdWatch != 0;
}

- (void)setAppConfigTreatmentId:(int64_t)a3
{
  *(_DWORD *)&self->_has |= 1u;
  self->_appConfigTreatmentId = a3;
}

- (void)setHasAppConfigTreatmentId:(BOOL)a3
{
  self->_has = ($D741C7B20A104483CE535A1F820EC5B8)(*(_DWORD *)&self->_has & 0xFFFFFFFE | a3);
}

- (BOOL)hasAppConfigTreatmentId
{
  return *(_DWORD *)&self->_has & 1;
}

- (BOOL)hasWidgetSessionId
{
  return self->_widgetSessionId != 0;
}

- (void)clearUserPaidSubscriptionStatus
{
  -[NSMutableArray removeAllObjects](self->_userPaidSubscriptionStatus, "removeAllObjects");
}

- (void)addUserPaidSubscriptionStatus:(id)a3
{
  id v4;
  NSMutableArray *userPaidSubscriptionStatus;
  NSMutableArray *v6;
  NSMutableArray *v7;
  id v8;

  v4 = a3;
  userPaidSubscriptionStatus = self->_userPaidSubscriptionStatus;
  v8 = v4;
  if (!userPaidSubscriptionStatus)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x24BDBCEB8]);
    v7 = self->_userPaidSubscriptionStatus;
    self->_userPaidSubscriptionStatus = v6;

    v4 = v8;
    userPaidSubscriptionStatus = self->_userPaidSubscriptionStatus;
  }
  -[NSMutableArray addObject:](userPaidSubscriptionStatus, "addObject:", v4);

}

- (unint64_t)userPaidSubscriptionStatusCount
{
  return -[NSMutableArray count](self->_userPaidSubscriptionStatus, "count");
}

- (id)userPaidSubscriptionStatusAtIndex:(unint64_t)a3
{
  return (id)-[NSMutableArray objectAtIndex:](self->_userPaidSubscriptionStatus, "objectAtIndex:", a3);
}

+ (Class)userPaidSubscriptionStatusType
{
  return (Class)objc_opt_class();
}

- (BOOL)hasWidgetUserId
{
  return self->_widgetUserId != 0;
}

- (int)bundleSubscriptionStatus
{
  if ((*(_BYTE *)&self->_has & 0x20) != 0)
    return self->_bundleSubscriptionStatus;
  else
    return 0;
}

- (void)setBundleSubscriptionStatus:(int)a3
{
  *(_DWORD *)&self->_has |= 0x20u;
  self->_bundleSubscriptionStatus = a3;
}

- (void)setHasBundleSubscriptionStatus:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 32;
  else
    v3 = 0;
  self->_has = ($D741C7B20A104483CE535A1F820EC5B8)(*(_DWORD *)&self->_has & 0xFFFFFFDF | v3);
}

- (BOOL)hasBundleSubscriptionStatus
{
  return (*(_BYTE *)&self->_has >> 5) & 1;
}

- (id)bundleSubscriptionStatusAsString:(int)a3
{
  if (a3 < 4)
    return off_24CD52D58[a3];
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (int)StringAsBundleSubscriptionStatus:(id)a3
{
  id v3;
  int v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("UNKNOWN_BUNDLE_SUBSCRIPTION_STATUS")) & 1) != 0)
  {
    v4 = 0;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("UNPAID_BUNDLE_SUBSCRIPTION_STATUS")) & 1) != 0)
  {
    v4 = 1;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("PAID_BUNDLE_SUBSCRIPTION_STATUS")) & 1) != 0)
  {
    v4 = 2;
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("NO_BUNDLE_SUBSCRIPTION_STATUS")))
  {
    v4 = 3;
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (BOOL)hasBundlePurchaseId
{
  return self->_bundlePurchaseId != 0;
}

- (BOOL)hasBundleOfferId
{
  return self->_bundleOfferId != 0;
}

- (void)setIsBundlePurchaser:(BOOL)a3
{
  *(_DWORD *)&self->_has |= 0x1000u;
  self->_isBundlePurchaser = a3;
}

- (void)setHasIsBundlePurchaser:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 4096;
  else
    v3 = 0;
  self->_has = ($D741C7B20A104483CE535A1F820EC5B8)(*(_DWORD *)&self->_has & 0xFFFFEFFF | v3);
}

- (BOOL)hasIsBundlePurchaser
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 4) & 1;
}

- (BOOL)hasAppAnalyticsEventIdentifier
{
  return self->_appAnalyticsEventIdentifier != 0;
}

- (BOOL)hasAppAnalyticsEventPath
{
  return self->_appAnalyticsEventPath != 0;
}

- (void)setIsAmplifyUser:(BOOL)a3
{
  *(_DWORD *)&self->_has |= 0x800u;
  self->_isAmplifyUser = a3;
}

- (void)setHasIsAmplifyUser:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 2048;
  else
    v3 = 0;
  self->_has = ($D741C7B20A104483CE535A1F820EC5B8)(*(_DWORD *)&self->_has & 0xFFFFF7FF | v3);
}

- (BOOL)hasIsAmplifyUser
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 3) & 1;
}

- (BOOL)hasSBundlePurchaseId
{
  return self->_sBundlePurchaseId != 0;
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
  v8.super_class = (Class)NTPBEvent;
  -[NTPBEvent description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[NTPBEvent dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  NTPBEventObject *eventObject;
  void *v5;
  NSData *sessionId;
  NSString *userId;
  NSString *userStorefrontId;
  $D741C7B20A104483CE535A1F820EC5B8 has;
  void *v10;
  NSString *referringType;
  NSString *referringSource;
  NSString *windowFrameInScreen;
  $D741C7B20A104483CE535A1F820EC5B8 v14;
  void *v15;
  NSString *notwUserId;
  NSData *sessionIdWatch;
  void *v18;
  NSData *widgetSessionId;
  void *v20;
  NSMutableArray *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t i;
  void *v26;
  NSString *widgetUserId;
  uint64_t bundleSubscriptionStatus;
  __CFString *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  uint64_t reachabilityStatus;
  __CFString *v35;
  NSString *bundlePurchaseId;
  NSString *bundleOfferId;
  void *v38;
  NSString *appAnalyticsEventIdentifier;
  NSString *appAnalyticsEventPath;
  void *v41;
  NSString *sBundlePurchaseId;
  id v43;
  uint64_t cellularRadioAccessTechnology;
  __CFString *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  _BYTE v56[128];
  uint64_t v57;

  v57 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  eventObject = self->_eventObject;
  if (eventObject)
  {
    -[NTPBEventObject dictionaryRepresentation](eventObject, "dictionaryRepresentation");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v5, CFSTR("event_object"));

  }
  sessionId = self->_sessionId;
  if (sessionId)
    objc_msgSend(v3, "setObject:forKey:", sessionId, CFSTR("session_id"));
  userId = self->_userId;
  if (userId)
    objc_msgSend(v3, "setObject:forKey:", userId, CFSTR("user_id"));
  userStorefrontId = self->_userStorefrontId;
  if (userStorefrontId)
    objc_msgSend(v3, "setObject:forKey:", userStorefrontId, CFSTR("user_storefront_id"));
  has = self->_has;
  if ((*(_BYTE *)&has & 0x10) != 0)
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithLongLong:", self->_startTimestamp);
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v30, CFSTR("start_timestamp"));

    has = self->_has;
    if ((*(_BYTE *)&has & 2) == 0)
    {
LABEL_11:
      if ((*(_BYTE *)&has & 0x80) == 0)
        goto LABEL_13;
      goto LABEL_12;
    }
  }
  else if ((*(_BYTE *)&has & 2) == 0)
  {
    goto LABEL_11;
  }
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithLongLong:", self->_duration);
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v31, CFSTR("duration"));

  if ((*(_DWORD *)&self->_has & 0x80) != 0)
  {
LABEL_12:
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", self->_deviceOrientation);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v10, CFSTR("device_orientation"));

  }
LABEL_13:
  referringType = self->_referringType;
  if (referringType)
    objc_msgSend(v3, "setObject:forKey:", referringType, CFSTR("referring_type"));
  referringSource = self->_referringSource;
  if (referringSource)
    objc_msgSend(v3, "setObject:forKey:", referringSource, CFSTR("referring_source"));
  windowFrameInScreen = self->_windowFrameInScreen;
  if (windowFrameInScreen)
    objc_msgSend(v3, "setObject:forKey:", windowFrameInScreen, CFSTR("window_frame_in_screen"));
  v14 = self->_has;
  if ((*(_WORD *)&v14 & 0x100) != 0)
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", self->_gestureType);
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v32, CFSTR("gesture_type"));

    v14 = self->_has;
    if ((*(_WORD *)&v14 & 0x200) == 0)
    {
LABEL_21:
      if ((*(_WORD *)&v14 & 0x400) == 0)
        goto LABEL_22;
      goto LABEL_57;
    }
  }
  else if ((*(_WORD *)&v14 & 0x200) == 0)
  {
    goto LABEL_21;
  }
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", self->_interfaceOrientation);
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v33, CFSTR("interface_orientation"));

  v14 = self->_has;
  if ((*(_WORD *)&v14 & 0x400) == 0)
  {
LABEL_22:
    if ((*(_BYTE *)&v14 & 0x40) == 0)
      goto LABEL_23;
    goto LABEL_78;
  }
LABEL_57:
  reachabilityStatus = self->_reachabilityStatus;
  if (reachabilityStatus >= 5)
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("(unknown: %i)"), self->_reachabilityStatus);
    v35 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v35 = off_24CD52CC0[reachabilityStatus];
  }
  objc_msgSend(v3, "setObject:forKey:", v35, CFSTR("reachability_status"));

  v14 = self->_has;
  if ((*(_BYTE *)&v14 & 0x40) == 0)
  {
LABEL_23:
    if ((*(_BYTE *)&v14 & 4) == 0)
      goto LABEL_24;
    goto LABEL_82;
  }
LABEL_78:
  cellularRadioAccessTechnology = self->_cellularRadioAccessTechnology;
  if (cellularRadioAccessTechnology >= 0xE)
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("(unknown: %i)"), self->_cellularRadioAccessTechnology);
    v46 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v46 = off_24CD52CE8[cellularRadioAccessTechnology];
  }
  objc_msgSend(v3, "setObject:forKey:", v46, CFSTR("cellular_radio_access_technology"));

  v14 = self->_has;
  if ((*(_BYTE *)&v14 & 4) == 0)
  {
LABEL_24:
    if ((*(_BYTE *)&v14 & 8) == 0)
      goto LABEL_25;
    goto LABEL_83;
  }
LABEL_82:
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithLongLong:", self->_personalizationTreatmentId);
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v47, CFSTR("personalization_treatment_id"));

  v14 = self->_has;
  if ((*(_BYTE *)&v14 & 8) == 0)
  {
LABEL_25:
    if ((*(_WORD *)&v14 & 0x2000) == 0)
      goto LABEL_26;
    goto LABEL_84;
  }
LABEL_83:
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithLongLong:", self->_personalizedTreatmentId);
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v48, CFSTR("personalized_treatment_id"));

  v14 = self->_has;
  if ((*(_WORD *)&v14 & 0x2000) == 0)
  {
LABEL_26:
    if ((*(_WORD *)&v14 & 0x8000) == 0)
      goto LABEL_27;
    goto LABEL_85;
  }
LABEL_84:
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", self->_isPaidSubscriberDuringEvent);
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v49, CFSTR("is_paid_subscriber_during_event"));

  v14 = self->_has;
  if ((*(_WORD *)&v14 & 0x8000) == 0)
  {
LABEL_27:
    if ((*(_WORD *)&v14 & 0x4000) == 0)
      goto LABEL_28;
    goto LABEL_86;
  }
LABEL_85:
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", self->_isPaidSubscriberFromNewsDuringEvent);
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v50, CFSTR("is_paid_subscriber_from_news_during_event"));

  v14 = self->_has;
  if ((*(_WORD *)&v14 & 0x4000) == 0)
  {
LABEL_28:
    if ((*(_DWORD *)&v14 & 0x10000) == 0)
      goto LABEL_30;
    goto LABEL_29;
  }
LABEL_86:
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", self->_isPaidSubscriberFromAppStoreDuringEvent);
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v51, CFSTR("is_paid_subscriber_from_app_store_during_event"));

  if ((*(_DWORD *)&self->_has & 0x10000) != 0)
  {
LABEL_29:
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", self->_isPaidSubscriberFromThirdPartyDuringEvent);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v15, CFSTR("is_paid_subscriber_from_third_party_during_event"));

  }
LABEL_30:
  notwUserId = self->_notwUserId;
  if (notwUserId)
    objc_msgSend(v3, "setObject:forKey:", notwUserId, CFSTR("notw_user_id"));
  sessionIdWatch = self->_sessionIdWatch;
  if (sessionIdWatch)
    objc_msgSend(v3, "setObject:forKey:", sessionIdWatch, CFSTR("session_id_watch"));
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithLongLong:", self->_appConfigTreatmentId);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v18, CFSTR("app_config_treatment_id"));

  }
  widgetSessionId = self->_widgetSessionId;
  if (widgetSessionId)
    objc_msgSend(v3, "setObject:forKey:", widgetSessionId, CFSTR("widget_session_id"));
  if (-[NSMutableArray count](self->_userPaidSubscriptionStatus, "count"))
  {
    v20 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCEB8]), "initWithCapacity:", -[NSMutableArray count](self->_userPaidSubscriptionStatus, "count"));
    v52 = 0u;
    v53 = 0u;
    v54 = 0u;
    v55 = 0u;
    v21 = self->_userPaidSubscriptionStatus;
    v22 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v21, "countByEnumeratingWithState:objects:count:", &v52, v56, 16);
    if (v22)
    {
      v23 = v22;
      v24 = *(_QWORD *)v53;
      do
      {
        for (i = 0; i != v23; ++i)
        {
          if (*(_QWORD *)v53 != v24)
            objc_enumerationMutation(v21);
          objc_msgSend(*(id *)(*((_QWORD *)&v52 + 1) + 8 * i), "dictionaryRepresentation");
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v20, "addObject:", v26);

        }
        v23 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v21, "countByEnumeratingWithState:objects:count:", &v52, v56, 16);
      }
      while (v23);
    }

    objc_msgSend(v3, "setObject:forKey:", v20, CFSTR("user_paid_subscription_status"));
  }
  widgetUserId = self->_widgetUserId;
  if (widgetUserId)
    objc_msgSend(v3, "setObject:forKey:", widgetUserId, CFSTR("widget_user_id"));
  if ((*(_BYTE *)&self->_has & 0x20) != 0)
  {
    bundleSubscriptionStatus = self->_bundleSubscriptionStatus;
    if (bundleSubscriptionStatus >= 4)
    {
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("(unknown: %i)"), self->_bundleSubscriptionStatus);
      v29 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v29 = off_24CD52D58[bundleSubscriptionStatus];
    }
    objc_msgSend(v3, "setObject:forKey:", v29, CFSTR("bundle_subscription_status"));

  }
  bundlePurchaseId = self->_bundlePurchaseId;
  if (bundlePurchaseId)
    objc_msgSend(v3, "setObject:forKey:", bundlePurchaseId, CFSTR("bundle_purchase_id"));
  bundleOfferId = self->_bundleOfferId;
  if (bundleOfferId)
    objc_msgSend(v3, "setObject:forKey:", bundleOfferId, CFSTR("bundle_offer_id"));
  if ((*((_BYTE *)&self->_has + 1) & 0x10) != 0)
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", self->_isBundlePurchaser);
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v38, CFSTR("is_bundle_purchaser"));

  }
  appAnalyticsEventIdentifier = self->_appAnalyticsEventIdentifier;
  if (appAnalyticsEventIdentifier)
    objc_msgSend(v3, "setObject:forKey:", appAnalyticsEventIdentifier, CFSTR("app_analytics_event_identifier"));
  appAnalyticsEventPath = self->_appAnalyticsEventPath;
  if (appAnalyticsEventPath)
    objc_msgSend(v3, "setObject:forKey:", appAnalyticsEventPath, CFSTR("app_analytics_event_path"));
  if ((*((_BYTE *)&self->_has + 1) & 8) != 0)
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", self->_isAmplifyUser);
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v41, CFSTR("is_amplify_user"));

  }
  sBundlePurchaseId = self->_sBundlePurchaseId;
  if (sBundlePurchaseId)
    objc_msgSend(v3, "setObject:forKey:", sBundlePurchaseId, CFSTR("s_bundle_purchase_id"));
  v43 = v3;

  return v43;
}

- (BOOL)readFrom:(id)a3
{
  return NTPBEventReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4;
  $D741C7B20A104483CE535A1F820EC5B8 has;
  $D741C7B20A104483CE535A1F820EC5B8 v6;
  NSMutableArray *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  if (self->_eventObject)
    PBDataWriterWriteSubmessage();
  if (self->_sessionId)
    PBDataWriterWriteDataField();
  if (self->_userId)
    PBDataWriterWriteStringField();
  if (self->_userStorefrontId)
    PBDataWriterWriteStringField();
  has = self->_has;
  if ((*(_BYTE *)&has & 0x10) != 0)
  {
    PBDataWriterWriteInt64Field();
    has = self->_has;
    if ((*(_BYTE *)&has & 2) == 0)
    {
LABEL_11:
      if ((*(_BYTE *)&has & 0x80) == 0)
        goto LABEL_13;
      goto LABEL_12;
    }
  }
  else if ((*(_BYTE *)&has & 2) == 0)
  {
    goto LABEL_11;
  }
  PBDataWriterWriteInt64Field();
  if ((*(_DWORD *)&self->_has & 0x80) != 0)
LABEL_12:
    PBDataWriterWriteInt32Field();
LABEL_13:
  if (self->_referringType)
    PBDataWriterWriteStringField();
  if (self->_referringSource)
    PBDataWriterWriteStringField();
  if (self->_windowFrameInScreen)
    PBDataWriterWriteStringField();
  v6 = self->_has;
  if ((*(_WORD *)&v6 & 0x100) != 0)
  {
    PBDataWriterWriteInt32Field();
    v6 = self->_has;
    if ((*(_WORD *)&v6 & 0x200) == 0)
    {
LABEL_21:
      if ((*(_WORD *)&v6 & 0x400) == 0)
        goto LABEL_22;
      goto LABEL_69;
    }
  }
  else if ((*(_WORD *)&v6 & 0x200) == 0)
  {
    goto LABEL_21;
  }
  PBDataWriterWriteInt32Field();
  v6 = self->_has;
  if ((*(_WORD *)&v6 & 0x400) == 0)
  {
LABEL_22:
    if ((*(_BYTE *)&v6 & 0x40) == 0)
      goto LABEL_23;
    goto LABEL_70;
  }
LABEL_69:
  PBDataWriterWriteInt32Field();
  v6 = self->_has;
  if ((*(_BYTE *)&v6 & 0x40) == 0)
  {
LABEL_23:
    if ((*(_BYTE *)&v6 & 4) == 0)
      goto LABEL_24;
    goto LABEL_71;
  }
LABEL_70:
  PBDataWriterWriteInt32Field();
  v6 = self->_has;
  if ((*(_BYTE *)&v6 & 4) == 0)
  {
LABEL_24:
    if ((*(_BYTE *)&v6 & 8) == 0)
      goto LABEL_25;
    goto LABEL_72;
  }
LABEL_71:
  PBDataWriterWriteInt64Field();
  v6 = self->_has;
  if ((*(_BYTE *)&v6 & 8) == 0)
  {
LABEL_25:
    if ((*(_WORD *)&v6 & 0x2000) == 0)
      goto LABEL_26;
    goto LABEL_73;
  }
LABEL_72:
  PBDataWriterWriteInt64Field();
  v6 = self->_has;
  if ((*(_WORD *)&v6 & 0x2000) == 0)
  {
LABEL_26:
    if ((*(_WORD *)&v6 & 0x8000) == 0)
      goto LABEL_27;
    goto LABEL_74;
  }
LABEL_73:
  PBDataWriterWriteBOOLField();
  v6 = self->_has;
  if ((*(_WORD *)&v6 & 0x8000) == 0)
  {
LABEL_27:
    if ((*(_WORD *)&v6 & 0x4000) == 0)
      goto LABEL_28;
    goto LABEL_75;
  }
LABEL_74:
  PBDataWriterWriteBOOLField();
  v6 = self->_has;
  if ((*(_WORD *)&v6 & 0x4000) == 0)
  {
LABEL_28:
    if ((*(_DWORD *)&v6 & 0x10000) == 0)
      goto LABEL_30;
    goto LABEL_29;
  }
LABEL_75:
  PBDataWriterWriteBOOLField();
  if ((*(_DWORD *)&self->_has & 0x10000) != 0)
LABEL_29:
    PBDataWriterWriteBOOLField();
LABEL_30:
  if (self->_notwUserId)
    PBDataWriterWriteStringField();
  if (self->_sessionIdWatch)
    PBDataWriterWriteDataField();
  if ((*(_BYTE *)&self->_has & 1) != 0)
    PBDataWriterWriteInt64Field();
  if (self->_widgetSessionId)
    PBDataWriterWriteDataField();
  v14 = 0u;
  v15 = 0u;
  v12 = 0u;
  v13 = 0u;
  v7 = self->_userPaidSubscriptionStatus;
  v8 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v13;
    do
    {
      v11 = 0;
      do
      {
        if (*(_QWORD *)v13 != v10)
          objc_enumerationMutation(v7);
        PBDataWriterWriteSubmessage();
        ++v11;
      }
      while (v9 != v11);
      v9 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v9);
  }

  if (self->_widgetUserId)
    PBDataWriterWriteStringField();
  if ((*(_BYTE *)&self->_has & 0x20) != 0)
    PBDataWriterWriteInt32Field();
  if (self->_bundlePurchaseId)
    PBDataWriterWriteStringField();
  if (self->_bundleOfferId)
    PBDataWriterWriteStringField();
  if ((*((_BYTE *)&self->_has + 1) & 0x10) != 0)
    PBDataWriterWriteBOOLField();
  if (self->_appAnalyticsEventIdentifier)
    PBDataWriterWriteStringField();
  if (self->_appAnalyticsEventPath)
    PBDataWriterWriteStringField();
  if ((*((_BYTE *)&self->_has + 1) & 8) != 0)
    PBDataWriterWriteBOOLField();
  if (self->_sBundlePurchaseId)
    PBDataWriterWriteStringField();

}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5;
  id v6;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  void *v13;
  $D741C7B20A104483CE535A1F820EC5B8 has;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  void *v20;
  $D741C7B20A104483CE535A1F820EC5B8 v21;
  uint64_t v22;
  void *v23;
  uint64_t v24;
  void *v25;
  uint64_t v26;
  void *v27;
  NSMutableArray *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  void *v33;
  uint64_t v34;
  void *v35;
  uint64_t v36;
  void *v37;
  uint64_t v38;
  void *v39;
  uint64_t v40;
  void *v41;
  uint64_t v42;
  void *v43;
  uint64_t v44;
  void *v45;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  _BYTE v51[128];
  uint64_t v52;

  v52 = *MEMORY[0x24BDAC8D0];
  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = -[NTPBEventObject copyWithZone:](self->_eventObject, "copyWithZone:", a3);
  v7 = *(void **)(v5 + 96);
  *(_QWORD *)(v5 + 96) = v6;

  v8 = -[NSData copyWithZone:](self->_sessionId, "copyWithZone:", a3);
  v9 = *(void **)(v5 + 152);
  *(_QWORD *)(v5 + 152) = v8;

  v10 = -[NSString copyWithZone:](self->_userId, "copyWithZone:", a3);
  v11 = *(void **)(v5 + 168);
  *(_QWORD *)(v5 + 168) = v10;

  v12 = -[NSString copyWithZone:](self->_userStorefrontId, "copyWithZone:", a3);
  v13 = *(void **)(v5 + 184);
  *(_QWORD *)(v5 + 184) = v12;

  has = self->_has;
  if ((*(_BYTE *)&has & 0x10) != 0)
  {
    *(_QWORD *)(v5 + 40) = self->_startTimestamp;
    *(_DWORD *)(v5 + 224) |= 0x10u;
    has = self->_has;
    if ((*(_BYTE *)&has & 2) == 0)
    {
LABEL_3:
      if ((*(_BYTE *)&has & 0x80) == 0)
        goto LABEL_5;
      goto LABEL_4;
    }
  }
  else if ((*(_BYTE *)&has & 2) == 0)
  {
    goto LABEL_3;
  }
  *(_QWORD *)(v5 + 16) = self->_duration;
  *(_DWORD *)(v5 + 224) |= 2u;
  if ((*(_DWORD *)&self->_has & 0x80) != 0)
  {
LABEL_4:
    *(_DWORD *)(v5 + 88) = self->_deviceOrientation;
    *(_DWORD *)(v5 + 224) |= 0x80u;
  }
LABEL_5:
  v15 = -[NSString copyWithZone:](self->_referringType, "copyWithZone:", a3);
  v16 = *(void **)(v5 + 136);
  *(_QWORD *)(v5 + 136) = v15;

  v17 = -[NSString copyWithZone:](self->_referringSource, "copyWithZone:", a3);
  v18 = *(void **)(v5 + 128);
  *(_QWORD *)(v5 + 128) = v17;

  v19 = -[NSString copyWithZone:](self->_windowFrameInScreen, "copyWithZone:", a3);
  v20 = *(void **)(v5 + 208);
  *(_QWORD *)(v5 + 208) = v19;

  v21 = self->_has;
  if ((*(_WORD *)&v21 & 0x100) != 0)
  {
    *(_DWORD *)(v5 + 104) = self->_gestureType;
    *(_DWORD *)(v5 + 224) |= 0x100u;
    v21 = self->_has;
    if ((*(_WORD *)&v21 & 0x200) == 0)
    {
LABEL_7:
      if ((*(_WORD *)&v21 & 0x400) == 0)
        goto LABEL_8;
      goto LABEL_37;
    }
  }
  else if ((*(_WORD *)&v21 & 0x200) == 0)
  {
    goto LABEL_7;
  }
  *(_DWORD *)(v5 + 108) = self->_interfaceOrientation;
  *(_DWORD *)(v5 + 224) |= 0x200u;
  v21 = self->_has;
  if ((*(_WORD *)&v21 & 0x400) == 0)
  {
LABEL_8:
    if ((*(_BYTE *)&v21 & 0x40) == 0)
      goto LABEL_9;
    goto LABEL_38;
  }
LABEL_37:
  *(_DWORD *)(v5 + 120) = self->_reachabilityStatus;
  *(_DWORD *)(v5 + 224) |= 0x400u;
  v21 = self->_has;
  if ((*(_BYTE *)&v21 & 0x40) == 0)
  {
LABEL_9:
    if ((*(_BYTE *)&v21 & 4) == 0)
      goto LABEL_10;
    goto LABEL_39;
  }
LABEL_38:
  *(_DWORD *)(v5 + 84) = self->_cellularRadioAccessTechnology;
  *(_DWORD *)(v5 + 224) |= 0x40u;
  v21 = self->_has;
  if ((*(_BYTE *)&v21 & 4) == 0)
  {
LABEL_10:
    if ((*(_BYTE *)&v21 & 8) == 0)
      goto LABEL_11;
    goto LABEL_40;
  }
LABEL_39:
  *(_QWORD *)(v5 + 24) = self->_personalizationTreatmentId;
  *(_DWORD *)(v5 + 224) |= 4u;
  v21 = self->_has;
  if ((*(_BYTE *)&v21 & 8) == 0)
  {
LABEL_11:
    if ((*(_WORD *)&v21 & 0x2000) == 0)
      goto LABEL_12;
    goto LABEL_41;
  }
LABEL_40:
  *(_QWORD *)(v5 + 32) = self->_personalizedTreatmentId;
  *(_DWORD *)(v5 + 224) |= 8u;
  v21 = self->_has;
  if ((*(_WORD *)&v21 & 0x2000) == 0)
  {
LABEL_12:
    if ((*(_WORD *)&v21 & 0x8000) == 0)
      goto LABEL_13;
    goto LABEL_42;
  }
LABEL_41:
  *(_BYTE *)(v5 + 218) = self->_isPaidSubscriberDuringEvent;
  *(_DWORD *)(v5 + 224) |= 0x2000u;
  v21 = self->_has;
  if ((*(_WORD *)&v21 & 0x8000) == 0)
  {
LABEL_13:
    if ((*(_WORD *)&v21 & 0x4000) == 0)
      goto LABEL_14;
    goto LABEL_43;
  }
LABEL_42:
  *(_BYTE *)(v5 + 220) = self->_isPaidSubscriberFromNewsDuringEvent;
  *(_DWORD *)(v5 + 224) |= 0x8000u;
  v21 = self->_has;
  if ((*(_WORD *)&v21 & 0x4000) == 0)
  {
LABEL_14:
    if ((*(_DWORD *)&v21 & 0x10000) == 0)
      goto LABEL_16;
    goto LABEL_15;
  }
LABEL_43:
  *(_BYTE *)(v5 + 219) = self->_isPaidSubscriberFromAppStoreDuringEvent;
  *(_DWORD *)(v5 + 224) |= 0x4000u;
  if ((*(_DWORD *)&self->_has & 0x10000) != 0)
  {
LABEL_15:
    *(_BYTE *)(v5 + 221) = self->_isPaidSubscriberFromThirdPartyDuringEvent;
    *(_DWORD *)(v5 + 224) |= 0x10000u;
  }
LABEL_16:
  v22 = -[NSString copyWithZone:](self->_notwUserId, "copyWithZone:", a3);
  v23 = *(void **)(v5 + 112);
  *(_QWORD *)(v5 + 112) = v22;

  v24 = -[NSData copyWithZone:](self->_sessionIdWatch, "copyWithZone:", a3);
  v25 = *(void **)(v5 + 160);
  *(_QWORD *)(v5 + 160) = v24;

  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    *(_QWORD *)(v5 + 8) = self->_appConfigTreatmentId;
    *(_DWORD *)(v5 + 224) |= 1u;
  }
  v26 = -[NSData copyWithZone:](self->_widgetSessionId, "copyWithZone:", a3);
  v27 = *(void **)(v5 + 192);
  *(_QWORD *)(v5 + 192) = v26;

  v49 = 0u;
  v50 = 0u;
  v47 = 0u;
  v48 = 0u;
  v28 = self->_userPaidSubscriptionStatus;
  v29 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v28, "countByEnumeratingWithState:objects:count:", &v47, v51, 16);
  if (v29)
  {
    v30 = v29;
    v31 = *(_QWORD *)v48;
    do
    {
      v32 = 0;
      do
      {
        if (*(_QWORD *)v48 != v31)
          objc_enumerationMutation(v28);
        v33 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v47 + 1) + 8 * v32), "copyWithZone:", a3, (_QWORD)v47);
        objc_msgSend((id)v5, "addUserPaidSubscriptionStatus:", v33);

        ++v32;
      }
      while (v30 != v32);
      v30 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v28, "countByEnumeratingWithState:objects:count:", &v47, v51, 16);
    }
    while (v30);
  }

  v34 = -[NSString copyWithZone:](self->_widgetUserId, "copyWithZone:", a3);
  v35 = *(void **)(v5 + 200);
  *(_QWORD *)(v5 + 200) = v34;

  if ((*(_BYTE *)&self->_has & 0x20) != 0)
  {
    *(_DWORD *)(v5 + 80) = self->_bundleSubscriptionStatus;
    *(_DWORD *)(v5 + 224) |= 0x20u;
  }
  v36 = -[NSString copyWithZone:](self->_bundlePurchaseId, "copyWithZone:", a3, (_QWORD)v47);
  v37 = *(void **)(v5 + 72);
  *(_QWORD *)(v5 + 72) = v36;

  v38 = -[NSString copyWithZone:](self->_bundleOfferId, "copyWithZone:", a3);
  v39 = *(void **)(v5 + 64);
  *(_QWORD *)(v5 + 64) = v38;

  if ((*((_BYTE *)&self->_has + 1) & 0x10) != 0)
  {
    *(_BYTE *)(v5 + 217) = self->_isBundlePurchaser;
    *(_DWORD *)(v5 + 224) |= 0x1000u;
  }
  v40 = -[NSString copyWithZone:](self->_appAnalyticsEventIdentifier, "copyWithZone:", a3);
  v41 = *(void **)(v5 + 48);
  *(_QWORD *)(v5 + 48) = v40;

  v42 = -[NSString copyWithZone:](self->_appAnalyticsEventPath, "copyWithZone:", a3);
  v43 = *(void **)(v5 + 56);
  *(_QWORD *)(v5 + 56) = v42;

  if ((*((_BYTE *)&self->_has + 1) & 8) != 0)
  {
    *(_BYTE *)(v5 + 216) = self->_isAmplifyUser;
    *(_DWORD *)(v5 + 224) |= 0x800u;
  }
  v44 = -[NSString copyWithZone:](self->_sBundlePurchaseId, "copyWithZone:", a3);
  v45 = *(void **)(v5 + 144);
  *(_QWORD *)(v5 + 144) = v44;

  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  NTPBEventObject *eventObject;
  NSData *sessionId;
  NSString *userId;
  NSString *userStorefrontId;
  $D741C7B20A104483CE535A1F820EC5B8 has;
  int v10;
  NSString *referringType;
  NSString *referringSource;
  NSString *windowFrameInScreen;
  $D741C7B20A104483CE535A1F820EC5B8 v14;
  int v15;
  NSString *notwUserId;
  NSData *sessionIdWatch;
  int v18;
  NSData *widgetSessionId;
  NSMutableArray *userPaidSubscriptionStatus;
  NSString *widgetUserId;
  int v22;
  NSString *bundlePurchaseId;
  NSString *bundleOfferId;
  int v25;
  NSString *appAnalyticsEventIdentifier;
  NSString *appAnalyticsEventPath;
  int v28;
  char v29;
  NSString *sBundlePurchaseId;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_133;
  eventObject = self->_eventObject;
  if ((unint64_t)eventObject | *((_QWORD *)v4 + 12))
  {
    if (!-[NTPBEventObject isEqual:](eventObject, "isEqual:"))
      goto LABEL_133;
  }
  sessionId = self->_sessionId;
  if ((unint64_t)sessionId | *((_QWORD *)v4 + 19))
  {
    if (!-[NSData isEqual:](sessionId, "isEqual:"))
      goto LABEL_133;
  }
  userId = self->_userId;
  if ((unint64_t)userId | *((_QWORD *)v4 + 21))
  {
    if (!-[NSString isEqual:](userId, "isEqual:"))
      goto LABEL_133;
  }
  userStorefrontId = self->_userStorefrontId;
  if ((unint64_t)userStorefrontId | *((_QWORD *)v4 + 23))
  {
    if (!-[NSString isEqual:](userStorefrontId, "isEqual:"))
      goto LABEL_133;
  }
  has = self->_has;
  v10 = *((_DWORD *)v4 + 56);
  if ((*(_BYTE *)&has & 0x10) != 0)
  {
    if ((v10 & 0x10) == 0 || self->_startTimestamp != *((_QWORD *)v4 + 5))
      goto LABEL_133;
  }
  else if ((v10 & 0x10) != 0)
  {
    goto LABEL_133;
  }
  if ((*(_BYTE *)&has & 2) != 0)
  {
    if ((v10 & 2) == 0 || self->_duration != *((_QWORD *)v4 + 2))
      goto LABEL_133;
  }
  else if ((v10 & 2) != 0)
  {
    goto LABEL_133;
  }
  if ((*(_BYTE *)&has & 0x80) != 0)
  {
    if ((v10 & 0x80) == 0 || self->_deviceOrientation != *((_DWORD *)v4 + 22))
      goto LABEL_133;
  }
  else if ((v10 & 0x80) != 0)
  {
    goto LABEL_133;
  }
  referringType = self->_referringType;
  if ((unint64_t)referringType | *((_QWORD *)v4 + 17)
    && !-[NSString isEqual:](referringType, "isEqual:"))
  {
    goto LABEL_133;
  }
  referringSource = self->_referringSource;
  if ((unint64_t)referringSource | *((_QWORD *)v4 + 16))
  {
    if (!-[NSString isEqual:](referringSource, "isEqual:"))
      goto LABEL_133;
  }
  windowFrameInScreen = self->_windowFrameInScreen;
  if ((unint64_t)windowFrameInScreen | *((_QWORD *)v4 + 26))
  {
    if (!-[NSString isEqual:](windowFrameInScreen, "isEqual:"))
      goto LABEL_133;
  }
  v14 = self->_has;
  v15 = *((_DWORD *)v4 + 56);
  if ((*(_WORD *)&v14 & 0x100) != 0)
  {
    if ((v15 & 0x100) == 0 || self->_gestureType != *((_DWORD *)v4 + 26))
      goto LABEL_133;
  }
  else if ((v15 & 0x100) != 0)
  {
    goto LABEL_133;
  }
  if ((*(_WORD *)&v14 & 0x200) != 0)
  {
    if ((v15 & 0x200) == 0 || self->_interfaceOrientation != *((_DWORD *)v4 + 27))
      goto LABEL_133;
  }
  else if ((v15 & 0x200) != 0)
  {
    goto LABEL_133;
  }
  if ((*(_WORD *)&v14 & 0x400) != 0)
  {
    if ((v15 & 0x400) == 0 || self->_reachabilityStatus != *((_DWORD *)v4 + 30))
      goto LABEL_133;
  }
  else if ((v15 & 0x400) != 0)
  {
    goto LABEL_133;
  }
  if ((*(_BYTE *)&v14 & 0x40) != 0)
  {
    if ((v15 & 0x40) == 0 || self->_cellularRadioAccessTechnology != *((_DWORD *)v4 + 21))
      goto LABEL_133;
  }
  else if ((v15 & 0x40) != 0)
  {
    goto LABEL_133;
  }
  if ((*(_BYTE *)&v14 & 4) != 0)
  {
    if ((v15 & 4) == 0 || self->_personalizationTreatmentId != *((_QWORD *)v4 + 3))
      goto LABEL_133;
  }
  else if ((v15 & 4) != 0)
  {
    goto LABEL_133;
  }
  if ((*(_BYTE *)&v14 & 8) != 0)
  {
    if ((v15 & 8) == 0 || self->_personalizedTreatmentId != *((_QWORD *)v4 + 4))
      goto LABEL_133;
  }
  else if ((v15 & 8) != 0)
  {
    goto LABEL_133;
  }
  if ((*(_WORD *)&v14 & 0x2000) != 0)
  {
    if ((v15 & 0x2000) == 0)
      goto LABEL_133;
    if (self->_isPaidSubscriberDuringEvent)
    {
      if (!*((_BYTE *)v4 + 218))
        goto LABEL_133;
    }
    else if (*((_BYTE *)v4 + 218))
    {
      goto LABEL_133;
    }
  }
  else if ((v15 & 0x2000) != 0)
  {
    goto LABEL_133;
  }
  if ((*(_WORD *)&v14 & 0x8000) != 0)
  {
    if ((v15 & 0x8000) == 0)
      goto LABEL_133;
    if (self->_isPaidSubscriberFromNewsDuringEvent)
    {
      if (!*((_BYTE *)v4 + 220))
        goto LABEL_133;
    }
    else if (*((_BYTE *)v4 + 220))
    {
      goto LABEL_133;
    }
  }
  else if ((v15 & 0x8000) != 0)
  {
    goto LABEL_133;
  }
  if ((*(_WORD *)&v14 & 0x4000) != 0)
  {
    if ((v15 & 0x4000) == 0)
      goto LABEL_133;
    if (self->_isPaidSubscriberFromAppStoreDuringEvent)
    {
      if (!*((_BYTE *)v4 + 219))
        goto LABEL_133;
    }
    else if (*((_BYTE *)v4 + 219))
    {
      goto LABEL_133;
    }
  }
  else if ((v15 & 0x4000) != 0)
  {
    goto LABEL_133;
  }
  if ((*(_DWORD *)&v14 & 0x10000) != 0)
  {
    if ((v15 & 0x10000) == 0)
      goto LABEL_133;
    if (self->_isPaidSubscriberFromThirdPartyDuringEvent)
    {
      if (!*((_BYTE *)v4 + 221))
        goto LABEL_133;
    }
    else if (*((_BYTE *)v4 + 221))
    {
      goto LABEL_133;
    }
  }
  else if ((v15 & 0x10000) != 0)
  {
    goto LABEL_133;
  }
  notwUserId = self->_notwUserId;
  if ((unint64_t)notwUserId | *((_QWORD *)v4 + 14)
    && !-[NSString isEqual:](notwUserId, "isEqual:"))
  {
    goto LABEL_133;
  }
  sessionIdWatch = self->_sessionIdWatch;
  if ((unint64_t)sessionIdWatch | *((_QWORD *)v4 + 20))
  {
    if (!-[NSData isEqual:](sessionIdWatch, "isEqual:"))
      goto LABEL_133;
  }
  v18 = *((_DWORD *)v4 + 56);
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    if ((v18 & 1) == 0 || self->_appConfigTreatmentId != *((_QWORD *)v4 + 1))
      goto LABEL_133;
  }
  else if ((v18 & 1) != 0)
  {
    goto LABEL_133;
  }
  widgetSessionId = self->_widgetSessionId;
  if ((unint64_t)widgetSessionId | *((_QWORD *)v4 + 24)
    && !-[NSData isEqual:](widgetSessionId, "isEqual:"))
  {
    goto LABEL_133;
  }
  userPaidSubscriptionStatus = self->_userPaidSubscriptionStatus;
  if ((unint64_t)userPaidSubscriptionStatus | *((_QWORD *)v4 + 22))
  {
    if (!-[NSMutableArray isEqual:](userPaidSubscriptionStatus, "isEqual:"))
      goto LABEL_133;
  }
  widgetUserId = self->_widgetUserId;
  if ((unint64_t)widgetUserId | *((_QWORD *)v4 + 25))
  {
    if (!-[NSString isEqual:](widgetUserId, "isEqual:"))
      goto LABEL_133;
  }
  v22 = *((_DWORD *)v4 + 56);
  if ((*(_BYTE *)&self->_has & 0x20) != 0)
  {
    if ((v22 & 0x20) == 0 || self->_bundleSubscriptionStatus != *((_DWORD *)v4 + 20))
      goto LABEL_133;
  }
  else if ((v22 & 0x20) != 0)
  {
    goto LABEL_133;
  }
  bundlePurchaseId = self->_bundlePurchaseId;
  if ((unint64_t)bundlePurchaseId | *((_QWORD *)v4 + 9)
    && !-[NSString isEqual:](bundlePurchaseId, "isEqual:"))
  {
    goto LABEL_133;
  }
  bundleOfferId = self->_bundleOfferId;
  if ((unint64_t)bundleOfferId | *((_QWORD *)v4 + 8))
  {
    if (!-[NSString isEqual:](bundleOfferId, "isEqual:"))
      goto LABEL_133;
  }
  v25 = *((_DWORD *)v4 + 56);
  if ((*((_BYTE *)&self->_has + 1) & 0x10) != 0)
  {
    if ((v25 & 0x1000) == 0)
      goto LABEL_133;
    if (self->_isBundlePurchaser)
    {
      if (!*((_BYTE *)v4 + 217))
        goto LABEL_133;
    }
    else if (*((_BYTE *)v4 + 217))
    {
      goto LABEL_133;
    }
  }
  else if ((v25 & 0x1000) != 0)
  {
    goto LABEL_133;
  }
  appAnalyticsEventIdentifier = self->_appAnalyticsEventIdentifier;
  if ((unint64_t)appAnalyticsEventIdentifier | *((_QWORD *)v4 + 6)
    && !-[NSString isEqual:](appAnalyticsEventIdentifier, "isEqual:"))
  {
    goto LABEL_133;
  }
  appAnalyticsEventPath = self->_appAnalyticsEventPath;
  if ((unint64_t)appAnalyticsEventPath | *((_QWORD *)v4 + 7))
  {
    if (!-[NSString isEqual:](appAnalyticsEventPath, "isEqual:"))
      goto LABEL_133;
  }
  v28 = *((_DWORD *)v4 + 56);
  if ((*((_BYTE *)&self->_has + 1) & 8) == 0)
  {
    if ((v28 & 0x800) == 0)
      goto LABEL_139;
LABEL_133:
    v29 = 0;
    goto LABEL_134;
  }
  if ((v28 & 0x800) == 0)
    goto LABEL_133;
  if (!self->_isAmplifyUser)
  {
    if (!*((_BYTE *)v4 + 216))
      goto LABEL_139;
    goto LABEL_133;
  }
  if (!*((_BYTE *)v4 + 216))
    goto LABEL_133;
LABEL_139:
  sBundlePurchaseId = self->_sBundlePurchaseId;
  if ((unint64_t)sBundlePurchaseId | *((_QWORD *)v4 + 18))
    v29 = -[NSString isEqual:](sBundlePurchaseId, "isEqual:");
  else
    v29 = 1;
LABEL_134:

  return v29;
}

- (unint64_t)hash
{
  $D741C7B20A104483CE535A1F820EC5B8 has;
  $D741C7B20A104483CE535A1F820EC5B8 v4;
  uint64_t v5;
  NSUInteger v6;
  uint64_t v7;
  NSUInteger v8;
  NSUInteger v9;
  uint64_t v10;
  NSUInteger v11;
  NSUInteger v12;
  uint64_t v13;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  NSUInteger v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  NSUInteger v29;
  NSUInteger v30;
  NSUInteger v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  NSUInteger v35;
  NSUInteger v36;
  uint64_t v37;
  unint64_t v38;

  v38 = -[NTPBEventObject hash](self->_eventObject, "hash");
  v37 = -[NSData hash](self->_sessionId, "hash");
  v36 = -[NSString hash](self->_userId, "hash");
  v35 = -[NSString hash](self->_userStorefrontId, "hash");
  has = self->_has;
  if ((*(_BYTE *)&has & 0x10) == 0)
  {
    v34 = 0;
    if ((*(_BYTE *)&has & 2) != 0)
      goto LABEL_3;
LABEL_6:
    v33 = 0;
    if ((*(_BYTE *)&has & 0x80) != 0)
      goto LABEL_4;
    goto LABEL_7;
  }
  v34 = 2654435761 * self->_startTimestamp;
  if ((*(_BYTE *)&has & 2) == 0)
    goto LABEL_6;
LABEL_3:
  v33 = 2654435761 * self->_duration;
  if ((*(_BYTE *)&has & 0x80) != 0)
  {
LABEL_4:
    v32 = 2654435761 * self->_deviceOrientation;
    goto LABEL_8;
  }
LABEL_7:
  v32 = 0;
LABEL_8:
  v31 = -[NSString hash](self->_referringType, "hash");
  v30 = -[NSString hash](self->_referringSource, "hash");
  v29 = -[NSString hash](self->_windowFrameInScreen, "hash");
  v4 = self->_has;
  if ((*(_WORD *)&v4 & 0x100) != 0)
  {
    v28 = 2654435761 * self->_gestureType;
    if ((*(_WORD *)&v4 & 0x200) != 0)
    {
LABEL_10:
      v27 = 2654435761 * self->_interfaceOrientation;
      if ((*(_WORD *)&v4 & 0x400) != 0)
        goto LABEL_11;
      goto LABEL_21;
    }
  }
  else
  {
    v28 = 0;
    if ((*(_WORD *)&v4 & 0x200) != 0)
      goto LABEL_10;
  }
  v27 = 0;
  if ((*(_WORD *)&v4 & 0x400) != 0)
  {
LABEL_11:
    v26 = 2654435761 * self->_reachabilityStatus;
    if ((*(_BYTE *)&v4 & 0x40) != 0)
      goto LABEL_12;
    goto LABEL_22;
  }
LABEL_21:
  v26 = 0;
  if ((*(_BYTE *)&v4 & 0x40) != 0)
  {
LABEL_12:
    v25 = 2654435761 * self->_cellularRadioAccessTechnology;
    if ((*(_BYTE *)&v4 & 4) != 0)
      goto LABEL_13;
    goto LABEL_23;
  }
LABEL_22:
  v25 = 0;
  if ((*(_BYTE *)&v4 & 4) != 0)
  {
LABEL_13:
    v24 = 2654435761 * self->_personalizationTreatmentId;
    if ((*(_BYTE *)&v4 & 8) != 0)
      goto LABEL_14;
    goto LABEL_24;
  }
LABEL_23:
  v24 = 0;
  if ((*(_BYTE *)&v4 & 8) != 0)
  {
LABEL_14:
    v23 = 2654435761 * self->_personalizedTreatmentId;
    if ((*(_WORD *)&v4 & 0x2000) != 0)
      goto LABEL_15;
    goto LABEL_25;
  }
LABEL_24:
  v23 = 0;
  if ((*(_WORD *)&v4 & 0x2000) != 0)
  {
LABEL_15:
    v22 = 2654435761 * self->_isPaidSubscriberDuringEvent;
    if ((*(_WORD *)&v4 & 0x8000) != 0)
      goto LABEL_16;
    goto LABEL_26;
  }
LABEL_25:
  v22 = 0;
  if ((*(_WORD *)&v4 & 0x8000) != 0)
  {
LABEL_16:
    v21 = 2654435761 * self->_isPaidSubscriberFromNewsDuringEvent;
    if ((*(_WORD *)&v4 & 0x4000) != 0)
      goto LABEL_17;
LABEL_27:
    v20 = 0;
    if ((*(_DWORD *)&v4 & 0x10000) != 0)
      goto LABEL_18;
    goto LABEL_28;
  }
LABEL_26:
  v21 = 0;
  if ((*(_WORD *)&v4 & 0x4000) == 0)
    goto LABEL_27;
LABEL_17:
  v20 = 2654435761 * self->_isPaidSubscriberFromAppStoreDuringEvent;
  if ((*(_DWORD *)&v4 & 0x10000) != 0)
  {
LABEL_18:
    v19 = 2654435761 * self->_isPaidSubscriberFromThirdPartyDuringEvent;
    goto LABEL_29;
  }
LABEL_28:
  v19 = 0;
LABEL_29:
  v18 = -[NSString hash](self->_notwUserId, "hash");
  v17 = -[NSData hash](self->_sessionIdWatch, "hash");
  if ((*(_BYTE *)&self->_has & 1) != 0)
    v16 = 2654435761 * self->_appConfigTreatmentId;
  else
    v16 = 0;
  v15 = -[NSData hash](self->_widgetSessionId, "hash");
  v5 = -[NSMutableArray hash](self->_userPaidSubscriptionStatus, "hash");
  v6 = -[NSString hash](self->_widgetUserId, "hash");
  if ((*(_BYTE *)&self->_has & 0x20) != 0)
    v7 = 2654435761 * self->_bundleSubscriptionStatus;
  else
    v7 = 0;
  v8 = -[NSString hash](self->_bundlePurchaseId, "hash");
  v9 = -[NSString hash](self->_bundleOfferId, "hash");
  if ((*((_BYTE *)&self->_has + 1) & 0x10) != 0)
    v10 = 2654435761 * self->_isBundlePurchaser;
  else
    v10 = 0;
  v11 = -[NSString hash](self->_appAnalyticsEventIdentifier, "hash");
  v12 = -[NSString hash](self->_appAnalyticsEventPath, "hash");
  if ((*((_BYTE *)&self->_has + 1) & 8) != 0)
    v13 = 2654435761 * self->_isAmplifyUser;
  else
    v13 = 0;
  return v37 ^ v38 ^ v36 ^ v35 ^ v34 ^ v33 ^ v32 ^ v31 ^ v30 ^ v29 ^ v28 ^ v27 ^ v26 ^ v25 ^ v24 ^ v23 ^ v22 ^ v21 ^ v20 ^ v19 ^ v18 ^ v17 ^ v16 ^ v15 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9 ^ v10 ^ v11 ^ v12 ^ v13 ^ -[NSString hash](self->_sBundlePurchaseId, "hash");
}

- (void)mergeFrom:(id)a3
{
  id v4;
  NTPBEventObject *eventObject;
  uint64_t v6;
  int v7;
  int v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  eventObject = self->_eventObject;
  v6 = *((_QWORD *)v4 + 12);
  if (eventObject)
  {
    if (v6)
      -[NTPBEventObject mergeFrom:](eventObject, "mergeFrom:");
  }
  else if (v6)
  {
    -[NTPBEvent setEventObject:](self, "setEventObject:");
  }
  if (*((_QWORD *)v4 + 19))
    -[NTPBEvent setSessionId:](self, "setSessionId:");
  if (*((_QWORD *)v4 + 21))
    -[NTPBEvent setUserId:](self, "setUserId:");
  if (*((_QWORD *)v4 + 23))
    -[NTPBEvent setUserStorefrontId:](self, "setUserStorefrontId:");
  v7 = *((_DWORD *)v4 + 56);
  if ((v7 & 0x10) != 0)
  {
    self->_startTimestamp = *((_QWORD *)v4 + 5);
    *(_DWORD *)&self->_has |= 0x10u;
    v7 = *((_DWORD *)v4 + 56);
    if ((v7 & 2) == 0)
    {
LABEL_14:
      if ((v7 & 0x80) == 0)
        goto LABEL_16;
      goto LABEL_15;
    }
  }
  else if ((v7 & 2) == 0)
  {
    goto LABEL_14;
  }
  self->_duration = *((_QWORD *)v4 + 2);
  *(_DWORD *)&self->_has |= 2u;
  if ((*((_DWORD *)v4 + 56) & 0x80) != 0)
  {
LABEL_15:
    self->_deviceOrientation = *((_DWORD *)v4 + 22);
    *(_DWORD *)&self->_has |= 0x80u;
  }
LABEL_16:
  if (*((_QWORD *)v4 + 17))
    -[NTPBEvent setReferringType:](self, "setReferringType:");
  if (*((_QWORD *)v4 + 16))
    -[NTPBEvent setReferringSource:](self, "setReferringSource:");
  if (*((_QWORD *)v4 + 26))
    -[NTPBEvent setWindowFrameInScreen:](self, "setWindowFrameInScreen:");
  v8 = *((_DWORD *)v4 + 56);
  if ((v8 & 0x100) != 0)
  {
    self->_gestureType = *((_DWORD *)v4 + 26);
    *(_DWORD *)&self->_has |= 0x100u;
    v8 = *((_DWORD *)v4 + 56);
    if ((v8 & 0x200) == 0)
    {
LABEL_24:
      if ((v8 & 0x400) == 0)
        goto LABEL_25;
      goto LABEL_72;
    }
  }
  else if ((v8 & 0x200) == 0)
  {
    goto LABEL_24;
  }
  self->_interfaceOrientation = *((_DWORD *)v4 + 27);
  *(_DWORD *)&self->_has |= 0x200u;
  v8 = *((_DWORD *)v4 + 56);
  if ((v8 & 0x400) == 0)
  {
LABEL_25:
    if ((v8 & 0x40) == 0)
      goto LABEL_26;
    goto LABEL_73;
  }
LABEL_72:
  self->_reachabilityStatus = *((_DWORD *)v4 + 30);
  *(_DWORD *)&self->_has |= 0x400u;
  v8 = *((_DWORD *)v4 + 56);
  if ((v8 & 0x40) == 0)
  {
LABEL_26:
    if ((v8 & 4) == 0)
      goto LABEL_27;
    goto LABEL_74;
  }
LABEL_73:
  self->_cellularRadioAccessTechnology = *((_DWORD *)v4 + 21);
  *(_DWORD *)&self->_has |= 0x40u;
  v8 = *((_DWORD *)v4 + 56);
  if ((v8 & 4) == 0)
  {
LABEL_27:
    if ((v8 & 8) == 0)
      goto LABEL_28;
    goto LABEL_75;
  }
LABEL_74:
  self->_personalizationTreatmentId = *((_QWORD *)v4 + 3);
  *(_DWORD *)&self->_has |= 4u;
  v8 = *((_DWORD *)v4 + 56);
  if ((v8 & 8) == 0)
  {
LABEL_28:
    if ((v8 & 0x2000) == 0)
      goto LABEL_29;
    goto LABEL_76;
  }
LABEL_75:
  self->_personalizedTreatmentId = *((_QWORD *)v4 + 4);
  *(_DWORD *)&self->_has |= 8u;
  v8 = *((_DWORD *)v4 + 56);
  if ((v8 & 0x2000) == 0)
  {
LABEL_29:
    if ((v8 & 0x8000) == 0)
      goto LABEL_30;
    goto LABEL_77;
  }
LABEL_76:
  self->_isPaidSubscriberDuringEvent = *((_BYTE *)v4 + 218);
  *(_DWORD *)&self->_has |= 0x2000u;
  v8 = *((_DWORD *)v4 + 56);
  if ((v8 & 0x8000) == 0)
  {
LABEL_30:
    if ((v8 & 0x4000) == 0)
      goto LABEL_31;
    goto LABEL_78;
  }
LABEL_77:
  self->_isPaidSubscriberFromNewsDuringEvent = *((_BYTE *)v4 + 220);
  *(_DWORD *)&self->_has |= 0x8000u;
  v8 = *((_DWORD *)v4 + 56);
  if ((v8 & 0x4000) == 0)
  {
LABEL_31:
    if ((v8 & 0x10000) == 0)
      goto LABEL_33;
    goto LABEL_32;
  }
LABEL_78:
  self->_isPaidSubscriberFromAppStoreDuringEvent = *((_BYTE *)v4 + 219);
  *(_DWORD *)&self->_has |= 0x4000u;
  if ((*((_DWORD *)v4 + 56) & 0x10000) != 0)
  {
LABEL_32:
    self->_isPaidSubscriberFromThirdPartyDuringEvent = *((_BYTE *)v4 + 221);
    *(_DWORD *)&self->_has |= 0x10000u;
  }
LABEL_33:
  if (*((_QWORD *)v4 + 14))
    -[NTPBEvent setNotwUserId:](self, "setNotwUserId:");
  if (*((_QWORD *)v4 + 20))
    -[NTPBEvent setSessionIdWatch:](self, "setSessionIdWatch:");
  if ((*((_BYTE *)v4 + 224) & 1) != 0)
  {
    self->_appConfigTreatmentId = *((_QWORD *)v4 + 1);
    *(_DWORD *)&self->_has |= 1u;
  }
  if (*((_QWORD *)v4 + 24))
    -[NTPBEvent setWidgetSessionId:](self, "setWidgetSessionId:");
  v16 = 0u;
  v17 = 0u;
  v14 = 0u;
  v15 = 0u;
  v9 = *((id *)v4 + 22);
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v15;
    do
    {
      for (i = 0; i != v11; ++i)
      {
        if (*(_QWORD *)v15 != v12)
          objc_enumerationMutation(v9);
        -[NTPBEvent addUserPaidSubscriptionStatus:](self, "addUserPaidSubscriptionStatus:", *(_QWORD *)(*((_QWORD *)&v14 + 1) + 8 * i), (_QWORD)v14);
      }
      v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v11);
  }

  if (*((_QWORD *)v4 + 25))
    -[NTPBEvent setWidgetUserId:](self, "setWidgetUserId:");
  if ((*((_BYTE *)v4 + 224) & 0x20) != 0)
  {
    self->_bundleSubscriptionStatus = *((_DWORD *)v4 + 20);
    *(_DWORD *)&self->_has |= 0x20u;
  }
  if (*((_QWORD *)v4 + 9))
    -[NTPBEvent setBundlePurchaseId:](self, "setBundlePurchaseId:");
  if (*((_QWORD *)v4 + 8))
    -[NTPBEvent setBundleOfferId:](self, "setBundleOfferId:");
  if ((*((_BYTE *)v4 + 225) & 0x10) != 0)
  {
    self->_isBundlePurchaser = *((_BYTE *)v4 + 217);
    *(_DWORD *)&self->_has |= 0x1000u;
  }
  if (*((_QWORD *)v4 + 6))
    -[NTPBEvent setAppAnalyticsEventIdentifier:](self, "setAppAnalyticsEventIdentifier:");
  if (*((_QWORD *)v4 + 7))
    -[NTPBEvent setAppAnalyticsEventPath:](self, "setAppAnalyticsEventPath:");
  if ((*((_BYTE *)v4 + 225) & 8) != 0)
  {
    self->_isAmplifyUser = *((_BYTE *)v4 + 216);
    *(_DWORD *)&self->_has |= 0x800u;
  }
  if (*((_QWORD *)v4 + 18))
    -[NTPBEvent setSBundlePurchaseId:](self, "setSBundlePurchaseId:");

}

- (NTPBEventObject)eventObject
{
  return self->_eventObject;
}

- (void)setEventObject:(id)a3
{
  objc_storeStrong((id *)&self->_eventObject, a3);
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

- (int64_t)startTimestamp
{
  return self->_startTimestamp;
}

- (int64_t)duration
{
  return self->_duration;
}

- (NSString)referringType
{
  return self->_referringType;
}

- (void)setReferringType:(id)a3
{
  objc_storeStrong((id *)&self->_referringType, a3);
}

- (NSString)referringSource
{
  return self->_referringSource;
}

- (void)setReferringSource:(id)a3
{
  objc_storeStrong((id *)&self->_referringSource, a3);
}

- (NSString)windowFrameInScreen
{
  return self->_windowFrameInScreen;
}

- (void)setWindowFrameInScreen:(id)a3
{
  objc_storeStrong((id *)&self->_windowFrameInScreen, a3);
}

- (int64_t)personalizationTreatmentId
{
  return self->_personalizationTreatmentId;
}

- (int64_t)personalizedTreatmentId
{
  return self->_personalizedTreatmentId;
}

- (BOOL)isPaidSubscriberDuringEvent
{
  return self->_isPaidSubscriberDuringEvent;
}

- (BOOL)isPaidSubscriberFromNewsDuringEvent
{
  return self->_isPaidSubscriberFromNewsDuringEvent;
}

- (BOOL)isPaidSubscriberFromAppStoreDuringEvent
{
  return self->_isPaidSubscriberFromAppStoreDuringEvent;
}

- (BOOL)isPaidSubscriberFromThirdPartyDuringEvent
{
  return self->_isPaidSubscriberFromThirdPartyDuringEvent;
}

- (NSString)notwUserId
{
  return self->_notwUserId;
}

- (void)setNotwUserId:(id)a3
{
  objc_storeStrong((id *)&self->_notwUserId, a3);
}

- (NSData)sessionIdWatch
{
  return self->_sessionIdWatch;
}

- (void)setSessionIdWatch:(id)a3
{
  objc_storeStrong((id *)&self->_sessionIdWatch, a3);
}

- (int64_t)appConfigTreatmentId
{
  return self->_appConfigTreatmentId;
}

- (NSData)widgetSessionId
{
  return self->_widgetSessionId;
}

- (void)setWidgetSessionId:(id)a3
{
  objc_storeStrong((id *)&self->_widgetSessionId, a3);
}

- (NSMutableArray)userPaidSubscriptionStatus
{
  return self->_userPaidSubscriptionStatus;
}

- (void)setUserPaidSubscriptionStatus:(id)a3
{
  objc_storeStrong((id *)&self->_userPaidSubscriptionStatus, a3);
}

- (NSString)widgetUserId
{
  return self->_widgetUserId;
}

- (void)setWidgetUserId:(id)a3
{
  objc_storeStrong((id *)&self->_widgetUserId, a3);
}

- (NSString)bundlePurchaseId
{
  return self->_bundlePurchaseId;
}

- (void)setBundlePurchaseId:(id)a3
{
  objc_storeStrong((id *)&self->_bundlePurchaseId, a3);
}

- (NSString)bundleOfferId
{
  return self->_bundleOfferId;
}

- (void)setBundleOfferId:(id)a3
{
  objc_storeStrong((id *)&self->_bundleOfferId, a3);
}

- (BOOL)isBundlePurchaser
{
  return self->_isBundlePurchaser;
}

- (NSString)appAnalyticsEventIdentifier
{
  return self->_appAnalyticsEventIdentifier;
}

- (void)setAppAnalyticsEventIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_appAnalyticsEventIdentifier, a3);
}

- (NSString)appAnalyticsEventPath
{
  return self->_appAnalyticsEventPath;
}

- (void)setAppAnalyticsEventPath:(id)a3
{
  objc_storeStrong((id *)&self->_appAnalyticsEventPath, a3);
}

- (BOOL)isAmplifyUser
{
  return self->_isAmplifyUser;
}

- (NSString)sBundlePurchaseId
{
  return self->_sBundlePurchaseId;
}

- (void)setSBundlePurchaseId:(id)a3
{
  objc_storeStrong((id *)&self->_sBundlePurchaseId, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_windowFrameInScreen, 0);
  objc_storeStrong((id *)&self->_widgetUserId, 0);
  objc_storeStrong((id *)&self->_widgetSessionId, 0);
  objc_storeStrong((id *)&self->_userStorefrontId, 0);
  objc_storeStrong((id *)&self->_userPaidSubscriptionStatus, 0);
  objc_storeStrong((id *)&self->_userId, 0);
  objc_storeStrong((id *)&self->_sessionIdWatch, 0);
  objc_storeStrong((id *)&self->_sessionId, 0);
  objc_storeStrong((id *)&self->_sBundlePurchaseId, 0);
  objc_storeStrong((id *)&self->_referringType, 0);
  objc_storeStrong((id *)&self->_referringSource, 0);
  objc_storeStrong((id *)&self->_notwUserId, 0);
  objc_storeStrong((id *)&self->_eventObject, 0);
  objc_storeStrong((id *)&self->_bundlePurchaseId, 0);
  objc_storeStrong((id *)&self->_bundleOfferId, 0);
  objc_storeStrong((id *)&self->_appAnalyticsEventPath, 0);
  objc_storeStrong((id *)&self->_appAnalyticsEventIdentifier, 0);
}

@end
