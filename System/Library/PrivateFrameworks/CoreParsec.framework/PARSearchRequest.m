@implementation PARSearchRequest

- (void)encodeWithCoder:(id)a3
{
  id v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)PARSearchRequest;
  v4 = a3;
  -[PARRequest encodeWithCoder:](&v5, sel_encodeWithCoder_, v4);
  objc_msgSend(v4, "encodeObject:forKey:", self->_queryString, CFSTR("query"), v5.receiver, v5.super_class);
  objc_msgSend(v4, "encodeObject:forKey:", self->_topics, CFSTR("topics"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_engagedSuggestion, CFSTR("engagedSuggestion"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_localContextualSuggestions, CFSTR("localContextualSuggestions"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_l2version, CFSTR("l2version"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_l3version, CFSTR("l3version"));
  objc_msgSend(v4, "encodeInteger:forKey:", self->_type, CFSTR("requestType"));
  objc_msgSend(v4, "encodeInteger:forKey:", self->_exp, CFSTR("exp"));

}

- (PARSearchRequest)initWithCoder:(id)a3
{
  id v4;
  PARSearchRequest *v5;
  uint64_t v6;
  NSString *queryString;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  NSDictionary *topics;
  uint64_t v13;
  SFSearchSuggestion *engagedSuggestion;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  NSArray *localContextualSuggestions;
  uint64_t v20;
  NSString *l2version;
  uint64_t v22;
  NSString *l3version;
  objc_super v25;
  _QWORD v26[2];
  _QWORD v27[4];

  v27[3] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v25.receiver = self;
  v25.super_class = (Class)PARSearchRequest;
  v5 = -[PARRequest initWithCoder:](&v25, sel_initWithCoder_, v4);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("query"));
    v6 = objc_claimAutoreleasedReturnValue();
    queryString = v5->_queryString;
    v5->_queryString = (NSString *)v6;

    v8 = (void *)MEMORY[0x1E0C99E60];
    v27[0] = objc_opt_class();
    v27[1] = objc_opt_class();
    v27[2] = objc_opt_class();
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v27, 3);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setWithArray:", v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v10, CFSTR("topics"));
    v11 = objc_claimAutoreleasedReturnValue();
    topics = v5->_topics;
    v5->_topics = (NSDictionary *)v11;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("engagedSuggestion"));
    v13 = objc_claimAutoreleasedReturnValue();
    engagedSuggestion = v5->_engagedSuggestion;
    v5->_engagedSuggestion = (SFSearchSuggestion *)v13;

    v15 = (void *)MEMORY[0x1E0C99E60];
    v26[0] = objc_opt_class();
    v26[1] = objc_opt_class();
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v26, 2);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "setWithArray:", v16);
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v17, CFSTR("localContextualSuggestions"));
    v18 = objc_claimAutoreleasedReturnValue();
    localContextualSuggestions = v5->_localContextualSuggestions;
    v5->_localContextualSuggestions = (NSArray *)v18;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("l2version"));
    v20 = objc_claimAutoreleasedReturnValue();
    l2version = v5->_l2version;
    v5->_l2version = (NSString *)v20;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("l3version"));
    v22 = objc_claimAutoreleasedReturnValue();
    l3version = v5->_l3version;
    v5->_l3version = (NSString *)v22;

    v5->_type = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("requestType"));
    v5->_exp = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("exp"));

  }
  return v5;
}

- (unsigned)nwActivityLabel
{
  return 3;
}

- (NSString)queryString
{
  return self->_queryString;
}

- (void)setQueryString:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 120);
}

- (NSDictionary)topics
{
  return self->_topics;
}

- (void)setTopics:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 128);
}

- (int64_t)type
{
  return self->_type;
}

- (void)setType:(int64_t)a3
{
  self->_type = a3;
}

- (NSString)l2version
{
  return self->_l2version;
}

- (void)setL2version:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 144);
}

- (NSString)l3version
{
  return self->_l3version;
}

- (void)setL3version:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 152);
}

- (NSArray)localContextualSuggestions
{
  return self->_localContextualSuggestions;
}

- (void)setLocalContextualSuggestions:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 160);
}

- (int64_t)exp
{
  return self->_exp;
}

- (void)setExp:(int64_t)a3
{
  self->_exp = a3;
}

- (SFSearchSuggestion)engagedSuggestion
{
  return self->_engagedSuggestion;
}

- (void)setEngagedSuggestion:(id)a3
{
  objc_storeStrong((id *)&self->_engagedSuggestion, a3);
}

- (NSArray)completionCacheSuggestions
{
  return self->_completionCacheSuggestions;
}

- (void)setCompletionCacheSuggestions:(id)a3
{
  objc_storeStrong((id *)&self->_completionCacheSuggestions, a3);
}

- (NSString)previouslyEngagedQuery
{
  return self->_previouslyEngagedQuery;
}

- (void)setPreviouslyEngagedQuery:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 192);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_previouslyEngagedQuery, 0);
  objc_storeStrong((id *)&self->_completionCacheSuggestions, 0);
  objc_storeStrong((id *)&self->_engagedSuggestion, 0);
  objc_storeStrong((id *)&self->_localContextualSuggestions, 0);
  objc_storeStrong((id *)&self->_l3version, 0);
  objc_storeStrong((id *)&self->_l2version, 0);
  objc_storeStrong((id *)&self->_topics, 0);
  objc_storeStrong((id *)&self->_queryString, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
