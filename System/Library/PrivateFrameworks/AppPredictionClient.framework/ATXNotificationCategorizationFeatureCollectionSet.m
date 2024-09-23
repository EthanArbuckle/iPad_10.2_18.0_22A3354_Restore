@implementation ATXNotificationCategorizationFeatureCollectionSet

- (ATXNotificationCategorizationFeatureCollectionSet)initWithBundleID:(id)a3 notificationDeliveryUrgency:(int64_t)a4 contactRelationships:(unint64_t)a5 relationshipsFromMegadome:(id)a6 dayOfWeek:(unint64_t)a7 timeOfDay:(int)a8 locationSemantic:(int)a9 appModeAffinityScore:(double)a10 contactModeAffinityScore:(double)a11 notificationModeAffinityScore:(double)a12 appCategoryScoreInMode:(double)a13 urgencyScore:(double)a14 importanceScore:(double)a15 bucketizedLengthOfNotificationBody:(unint64_t)a16 currentMode:(unint64_t)a17 timeToLaunchApp:(unint64_t)a18 historicalVolumeByCountAndPercentage:(id)a19 modeConditionedHistoricalVolumeByCountAndPercentage:(id)a20 historicalResolutionByPercentage:(id)a21 modeConditionedHistoricalResolutionByPercentage:(id)a22
{
  id v32;
  id v33;
  id v34;
  ATXNotificationCategorizationFeatureCollectionSet *v35;
  uint64_t v36;
  NSString *bundleID;
  uint64_t v38;
  NSArray *relationshipsFromMegadome;
  id v43;
  id v44;
  id v45;
  objc_super v46;

  v45 = a3;
  v44 = a6;
  v32 = a19;
  v33 = a20;
  v34 = a21;
  v43 = a22;
  v46.receiver = self;
  v46.super_class = (Class)ATXNotificationCategorizationFeatureCollectionSet;
  v35 = -[ATXNotificationCategorizationFeatureCollectionSet init](&v46, sel_init);
  if (v35)
  {
    v36 = objc_msgSend(v45, "copy");
    bundleID = v35->_bundleID;
    v35->_bundleID = (NSString *)v36;

    v35->_notificationDeliveryUrgency = a4;
    v35->_contactRelationships = a5;
    v38 = objc_msgSend(v44, "copy");
    relationshipsFromMegadome = v35->_relationshipsFromMegadome;
    v35->_relationshipsFromMegadome = (NSArray *)v38;

    v35->_dayOfWeek = a7;
    v35->_timeOfDay = a8;
    v35->_locationSemantic = a9;
    v35->_appModeAffinityScore = a10;
    v35->_contactModeAffinityScore = a11;
    v35->_notificationModeAffinityScore = a12;
    v35->_appCategoryScoreInMode = a13;
    v35->_urgencyScore = a14;
    v35->_importanceScore = a15;
    v35->_bucketizedLengthOfNotificationBody = a16;
    v35->_currentUnifiedMode = a17;
    v35->_timeToLaunchApp = a18;
    objc_storeStrong((id *)&v35->_historicalVolumeByCountAndPercentage, a19);
    objc_storeStrong((id *)&v35->_modeConditionedHistoricalVolumeByCountAndPercentage, a20);
    objc_storeStrong((id *)&v35->_historicalResolutionByPercentage, a21);
    objc_storeStrong((id *)&v35->_modeConditionedHistoricalResolutionByPercentage, a22);
  }

  return v35;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  NSString *bundleID;
  id v5;

  bundleID = self->_bundleID;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", bundleID, CFSTR("bundleID"));
  objc_msgSend(v5, "encodeInteger:forKey:", self->_notificationDeliveryUrgency, CFSTR("notificationDeliveryUrgency"));
  objc_msgSend(v5, "encodeInteger:forKey:", self->_contactRelationships, CFSTR("contactRelationships"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_relationshipsFromMegadome, CFSTR("relationshipsFromMegadome"));
  objc_msgSend(v5, "encodeInteger:forKey:", self->_dayOfWeek, CFSTR("dayOfWeek"));
  objc_msgSend(v5, "encodeInt32:forKey:", self->_timeOfDay, CFSTR("timeOfDay"));
  objc_msgSend(v5, "encodeInt32:forKey:", self->_locationSemantic, CFSTR("locationSemantic"));
  objc_msgSend(v5, "encodeDouble:forKey:", CFSTR("appModeAffinityScore"), self->_appModeAffinityScore);
  objc_msgSend(v5, "encodeDouble:forKey:", CFSTR("contactModeAffinityScore"), self->_contactModeAffinityScore);
  objc_msgSend(v5, "encodeDouble:forKey:", CFSTR("notificationModeAffinityScore"), self->_notificationModeAffinityScore);
  objc_msgSend(v5, "encodeDouble:forKey:", CFSTR("appCategoryScoreInMode"), self->_appCategoryScoreInMode);
  objc_msgSend(v5, "encodeDouble:forKey:", CFSTR("urgencyScore"), self->_urgencyScore);
  objc_msgSend(v5, "encodeDouble:forKey:", CFSTR("importanceScore"), self->_importanceScore);
  objc_msgSend(v5, "encodeInteger:forKey:", self->_bucketizedLengthOfNotificationBody, CFSTR("bucketizedLengthOfNotificationBody"));
  objc_msgSend(v5, "encodeInteger:forKey:", self->_currentUnifiedMode, CFSTR("currentUnifiedMode"));
  objc_msgSend(v5, "encodeInteger:forKey:", self->_timeToLaunchApp, CFSTR("timeToLaunchApp"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_historicalVolumeByCountAndPercentage, CFSTR("historicalVolumeByCountAndPercentage"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_modeConditionedHistoricalVolumeByCountAndPercentage, CFSTR("modeConditionedHistoricalVolumeByCountAndPercentage"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_historicalResolutionByPercentage, CFSTR("historicalResolutionByPercentage"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_modeConditionedHistoricalResolutionByPercentage, CFSTR("modeConditionedHistoricalResolutionByPercentage"));

}

- (ATXNotificationCategorizationFeatureCollectionSet)initWithCoder:(id)a3
{
  id v4;
  ATXNotificationCategorizationFeatureCollectionSet *v5;
  uint64_t v6;
  NSString *bundleID;
  void *v8;
  id v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  NSArray *relationshipsFromMegadome;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  uint64_t v20;
  ATXNotificationVolumeByCountAndPercentage *historicalVolumeByCountAndPercentage;
  uint64_t v22;
  ATXNotificationVolumeByCountAndPercentage *modeConditionedHistoricalVolumeByCountAndPercentage;
  uint64_t v24;
  ATXNotificationResolutionByPercentage *historicalResolutionByPercentage;
  uint64_t v26;
  ATXNotificationResolutionByPercentage *modeConditionedHistoricalResolutionByPercentage;
  objc_super v29;

  v4 = a3;
  v29.receiver = self;
  v29.super_class = (Class)ATXNotificationCategorizationFeatureCollectionSet;
  v5 = -[ATXNotificationCategorizationFeatureCollectionSet init](&v29, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("bundleID"));
    v6 = objc_claimAutoreleasedReturnValue();
    bundleID = v5->_bundleID;
    v5->_bundleID = (NSString *)v6;

    v5->_notificationDeliveryUrgency = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("notificationDeliveryUrgency"));
    v5->_contactRelationships = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("contactRelationships"));
    v8 = (void *)MEMORY[0x1A85A4F90]();
    v9 = objc_alloc(MEMORY[0x1E0C99E60]);
    v10 = objc_opt_class();
    v11 = (void *)objc_msgSend(v9, "initWithObjects:", v10, objc_opt_class(), 0);
    objc_autoreleasePoolPop(v8);
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v11, CFSTR("relationshipsFromMegadome"));
    v12 = objc_claimAutoreleasedReturnValue();
    relationshipsFromMegadome = v5->_relationshipsFromMegadome;
    v5->_relationshipsFromMegadome = (NSArray *)v12;

    v5->_dayOfWeek = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("dayOfWeek"));
    v5->_timeOfDay = objc_msgSend(v4, "decodeInt32ForKey:", CFSTR("timeOfDay"));
    v5->_locationSemantic = objc_msgSend(v4, "decodeInt32ForKey:", CFSTR("locationSemantic"));
    objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("appModeAffinityScore"));
    v5->_appModeAffinityScore = v14;
    objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("contactModeAffinityScore"));
    v5->_contactModeAffinityScore = v15;
    objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("notificationModeAffinityScore"));
    v5->_notificationModeAffinityScore = v16;
    objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("appCategoryScoreInMode"));
    v5->_appCategoryScoreInMode = v17;
    objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("urgencyScore"));
    v5->_urgencyScore = v18;
    objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("importanceScore"));
    v5->_importanceScore = v19;
    v5->_bucketizedLengthOfNotificationBody = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("bucketizedLengthOfNotificationBody"));
    v5->_currentUnifiedMode = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("currentUnifiedMode"));
    v5->_timeToLaunchApp = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("timeToLaunchApp"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("historicalVolumeByCountAndPercentage"));
    v20 = objc_claimAutoreleasedReturnValue();
    historicalVolumeByCountAndPercentage = v5->_historicalVolumeByCountAndPercentage;
    v5->_historicalVolumeByCountAndPercentage = (ATXNotificationVolumeByCountAndPercentage *)v20;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("modeConditionedHistoricalVolumeByCountAndPercentage"));
    v22 = objc_claimAutoreleasedReturnValue();
    modeConditionedHistoricalVolumeByCountAndPercentage = v5->_modeConditionedHistoricalVolumeByCountAndPercentage;
    v5->_modeConditionedHistoricalVolumeByCountAndPercentage = (ATXNotificationVolumeByCountAndPercentage *)v22;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("historicalResolutionByPercentage"));
    v24 = objc_claimAutoreleasedReturnValue();
    historicalResolutionByPercentage = v5->_historicalResolutionByPercentage;
    v5->_historicalResolutionByPercentage = (ATXNotificationResolutionByPercentage *)v24;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("modeConditionedHistoricalResolutionByPercentage"));
    v26 = objc_claimAutoreleasedReturnValue();
    modeConditionedHistoricalResolutionByPercentage = v5->_modeConditionedHistoricalResolutionByPercentage;
    v5->_modeConditionedHistoricalResolutionByPercentage = (ATXNotificationResolutionByPercentage *)v26;

  }
  return v5;
}

- (NSString)bundleID
{
  return self->_bundleID;
}

- (int64_t)notificationDeliveryUrgency
{
  return self->_notificationDeliveryUrgency;
}

- (unint64_t)contactRelationships
{
  return self->_contactRelationships;
}

- (NSArray)relationshipsFromMegadome
{
  return self->_relationshipsFromMegadome;
}

- (unint64_t)dayOfWeek
{
  return self->_dayOfWeek;
}

- (int)timeOfDay
{
  return self->_timeOfDay;
}

- (int)locationSemantic
{
  return self->_locationSemantic;
}

- (double)appModeAffinityScore
{
  return self->_appModeAffinityScore;
}

- (double)contactModeAffinityScore
{
  return self->_contactModeAffinityScore;
}

- (double)notificationModeAffinityScore
{
  return self->_notificationModeAffinityScore;
}

- (double)appCategoryScoreInMode
{
  return self->_appCategoryScoreInMode;
}

- (double)urgencyScore
{
  return self->_urgencyScore;
}

- (double)importanceScore
{
  return self->_importanceScore;
}

- (unint64_t)bucketizedLengthOfNotificationBody
{
  return self->_bucketizedLengthOfNotificationBody;
}

- (unint64_t)currentUnifiedMode
{
  return self->_currentUnifiedMode;
}

- (unint64_t)timeToLaunchApp
{
  return self->_timeToLaunchApp;
}

- (ATXNotificationVolumeByCountAndPercentage)historicalVolumeByCountAndPercentage
{
  return self->_historicalVolumeByCountAndPercentage;
}

- (ATXNotificationVolumeByCountAndPercentage)modeConditionedHistoricalVolumeByCountAndPercentage
{
  return self->_modeConditionedHistoricalVolumeByCountAndPercentage;
}

- (ATXNotificationResolutionByPercentage)historicalResolutionByPercentage
{
  return self->_historicalResolutionByPercentage;
}

- (ATXNotificationResolutionByPercentage)modeConditionedHistoricalResolutionByPercentage
{
  return self->_modeConditionedHistoricalResolutionByPercentage;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_modeConditionedHistoricalResolutionByPercentage, 0);
  objc_storeStrong((id *)&self->_historicalResolutionByPercentage, 0);
  objc_storeStrong((id *)&self->_modeConditionedHistoricalVolumeByCountAndPercentage, 0);
  objc_storeStrong((id *)&self->_historicalVolumeByCountAndPercentage, 0);
  objc_storeStrong((id *)&self->_relationshipsFromMegadome, 0);
  objc_storeStrong((id *)&self->_bundleID, 0);
}

@end
