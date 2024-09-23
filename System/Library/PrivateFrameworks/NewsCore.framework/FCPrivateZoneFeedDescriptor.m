@implementation FCPrivateZoneFeedDescriptor

- (id)streamOfLatestHeadlinesWithContext:(id)a3
{
  id v4;
  void *v5;
  int v6;
  void *v7;
  double v8;
  void *v9;
  void *v10;

  v4 = a3;
  objc_msgSend(v4, "networkReachability");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "isCloudKitReachable");

  if (v6)
  {
    NewsCoreUserDefaults();
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v7, "BOOLForKey:", CFSTR("update_headlines_immediately")))
      v8 = 0.0;
    else
      v8 = 86400.0;

  }
  else
  {
    v8 = 1.79769313e308;
  }
  -[FCPrivateZoneFeedDescriptor backingHeadlineIDs](self, "backingHeadlineIDs");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[FCFeedDescriptor streamOfHeadlinesWithIDs:context:cachedOnly:maxCachedAge:](self, "streamOfHeadlinesWithIDs:context:cachedOnly:maxCachedAge:", v9, v4, v6 ^ 1u, v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (FCPrivateDataController)privateDataController
{
  return self->_privateDataController;
}

- (FCPrivateZoneFeedDescriptor)initWithPrivateDataController:(id)a3 identifier:(id)a4 feedType:(int64_t)a5
{
  id v9;
  id v10;
  FCPrivateZoneFeedDescriptor *v11;
  FCPrivateZoneFeedDescriptor *v12;
  void *v14;
  void *v15;
  objc_super v16;
  uint8_t buf[4];
  const char *v18;
  __int16 v19;
  char *v20;
  __int16 v21;
  int v22;
  __int16 v23;
  void *v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v10 = a4;
  if (!v9 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    v14 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Invalid parameter not satisfying %s"), "privateDataController");
    *(_DWORD *)buf = 136315906;
    v18 = "-[FCPrivateZoneFeedDescriptor initWithPrivateDataController:identifier:feedType:]";
    v19 = 2080;
    v20 = "FCPrivateZoneFeedDescriptor.m";
    v21 = 1024;
    v22 = 55;
    v23 = 2114;
    v24 = v14;
    _os_log_error_impl(&dword_1A1B90000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);

    if (v10)
      goto LABEL_6;
  }
  else if (v10)
  {
    goto LABEL_6;
  }
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    v15 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Invalid parameter not satisfying %s"), "identifier");
    *(_DWORD *)buf = 136315906;
    v18 = "-[FCPrivateZoneFeedDescriptor initWithPrivateDataController:identifier:feedType:]";
    v19 = 2080;
    v20 = "FCPrivateZoneFeedDescriptor.m";
    v21 = 1024;
    v22 = 56;
    v23 = 2114;
    v24 = v15;
    _os_log_error_impl(&dword_1A1B90000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);

  }
LABEL_6:
  v16.receiver = self;
  v16.super_class = (Class)FCPrivateZoneFeedDescriptor;
  v11 = -[FCFeedDescriptor initWithIdentifier:](&v16, sel_initWithIdentifier_, v10);
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_privateDataController, a3);
    v12->_feedType = a5;
  }

  return v12;
}

- (FCPrivateZoneFeedDescriptor)initWithIdentifier:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  id v8;
  uint8_t buf[4];
  const char *v10;
  __int16 v11;
  char *v12;
  __int16 v13;
  int v14;
  __int16 v15;
  void *v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Do not call method"));
    *(_DWORD *)buf = 136315906;
    v10 = "-[FCPrivateZoneFeedDescriptor initWithIdentifier:]";
    v11 = 2080;
    v12 = "FCPrivateZoneFeedDescriptor.m";
    v13 = 1024;
    v14 = 50;
    v15 = 2114;
    v16 = v4;
    _os_log_error_impl(&dword_1A1B90000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);

  }
  v5 = (void *)MEMORY[0x1E0C99DA0];
  v6 = *MEMORY[0x1E0C99768];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@: %s"), CFSTR("Do not call method"), "-[FCPrivateZoneFeedDescriptor initWithIdentifier:]");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "exceptionWithName:reason:userInfo:", v6, v7, 0);
  v8 = (id)objc_claimAutoreleasedReturnValue();

  objc_exception_throw(v8);
}

- (id)backingHeadlineIDs
{
  void *v2;
  void *v3;
  uint64_t v4;
  void *v5;
  id v6;
  uint8_t buf[4];
  const char *v8;
  __int16 v9;
  char *v10;
  __int16 v11;
  int v12;
  __int16 v13;
  void *v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Abstract method"));
    *(_DWORD *)buf = 136315906;
    v8 = "-[FCPrivateZoneFeedDescriptor backingHeadlineIDs]";
    v9 = 2080;
    v10 = "FCPrivateZoneFeedDescriptor.m";
    v11 = 1024;
    v12 = 88;
    v13 = 2114;
    v14 = v2;
    _os_log_error_impl(&dword_1A1B90000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);

  }
  v3 = (void *)MEMORY[0x1E0C99DA0];
  v4 = *MEMORY[0x1E0C99768];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@: %s"), CFSTR("Abstract method"), "-[FCPrivateZoneFeedDescriptor backingHeadlineIDs]");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "exceptionWithName:reason:userInfo:", v4, v5, 0);
  v6 = (id)objc_claimAutoreleasedReturnValue();

  objc_exception_throw(v6);
}

- (int64_t)feedType
{
  return self->_feedType;
}

- (void)setPrivateDataController:(id)a3
{
  objc_storeStrong((id *)&self->_privateDataController, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_privateDataController, 0);
}

@end
