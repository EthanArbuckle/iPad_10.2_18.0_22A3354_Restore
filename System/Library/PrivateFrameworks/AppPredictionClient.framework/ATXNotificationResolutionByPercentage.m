@implementation ATXNotificationResolutionByPercentage

- (ATXNotificationResolutionByPercentage)initWithBundleID:(id)a3 percentageForOneMinuteDuration:(double)a4 percentageForTwoMinutesDuration:(double)a5 percentageForFiveMinutesDuration:(double)a6 percentageForTenMinutesDuration:(double)a7 percentageForTwentyMinutesDuration:(double)a8 percentageForThirtyMinutesDuration:(double)a9 percentageForSixtyMinutesDuration:(double)a10
{
  id v18;
  ATXNotificationResolutionByPercentage *v19;
  uint64_t v20;
  NSString *bundleID;
  objc_super v23;

  v18 = a3;
  v23.receiver = self;
  v23.super_class = (Class)ATXNotificationResolutionByPercentage;
  v19 = -[ATXNotificationResolutionByPercentage init](&v23, sel_init);
  if (v19)
  {
    v20 = objc_msgSend(v18, "copy");
    bundleID = v19->_bundleID;
    v19->_bundleID = (NSString *)v20;

    v19->_percentageForOneMinuteDuration = a4;
    v19->_percentageForTwoMinutesDuration = a5;
    v19->_percentageForFiveMinutesDuration = a6;
    v19->_percentageForTenMinutesDuration = a7;
    v19->_percentageForTwentyMinutesDuration = a8;
    v19->_percentageForThirtyMinutesDuration = a9;
    v19->_percentageForSixtyMinutesDuration = a10;
  }

  return v19;
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
  objc_msgSend(v5, "encodeDouble:forKey:", CFSTR("percentageForOneMinuteDuration"), self->_percentageForOneMinuteDuration);
  objc_msgSend(v5, "encodeDouble:forKey:", CFSTR("percentageForTwoMinutesDuration"), self->_percentageForTwoMinutesDuration);
  objc_msgSend(v5, "encodeDouble:forKey:", CFSTR("percentageForFiveMinutesDuration"), self->_percentageForFiveMinutesDuration);
  objc_msgSend(v5, "encodeDouble:forKey:", CFSTR("percentageForTenMinutesDuration"), self->_percentageForTenMinutesDuration);
  objc_msgSend(v5, "encodeDouble:forKey:", CFSTR("percentageForTwentyMinutesDuration"), self->_percentageForTwentyMinutesDuration);
  objc_msgSend(v5, "encodeDouble:forKey:", CFSTR("percentageForThirtyMinutesDuration"), self->_percentageForThirtyMinutesDuration);
  objc_msgSend(v5, "encodeDouble:forKey:", CFSTR("percentageForSixtyMinutesDuration"), self->_percentageForSixtyMinutesDuration);

}

- (ATXNotificationResolutionByPercentage)initWithCoder:(id)a3
{
  id v4;
  ATXNotificationResolutionByPercentage *v5;
  uint64_t v6;
  NSString *bundleID;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  objc_super v16;

  v4 = a3;
  v16.receiver = self;
  v16.super_class = (Class)ATXNotificationResolutionByPercentage;
  v5 = -[ATXNotificationResolutionByPercentage init](&v16, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("bundleID"));
    v6 = objc_claimAutoreleasedReturnValue();
    bundleID = v5->_bundleID;
    v5->_bundleID = (NSString *)v6;

    objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("percentageForOneMinuteDuration"));
    v5->_percentageForOneMinuteDuration = v8;
    objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("percentageForTwoMinutesDuration"));
    v5->_percentageForTwoMinutesDuration = v9;
    objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("percentageForFiveMinutesDuration"));
    v5->_percentageForFiveMinutesDuration = v10;
    objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("percentageForTenMinutesDuration"));
    v5->_percentageForTenMinutesDuration = v11;
    objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("percentageForTwentyMinutesDuration"));
    v5->_percentageForTwentyMinutesDuration = v12;
    objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("percentageForThirtyMinutesDuration"));
    v5->_percentageForThirtyMinutesDuration = v13;
    objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("percentageForSixtyMinutesDuration"));
    v5->_percentageForSixtyMinutesDuration = v14;
  }

  return v5;
}

- (NSString)bundleID
{
  return self->_bundleID;
}

- (double)percentageForOneMinuteDuration
{
  return self->_percentageForOneMinuteDuration;
}

- (double)percentageForTwoMinutesDuration
{
  return self->_percentageForTwoMinutesDuration;
}

- (double)percentageForFiveMinutesDuration
{
  return self->_percentageForFiveMinutesDuration;
}

- (double)percentageForTenMinutesDuration
{
  return self->_percentageForTenMinutesDuration;
}

- (double)percentageForTwentyMinutesDuration
{
  return self->_percentageForTwentyMinutesDuration;
}

- (double)percentageForThirtyMinutesDuration
{
  return self->_percentageForThirtyMinutesDuration;
}

- (double)percentageForSixtyMinutesDuration
{
  return self->_percentageForSixtyMinutesDuration;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_bundleID, 0);
}

@end
