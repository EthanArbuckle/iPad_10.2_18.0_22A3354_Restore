@implementation ATXInterruptionManagerAppSuggestions

- (ATXInterruptionManagerAppSuggestions)init
{
  void *v3;
  void *v4;
  ATXInterruptionManagerAppSuggestions *v5;

  v3 = (void *)objc_opt_new();
  v4 = (void *)objc_opt_new();
  v5 = -[ATXInterruptionManagerAppSuggestions initWithRecommendedApps:candidateApps:](self, "initWithRecommendedApps:candidateApps:", v3, v4);

  return v5;
}

- (ATXInterruptionManagerAppSuggestions)initWithRecommendedApps:(id)a3 candidateApps:(id)a4
{
  id v7;
  id v8;
  ATXInterruptionManagerAppSuggestions *v9;
  ATXInterruptionManagerAppSuggestions *v10;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)ATXInterruptionManagerAppSuggestions;
  v9 = -[ATXInterruptionManagerAppSuggestions init](&v12, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_recommendedApps, a3);
    objc_storeStrong((id *)&v10->_candidateApps, a4);
  }

  return v10;
}

- (id)debugDescription
{
  NSMutableArray *candidateApps;
  void *v3;
  void *v4;
  _QWORD v6[2];
  _QWORD v7[3];

  v7[2] = *MEMORY[0x1E0C80C00];
  v6[0] = CFSTR("recommendedApps");
  v6[1] = CFSTR("candidateApps");
  candidateApps = self->_candidateApps;
  v7[0] = self->_recommendedApps;
  v7[1] = candidateApps;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v7, v6, 2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "debugDescription");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)description
{
  return (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("recommendedApps: %@ candidateApps: %@"), self->_recommendedApps, self->_candidateApps);
}

- (void)addRecommendedApp:(id)a3
{
  -[NSMutableArray addObject:](self->_recommendedApps, "addObject:", a3);
}

- (void)addCandidateApp:(id)a3
{
  -[NSMutableArray addObject:](self->_candidateApps, "addObject:", a3);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  NSMutableArray *recommendedApps;
  id v5;

  recommendedApps = self->_recommendedApps;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", recommendedApps, CFSTR("codingKeyForRecommendedApps"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_candidateApps, CFSTR("codingKeyForCandidateApps"));

}

- (ATXInterruptionManagerAppSuggestions)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  ATXInterruptionManagerAppSuggestions *v13;
  void *v14;
  void *v15;
  id v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;

  v4 = a3;
  v5 = (void *)MEMORY[0x1E0D81610];
  v6 = (void *)MEMORY[0x1A85A4F90]();
  v7 = objc_alloc(MEMORY[0x1E0C99E60]);
  v8 = objc_opt_class();
  v9 = (void *)objc_msgSend(v7, "initWithObjects:", v8, objc_opt_class(), 0);
  objc_autoreleasePoolPop(v6);
  __atxlog_handle_notification_management();
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "robustDecodeObjectOfClasses:forKey:withCoder:expectNonNull:errorDomain:errorCode:logHandle:", v9, CFSTR("codingKeyForRecommendedApps"), v4, 1, CFSTR("com.apple.proactive.decode.ATXInterruptionManagerAppSuggestions"), -1, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "error");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  v13 = 0;
  if (!v12)
  {
    v14 = (void *)MEMORY[0x1E0D81610];
    v15 = (void *)MEMORY[0x1A85A4F90]();
    v16 = objc_alloc(MEMORY[0x1E0C99E60]);
    v17 = objc_opt_class();
    v18 = (void *)objc_msgSend(v16, "initWithObjects:", v17, objc_opt_class(), 0);
    objc_autoreleasePoolPop(v15);
    __atxlog_handle_notification_management();
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "robustDecodeObjectOfClasses:forKey:withCoder:expectNonNull:errorDomain:errorCode:logHandle:", v18, CFSTR("codingKeyForCandidateApps"), v4, 1, CFSTR("com.apple.proactive.decode.ATXInterruptionManagerAppSuggestions"), -1, v19);
    v20 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v4, "error");
    v21 = (void *)objc_claimAutoreleasedReturnValue();

    v13 = 0;
    if (!v21)
      v13 = -[ATXInterruptionManagerAppSuggestions initWithRecommendedApps:candidateApps:]([ATXInterruptionManagerAppSuggestions alloc], "initWithRecommendedApps:candidateApps:", v11, v20);

  }
  return v13;
}

- (id)copyWithZone:(_NSZone *)a3
{
  ATXInterruptionManagerAppSuggestions *v4;
  void *v5;
  void *v6;
  ATXInterruptionManagerAppSuggestions *v7;

  v4 = +[ATXInterruptionManagerAppSuggestions allocWithZone:](ATXInterruptionManagerAppSuggestions, "allocWithZone:", a3);
  v5 = (void *)-[NSMutableArray mutableCopy](self->_recommendedApps, "mutableCopy");
  v6 = (void *)-[NSMutableArray mutableCopy](self->_candidateApps, "mutableCopy");
  v7 = -[ATXInterruptionManagerAppSuggestions initWithRecommendedApps:candidateApps:](v4, "initWithRecommendedApps:candidateApps:", v5, v6);

  return v7;
}

- (NSArray)recommendedApps
{
  return &self->_recommendedApps->super;
}

- (NSArray)candidateApps
{
  return &self->_candidateApps->super;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_candidateApps, 0);
  objc_storeStrong((id *)&self->_recommendedApps, 0);
}

@end
