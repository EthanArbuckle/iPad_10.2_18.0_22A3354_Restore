@implementation HKMedicationsNotification

- (HKMedicationsNotification)init
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

+ (id)notificationBeforeFirstUnlockWithScheduleItemIdentifier:(id)a3 dueDate:(id)a4
{
  id v5;
  id v6;
  id *v7;

  v5 = a4;
  v6 = a3;
  v7 = -[HKMedicationsNotification initWithScheduleItemIdentifier:dueDate:category:argument:extraUserInfo:]((id *)[HKMedicationsNotification alloc], v6, v5, CFSTR("MedicationsHealthAppPlugin.BeforeFirstUnlock"), 0, 0);

  return v7;
}

- (id)initWithScheduleItemIdentifier:(void *)a3 dueDate:(void *)a4 category:(void *)a5 argument:(void *)a6 extraUserInfo:
{
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  id *v17;
  uint64_t v18;
  id v19;
  objc_super v21;

  v12 = a2;
  v13 = a3;
  v14 = a4;
  v15 = a5;
  v16 = a6;
  if (a1)
  {
    v21.receiver = a1;
    v21.super_class = (Class)HKMedicationsNotification;
    v17 = (id *)objc_msgSendSuper2(&v21, sel_init);
    a1 = v17;
    if (v17)
    {
      objc_storeStrong(v17 + 1, a4);
      objc_storeStrong(a1 + 2, a5);
      -[HKMedicationsNotification _userInfoWithScheduleItemIdentifier:extraUserInfo:](a1, v12, v16);
      v18 = objc_claimAutoreleasedReturnValue();
      v19 = a1[3];
      a1[3] = (id)v18;

      objc_storeStrong(a1 + 4, a2);
      objc_storeStrong(a1 + 5, a3);
    }
  }

  return a1;
}

+ (id)notificationMissedWithScheduleItemIdentifier:(id)a3 dueDate:(id)a4
{
  id v5;
  id v6;
  id *v7;

  v5 = a4;
  v6 = a3;
  v7 = -[HKMedicationsNotification initWithScheduleItemIdentifier:dueDate:category:argument:extraUserInfo:]((id *)[HKMedicationsNotification alloc], v6, v5, CFSTR("MedicationsHealthAppPlugin.Missed"), 0, 0);

  return v7;
}

+ (id)notificationNotMissedWithScheduleItemIdentifier:(id)a3 dueDate:(id)a4 isBatchingDoses:(BOOL)a5 isCritical:(BOOL)a6 isFollowUp:(BOOL)a7
{
  _BOOL8 v7;
  _BOOL8 v8;
  _BOOL8 v9;
  id v11;
  id v12;
  __CFString *v13;
  __CFString *v14;
  __CFString *v15;
  int v16;
  HKMedicationsNotification *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  id *v22;
  _QWORD v24[3];
  _QWORD v25[4];

  v7 = a7;
  v8 = a6;
  v9 = a5;
  v25[3] = *MEMORY[0x1E0C80C00];
  v11 = a3;
  v12 = a4;
  v13 = CFSTR("MedicationsHealthAppPlugin.NotMissed");
  if (v7)
    v13 = CFSTR("MedicationsHealthAppPlugin.NotMissedFollowUp");
  v14 = v13;
  v15 = v14;
  if (!v9)
  {
    v16 = -[__CFString isEqualToString:](v14, "isEqualToString:", CFSTR("MedicationsHealthAppPlugin.NotMissed"));

    if (v16)
      v15 = CFSTR("MedicationsHealthAppPlugin.NotMissed.Singular");
    else
      v15 = CFSTR("MedicationsHealthAppPlugin.NotMissedFollowUp.Singular");
  }
  v17 = [HKMedicationsNotification alloc];
  v24[0] = CFSTR("MedicationsNotificationIsCriticalKey");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v8);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v25[0] = v18;
  v24[1] = CFSTR("MedicationsNotificationIsFollowUpKey");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v7);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v25[1] = v19;
  v24[2] = CFSTR("MedicationsNotificationIsBatchNotificationKey");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v9);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v25[2] = v20;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v25, v24, 3);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = -[HKMedicationsNotification initWithScheduleItemIdentifier:dueDate:category:argument:extraUserInfo:]((id *)&v17->super.isa, v11, v12, v15, 0, v21);

  return v22;
}

- (id)_userInfoWithScheduleItemIdentifier:(void *)a3 extraUserInfo:
{
  id v5;
  void *v6;
  id v7;
  void *v8;

  v5 = a3;
  if (a1)
  {
    v6 = (void *)MEMORY[0x1E0C99E08];
    v7 = a2;
    objc_msgSend(v6, "dictionary");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setObject:forKeyedSubscript:", v7, CFSTR("MedicationsNotificationScheduleItemIdentifierKey"));

    if (v5)
      objc_msgSend(v8, "addEntriesFromDictionary:", v5);
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithDictionary:", v8);
    a1 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return a1;
}

+ (id)allNotificationCategories
{
  _QWORD v3[7];

  v3[6] = *MEMORY[0x1E0C80C00];
  v3[0] = CFSTR("MedicationsHealthAppPlugin.BeforeFirstUnlock");
  v3[1] = CFSTR("MedicationsHealthAppPlugin.NotMissed");
  v3[2] = CFSTR("MedicationsHealthAppPlugin.NotMissed.Singular");
  v3[3] = CFSTR("MedicationsHealthAppPlugin.NotMissedFollowUp");
  v3[4] = CFSTR("MedicationsHealthAppPlugin.NotMissedFollowUp.Singular");
  v3[5] = CFSTR("MedicationsHealthAppPlugin.Missed");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v3, 6);
  return (id)objc_claimAutoreleasedReturnValue();
}

+ (id)notificationCategoryForString:(id)a3
{
  id v3;
  const __CFString *v4;

  v3 = a3;
  v4 = CFSTR("MedicationsHealthAppPlugin.BeforeFirstUnlock");
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("MedicationsHealthAppPlugin.BeforeFirstUnlock")) & 1) == 0)
  {
    v4 = CFSTR("MedicationsHealthAppPlugin.NotMissed");
    if ((objc_msgSend(v3, "isEqualToString:", CFSTR("MedicationsHealthAppPlugin.NotMissed")) & 1) == 0)
    {
      v4 = CFSTR("MedicationsHealthAppPlugin.NotMissedFollowUp");
      if ((objc_msgSend(v3, "isEqualToString:", CFSTR("MedicationsHealthAppPlugin.NotMissedFollowUp")) & 1) == 0)
      {
        v4 = CFSTR("MedicationsHealthAppPlugin.Missed");
        if ((objc_msgSend(v3, "isEqualToString:", CFSTR("MedicationsHealthAppPlugin.Missed")) & 1) == 0)
        {
          v4 = CFSTR("MedicationsHealthAppPlugin.NotMissed.Singular");
          if ((objc_msgSend(v3, "isEqualToString:", CFSTR("MedicationsHealthAppPlugin.NotMissed.Singular")) & 1) == 0)
          {
            v4 = CFSTR("MedicationsHealthAppPlugin.NotMissedFollowUp.Singular");
            if (!objc_msgSend(v3, "isEqualToString:", CFSTR("MedicationsHealthAppPlugin.NotMissedFollowUp.Singular")))v4 = 0;
          }
        }
      }
    }
  }

  return (id)v4;
}

- (NSString)category
{
  return self->_category;
}

- (NSString)argument
{
  return self->_argument;
}

- (NSDictionary)userInfo
{
  return self->_userInfo;
}

- (NSString)scheduleItemIdentifier
{
  return self->_scheduleItemIdentifier;
}

- (NSDate)dueDate
{
  return self->_dueDate;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dueDate, 0);
  objc_storeStrong((id *)&self->_scheduleItemIdentifier, 0);
  objc_storeStrong((id *)&self->_userInfo, 0);
  objc_storeStrong((id *)&self->_argument, 0);
  objc_storeStrong((id *)&self->_category, 0);
}

@end
