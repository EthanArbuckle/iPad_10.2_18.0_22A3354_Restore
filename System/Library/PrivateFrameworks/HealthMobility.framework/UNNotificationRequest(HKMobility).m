@implementation UNNotificationRequest(HKMobility)

+ (id)hkmobility_requestForCategory:()HKMobility shouldHidePregnancyContent:
{
  void *v6;
  id v7;
  void *v8;
  void *v9;

  v6 = (void *)MEMORY[0x1E0C99D68];
  v7 = a3;
  objc_msgSend(v6, "now");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "_hkmobility_requestForCategory:shouldHidePregnancyContent:startDate:", v7, a4, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

+ (uint64_t)_hkmobility_requestForCategory:()HKMobility shouldHidePregnancyContent:startDate:
{
  return objc_msgSend(a1, "_hkmobility_notificationRequestWithCategory:shouldHidePregnancyContent:expirationDate:", a3, a4, 0);
}

+ (id)_hkmobility_notificationRequestWithCategory:()HKMobility shouldHidePregnancyContent:expirationDate:
{
  void *v0;
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  objc_msgSend(MEMORY[0x1E0CEC6E0], "_hkmobility_contentWithCategory:shouldHidePregnancyContent:expirationDate:");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "categoryIdentifier");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  HKMobilityNotificationIdentifierForCategory(v1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "UUIDString");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stringByAppendingString:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CEC740], "requestWithIdentifier:content:trigger:", v5, v0, 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

@end
