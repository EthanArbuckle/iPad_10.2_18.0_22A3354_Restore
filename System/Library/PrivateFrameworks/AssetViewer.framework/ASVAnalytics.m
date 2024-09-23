@implementation ASVAnalytics

+ (void)sendAnalyticsWithEvent:(unint64_t)a3
{
  +[ASVAnalytics sendAnalyticsWithEvent:payloadDict:](ASVAnalytics, "sendAnalyticsWithEvent:payloadDict:", a3, MEMORY[0x1E0C9AA70]);
}

+ (void)sendAnalyticsWithEvent:(unint64_t)a3 error:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  _QWORD v10[3];
  _QWORD v11[4];

  v11[3] = *MEMORY[0x1E0C80C00];
  v10[0] = CFSTR("errorDomain");
  v5 = a4;
  objc_msgSend(v5, "domain");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = v6;
  v10[1] = CFSTR("errorCode");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLong:", objc_msgSend(v5, "code"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v11[1] = v7;
  v10[2] = CFSTR("errorMessage");
  objc_msgSend(v5, "localizedDescription");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v11[2] = v8;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v11, v10, 3);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  +[ASVAnalytics sendAnalyticsWithEvent:payloadDict:](ASVAnalytics, "sendAnalyticsWithEvent:payloadDict:", a3, v9);

}

+ (void)sendAnalyticsWithEvent:(unint64_t)a3 payloadDict:(id)a4
{
  id v7;
  id v8;
  __CFString *v9;
  __CFString *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;

  v7 = a4;
  v15 = v7;
  if (a3 >= 0x15)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("ASVAnalytics.m"), 190, CFSTR("Event name should be defined"));

    v8 = v15;
    v9 = 0;
    v10 = 0;
  }
  else
  {
    v8 = v7;
    v9 = off_1E9F0C518[a3];
    v10 = off_1E9F0C5C0[a3];
  }
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithDictionary:", v8);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "objectForKeyedSubscript:", CFSTR("type"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (v13)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("ASVAnalytics.m"), 194, CFSTR("[Analytics] Type should not already be defined"));

  }
  objc_msgSend(v12, "setObject:forKeyedSubscript:", v10, CFSTR("type"));
  +[ASVAnalytics sendAnalyticsWithCategory:payloadDict:](ASVAnalytics, "sendAnalyticsWithCategory:payloadDict:", v9, v12);

}

+ (void)sendAnalyticsWithCategory:(id)a3 payloadDict:(id)a4
{
  id v7;
  void *v8;
  void *v9;
  id v10;

  v10 = a3;
  v7 = a4;
  objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("type"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v8)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("ASVAnalytics.m"), 203, CFSTR("Event type should be defined"));

  }
  AnalyticsSendEvent();

}

@end
