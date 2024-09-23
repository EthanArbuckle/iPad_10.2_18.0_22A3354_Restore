@implementation CLKCompanionDisplayDate

void __CLKCompanionDisplayDate_block_invoke()
{
  uint64_t v0;
  void *v1;
  void *v2;
  uint64_t v3;
  void *v4;
  id v5;

  CLKDebugCompanionDisplayDateOverride();
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)CLKCompanionDisplayDate__date;
  CLKCompanionDisplayDate__date = v0;

  if (!CLKCompanionDisplayDate__date)
  {
    objc_msgSend(MEMORY[0x24BDBCE48], "calendarWithIdentifier:", *MEMORY[0x24BDBCA18]);
    v5 = (id)objc_claimAutoreleasedReturnValue();
    v2 = (void *)objc_opt_new();
    objc_msgSend(v2, "setYear:", 2016);
    objc_msgSend(v2, "setMonth:", 9);
    objc_msgSend(v2, "setDay:", 23);
    objc_msgSend(v2, "setHour:", 10);
    objc_msgSend(v2, "setMinute:", 9);
    objc_msgSend(v2, "setSecond:", 30);
    objc_msgSend(v5, "dateFromComponents:", v2);
    v3 = objc_claimAutoreleasedReturnValue();
    v4 = (void *)CLKCompanionDisplayDate__date;
    CLKCompanionDisplayDate__date = v3;

  }
}

@end
