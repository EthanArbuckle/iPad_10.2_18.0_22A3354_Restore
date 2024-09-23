@implementation HKNotificationInstruction(Medications)

- (uint64_t)initWithAction:()Medications scheduleItemIdentifier:
{
  void *v6;
  id v7;
  void *v8;
  uint64_t v9;

  v6 = (void *)MEMORY[0x1E0C99D68];
  v7 = a4;
  objc_msgSend(v6, "dateWithTimeIntervalSinceNow:", 43200.0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(a1, "initWithAction:scheduleItemIdentifier:expirationDate:", a3, v7, v8);

  return v9;
}

- (uint64_t)initWithAction:()Medications scheduleItemIdentifier:expirationDate:
{
  void *v8;
  id v9;
  void *v10;
  uint64_t v11;

  v8 = (void *)MEMORY[0x1E0CB6920];
  v9 = a5;
  objc_msgSend(v8, "categoryIdentifierFromScheduleItemIdentifier:", a4);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(a1, "initWithAction:categoryIdentifier:expirationDate:", a3, v10, v9);

  return v11;
}

- (id)scheduleItemIdentifier
{
  void *v1;
  void *v2;
  void *v3;

  v1 = (void *)MEMORY[0x1E0CB6920];
  objc_msgSend(a1, "categoryIdentifier");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "scheduleItemIdentifierFromCategoryIdentifier:", v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

+ (uint64_t)instructionExpirationDateForDate:()Medications
{
  return objc_msgSend(a3, "dateByAddingTimeInterval:", 43200.0);
}

+ (uint64_t)categoryIdentifierFromScheduleItemIdentifier:()Medications
{
  return objc_msgSend(CFSTR("MSIID-"), "stringByAppendingString:");
}

+ (id)scheduleItemIdentifierFromCategoryIdentifier:()Medications
{
  id v3;
  void *v4;

  v3 = a3;
  objc_msgSend(v3, "substringFromIndex:", objc_msgSend(CFSTR("MSIID-"), "length"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

+ (id)scheduleItemIdentifiersFromCategoryIdentifiers:()Medications
{
  void *v4;
  void *v5;
  _QWORD v7[5];

  objc_msgSend(a3, "allObjects");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __89__HKNotificationInstruction_Medications__scheduleItemIdentifiersFromCategoryIdentifiers___block_invoke;
  v7[3] = &__block_descriptor_40_e18__16__0__NSString_8l;
  v7[4] = a1;
  objc_msgSend(v4, "hk_map:", v7);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

@end
