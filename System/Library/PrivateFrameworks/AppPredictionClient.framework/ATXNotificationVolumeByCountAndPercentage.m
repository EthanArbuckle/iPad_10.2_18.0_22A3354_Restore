@implementation ATXNotificationVolumeByCountAndPercentage

- (ATXNotificationVolumeByCountAndPercentage)initWithBundleID:(id)a3 dailyNumberOfNotificationsReceivedForBundleID:(unint64_t)a4 weeklyNumberOfNotificationsReceivedForBundleID:(unint64_t)a5 dailyPercentageOfNotificationsReceivedForBundleID:(double)a6 weeklyPercentageOfNotificationsReceivedForBundleID:(double)a7
{
  id v12;
  ATXNotificationVolumeByCountAndPercentage *v13;
  uint64_t v14;
  NSString *bundleID;
  objc_super v17;

  v12 = a3;
  v17.receiver = self;
  v17.super_class = (Class)ATXNotificationVolumeByCountAndPercentage;
  v13 = -[ATXNotificationVolumeByCountAndPercentage init](&v17, sel_init);
  if (v13)
  {
    v14 = objc_msgSend(v12, "copy");
    bundleID = v13->_bundleID;
    v13->_bundleID = (NSString *)v14;

    v13->_dailyNumberOfNotificationsReceivedForBundleID = a4;
    v13->_weeklyNumberOfNotificationsReceivedForBundleID = a5;
    v13->_dailyPercentageOfNotificationsReceivedForBundleID = a6;
    v13->_weeklyPercentageOfNotificationsReceivedForBundleID = a7;
  }

  return v13;
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
  objc_msgSend(v5, "encodeInteger:forKey:", self->_dailyNumberOfNotificationsReceivedForBundleID, CFSTR("dailyNumberOfNotificationsReceivedForBundleID"));
  objc_msgSend(v5, "encodeInteger:forKey:", self->_weeklyNumberOfNotificationsReceivedForBundleID, CFSTR("weeklyNumberOfNotificationsReceivedForBundleID"));
  objc_msgSend(v5, "encodeDouble:forKey:", CFSTR("dailyPercentageOfNotificationsReceivedForBundleID"), self->_dailyPercentageOfNotificationsReceivedForBundleID);
  objc_msgSend(v5, "encodeDouble:forKey:", CFSTR("weeklyPercentageOfNotificationsReceivedForBundleID"), self->_weeklyPercentageOfNotificationsReceivedForBundleID);

}

- (ATXNotificationVolumeByCountAndPercentage)initWithCoder:(id)a3
{
  id v4;
  ATXNotificationVolumeByCountAndPercentage *v5;
  uint64_t v6;
  NSString *bundleID;
  double v8;
  double v9;
  objc_super v11;

  v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)ATXNotificationVolumeByCountAndPercentage;
  v5 = -[ATXNotificationVolumeByCountAndPercentage init](&v11, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("bundleID"));
    v6 = objc_claimAutoreleasedReturnValue();
    bundleID = v5->_bundleID;
    v5->_bundleID = (NSString *)v6;

    v5->_dailyNumberOfNotificationsReceivedForBundleID = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("dailyNumberOfNotificationsReceivedForBundleID"));
    v5->_weeklyNumberOfNotificationsReceivedForBundleID = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("weeklyNumberOfNotificationsReceivedForBundleID"));
    objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("dailyPercentageOfNotificationsReceivedForBundleID"));
    v5->_dailyPercentageOfNotificationsReceivedForBundleID = v8;
    objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("weeklyPercentageOfNotificationsReceivedForBundleID"));
    v5->_weeklyPercentageOfNotificationsReceivedForBundleID = v9;
  }

  return v5;
}

- (NSString)bundleID
{
  return self->_bundleID;
}

- (unint64_t)dailyNumberOfNotificationsReceivedForBundleID
{
  return self->_dailyNumberOfNotificationsReceivedForBundleID;
}

- (unint64_t)weeklyNumberOfNotificationsReceivedForBundleID
{
  return self->_weeklyNumberOfNotificationsReceivedForBundleID;
}

- (double)dailyPercentageOfNotificationsReceivedForBundleID
{
  return self->_dailyPercentageOfNotificationsReceivedForBundleID;
}

- (double)weeklyPercentageOfNotificationsReceivedForBundleID
{
  return self->_weeklyPercentageOfNotificationsReceivedForBundleID;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_bundleID, 0);
}

@end
