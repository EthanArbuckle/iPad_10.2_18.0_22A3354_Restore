@implementation SGTimeZone

+ (id)sharedDetector
{
  if (sharedDetector_onceToken != -1)
    dispatch_once(&sharedDetector_onceToken, &__block_literal_global_5046);
  return (id)sharedDetector__sharedDetector;
}

+ (id)timeZoneForAddress:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;

  v4 = a3;
  if (v4)
  {
    v5 = (void *)MEMORY[0x1A8583A40]();
    objc_msgSend(a1, "sharedDetector");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "timeZoneFromAiportCodeForAddress:", v4);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (v7)
    {
      v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E80]), "initWithName:", v7);
    }
    else
    {
      objc_msgSend(a1, "sharedDetector");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "countryCodeForAddress:", v4);
      v7 = (void *)objc_claimAutoreleasedReturnValue();

      if (v7
        && (objc_msgSend(a1, "sharedDetector"),
            v10 = (void *)objc_claimAutoreleasedReturnValue(),
            objc_msgSend(v10, "timeZoneNameForAddress:withCountryCode:", v4, v7),
            v11 = (void *)objc_claimAutoreleasedReturnValue(),
            v10,
            v11))
      {
        v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E80]), "initWithName:", v11);

      }
      else
      {
        v8 = 0;
      }
      objc_msgSend(a1, "sharedDetector");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "cleanupCache");

    }
    objc_autoreleasePoolPop(v5);
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

+ (id)countryCodeForAddress:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v4 = a3;
  v5 = (void *)MEMORY[0x1A8583A40]();
  objc_msgSend(a1, "sharedDetector");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "countryCodeForAddress:", v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(a1, "sharedDetector");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "cleanupCache");

  objc_autoreleasePoolPop(v5);
  return v7;
}

+ (id)timeZoneNameForAddress:(id)a3 withCountryCode:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;

  v6 = a3;
  v7 = a4;
  v8 = (void *)MEMORY[0x1A8583A40]();
  objc_msgSend(a1, "sharedDetector");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "timeZoneNameForAddress:withCountryCode:", v6, v7);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(a1, "sharedDetector");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "cleanupCache");

  objc_autoreleasePoolPop(v8);
  return v10;
}

void __28__SGTimeZone_sharedDetector__block_invoke()
{
  uint64_t v0;
  void *v1;

  v0 = objc_opt_new();
  v1 = (void *)sharedDetector__sharedDetector;
  sharedDetector__sharedDetector = v0;

}

@end
