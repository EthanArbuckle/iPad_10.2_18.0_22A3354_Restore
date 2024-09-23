@implementation SHRotatingInstallationID

+ (id)cachedInstallationIDForUTCDay
{
  return (id)objc_msgSend(a1, "cachedInstallationForDays:", 0);
}

+ (id)cachedInstallationForDays:(int64_t)a3
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  double v11;
  void *v12;

  v5 = objc_alloc_init(MEMORY[0x24BDBCE68]);
  objc_msgSend(v5, "setDay:", -a3);
  objc_msgSend(MEMORY[0x24BDBCE48], "currentCalendar");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCF38], "timeZoneWithName:", CFSTR("UTC"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setTimeZone:", v7);

  objc_msgSend(MEMORY[0x24BDBCE60], "date");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "dateByAddingComponents:toDate:options:", v5, v8, 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "startOfDayForDate:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "timeIntervalSinceNow");
  objc_msgSend(a1, "cachedInstallationIDWithMaxAge:", (double)(uint64_t)fabs(v11));
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

+ (id)cachedInstallationIDWithMaxAge:(double)a3
{
  void *v5;
  void *v6;
  double v7;
  double v8;
  BOOL v9;
  void *v10;
  id v11;
  NSObject *v12;
  void *v13;
  NSObject *v14;
  int v17;
  id v18;
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(a1, "installationID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "creationDate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "timeIntervalSinceNow");
  if (v5 && v6 && ((v8 = fabs(v7), v7 < 0.0) ? (v9 = v8 > a3) : (v9 = 1), !v9))
  {
    sh_log_object();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
    {
      v17 = 138412290;
      v18 = v5;
      _os_log_impl(&dword_218BF1000, v14, OS_LOG_TYPE_DEBUG, "Using cached installation ID: %@", (uint8_t *)&v17, 0xCu);
    }

    v11 = v5;
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD1880], "UUID");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "UUIDString");
    v11 = (id)objc_claimAutoreleasedReturnValue();

    sh_log_object();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
    {
      v17 = 138412290;
      v18 = v11;
      _os_log_impl(&dword_218BF1000, v12, OS_LOG_TYPE_DEBUG, "Using new installation ID: %@", (uint8_t *)&v17, 0xCu);
    }

    objc_msgSend(a1, "setInstallationID:", v11);
    objc_msgSend(MEMORY[0x24BDBCE60], "date");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "setCreationDate:", v13);

  }
  return v11;
}

+ (void)setInstallationID:(id)a3
{
  void *v3;
  id v4;
  id v5;

  v3 = (void *)MEMORY[0x24BDBCF50];
  v4 = a3;
  objc_msgSend(v3, "standardUserDefaults");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKey:", v4, CFSTR("com.apple.shazamd.installation-id"));

}

+ (id)installationID
{
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x24BDBCF50], "standardUserDefaults");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKey:", CFSTR("com.apple.shazamd.installation-id"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

+ (void)setCreationDate:(id)a3
{
  void *v3;
  id v4;
  id v5;

  v3 = (void *)MEMORY[0x24BDBCF50];
  v4 = a3;
  objc_msgSend(v3, "standardUserDefaults");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKey:", v4, CFSTR("com.apple.shazamd.installation-id-creation-date"));

}

+ (id)creationDate
{
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x24BDBCF50], "standardUserDefaults");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKey:", CFSTR("com.apple.shazamd.installation-id-creation-date"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

@end
