@implementation NSDate(RPExtensions)

+ (id)_srGetStringFromDate:()RPExtensions
{
  objc_class *v3;
  id v4;
  id v5;
  void *v6;
  void *v7;

  v3 = (objc_class *)MEMORY[0x24BDD1500];
  v4 = a3;
  v5 = objc_alloc_init(v3);
  objc_msgSend(v5, "setLocalizedDateFormatFromTemplate:", CFSTR("MMMM d hh:mm a"));
  objc_msgSend(MEMORY[0x24BDBCF38], "timeZoneWithName:", CFSTR("..."));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setTimeZone:", v6);

  objc_msgSend(v5, "stringFromDate:", v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

@end
