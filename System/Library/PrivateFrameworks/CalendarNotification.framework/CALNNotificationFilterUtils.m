@implementation CALNNotificationFilterUtils

+ (id)filterIdentifierForNotificationRecord:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  objc_msgSend(v4, "content");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "filterIdentifierForNotificationContent:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v6)
  {
    objc_msgSend(v4, "sourceClientIdentifier");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v6;
}

+ (id)filterIdentifierForNotificationContent:(id)a3
{
  void *v3;
  void *v4;

  objc_msgSend(a3, "userInfo");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("DatabaseChangedFilterIdentifier"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

+ (void)setFilterIdentifier:(id)a3 onNotificationContent:(id)a4
{
  objc_msgSend(a4, "setUserInfoValue:forKey:", a3, CFSTR("DatabaseChangedFilterIdentifier"));
}

+ (void)setFilterIdentifierForEKCalendarNotification:(id)a3 onNotificationContent:(id)a4
{
  void *v6;
  void *v7;
  id v8;

  v8 = a4;
  objc_msgSend(a3, "objectID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "stringRepresentation");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
    objc_msgSend(a1, "setFilterIdentifier:onNotificationContent:", v7, v8);

}

@end
