@implementation NSBundle(MKAdditions)

+ (id)_mapkitBundle
{
  if (qword_1ECE2DAC0 != -1)
    dispatch_once(&qword_1ECE2DAC0, &__block_literal_global_140);
  return (id)qword_1ECE2DAB8;
}

- (id)_mapkit_localizedStringForKey:()MKAdditions value:table:
{
  void *v8;
  id v9;
  id v10;
  id v11;
  void *v12;

  v8 = (void *)MEMORY[0x1E0CB34D0];
  v9 = a5;
  v10 = a4;
  v11 = a3;
  if (objc_msgSend(v8, "_navigation_isRunningInSiri"))
    objc_msgSend(a1, "siriUILocalizedStringForKey:value:table:", v11, v10, v9);
  else
    objc_msgSend(a1, "localizedStringForKey:value:table:", v11, v10, v9);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

+ (uint64_t)_mapkit_shouldShowAppleLogo
{
  void *v0;
  void *v1;
  void *v2;
  uint64_t v3;

  objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "bundleIdentifier");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "lowercaseString");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  if ((objc_msgSend(v2, "isEqualToString:", CFSTR("com.apple.mapkit.private.remoteui")) & 1) != 0
    || !objc_msgSend(v2, "hasPrefix:", CFSTR("com.apple.")))
  {
    v3 = 1;
  }
  else
  {
    v3 = objc_msgSend(v2, "hasPrefix:", CFSTR("com.apple.mapkittest"));
  }

  return v3;
}

@end
