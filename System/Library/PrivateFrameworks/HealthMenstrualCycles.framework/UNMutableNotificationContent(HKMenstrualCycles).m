@implementation UNMutableNotificationContent(HKMenstrualCycles)

+ (id)_hkmc_contentWithCategory:()HKMenstrualCycles body:title:expirationDate:fertileWindowEndDayIndex:daysShiftedFromCalendarMethod:
{
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  id v17;
  void *v18;

  v12 = a5;
  v13 = a6;
  v14 = a4;
  v15 = a3;
  v16 = objc_alloc_init(a1);
  objc_msgSend(v16, "setBody:", v14);

  objc_msgSend(v16, "setCategoryIdentifier:", v15);
  objc_msgSend(v16, "setExpirationDate:", v13);

  objc_msgSend(v16, "setThreadIdentifier:", CFSTR("com.apple.health.MenstrualCycles"));
  v17 = objc_alloc_init(MEMORY[0x24BDBCED8]);
  objc_msgSend(v17, "setObject:forKeyedSubscript:", &unk_24D9AA438, *MEMORY[0x24BDD46A8]);
  if (a7)
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", a7);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "setObject:forKeyedSubscript:", v18, HKMCNotificationAssociatedDayIndexKey);

  }
  objc_msgSend(v16, "setUserInfo:", v17);
  if (v12)
    objc_msgSend(v16, "setTitle:", v12);

  return v16;
}

@end
