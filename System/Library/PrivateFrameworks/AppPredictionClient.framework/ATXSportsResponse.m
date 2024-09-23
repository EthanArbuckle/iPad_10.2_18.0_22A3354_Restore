@implementation ATXSportsResponse

- (ATXSportsResponse)init
{
  return -[ATXSportsResponse initWithTeams:](self, "initWithTeams:", MEMORY[0x1E0C9AA60]);
}

- (ATXSportsResponse)initWithTeams:(id)a3
{
  id v4;
  ATXSportsResponse *v5;
  uint64_t v6;
  NSArray *teams;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)ATXSportsResponse;
  v5 = -[ATXSportsResponse init](&v9, sel_init);
  if (v5)
  {
    v6 = objc_msgSend(v4, "copy");
    teams = v5->_teams;
    v5->_teams = (NSArray *)v6;

  }
  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (BOOL)checkAndReportDecodingFailureIfNeededForid:(id)a3 key:(id)a4 coder:(id)a5 errorDomain:(id)a6 errorCode:(int64_t)a7
{
  id v11;
  id v12;
  id v13;
  BOOL v14;
  void *v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v21;
  _QWORD v22[2];

  v22[1] = *MEMORY[0x1E0C80C00];
  v11 = a4;
  v12 = a5;
  v13 = a6;
  if (!a3)
  {
    objc_msgSend(v12, "error");
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    if (v15)
    {
      v14 = 1;
      goto LABEL_7;
    }
    if ((objc_msgSend(v12, "containsValueForKey:", v11) & 1) == 0)
    {
      v16 = objc_alloc(MEMORY[0x1E0CB35C8]);
      v21 = *MEMORY[0x1E0CB2D50];
      v17 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Failed to decode key %@"), v11, v21);
      v22[0] = v17;
      v14 = 1;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v22, &v21, 1);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = (void *)objc_msgSend(v16, "initWithDomain:code:userInfo:", v13, a7, v18);

      objc_msgSend(v12, "failWithError:", v19);
      goto LABEL_7;
    }
  }
  v14 = 0;
LABEL_7:

  return v14;
}

- (void)encodeWithCoder:(id)a3
{
  objc_msgSend(a3, "encodeObject:forKey:", self->_teams, CFSTR("KEY_TEAMS"));
}

- (ATXSportsResponse)initWithCoder:(id)a3
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
  ATXSportsResponse *v13;

  v4 = a3;
  v5 = (void *)MEMORY[0x1E0D81610];
  v6 = (void *)MEMORY[0x1A85A4F90]();
  v7 = objc_alloc(MEMORY[0x1E0C99E60]);
  v8 = objc_opt_class();
  v9 = (void *)objc_msgSend(v7, "initWithObjects:", v8, objc_opt_class(), 0);
  objc_autoreleasePoolPop(v6);
  __atxlog_handle_default();
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "robustDecodeObjectOfClasses:forKey:withCoder:expectNonNull:errorDomain:errorCode:logHandle:", v9, CFSTR("KEY_TEAMS"), v4, 1, CFSTR("com.apple.duetexpertd.ATXSportsResponse"), -1, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "error");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  v13 = 0;
  if (!v12 && v11)
  {
    self = -[ATXSportsResponse initWithTeams:](self, "initWithTeams:", v11);
    v13 = self;
  }

  return v13;
}

- (NSArray)teams
{
  return self->_teams;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_teams, 0);
}

@end
