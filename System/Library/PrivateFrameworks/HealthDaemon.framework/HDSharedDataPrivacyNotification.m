@implementation HDSharedDataPrivacyNotification

- (HDSharedDataPrivacyNotification)initWithNotificationManager:(id)a3 guardianFirstName:(id)a4 lastName:(id)a5
{
  id v9;
  id v10;
  HDSharedDataPrivacyNotification *v11;
  HDSharedDataPrivacyNotification *v12;
  objc_super v14;

  v9 = a4;
  v10 = a5;
  v14.receiver = self;
  v14.super_class = (Class)HDSharedDataPrivacyNotification;
  v11 = -[HDNanoHealthNotification initWithNotificationManager:](&v14, sel_initWithNotificationManager_, a3);
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_firstName, a4);
    objc_storeStrong((id *)&v12->_lastName, a5);
  }

  return v12;
}

+ (id)category
{
  return CFSTR("HDSharedDataPrivacyNotificationCategory");
}

- (id)title
{
  void *v2;
  void *v3;

  HKHealthKitFrameworkBundle();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "localizedStringForKey:value:table:", CFSTR("SHARED_HEALTH_DATA_NOTIFICATION_TITLE"), &stru_1E6D11BB8, CFSTR("Localizable-tinker"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)body
{
  NSString *firstName;
  objc_class *v3;
  NSString *v4;
  NSString *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;

  firstName = self->_firstName;
  v3 = (objc_class *)MEMORY[0x1E0CB3850];
  v4 = self->_lastName;
  v5 = firstName;
  v6 = objc_alloc_init(v3);
  objc_msgSend(v6, "setGivenName:", v5);

  objc_msgSend(v6, "setFamilyName:", v4);
  objc_msgSend(MEMORY[0x1E0CB3858], "localizedStringFromPersonNameComponents:style:options:", v6, 2, 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = (void *)MEMORY[0x1E0CB3940];
  HKHealthKitFrameworkBundle();
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "localizedStringForKey:value:table:", CFSTR("SHARED_HEALTH_DATA_NOTIFICATION_BODY_%@"), &stru_1E6D11BB8, CFSTR("Localizable-tinker"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "localizedStringWithFormat:", v10, v7);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lastName, 0);
  objc_storeStrong((id *)&self->_firstName, 0);
}

@end
