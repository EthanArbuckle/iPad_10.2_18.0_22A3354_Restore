@implementation HKMHNotification

- (HKMHNotification)init
{
  void *v3;
  uint64_t v4;
  void *v5;

  v3 = (void *)MEMORY[0x24BDBCE88];
  v4 = *MEMORY[0x24BDBCAB8];
  NSStringFromSelector(a2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "raise:format:", v4, CFSTR("The -%@ method is not available on %@"), v5, objc_opt_class());

  return 0;
}

- (HKMHNotification)initWithCategory:(id)a3
{
  id v5;
  HKMHNotification *v6;
  HKMHNotification *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)HKMHNotification;
  v6 = -[HKMHNotification init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_category, a3);

  return v7;
}

+ (id)allNotificationCategories
{
  void *v3;
  void *v4;
  void *v5;

  objc_msgSend(a1, "stateOfMindNotificationCategories");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "assessmentsNotificationCategories");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "arrayByAddingObjectsFromArray:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

+ (id)stateOfMindNotificationCategories
{
  _QWORD v3[4];

  v3[3] = *MEMORY[0x24BDAC8D0];
  v3[0] = CFSTR("MentalHealthAppPlugin.CustomReminder");
  v3[1] = CFSTR("MentalHealthAppPlugin.MiddayReminder");
  v3[2] = CFSTR("MentalHealthAppPlugin.EndOfDayReminder");
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v3, 3);
  return (id)objc_claimAutoreleasedReturnValue();
}

+ (id)assessmentsNotificationCategories
{
  _QWORD v3[2];

  v3[1] = *MEMORY[0x24BDAC8D0];
  v3[0] = CFSTR("MentalHealthAppPlugin.PeriodicPromptedAssessmentReminder");
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v3, 1);
  return (id)objc_claimAutoreleasedReturnValue();
}

+ (id)notificationCategoryForString:(id)a3
{
  id v3;
  void *v4;
  id v5;
  void *v6;
  _QWORD v8[4];
  id v9;

  v3 = a3;
  +[HKMHNotification allNotificationCategories](HKMHNotification, "allNotificationCategories");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __50__HKMHNotification_notificationCategoryForString___block_invoke;
  v8[3] = &unk_25119D7A8;
  v9 = v3;
  v5 = v3;
  objc_msgSend(v4, "hk_firstObjectPassingTest:", v8);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

uint64_t __50__HKMHNotification_notificationCategoryForString___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "isEqualToString:", a2);
}

- (NSString)category
{
  return self->_category;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_category, 0);
}

@end
