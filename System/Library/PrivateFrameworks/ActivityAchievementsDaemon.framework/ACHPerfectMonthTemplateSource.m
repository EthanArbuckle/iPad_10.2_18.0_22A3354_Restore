@implementation ACHPerfectMonthTemplateSource

- (ACHPerfectMonthTemplateSource)init
{
  ACHPerfectMonthTemplateSource *v2;
  uint64_t v3;
  NSCalendar *utcGregorianCalendar;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)ACHPerfectMonthTemplateSource;
  v2 = -[ACHPerfectMonthTemplateSource init](&v6, sel_init);
  if (v2)
  {
    objc_msgSend(MEMORY[0x24BDBCE48], "hk_gregorianCalendarWithUTCTimeZone");
    v3 = objc_claimAutoreleasedReturnValue();
    utcGregorianCalendar = v2->_utcGregorianCalendar;
    v2->_utcGregorianCalendar = (NSCalendar *)v3;

  }
  return v2;
}

- (NSString)identifier
{
  return (NSString *)(id)*MEMORY[0x24BE01640];
}

- (int64_t)runCadence
{
  return 1;
}

- (BOOL)sourceShouldRunForDate:(id)a3
{
  return 1;
}

- (void)templatesForDate:(id)a3 completion:(id)a4
{
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  id v11;
  void *v12;
  _QWORD *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  id v21;
  id v22;

  v22 = a3;
  v21 = a4;
  -[ACHPerfectMonthTemplateSource utcGregorianCalendar](self, "utcGregorianCalendar");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  ACHDateComponentsForYearMonthDay();
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "dateFromComponents:");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCE60], "date");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "component:fromDate:", 4, v8);

  ACHDateComponentsForYearMonthDay();
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "dateFromComponents:");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_alloc_init(MEMORY[0x24BDBCEF0]);
  v11 = v7;
  v12 = v11;
  if (objc_msgSend(v11, "compare:", v9) != 1)
  {
    v13 = (_QWORD *)MEMORY[0x24BE01870];
    v14 = v11;
    do
    {
      v15 = (void *)MEMORY[0x2199C8FE0]();
      objc_msgSend(v6, "components:fromDate:", *v13, v14);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      PerfectMonthTemplateForDateComponents();
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "addObject:", v17);
      objc_msgSend(v6, "dateByAddingUnit:value:toDate:options:", 8, 1, v14, 0);
      v12 = (void *)objc_claimAutoreleasedReturnValue();

      objc_autoreleasePoolPop(v15);
      v14 = v12;
    }
    while (objc_msgSend(v12, "compare:", v9) != 1);
  }
  if (v21)
  {
    v18 = (void *)objc_msgSend(v10, "copy");
    (*((void (**)(id, void *, _QWORD, _QWORD))v21 + 2))(v21, v18, 0, 0);

  }
}

- (id)localizationBundleURLForTemplate:(id)a3
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  -[ACHPerfectMonthTemplateSource _monthlyAchievementsAssetsDirectoryBasePath](self, "_monthlyAchievementsAssetsDirectoryBasePath", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringByAppendingPathComponent:", CFSTR("localization"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stringByAppendingPathComponent:", CFSTR("perfect"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BDBCF48], "fileURLWithPath:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)resourceBundleURLForTemplate:(id)a3
{
  void *v3;
  void *v4;
  void *v5;

  -[ACHPerfectMonthTemplateSource _modelsDirectoryBasePathForTemplate:](self, "_modelsDirectoryBasePathForTemplate:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringByAppendingPathComponent:", CFSTR("badgemodel"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BDBCF48], "fileURLWithPath:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)propertyListBundleURLForTemplate:(id)a3
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  -[ACHPerfectMonthTemplateSource _modelsDirectoryBasePathForTemplate:](self, "_modelsDirectoryBasePathForTemplate:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringByAppendingPathComponent:", CFSTR("badgeproperties"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stringByAppendingPathComponent:", CFSTR("perfect"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BDBCF48], "fileURLWithPath:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)_monthlyAchievementsAssetsDirectoryBasePath
{
  if (_monthlyAchievementsAssetsDirectoryBasePath_onceToken != -1)
    dispatch_once(&_monthlyAchievementsAssetsDirectoryBasePath_onceToken, &__block_literal_global_9);
  return (id)_monthlyAchievementsAssetsDirectoryBasePath_monthlyAchievementsAssetsDirectoryBasePath;
}

void __76__ACHPerfectMonthTemplateSource__monthlyAchievementsAssetsDirectoryBasePath__block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend((id)*MEMORY[0x24BE015D8], "stringByAppendingPathComponent:", CFSTR("MonthlyAchievements"));
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)_monthlyAchievementsAssetsDirectoryBasePath_monthlyAchievementsAssetsDirectoryBasePath;
  _monthlyAchievementsAssetsDirectoryBasePath_monthlyAchievementsAssetsDirectoryBasePath = v0;

}

- (id)_modelsDirectoryBasePathForTemplate:(id)a3
{
  if (_modelsDirectoryBasePathForTemplate__onceToken != -1)
    dispatch_once(&_modelsDirectoryBasePathForTemplate__onceToken, &__block_literal_global_197);
  return (id)_modelsDirectoryBasePathForTemplate__modelsDirecotryBasePath;
}

void __69__ACHPerfectMonthTemplateSource__modelsDirectoryBasePathForTemplate___block_invoke()
{
  uint64_t v0;
  void *v1;
  id v2;

  objc_msgSend((id)*MEMORY[0x24BE015D8], "stringByAppendingPathComponent:", CFSTR("MonthlyAchievements"));
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stringByAppendingPathComponent:", CFSTR("models"));
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)_modelsDirectoryBasePathForTemplate__modelsDirecotryBasePath;
  _modelsDirectoryBasePathForTemplate__modelsDirecotryBasePath = v0;

}

- (id)stickerBundleURLForTemplate:(id)a3
{
  return 0;
}

- (NSCalendar)utcGregorianCalendar
{
  return self->_utcGregorianCalendar;
}

- (void)setUtcGregorianCalendar:(id)a3
{
  objc_storeStrong((id *)&self->_utcGregorianCalendar, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_utcGregorianCalendar, 0);
}

@end
