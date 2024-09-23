@implementation ICPasswordReaskController

+ (id)sharedController
{
  if (s_onceToken != -1)
    dispatch_once(&s_onceToken, &__block_literal_global_1);
  return (id)sharedController_s_instance;
}

void __45__ICPasswordReaskController_sharedController__block_invoke()
{
  ICPasswordReaskController *v0;
  void *v1;

  v0 = objc_alloc_init(ICPasswordReaskController);
  v1 = (void *)sharedController_s_instance;
  sharedController_s_instance = (uint64_t)v0;

}

- (void)enrollInReaskForAccount:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  int v8;
  void *v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = os_log_create("com.apple.notes", "Crypto");
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    objc_msgSend(v4, "shortLoggingDescription");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = 138412290;
    v9 = v6;
    _os_log_impl(&dword_1BD918000, v5, OS_LOG_TYPE_INFO, "Enrolling account for password reask: %@", (uint8_t *)&v8, 0xCu);

  }
  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICPasswordReaskController setLastReaskDate:forAccount:](self, "setLastReaskDate:forAccount:", v7, v4);

  -[ICPasswordReaskController setIsEnrolledInReask:forAccount:](self, "setIsEnrolledInReask:forAccount:", 1, v4);
}

- (void)reaskPasswordForAccountIfNecessary:(id)a3
{
  id v4;
  _BOOL4 v5;
  NSObject *v6;
  _BOOL4 v7;
  void *v8;
  void *v9;
  int v10;
  void *v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (-[ICPasswordReaskController isEnrolledInReaskForAccount:](self, "isEnrolledInReaskForAccount:", v4))
  {
    v5 = -[ICPasswordReaskController shouldReaskForAccount:](self, "shouldReaskForAccount:", v4);
    v6 = os_log_create("com.apple.notes", "Crypto");
    v7 = os_log_type_enabled(v6, OS_LOG_TYPE_INFO);
    if (v5)
    {
      if (v7)
      {
        objc_msgSend(v4, "shortLoggingDescription");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        v10 = 138412290;
        v11 = v8;
        _os_log_impl(&dword_1BD918000, v6, OS_LOG_TYPE_INFO, "Account is being reasked for password: %@", (uint8_t *)&v10, 0xCu);

      }
      -[ICPasswordReaskController reaskPasswordForAccount:](self, "reaskPasswordForAccount:", v4);
    }
    else
    {
      if (v7)
      {
        objc_msgSend(v4, "shortLoggingDescription");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v10 = 138412290;
        v11 = v9;
        _os_log_impl(&dword_1BD918000, v6, OS_LOG_TYPE_INFO, "Account is NOT reasked for password: %@", (uint8_t *)&v10, 0xCu);

      }
    }
  }

}

- (void)reaskPasswordForAccount:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  +[ICAuthenticationState sharedState](ICAuthenticationState, "sharedState");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "removeMainKeysFromKeychainForAccount:", v4);

  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  -[ICPasswordReaskController setLastReaskDate:forAccount:](self, "setLastReaskDate:forAccount:", v6, v4);

}

- (BOOL)shouldReaskForAccount:(id)a3
{
  void *v3;
  void *v4;
  double v5;
  double v6;
  void *v7;
  BOOL v8;

  -[ICPasswordReaskController lastReaskDateForAccount:](self, "lastReaskDateForAccount:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "timeIntervalSinceDate:", v3);
    v6 = v5;
    +[ICCloudConfiguration sharedConfiguration](ICCloudConfiguration, "sharedConfiguration");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = v6 >= (double)(unint64_t)objc_msgSend(v7, "durationForNextPasswordReask");

  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (id)keyForEnrolledInReask:(id)a3
{
  void *v3;
  void *v4;
  void *v5;

  v3 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend(a3, "identifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@_%@"), CFSTR("kICDefaultsKeyEnrolledInPasswordReask"), v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)keyForLastReaskDate:(id)a3
{
  void *v3;
  void *v4;
  void *v5;

  v3 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend(a3, "identifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@_%@"), CFSTR("kICDefaultsKeyLastPasswordReaskDate"), v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (BOOL)isEnrolledInReaskForAccount:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  void *v7;

  v4 = (void *)MEMORY[0x1E0D64188];
  v5 = a3;
  objc_msgSend(v4, "sharedAppGroupDefaults");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICPasswordReaskController keyForEnrolledInReask:](self, "keyForEnrolledInReask:", v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  LOBYTE(v5) = objc_msgSend(v6, "BOOLForKey:", v7);
  return (char)v5;
}

- (void)setIsEnrolledInReask:(BOOL)a3 forAccount:(id)a4
{
  _BOOL8 v4;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  id v10;

  v4 = a3;
  v6 = (void *)MEMORY[0x1E0D64188];
  v7 = a4;
  objc_msgSend(v6, "sharedAppGroupDefaults");
  v10 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICPasswordReaskController keyForEnrolledInReask:](self, "keyForEnrolledInReask:", v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v10, "setObject:forKey:", v8, v9);
}

- (id)lastReaskDateForAccount:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v4 = a3;
  objc_opt_class();
  objc_msgSend(MEMORY[0x1E0D64188], "sharedAppGroupDefaults");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICPasswordReaskController keyForLastReaskDate:](self, "keyForLastReaskDate:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "objectForKey:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  ICCheckedDynamicCast();
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (void)setLastReaskDate:(id)a3 forAccount:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  void *v9;
  void *v10;
  void *v11;
  int v12;
  void *v13;
  __int16 v14;
  id v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v8 = os_log_create("com.apple.notes", "Crypto");
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    objc_msgSend(v7, "shortLoggingDescription");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = 138412546;
    v13 = v9;
    v14 = 2112;
    v15 = v6;
    _os_log_impl(&dword_1BD918000, v8, OS_LOG_TYPE_INFO, "Setting last reask date for account %@ to %@", (uint8_t *)&v12, 0x16u);

  }
  objc_msgSend(MEMORY[0x1E0D64188], "sharedAppGroupDefaults");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICPasswordReaskController keyForLastReaskDate:](self, "keyForLastReaskDate:", v7);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setObject:forKey:", v6, v11);

}

@end
