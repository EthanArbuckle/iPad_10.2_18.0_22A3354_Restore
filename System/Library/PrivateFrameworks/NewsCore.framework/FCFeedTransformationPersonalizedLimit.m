@implementation FCFeedTransformationPersonalizedLimit

+ (id)transformationWithPersonalizer:(id)a3 dateRange:(id)a4
{
  id v5;
  id v6;
  void *v7;
  double v8;
  double v9;
  void *v11;
  int v12;
  const char *v13;
  __int16 v14;
  char *v15;
  __int16 v16;
  int v17;
  __int16 v18;
  void *v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v5 = a4;
  v6 = a3;
  if ((objc_msgSend(v5, "isFinite") & 1) == 0 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("personalization limit requires a finite date range"));
    v12 = 136315906;
    v13 = "+[FCFeedTransformationPersonalizedLimit transformationWithPersonalizer:dateRange:]";
    v14 = 2080;
    v15 = "FCFeedTransformationPersonalize.m";
    v16 = 1024;
    v17 = 140;
    v18 = 2114;
    v19 = v11;
    _os_log_error_impl(&dword_1A1B90000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", (uint8_t *)&v12, 0x26u);

  }
  v7 = (void *)objc_opt_new();
  objc_msgSend(v7, "setFeedPersonalizer:", v6);

  objc_msgSend(v5, "absoluteTimeInterval");
  v9 = v8;

  objc_msgSend(v7, "setTimeInterval:", v9);
  return v7;
}

+ (id)transformationWithPersonalizer:(id)a3 timeInterval:(double)a4
{
  id v5;
  void *v6;

  v5 = a3;
  v6 = (void *)objc_opt_new();
  objc_msgSend(v6, "setFeedPersonalizer:", v5);

  objc_msgSend(v6, "setTimeInterval:", a4);
  return v6;
}

- (id)transformFeedItems:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  double v15;
  id v16;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  NewsCoreUserDefaults();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "BOOLForKey:", CFSTR("personalization_disabled")))
  {

LABEL_12:
    v16 = v4;
    goto LABEL_13;
  }
  -[FCFeedTransformationPersonalizedLimit feedPersonalizer](self, "feedPersonalizer");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v6)
    goto LABEL_12;
  objc_msgSend(MEMORY[0x1E0C99E20], "set");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v8 = v4;
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v19;
    do
    {
      v12 = 0;
      do
      {
        if (*(_QWORD *)v19 != v11)
          objc_enumerationMutation(v8);
        objc_msgSend(*(id *)(*((_QWORD *)&v18 + 1) + 8 * v12), "sourceChannelID", (_QWORD)v18);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "addObject:", v13);

        ++v12;
      }
      while (v10 != v12);
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
    }
    while (v10);
  }

  -[FCFeedTransformationPersonalizedLimit feedPersonalizer](self, "feedPersonalizer");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[FCFeedTransformationPersonalizedLimit timeInterval](self, "timeInterval");
  objc_msgSend(v14, "limitItemsByFlowRate:timeInterval:publisherCount:", v8, objc_msgSend(v7, "count"), v15);
  v16 = (id)objc_claimAutoreleasedReturnValue();

LABEL_13:
  return v16;
}

- (FCFeedPersonalizing)feedPersonalizer
{
  return self->_feedPersonalizer;
}

- (void)setFeedPersonalizer:(id)a3
{
  objc_storeStrong((id *)&self->_feedPersonalizer, a3);
}

- (double)timeInterval
{
  return self->_timeInterval;
}

- (void)setTimeInterval:(double)a3
{
  self->_timeInterval = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_feedPersonalizer, 0);
}

@end
