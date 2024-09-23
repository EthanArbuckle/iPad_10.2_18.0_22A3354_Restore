@implementation NTPBTodayPersonalizationUpdate(FCTodayExtension)

- (void)addEvent:()FCTodayExtension
{
  id v4;
  void *v5;
  void *v6;
  id v7;

  v4 = a3;
  objc_opt_class();
  if (v4)
  {
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v5 = v4;
    else
      v5 = 0;
  }
  else
  {
    v5 = 0;
  }
  v7 = v5;

  if (v7)
  {
    objc_msgSend(a1, "events");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "addObject:", v7);

  }
}

@end
