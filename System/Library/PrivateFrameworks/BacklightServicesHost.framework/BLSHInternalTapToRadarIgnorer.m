@implementation BLSHInternalTapToRadarIgnorer

+ (id)_defaults
{
  void *v2;
  void *v3;
  id v4;
  void *v5;

  v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCF50]), "initWithSuiteName:", CFSTR("com.apple.BacklightServices"));
  v3 = v2;
  if (v2)
  {
    v4 = v2;
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDBCF50], "standardUserDefaults");
    v4 = (id)objc_claimAutoreleasedReturnValue();
  }
  v5 = v4;

  return v5;
}

+ (id)_ignoredDesignations
{
  void *v2;
  void *v3;
  void *v4;
  id v5;

  objc_msgSend(a1, "_defaults");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "arrayForKey:", CFSTR("IgnoredTapToRadarDesignations"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
    v4 = v3;
  else
    v4 = (void *)MEMORY[0x24BDBD1A8];
  v5 = v4;

  return v5;
}

+ (void)ignoreRadarDesignation:(unint64_t)a3
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  objc_msgSend(a1, "_ignoredDesignations");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCEF0], "setWithArray:", v9);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addObject:", v6);

  objc_msgSend(a1, "_defaults");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "allObjects");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setObject:forKey:", v8, CFSTR("IgnoredTapToRadarDesignations"));

}

+ (BOOL)shouldIgnoreDesignation:(unint64_t)a3
{
  void *v4;
  void *v5;
  char v6;

  objc_msgSend(a1, "_ignoredDesignations");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v4, "containsObject:", v5) & 1) != 0)
    v6 = 1;
  else
    v6 = objc_msgSend(v4, "containsObject:", &unk_24D1DD390);

  return v6;
}

+ (BOOL)hasIgnoredDesignations
{
  void *v2;
  BOOL v3;

  objc_msgSend(a1, "_ignoredDesignations");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "count") != 0;

  return v3;
}

+ (void)resetIgnoredDesignations
{
  id v2;

  objc_msgSend(a1, "_defaults");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "removeObjectForKey:", CFSTR("IgnoredTapToRadarDesignations"));

}

@end
