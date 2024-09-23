@implementation NTPBTodayResultOperationFetchInfo

- (void)dealloc
{
  objc_super v3;

  PBRepeatedInt32Clear();
  PBRepeatedInt64Clear();
  v3.receiver = self;
  v3.super_class = (Class)NTPBTodayResultOperationFetchInfo;
  -[NTPBTodayResultOperationFetchInfo dealloc](&v3, sel_dealloc);
}

- (BOOL)hasTodaySourceIdentifier
{
  return self->_todaySourceIdentifier != 0;
}

- (void)setAppConfigTreatmentIDInteger:(int64_t)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_appConfigTreatmentIDInteger = a3;
}

- (void)setHasAppConfigTreatmentIDInteger:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (BOOL)hasAppConfigTreatmentIDInteger
{
  return *(_BYTE *)&self->_has & 1;
}

- (BOOL)hasUserID
{
  return self->_userID != 0;
}

- (BOOL)hasContentStoreFrontID
{
  return self->_contentStoreFrontID != 0;
}

- (void)setWifiReachable:(BOOL)a3
{
  *(_BYTE *)&self->_has |= 0x20u;
  self->_wifiReachable = a3;
}

- (void)setHasWifiReachable:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 32;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xDF | v3;
}

- (BOOL)hasWifiReachable
{
  return (*(_BYTE *)&self->_has >> 5) & 1;
}

- (void)setCellularRadioAccessTechnology:(int64_t)a3
{
  *(_BYTE *)&self->_has |= 2u;
  self->_cellularRadioAccessTechnology = a3;
}

- (void)setHasCellularRadioAccessTechnology:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFD | v3;
}

- (BOOL)hasCellularRadioAccessTechnology
{
  return (*(_BYTE *)&self->_has >> 1) & 1;
}

- (void)setReachabilityStatus:(int64_t)a3
{
  *(_BYTE *)&self->_has |= 8u;
  self->_reachabilityStatus = a3;
}

- (void)setHasReachabilityStatus:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 8;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xF7 | v3;
}

- (BOOL)hasReachabilityStatus
{
  return (*(_BYTE *)&self->_has >> 3) & 1;
}

- (BOOL)hasWidgetConfig
{
  return self->_widgetConfig != 0;
}

- (void)setOnboardingVersion:(int64_t)a3
{
  *(_BYTE *)&self->_has |= 4u;
  self->_onboardingVersion = a3;
}

- (void)setHasOnboardingVersion:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 4;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFB | v3;
}

- (BOOL)hasOnboardingVersion
{
  return (*(_BYTE *)&self->_has >> 2) & 1;
}

- (BOOL)hasClickThroughRateByPersonalizationFeatureIDData
{
  return self->_clickThroughRateByPersonalizationFeatureIDData != 0;
}

- (BOOL)hasLocaleIdentifier
{
  return self->_localeIdentifier != 0;
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

- (void)setIsBundleSubscriber:(BOOL)a3
{
  *(_BYTE *)&self->_has |= 0x10u;
  self->_isBundleSubscriber = a3;
}

- (void)setHasIsBundleSubscriber:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 16;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xEF | v3;
}

- (BOOL)hasIsBundleSubscriber
{
  return (*(_BYTE *)&self->_has >> 4) & 1;
}

- (BOOL)hasBundleIap
{
  return self->_bundleIap != 0;
}

- (BOOL)hasContentEnvironment
{
  return self->_contentEnvironment != 0;
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
  v8.super_class = (Class)NTPBTodayResultOperationFetchInfo;
  -[NTPBTodayResultOperationFetchInfo description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[NTPBTodayResultOperationFetchInfo dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;
  NSString *todaySourceIdentifier;
  void *v6;
  NSString *userID;
  NSString *contentStoreFrontID;
  char has;
  void *v10;
  NTPBTodayWidgetConfig *widgetConfig;
  void *v12;
  void *v13;
  NSData *clickThroughRateByPersonalizationFeatureIDData;
  NSString *localeIdentifier;
  void *v16;
  void *v17;
  void *v18;
  NSString *bundleIap;
  NSString *contentEnvironment;
  void *v22;
  void *v23;

  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  todaySourceIdentifier = self->_todaySourceIdentifier;
  if (todaySourceIdentifier)
    objc_msgSend(v3, "setObject:forKey:", todaySourceIdentifier, CFSTR("today_source_identifier"));
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithLongLong:", self->_appConfigTreatmentIDInteger);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v6, CFSTR("app_config_treatment_ID_integer"));

  }
  userID = self->_userID;
  if (userID)
    objc_msgSend(v4, "setObject:forKey:", userID, CFSTR("user_ID"));
  contentStoreFrontID = self->_contentStoreFrontID;
  if (contentStoreFrontID)
    objc_msgSend(v4, "setObject:forKey:", contentStoreFrontID, CFSTR("content_store_front_ID"));
  has = (char)self->_has;
  if ((has & 0x20) != 0)
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", self->_wifiReachable);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v22, CFSTR("wifi_reachable"));

    has = (char)self->_has;
    if ((has & 2) == 0)
    {
LABEL_11:
      if ((has & 8) == 0)
        goto LABEL_13;
      goto LABEL_12;
    }
  }
  else if ((*(_BYTE *)&self->_has & 2) == 0)
  {
    goto LABEL_11;
  }
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithLongLong:", self->_cellularRadioAccessTechnology);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKey:", v23, CFSTR("cellular_radio_access_technology"));

  if ((*(_BYTE *)&self->_has & 8) != 0)
  {
LABEL_12:
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithLongLong:", self->_reachabilityStatus);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v10, CFSTR("reachability_status"));

  }
LABEL_13:
  widgetConfig = self->_widgetConfig;
  if (widgetConfig)
  {
    -[NTPBTodayWidgetConfig dictionaryRepresentation](widgetConfig, "dictionaryRepresentation");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v12, CFSTR("widget_config"));

  }
  if ((*(_BYTE *)&self->_has & 4) != 0)
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithLongLong:", self->_onboardingVersion);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v13, CFSTR("onboarding_version"));

  }
  clickThroughRateByPersonalizationFeatureIDData = self->_clickThroughRateByPersonalizationFeatureIDData;
  if (clickThroughRateByPersonalizationFeatureIDData)
    objc_msgSend(v4, "setObject:forKey:", clickThroughRateByPersonalizationFeatureIDData, CFSTR("click_through_rate_by_personalization_feature_ID_data"));
  localeIdentifier = self->_localeIdentifier;
  if (localeIdentifier)
    objc_msgSend(v4, "setObject:forKey:", localeIdentifier, CFSTR("locale_identifier"));
  PBRepeatedInt32NSArray();
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKey:", v16, CFSTR("user_segmentation_segment_set_ids"));

  PBRepeatedInt64NSArray();
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKey:", v17, CFSTR("user_segmentation_treatment_ids"));

  if ((*(_BYTE *)&self->_has & 0x10) != 0)
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", self->_isBundleSubscriber);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v18, CFSTR("is_bundle_subscriber"));

  }
  bundleIap = self->_bundleIap;
  if (bundleIap)
    objc_msgSend(v4, "setObject:forKey:", bundleIap, CFSTR("bundle_iap"));
  contentEnvironment = self->_contentEnvironment;
  if (contentEnvironment)
    objc_msgSend(v4, "setObject:forKey:", contentEnvironment, CFSTR("content_environment"));
  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return NTPBTodayResultOperationFetchInfoReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4;
  char has;
  unint64_t v6;
  unint64_t v7;
  id v8;

  v4 = a3;
  v8 = v4;
  if (self->_todaySourceIdentifier)
  {
    PBDataWriterWriteStringField();
    v4 = v8;
  }
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    PBDataWriterWriteInt64Field();
    v4 = v8;
  }
  if (self->_userID)
  {
    PBDataWriterWriteStringField();
    v4 = v8;
  }
  if (self->_contentStoreFrontID)
  {
    PBDataWriterWriteStringField();
    v4 = v8;
  }
  has = (char)self->_has;
  if ((has & 0x20) != 0)
  {
    PBDataWriterWriteBOOLField();
    v4 = v8;
    has = (char)self->_has;
    if ((has & 2) == 0)
    {
LABEL_11:
      if ((has & 8) == 0)
        goto LABEL_13;
      goto LABEL_12;
    }
  }
  else if ((*(_BYTE *)&self->_has & 2) == 0)
  {
    goto LABEL_11;
  }
  PBDataWriterWriteInt64Field();
  v4 = v8;
  if ((*(_BYTE *)&self->_has & 8) != 0)
  {
LABEL_12:
    PBDataWriterWriteInt64Field();
    v4 = v8;
  }
LABEL_13:
  if (self->_widgetConfig)
  {
    PBDataWriterWriteSubmessage();
    v4 = v8;
  }
  if ((*(_BYTE *)&self->_has & 4) != 0)
  {
    PBDataWriterWriteInt64Field();
    v4 = v8;
  }
  if (self->_clickThroughRateByPersonalizationFeatureIDData)
  {
    PBDataWriterWriteDataField();
    v4 = v8;
  }
  if (self->_localeIdentifier)
  {
    PBDataWriterWriteStringField();
    v4 = v8;
  }
  if (self->_userSegmentationSegmentSetIds.count)
  {
    v6 = 0;
    do
    {
      PBDataWriterWriteInt32Field();
      v4 = v8;
      ++v6;
    }
    while (v6 < self->_userSegmentationSegmentSetIds.count);
  }
  if (self->_userSegmentationTreatmentIds.count)
  {
    v7 = 0;
    do
    {
      PBDataWriterWriteInt64Field();
      v4 = v8;
      ++v7;
    }
    while (v7 < self->_userSegmentationTreatmentIds.count);
  }
  if ((*(_BYTE *)&self->_has & 0x10) != 0)
  {
    PBDataWriterWriteBOOLField();
    v4 = v8;
  }
  if (self->_bundleIap)
  {
    PBDataWriterWriteStringField();
    v4 = v8;
  }
  if (self->_contentEnvironment)
  {
    PBDataWriterWriteStringField();
    v4 = v8;
  }

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
  char has;
  id v13;
  void *v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  void *v20;
  uint64_t v21;
  void *v22;

  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = -[NSString copyWithZone:](self->_todaySourceIdentifier, "copyWithZone:", a3);
  v7 = *(void **)(v5 + 128);
  *(_QWORD *)(v5 + 128) = v6;

  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    *(_QWORD *)(v5 + 56) = self->_appConfigTreatmentIDInteger;
    *(_BYTE *)(v5 + 156) |= 1u;
  }
  v8 = -[NSString copyWithZone:](self->_userID, "copyWithZone:", a3);
  v9 = *(void **)(v5 + 136);
  *(_QWORD *)(v5 + 136) = v8;

  v10 = -[NSString copyWithZone:](self->_contentStoreFrontID, "copyWithZone:", a3);
  v11 = *(void **)(v5 + 112);
  *(_QWORD *)(v5 + 112) = v10;

  has = (char)self->_has;
  if ((has & 0x20) != 0)
  {
    *(_BYTE *)(v5 + 153) = self->_wifiReachable;
    *(_BYTE *)(v5 + 156) |= 0x20u;
    has = (char)self->_has;
    if ((has & 2) == 0)
    {
LABEL_5:
      if ((has & 8) == 0)
        goto LABEL_7;
      goto LABEL_6;
    }
  }
  else if ((*(_BYTE *)&self->_has & 2) == 0)
  {
    goto LABEL_5;
  }
  *(_QWORD *)(v5 + 64) = self->_cellularRadioAccessTechnology;
  *(_BYTE *)(v5 + 156) |= 2u;
  if ((*(_BYTE *)&self->_has & 8) != 0)
  {
LABEL_6:
    *(_QWORD *)(v5 + 80) = self->_reachabilityStatus;
    *(_BYTE *)(v5 + 156) |= 8u;
  }
LABEL_7:
  v13 = -[NTPBTodayWidgetConfig copyWithZone:](self->_widgetConfig, "copyWithZone:", a3);
  v14 = *(void **)(v5 + 144);
  *(_QWORD *)(v5 + 144) = v13;

  if ((*(_BYTE *)&self->_has & 4) != 0)
  {
    *(_QWORD *)(v5 + 72) = self->_onboardingVersion;
    *(_BYTE *)(v5 + 156) |= 4u;
  }
  v15 = -[NSData copyWithZone:](self->_clickThroughRateByPersonalizationFeatureIDData, "copyWithZone:", a3);
  v16 = *(void **)(v5 + 96);
  *(_QWORD *)(v5 + 96) = v15;

  v17 = -[NSString copyWithZone:](self->_localeIdentifier, "copyWithZone:", a3);
  v18 = *(void **)(v5 + 120);
  *(_QWORD *)(v5 + 120) = v17;

  PBRepeatedInt32Copy();
  PBRepeatedInt64Copy();
  if ((*(_BYTE *)&self->_has & 0x10) != 0)
  {
    *(_BYTE *)(v5 + 152) = self->_isBundleSubscriber;
    *(_BYTE *)(v5 + 156) |= 0x10u;
  }
  v19 = -[NSString copyWithZone:](self->_bundleIap, "copyWithZone:", a3);
  v20 = *(void **)(v5 + 88);
  *(_QWORD *)(v5 + 88) = v19;

  v21 = -[NSString copyWithZone:](self->_contentEnvironment, "copyWithZone:", a3);
  v22 = *(void **)(v5 + 104);
  *(_QWORD *)(v5 + 104) = v21;

  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  NSString *todaySourceIdentifier;
  NSString *userID;
  NSString *contentStoreFrontID;
  char has;
  NTPBTodayWidgetConfig *widgetConfig;
  NSData *clickThroughRateByPersonalizationFeatureIDData;
  NSString *localeIdentifier;
  NSString *bundleIap;
  NSString *contentEnvironment;
  char v14;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_57;
  todaySourceIdentifier = self->_todaySourceIdentifier;
  if ((unint64_t)todaySourceIdentifier | *((_QWORD *)v4 + 16))
  {
    if (!-[NSString isEqual:](todaySourceIdentifier, "isEqual:"))
      goto LABEL_57;
  }
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 156) & 1) == 0 || self->_appConfigTreatmentIDInteger != *((_QWORD *)v4 + 7))
      goto LABEL_57;
  }
  else if ((*((_BYTE *)v4 + 156) & 1) != 0)
  {
    goto LABEL_57;
  }
  userID = self->_userID;
  if ((unint64_t)userID | *((_QWORD *)v4 + 17) && !-[NSString isEqual:](userID, "isEqual:"))
    goto LABEL_57;
  contentStoreFrontID = self->_contentStoreFrontID;
  if ((unint64_t)contentStoreFrontID | *((_QWORD *)v4 + 14))
  {
    if (!-[NSString isEqual:](contentStoreFrontID, "isEqual:"))
      goto LABEL_57;
  }
  has = (char)self->_has;
  if ((has & 0x20) != 0)
  {
    if ((*((_BYTE *)v4 + 156) & 0x20) == 0)
      goto LABEL_57;
    if (self->_wifiReachable)
    {
      if (!*((_BYTE *)v4 + 153))
        goto LABEL_57;
    }
    else if (*((_BYTE *)v4 + 153))
    {
      goto LABEL_57;
    }
  }
  else if ((*((_BYTE *)v4 + 156) & 0x20) != 0)
  {
    goto LABEL_57;
  }
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    if ((*((_BYTE *)v4 + 156) & 2) == 0 || self->_cellularRadioAccessTechnology != *((_QWORD *)v4 + 8))
      goto LABEL_57;
  }
  else if ((*((_BYTE *)v4 + 156) & 2) != 0)
  {
    goto LABEL_57;
  }
  if ((*(_BYTE *)&self->_has & 8) != 0)
  {
    if ((*((_BYTE *)v4 + 156) & 8) == 0 || self->_reachabilityStatus != *((_QWORD *)v4 + 10))
      goto LABEL_57;
  }
  else if ((*((_BYTE *)v4 + 156) & 8) != 0)
  {
    goto LABEL_57;
  }
  widgetConfig = self->_widgetConfig;
  if ((unint64_t)widgetConfig | *((_QWORD *)v4 + 18))
  {
    if (!-[NTPBTodayWidgetConfig isEqual:](widgetConfig, "isEqual:"))
      goto LABEL_57;
    has = (char)self->_has;
  }
  if ((has & 4) != 0)
  {
    if ((*((_BYTE *)v4 + 156) & 4) == 0 || self->_onboardingVersion != *((_QWORD *)v4 + 9))
      goto LABEL_57;
  }
  else if ((*((_BYTE *)v4 + 156) & 4) != 0)
  {
    goto LABEL_57;
  }
  clickThroughRateByPersonalizationFeatureIDData = self->_clickThroughRateByPersonalizationFeatureIDData;
  if ((unint64_t)clickThroughRateByPersonalizationFeatureIDData | *((_QWORD *)v4 + 12)
    && !-[NSData isEqual:](clickThroughRateByPersonalizationFeatureIDData, "isEqual:"))
  {
    goto LABEL_57;
  }
  localeIdentifier = self->_localeIdentifier;
  if ((unint64_t)localeIdentifier | *((_QWORD *)v4 + 15))
  {
    if (!-[NSString isEqual:](localeIdentifier, "isEqual:"))
      goto LABEL_57;
  }
  if (!PBRepeatedInt32IsEqual() || !PBRepeatedInt64IsEqual())
    goto LABEL_57;
  if ((*(_BYTE *)&self->_has & 0x10) != 0)
  {
    if ((*((_BYTE *)v4 + 156) & 0x10) != 0)
    {
      if (self->_isBundleSubscriber)
      {
        if (!*((_BYTE *)v4 + 152))
          goto LABEL_57;
        goto LABEL_53;
      }
      if (!*((_BYTE *)v4 + 152))
        goto LABEL_53;
    }
LABEL_57:
    v14 = 0;
    goto LABEL_58;
  }
  if ((*((_BYTE *)v4 + 156) & 0x10) != 0)
    goto LABEL_57;
LABEL_53:
  bundleIap = self->_bundleIap;
  if ((unint64_t)bundleIap | *((_QWORD *)v4 + 11) && !-[NSString isEqual:](bundleIap, "isEqual:"))
    goto LABEL_57;
  contentEnvironment = self->_contentEnvironment;
  if ((unint64_t)contentEnvironment | *((_QWORD *)v4 + 13))
    v14 = -[NSString isEqual:](contentEnvironment, "isEqual:");
  else
    v14 = 1;
LABEL_58:

  return v14;
}

- (unint64_t)hash
{
  uint64_t v3;
  uint64_t v4;
  unint64_t v5;
  uint64_t v6;
  uint64_t v7;
  NSUInteger v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  NSUInteger v12;
  NSUInteger v13;
  uint64_t v15;
  NSUInteger v16;
  NSUInteger v17;
  uint64_t v18;
  NSUInteger v19;

  v19 = -[NSString hash](self->_todaySourceIdentifier, "hash");
  if ((*(_BYTE *)&self->_has & 1) != 0)
    v18 = 2654435761 * self->_appConfigTreatmentIDInteger;
  else
    v18 = 0;
  v17 = -[NSString hash](self->_userID, "hash");
  v16 = -[NSString hash](self->_contentStoreFrontID, "hash");
  if ((*(_BYTE *)&self->_has & 0x20) == 0)
  {
    v15 = 0;
    if ((*(_BYTE *)&self->_has & 2) != 0)
      goto LABEL_6;
LABEL_9:
    v3 = 0;
    if ((*(_BYTE *)&self->_has & 8) != 0)
      goto LABEL_7;
    goto LABEL_10;
  }
  v15 = 2654435761 * self->_wifiReachable;
  if ((*(_BYTE *)&self->_has & 2) == 0)
    goto LABEL_9;
LABEL_6:
  v3 = 2654435761 * self->_cellularRadioAccessTechnology;
  if ((*(_BYTE *)&self->_has & 8) != 0)
  {
LABEL_7:
    v4 = 2654435761 * self->_reachabilityStatus;
    goto LABEL_11;
  }
LABEL_10:
  v4 = 0;
LABEL_11:
  v5 = -[NTPBTodayWidgetConfig hash](self->_widgetConfig, "hash");
  if ((*(_BYTE *)&self->_has & 4) != 0)
    v6 = 2654435761 * self->_onboardingVersion;
  else
    v6 = 0;
  v7 = -[NSData hash](self->_clickThroughRateByPersonalizationFeatureIDData, "hash");
  v8 = -[NSString hash](self->_localeIdentifier, "hash");
  v9 = PBRepeatedInt32Hash();
  v10 = PBRepeatedInt64Hash();
  if ((*(_BYTE *)&self->_has & 0x10) != 0)
    v11 = 2654435761 * self->_isBundleSubscriber;
  else
    v11 = 0;
  v12 = v18 ^ v19 ^ v17 ^ v16 ^ v15 ^ v3 ^ v4 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9 ^ v10;
  v13 = v11 ^ -[NSString hash](self->_bundleIap, "hash");
  return v12 ^ v13 ^ -[NSString hash](self->_contentEnvironment, "hash");
}

- (void)mergeFrom:(id)a3
{
  BOOL *v4;
  BOOL v5;
  NTPBTodayWidgetConfig *widgetConfig;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  uint64_t v11;
  uint64_t v12;
  uint64_t j;
  BOOL *v14;
  BOOL *v15;

  v4 = (BOOL *)a3;
  v15 = v4;
  if (*((_QWORD *)v4 + 16))
  {
    -[NTPBTodayResultOperationFetchInfo setTodaySourceIdentifier:](self, "setTodaySourceIdentifier:");
    v4 = v15;
  }
  if (v4[156])
  {
    self->_appConfigTreatmentIDInteger = *((_QWORD *)v4 + 7);
    *(_BYTE *)&self->_has |= 1u;
  }
  if (*((_QWORD *)v4 + 17))
  {
    -[NTPBTodayResultOperationFetchInfo setUserID:](self, "setUserID:");
    v4 = v15;
  }
  if (*((_QWORD *)v4 + 14))
  {
    -[NTPBTodayResultOperationFetchInfo setContentStoreFrontID:](self, "setContentStoreFrontID:");
    v4 = v15;
  }
  v5 = v4[156];
  if ((v5 & 0x20) != 0)
  {
    self->_wifiReachable = v4[153];
    *(_BYTE *)&self->_has |= 0x20u;
    v5 = v4[156];
    if ((v5 & 2) == 0)
    {
LABEL_11:
      if ((v5 & 8) == 0)
        goto LABEL_13;
      goto LABEL_12;
    }
  }
  else if ((v4[156] & 2) == 0)
  {
    goto LABEL_11;
  }
  self->_cellularRadioAccessTechnology = *((_QWORD *)v4 + 8);
  *(_BYTE *)&self->_has |= 2u;
  if ((v4[156] & 8) != 0)
  {
LABEL_12:
    self->_reachabilityStatus = *((_QWORD *)v4 + 10);
    *(_BYTE *)&self->_has |= 8u;
  }
LABEL_13:
  widgetConfig = self->_widgetConfig;
  v7 = *((_QWORD *)v4 + 18);
  if (widgetConfig)
  {
    if (!v7)
      goto LABEL_22;
    -[NTPBTodayWidgetConfig mergeFrom:](widgetConfig, "mergeFrom:");
  }
  else
  {
    if (!v7)
      goto LABEL_22;
    -[NTPBTodayResultOperationFetchInfo setWidgetConfig:](self, "setWidgetConfig:");
  }
  v4 = v15;
LABEL_22:
  if ((v4[156] & 4) != 0)
  {
    self->_onboardingVersion = *((_QWORD *)v4 + 9);
    *(_BYTE *)&self->_has |= 4u;
  }
  if (*((_QWORD *)v4 + 12))
  {
    -[NTPBTodayResultOperationFetchInfo setClickThroughRateByPersonalizationFeatureIDData:](self, "setClickThroughRateByPersonalizationFeatureIDData:");
    v4 = v15;
  }
  if (*((_QWORD *)v4 + 15))
  {
    -[NTPBTodayResultOperationFetchInfo setLocaleIdentifier:](self, "setLocaleIdentifier:");
    v4 = v15;
  }
  v8 = objc_msgSend(v4, "userSegmentationSegmentSetIdsCount");
  if (v8)
  {
    v9 = v8;
    for (i = 0; i != v9; ++i)
      -[NTPBTodayResultOperationFetchInfo addUserSegmentationSegmentSetIds:](self, "addUserSegmentationSegmentSetIds:", objc_msgSend(v15, "userSegmentationSegmentSetIdsAtIndex:", i));
  }
  v11 = objc_msgSend(v15, "userSegmentationTreatmentIdsCount");
  if (v11)
  {
    v12 = v11;
    for (j = 0; j != v12; ++j)
      -[NTPBTodayResultOperationFetchInfo addUserSegmentationTreatmentIds:](self, "addUserSegmentationTreatmentIds:", objc_msgSend(v15, "userSegmentationTreatmentIdsAtIndex:", j));
  }
  v14 = v15;
  if ((v15[156] & 0x10) != 0)
  {
    self->_isBundleSubscriber = v15[152];
    *(_BYTE *)&self->_has |= 0x10u;
  }
  if (*((_QWORD *)v15 + 11))
  {
    -[NTPBTodayResultOperationFetchInfo setBundleIap:](self, "setBundleIap:");
    v14 = v15;
  }
  if (*((_QWORD *)v14 + 13))
  {
    -[NTPBTodayResultOperationFetchInfo setContentEnvironment:](self, "setContentEnvironment:");
    v14 = v15;
  }

}

- (NSString)todaySourceIdentifier
{
  return self->_todaySourceIdentifier;
}

- (void)setTodaySourceIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_todaySourceIdentifier, a3);
}

- (int64_t)appConfigTreatmentIDInteger
{
  return self->_appConfigTreatmentIDInteger;
}

- (NSString)userID
{
  return self->_userID;
}

- (void)setUserID:(id)a3
{
  objc_storeStrong((id *)&self->_userID, a3);
}

- (NSString)contentStoreFrontID
{
  return self->_contentStoreFrontID;
}

- (void)setContentStoreFrontID:(id)a3
{
  objc_storeStrong((id *)&self->_contentStoreFrontID, a3);
}

- (BOOL)wifiReachable
{
  return self->_wifiReachable;
}

- (int64_t)cellularRadioAccessTechnology
{
  return self->_cellularRadioAccessTechnology;
}

- (int64_t)reachabilityStatus
{
  return self->_reachabilityStatus;
}

- (NTPBTodayWidgetConfig)widgetConfig
{
  return self->_widgetConfig;
}

- (void)setWidgetConfig:(id)a3
{
  objc_storeStrong((id *)&self->_widgetConfig, a3);
}

- (int64_t)onboardingVersion
{
  return self->_onboardingVersion;
}

- (NSData)clickThroughRateByPersonalizationFeatureIDData
{
  return self->_clickThroughRateByPersonalizationFeatureIDData;
}

- (void)setClickThroughRateByPersonalizationFeatureIDData:(id)a3
{
  objc_storeStrong((id *)&self->_clickThroughRateByPersonalizationFeatureIDData, a3);
}

- (NSString)localeIdentifier
{
  return self->_localeIdentifier;
}

- (void)setLocaleIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_localeIdentifier, a3);
}

- (BOOL)isBundleSubscriber
{
  return self->_isBundleSubscriber;
}

- (NSString)bundleIap
{
  return self->_bundleIap;
}

- (void)setBundleIap:(id)a3
{
  objc_storeStrong((id *)&self->_bundleIap, a3);
}

- (NSString)contentEnvironment
{
  return self->_contentEnvironment;
}

- (void)setContentEnvironment:(id)a3
{
  objc_storeStrong((id *)&self->_contentEnvironment, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_widgetConfig, 0);
  objc_storeStrong((id *)&self->_userID, 0);
  objc_storeStrong((id *)&self->_todaySourceIdentifier, 0);
  objc_storeStrong((id *)&self->_localeIdentifier, 0);
  objc_storeStrong((id *)&self->_contentStoreFrontID, 0);
  objc_storeStrong((id *)&self->_contentEnvironment, 0);
  objc_storeStrong((id *)&self->_clickThroughRateByPersonalizationFeatureIDData, 0);
  objc_storeStrong((id *)&self->_bundleIap, 0);
}

@end
