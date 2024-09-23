@implementation CalReminderMigrationReminderKitUtils

+ (id)hexColorStringByRemovingAlphaFromHexString:(id)a3
{
  id v3;
  uint64_t v4;
  void *v5;

  v3 = a3;
  if (objc_msgSend(v3, "length") == 9)
  {
    objc_msgSend(v3, "substringWithRange:", 0, 7);
    v4 = objc_claimAutoreleasedReturnValue();

    v3 = (id)v4;
  }
  objc_msgSend(v3, "uppercaseString");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

@end
