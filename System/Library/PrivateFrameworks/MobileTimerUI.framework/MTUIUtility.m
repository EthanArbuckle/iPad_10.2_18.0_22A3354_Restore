@implementation MTUIUtility

+ (void)openSleepInHealthApp
{
  void *v2;
  void *v3;
  int v4;
  void *v5;
  id v6;

  objc_msgSend(MEMORY[0x24BE67830], "incrementEventCount:", *MEMORY[0x24BE67898]);
  objc_msgSend(MEMORY[0x24BDD3DC0], "categoryTypeForIdentifier:", *MEMORY[0x24BDD2A28]);
  v6 = (id)objc_claimAutoreleasedReturnValue();
  _HKCreateURLForSampleType();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDF6800], "sharedApplication");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "canOpenURL:", v2);

  if (v4)
  {
    objc_msgSend(MEMORY[0x24BDF6800], "sharedApplication");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "openURL:options:completionHandler:", v2, MEMORY[0x24BDBD1B8], 0);

  }
}

@end
