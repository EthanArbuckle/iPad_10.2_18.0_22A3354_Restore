@implementation ATXEnrollmentManager

+ (id)getUserIdForScheme:(id)a3 enrollmentPeriod:(double)a4 enrollmentRate:(double)a5
{
  objc_class *v7;
  id v8;
  id v9;
  void *v10;

  v7 = (objc_class *)MEMORY[0x1E0C99D68];
  v8 = a3;
  v9 = objc_alloc_init(v7);
  +[ATXEnrollmentManager getUserIdForScheme:enrollmentPeriod:enrollmentRate:currentDate:defaultsDomain:](ATXEnrollmentManager, "getUserIdForScheme:enrollmentPeriod:enrollmentRate:currentDate:defaultsDomain:", v8, v9, *MEMORY[0x1E0CF9510], a4, a5);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

+ (id)getUserIdForScheme:(id)a3 enrollmentPeriod:(double)a4 enrollmentRate:(double)a5 currentDate:(id)a6 defaultsDomain:(id)a7
{
  id v12;
  id v13;
  id v14;
  void *v15;
  id v16;
  void *v17;
  double v18;
  void *v19;
  void *v20;
  void *v21;
  id v22;

  v12 = a3;
  v13 = a6;
  v14 = a7;
  v15 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99EA0]), "initWithSuiteName:", v14);
  v16 = a1;
  objc_sync_enter(v16);
  +[ATXEnrollmentManager readLastEnrollmentDateFromDefaults:scheme:](ATXEnrollmentManager, "readLastEnrollmentDateFromDefaults:scheme:", v15, v12);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  if (v17 && (objc_msgSend(v13, "timeIntervalSinceDate:", v17), v18 < a4))
  {
    +[ATXEnrollmentManager readCurrentEnrollmentUserIdFromDefaults:scheme:](ATXEnrollmentManager, "readCurrentEnrollmentUserIdFromDefaults:scheme:", v15, v12);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    if (+[_ATXAggregateLogger yesWithProbability:](_ATXAggregateLogger, "yesWithProbability:", a5))
    {
      objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "UUIDString");
      v19 = (void *)objc_claimAutoreleasedReturnValue();

      +[ATXEnrollmentManager setCurrentEnrollmentUserId:forUserDefaults:scheme:](ATXEnrollmentManager, "setCurrentEnrollmentUserId:forUserDefaults:scheme:", v19, v15, v12);
    }
    else
    {
      +[ATXEnrollmentManager setCurrentEnrollmentUserId:forUserDefaults:scheme:](ATXEnrollmentManager, "setCurrentEnrollmentUserId:forUserDefaults:scheme:", &stru_1E82FDC98, v15, v12);
      v19 = 0;
    }
    +[ATXEnrollmentManager setLastEnrollmentToDate:forUserDefaults:scheme:](ATXEnrollmentManager, "setLastEnrollmentToDate:forUserDefaults:scheme:", v13, v15, v12);
  }

  objc_sync_exit(v16);
  if (objc_msgSend(v19, "length"))
    v21 = v19;
  else
    v21 = 0;
  v22 = v21;

  return v22;
}

+ (void)setCurrentEnrollmentUserId:(id)a3 forUserDefaults:(id)a4 scheme:(id)a5
{
  void *v7;
  id v8;
  id v9;
  id v10;

  v7 = (void *)MEMORY[0x1E0CB3940];
  v8 = a4;
  v9 = a3;
  objc_msgSend(v7, "stringWithFormat:", CFSTR("%@::%@"), a5, CFSTR("currentEnrollmentUserId"));
  v10 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setObject:forKey:", v9, v10);

}

+ (id)readCurrentEnrollmentUserIdFromDefaults:(id)a3 scheme:(id)a4
{
  void *v5;
  id v6;
  void *v7;
  void *v8;

  v5 = (void *)MEMORY[0x1E0CB3940];
  v6 = a3;
  objc_msgSend(v5, "stringWithFormat:", CFSTR("%@::%@"), a4, CFSTR("currentEnrollmentUserId"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "stringForKey:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

+ (void)setLastEnrollmentToDate:(id)a3 forUserDefaults:(id)a4 scheme:(id)a5
{
  void *v7;
  id v8;
  id v9;
  double v10;
  double v11;
  id v12;

  v7 = (void *)MEMORY[0x1E0CB3940];
  v8 = a4;
  v9 = a3;
  objc_msgSend(v7, "stringWithFormat:", CFSTR("%@::%@"), a5, CFSTR("lastEnrolled"));
  v12 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "timeIntervalSince1970");
  v11 = v10;

  objc_msgSend(v8, "setDouble:forKey:", v12, v11);
}

+ (id)readLastEnrollmentDateFromDefaults:(id)a3 scheme:(id)a4
{
  void *v5;
  id v6;
  void *v7;
  double v8;
  double v9;
  void *v10;

  v5 = (void *)MEMORY[0x1E0CB3940];
  v6 = a3;
  objc_msgSend(v5, "stringWithFormat:", CFSTR("%@::%@"), a4, CFSTR("lastEnrolled"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "doubleForKey:", v7);
  v9 = v8;

  if (v9 == 0.0)
    v10 = 0;
  else
    v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D68]), "initWithTimeIntervalSince1970:", v9);

  return v10;
}

@end
