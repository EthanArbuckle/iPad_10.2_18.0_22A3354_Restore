@implementation AceObject(AnalyticsContextVending)

- (id)af_analyticsContext
{
  void *v2;
  void *v3;
  id v4;
  void *v5;
  void *v6;
  void *v8;
  _QWORD v9[2];

  v9[1] = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "groupIdentifier");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "encodedClassName");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  objc_msgSend(a1, "af_addEntriesToAnalyticsContext:", v4);
  if (objc_msgSend(v4, "count"))
  {
    v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("%@.%@"), v2, v3);
    v8 = v5;
    v9[0] = v4;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v9, &v8, 1);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v6 = (void *)MEMORY[0x1E0C9AA70];
  }

  return v6;
}

- (void)af_addEntriesToAnalyticsContext:()AnalyticsContextVending
{
  void *v4;
  void *v5;
  id v6;

  v6 = a3;
  objc_msgSend(a1, "aceId");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
    objc_msgSend(v6, "setObject:forKey:", v4, CFSTR("aceId"));
  objc_msgSend(a1, "refId");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
    objc_msgSend(v6, "setObject:forKey:", v5, CFSTR("refId"));

}

- (uint64_t)af_dialogIdentifiersForAnalyticsContext
{
  return 0;
}

@end
