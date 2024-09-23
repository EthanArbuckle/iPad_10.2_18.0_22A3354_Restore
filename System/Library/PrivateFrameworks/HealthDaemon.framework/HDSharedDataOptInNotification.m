@implementation HDSharedDataOptInNotification

- (HDSharedDataOptInNotification)initWithNotificationManager:(id)a3 guardianDisplayName:(id)a4
{
  id v6;
  HDSharedDataOptInNotification *v7;
  uint64_t v8;
  NSString *guardianDisplayName;
  objc_super v11;

  v6 = a4;
  v11.receiver = self;
  v11.super_class = (Class)HDSharedDataOptInNotification;
  v7 = -[HDNanoHealthNotification initWithNotificationManager:](&v11, sel_initWithNotificationManager_, a3);
  if (v7)
  {
    v8 = objc_msgSend(v6, "copy");
    guardianDisplayName = v7->_guardianDisplayName;
    v7->_guardianDisplayName = (NSString *)v8;

  }
  return v7;
}

+ (id)category
{
  return CFSTR("HDSharedDataOptInNotificationCategory");
}

- (unint64_t)destinations
{
  return 19;
}

- (id)title
{
  void *v2;
  void *v3;

  HKHealthKitFrameworkBundle();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "localizedStringForKey:value:table:", CFSTR("START_SHARING_DATA_NOTIFICATION_TITLE"), &stru_1E6D11BB8, CFSTR("Localizable-tinker"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)body
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = (void *)MEMORY[0x1E0CB3940];
  HKHealthKitFrameworkBundle();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "localizedStringForKey:value:table:", CFSTR("START_SHARING_DATA_NOTIFICATION_BODY_%@"), &stru_1E6D11BB8, CFSTR("Localizable-tinker"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "localizedStringWithFormat:", v5, self->_guardianDisplayName);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_guardianDisplayName, 0);
}

@end
