@implementation HMRestrictedGuestHomeAccessSchedule(HFAdditions)

+ (id)hf_restrictedGuestHomeAccessScheduleFromHFSchedule:()HFAdditions
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;

  if (a3)
  {
    v3 = a3;
    objc_msgSend(v3, "rules");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "allObjects");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "na_filter:", &__block_literal_global_200);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "na_map:", &__block_literal_global_2_33);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v3, "rules");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v8, "allObjects");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "na_filter:", &__block_literal_global_3_14);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "na_map:", &__block_literal_global_4_8);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    v12 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CBA7C8]), "initWithWeekDayRules:yearDayRules:", v7, v11);
  }
  else
  {
    v12 = 0;
  }
  return v12;
}

@end
