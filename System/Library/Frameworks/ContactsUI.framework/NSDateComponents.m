@implementation NSDateComponents

void __55__NSDateComponents_ABSimplePropertyCell__displayString__block_invoke()
{
  id v0;
  void *v1;
  void *v2;
  id v3;
  void *v4;
  id v5;

  v0 = objc_alloc_init(MEMORY[0x1E0CB3578]);
  v1 = (void *)fullFormatter_41652;
  fullFormatter_41652 = (uint64_t)v0;

  objc_msgSend((id)fullFormatter_41652, "setTimeStyle:", 0);
  objc_msgSend((id)fullFormatter_41652, "setDateStyle:", 3);
  objc_msgSend(MEMORY[0x1E0C99E80], "timeZoneForSecondsFromGMT:", 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)fullFormatter_41652, "setTimeZone:", v2);

  v3 = objc_alloc_init(MEMORY[0x1E0CB3578]);
  v4 = (void *)yearlessFormatter_41651;
  yearlessFormatter_41651 = (uint64_t)v3;

  objc_msgSend((id)yearlessFormatter_41651, "setTimeStyle:", 0);
  objc_msgSend((id)yearlessFormatter_41651, "setDateStyle:", 3);
  objc_msgSend(MEMORY[0x1E0C99E80], "timeZoneForSecondsFromGMT:", 0);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)yearlessFormatter_41651, "setTimeZone:", v5);

}

@end
