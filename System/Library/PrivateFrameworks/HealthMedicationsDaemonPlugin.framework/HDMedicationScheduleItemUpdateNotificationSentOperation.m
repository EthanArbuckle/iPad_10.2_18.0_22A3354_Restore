@implementation HDMedicationScheduleItemUpdateNotificationSentOperation

- (HDMedicationScheduleItemUpdateNotificationSentOperation)init
{
  void *v3;
  uint64_t v4;
  void *v5;

  v3 = (void *)MEMORY[0x1E0C99DA0];
  v4 = *MEMORY[0x1E0C99778];
  NSStringFromSelector(a2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "raise:format:", v4, CFSTR("The -%@ method is not available on %@"), v5, objc_opt_class());

  return 0;
}

- (HDMedicationScheduleItemUpdateNotificationSentOperation)initWithScheduleItemIdentifier:(id)a3 notificationSent:(BOOL)a4
{
  id v7;
  HDMedicationScheduleItemUpdateNotificationSentOperation *v8;
  HDMedicationScheduleItemUpdateNotificationSentOperation *v9;
  objc_super v11;

  v7 = a3;
  v11.receiver = self;
  v11.super_class = (Class)HDMedicationScheduleItemUpdateNotificationSentOperation;
  v8 = -[HDMedicationScheduleItemUpdateNotificationSentOperation init](&v11, sel_init);
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_itemIdentifier, a3);
    v9->_notificationSent = a4;
  }

  return v9;
}

- (BOOL)performWithProfile:(id)a3 transaction:(id)a4 error:(id *)a5
{
  return +[HDMedicationScheduleItemEntity updateNotification:itemIdentifier:transaction:error:](HDMedicationScheduleItemEntity, "updateNotification:itemIdentifier:transaction:error:", self->_notificationSent, self->_itemIdentifier, a4, a5);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  NSString *itemIdentifier;
  id v5;

  itemIdentifier = self->_itemIdentifier;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", itemIdentifier, CFSTR("item_identifier"));
  objc_msgSend(v5, "encodeBool:forKey:", self->_notificationSent, CFSTR("notification_sent"));

}

- (HDMedicationScheduleItemUpdateNotificationSentOperation)initWithCoder:(id)a3
{
  id v4;
  HDMedicationScheduleItemUpdateNotificationSentOperation *v5;
  uint64_t v6;
  NSString *itemIdentifier;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)HDMedicationScheduleItemUpdateNotificationSentOperation;
  v5 = -[HDMedicationScheduleItemUpdateNotificationSentOperation init](&v9, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("item_identifier"));
    v6 = objc_claimAutoreleasedReturnValue();
    itemIdentifier = v5->_itemIdentifier;
    v5->_itemIdentifier = (NSString *)v6;

    v5->_notificationSent = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("notification_sent"));
  }

  return v5;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_itemIdentifier, 0);
}

@end
