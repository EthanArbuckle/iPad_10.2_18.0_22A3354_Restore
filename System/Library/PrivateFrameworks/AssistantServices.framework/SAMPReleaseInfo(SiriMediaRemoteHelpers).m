@implementation SAMPReleaseInfo(SiriMediaRemoteHelpers)

+ (id)_af_releaseInfoWithReleaseDate:()SiriMediaRemoteHelpers
{
  objc_class *v4;
  id v5;
  id v6;
  void *v7;
  void *v8;
  id v9;

  if (a3)
  {
    v4 = (objc_class *)MEMORY[0x1E0D87FC8];
    v5 = a3;
    v6 = objc_alloc_init(v4);
    objc_msgSend(MEMORY[0x1E0C99E80], "defaultTimeZone");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "name");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setTimeZoneId:", v8);

    objc_msgSend(v6, "setDate:", v5);
    v9 = objc_alloc_init(a1);
    objc_msgSend(v9, "setReleaseDate:", v6);

  }
  else
  {
    v9 = 0;
  }
  return v9;
}

@end
