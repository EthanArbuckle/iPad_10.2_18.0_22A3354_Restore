@implementation HKMobilityWalkingSteadinessAnalyticsNotificationInteractionEventDataSource

- (HKMobilityWalkingSteadinessAnalyticsNotificationInteractionEventDataSource)initWithHealthStore:(id)a3 category:(id)a4 action:(id)a5
{
  id v9;
  id v10;
  id v11;
  HKMobilityWalkingSteadinessAnalyticsNotificationInteractionEventDataSource *v12;
  HKMobilityWalkingSteadinessAnalyticsNotificationInteractionEventDataSource *v13;
  objc_super v15;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v15.receiver = self;
  v15.super_class = (Class)HKMobilityWalkingSteadinessAnalyticsNotificationInteractionEventDataSource;
  v12 = -[HKMobilityWalkingSteadinessAnalyticsNotificationInteractionEventDataSource init](&v15, sel_init);
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_healthStore, a3);
    objc_storeStrong((id *)&v13->_category, a4);
    objc_storeStrong((id *)&v13->_actionIdentifier, a5);
  }

  return v13;
}

- (id)ageWithError:(id *)a3
{
  return +[HKMobilityAnalyticsUtilities ageWithHealthStore:error:](HKMobilityAnalyticsUtilities, "ageWithHealthStore:error:", self->_healthStore, a3);
}

- (id)biologicalSexWithError:(id *)a3
{
  return +[HKMobilityAnalyticsUtilities biologicalSexWithHealthStore:error:](HKMobilityAnalyticsUtilities, "biologicalSexWithHealthStore:error:", self->_healthStore, a3);
}

- (id)notificationClassificationWithError:(id *)a3
{
  void *v3;
  void *v4;
  void *v5;

  -[HKMobilityWalkingSteadinessAnalyticsNotificationInteractionEventDataSource _walkingSteadinessEventValueForCategory:](self, "_walkingSteadinessEventValueForCategory:", self->_category);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    +[HKMobilityWalkingSteadinessAnalyticsUtilities payloadStringForWalkingSteadinessNotificationClassificationWithValue:](HKMobilityWalkingSteadinessAnalyticsUtilities, "payloadStringForWalkingSteadinessNotificationClassificationWithValue:", objc_msgSend(v3, "integerValue"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (id)notificationInteractionTypeWithError:(id *)a3
{
  return +[HKMobilityWalkingSteadinessAnalyticsUtilities payloadStringForWalkingSteadinessNotificationInteractionWithActionIdentifier:](HKMobilityWalkingSteadinessAnalyticsUtilities, "payloadStringForWalkingSteadinessNotificationInteractionWithActionIdentifier:", self->_actionIdentifier);
}

- (id)notificationTypeWithError:(id *)a3
{
  void *v3;
  void *v4;
  void *v5;

  -[HKMobilityWalkingSteadinessAnalyticsNotificationInteractionEventDataSource _walkingSteadinessEventValueForCategory:](self, "_walkingSteadinessEventValueForCategory:", self->_category);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    +[HKMobilityWalkingSteadinessAnalyticsUtilities payloadStringForWalkingSteadinessNotificationTypeWithValue:](HKMobilityWalkingSteadinessAnalyticsUtilities, "payloadStringForWalkingSteadinessNotificationTypeWithValue:", objc_msgSend(v3, "integerValue"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (id)_walkingSteadinessEventValueForCategory:(id)a3
{
  id v3;
  void *v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("MobilityAppPlugin.WalkingSteadinessInitial.Low")) & 1) != 0)
  {
    v4 = &unk_1E9C39A70;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("MobilityAppPlugin.WalkingSteadinessInitial.VeryLow")) & 1) != 0)
  {
    v4 = &unk_1E9C39A88;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("MobilityAppPlugin.WalkingSteadinessRepeat.Low")) & 1) != 0)
  {
    v4 = &unk_1E9C39AA0;
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("MobilityAppPlugin.WalkingSteadinessRepeat.VeryLow")))
  {
    v4 = &unk_1E9C39AB8;
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_actionIdentifier, 0);
  objc_storeStrong((id *)&self->_category, 0);
  objc_storeStrong((id *)&self->_healthStore, 0);
}

@end
