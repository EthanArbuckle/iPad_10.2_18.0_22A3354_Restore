@implementation ATXInterruptionManagerContactSuggestions

- (ATXInterruptionManagerContactSuggestions)init
{
  void *v3;
  void *v4;
  ATXInterruptionManagerContactSuggestions *v5;

  v3 = (void *)objc_opt_new();
  v4 = (void *)objc_opt_new();
  v5 = -[ATXInterruptionManagerContactSuggestions initWithRecommendedContacts:candidateContacts:](self, "initWithRecommendedContacts:candidateContacts:", v3, v4);

  return v5;
}

- (ATXInterruptionManagerContactSuggestions)initWithRecommendedContacts:(id)a3 candidateContacts:(id)a4
{
  id v7;
  id v8;
  ATXInterruptionManagerContactSuggestions *v9;
  ATXInterruptionManagerContactSuggestions *v10;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)ATXInterruptionManagerContactSuggestions;
  v9 = -[ATXInterruptionManagerContactSuggestions init](&v12, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_recommendedContacts, a3);
    objc_storeStrong((id *)&v10->_candidateContacts, a4);
  }

  return v10;
}

- (id)debugDescription
{
  NSMutableArray *candidateContacts;
  void *v3;
  void *v4;
  _QWORD v6[2];
  _QWORD v7[3];

  v7[2] = *MEMORY[0x1E0C80C00];
  v6[0] = CFSTR("recommendedContacts");
  v6[1] = CFSTR("candidateContacts");
  candidateContacts = self->_candidateContacts;
  v7[0] = self->_recommendedContacts;
  v7[1] = candidateContacts;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v7, v6, 2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "debugDescription");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)description
{
  return (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("recommendedContacts: %@ candidateContacts: %@"), self->_recommendedContacts, self->_candidateContacts);
}

- (void)addRecommendedContact:(id)a3
{
  -[NSMutableArray addObject:](self->_recommendedContacts, "addObject:", a3);
}

- (void)addCandidateContact:(id)a3
{
  -[NSMutableArray addObject:](self->_candidateContacts, "addObject:", a3);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  NSMutableArray *recommendedContacts;
  id v5;

  recommendedContacts = self->_recommendedContacts;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", recommendedContacts, CFSTR("codingKeyForRecommendedContacts"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_candidateContacts, CFSTR("codingKeyForCandidateContacts"));

}

- (ATXInterruptionManagerContactSuggestions)initWithCoder:(id)a3
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
  ATXInterruptionManagerContactSuggestions *v13;
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
  objc_msgSend(v5, "robustDecodeObjectOfClasses:forKey:withCoder:expectNonNull:errorDomain:errorCode:logHandle:", v9, CFSTR("codingKeyForRecommendedContacts"), v4, 1, CFSTR("com.apple.proactive.decode.ATXInterruptionManagerContactSuggestions"), -1, v10);
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
    objc_msgSend(v14, "robustDecodeObjectOfClasses:forKey:withCoder:expectNonNull:errorDomain:errorCode:logHandle:", v18, CFSTR("codingKeyForCandidateContacts"), v4, 1, CFSTR("com.apple.proactive.decode.ATXInterruptionManagerContactSuggestions"), -1, v19);
    v20 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v4, "error");
    v21 = (void *)objc_claimAutoreleasedReturnValue();

    v13 = 0;
    if (!v21)
      v13 = -[ATXInterruptionManagerContactSuggestions initWithRecommendedContacts:candidateContacts:]([ATXInterruptionManagerContactSuggestions alloc], "initWithRecommendedContacts:candidateContacts:", v11, v20);

  }
  return v13;
}

- (id)copyWithZone:(_NSZone *)a3
{
  ATXInterruptionManagerContactSuggestions *v4;
  void *v5;
  void *v6;
  ATXInterruptionManagerContactSuggestions *v7;

  v4 = +[ATXInterruptionManagerContactSuggestions allocWithZone:](ATXInterruptionManagerContactSuggestions, "allocWithZone:", a3);
  v5 = (void *)-[NSMutableArray mutableCopy](self->_recommendedContacts, "mutableCopy");
  v6 = (void *)-[NSMutableArray mutableCopy](self->_candidateContacts, "mutableCopy");
  v7 = -[ATXInterruptionManagerContactSuggestions initWithRecommendedContacts:candidateContacts:](v4, "initWithRecommendedContacts:candidateContacts:", v5, v6);

  return v7;
}

- (NSArray)recommendedContacts
{
  return &self->_recommendedContacts->super;
}

- (NSArray)candidateContacts
{
  return &self->_candidateContacts->super;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_candidateContacts, 0);
  objc_storeStrong((id *)&self->_recommendedContacts, 0);
}

@end
