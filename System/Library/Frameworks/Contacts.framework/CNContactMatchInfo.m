@implementation CNContactMatchInfo

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (CNContactMatchInfo)initWithCoder:(id)a3
{
  id v4;
  CNContactMatchInfo *v5;
  void *v6;
  uint64_t v7;
  NSNumber *relevanceScore;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  uint64_t v14;
  NSDictionary *matchedProperties;
  void *v16;
  uint64_t v17;
  CNPromise *excerpt;
  void *v19;
  uint64_t v20;
  void *v21;
  void *v22;
  uint64_t v23;
  NSSet *matchedTerms;
  objc_super v26;

  v4 = a3;
  v26.receiver = self;
  v26.super_class = (Class)CNContactMatchInfo;
  v5 = -[CNContactMatchInfo init](&v26, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_relevanceScore"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "copy");
    relevanceScore = v5->_relevanceScore;
    v5->_relevanceScore = (NSNumber *)v7;

    v9 = (void *)MEMORY[0x1E0C99E60];
    v10 = objc_opt_class();
    v11 = objc_opt_class();
    objc_msgSend(v9, "setWithObjects:", v10, v11, objc_opt_class(), 0);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v12, CFSTR("_matchedProperties"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v13, "copy");
    matchedProperties = v5->_matchedProperties;
    v5->_matchedProperties = (NSDictionary *)v14;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_excerpt"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = objc_msgSend(v16, "copy");
    excerpt = v5->_excerpt;
    v5->_excerpt = (CNPromise *)v17;

    v5->_matchedNameProperty = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("_matchedNameProperty"));
    v19 = (void *)MEMORY[0x1E0C99E60];
    v20 = objc_opt_class();
    objc_msgSend(v19, "setWithObjects:", v20, objc_opt_class(), 0);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v21, CFSTR("_matchedTerms"));
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = objc_msgSend(v22, "copy");
    matchedTerms = v5->_matchedTerms;
    v5->_matchedTerms = (NSSet *)v23;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  NSNumber *relevanceScore;
  id v5;

  relevanceScore = self->_relevanceScore;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", relevanceScore, CFSTR("_relevanceScore"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_matchedProperties, CFSTR("_matchedProperties"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_excerpt, CFSTR("_excerpt"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_matchedTerms, CFSTR("_matchedTerms"));
  objc_msgSend(v5, "encodeBool:forKey:", self->_matchedNameProperty, CFSTR("_matchedNameProperty"));

}

- (id)copyWithZone:(_NSZone *)a3
{
  CNContactMatchInfo *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;

  v4 = objc_alloc_init(CNContactMatchInfo);
  -[CNContactMatchInfo excerpt](self, "excerpt");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v5, "copy");
  -[CNContactMatchInfo setExcerpt:](v4, "setExcerpt:", v6);

  -[CNContactMatchInfo relevanceScore](self, "relevanceScore");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNContactMatchInfo setRelevanceScore:](v4, "setRelevanceScore:", v7);

  -[CNContactMatchInfo matchedProperties](self, "matchedProperties");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)objc_msgSend(v8, "copy");
  -[CNContactMatchInfo setMatchedProperties:](v4, "setMatchedProperties:", v9);

  -[CNContactMatchInfo matchedTerms](self, "matchedTerms");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (void *)objc_msgSend(v10, "copy");
  -[CNContactMatchInfo setMatchedTerms:](v4, "setMatchedTerms:", v11);

  -[CNContactMatchInfo setMatchedNameProperty:](v4, "setMatchedNameProperty:", -[CNContactMatchInfo matchedNameProperty](self, "matchedNameProperty"));
  return v4;
}

- (NSNumber)relevanceScore
{
  return self->_relevanceScore;
}

- (void)setRelevanceScore:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (NSDictionary)matchedProperties
{
  return self->_matchedProperties;
}

- (void)setMatchedProperties:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (NSSet)matchedTerms
{
  return self->_matchedTerms;
}

- (void)setMatchedTerms:(id)a3
{
  objc_storeStrong((id *)&self->_matchedTerms, a3);
}

- (CNPromise)excerpt
{
  return self->_excerpt;
}

- (void)setExcerpt:(id)a3
{
  objc_storeStrong((id *)&self->_excerpt, a3);
}

- (BOOL)matchedNameProperty
{
  return self->_matchedNameProperty;
}

- (void)setMatchedNameProperty:(BOOL)a3
{
  self->_matchedNameProperty = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_excerpt, 0);
  objc_storeStrong((id *)&self->_matchedTerms, 0);
  objc_storeStrong((id *)&self->_matchedProperties, 0);
  objc_storeStrong((id *)&self->_relevanceScore, 0);
}

@end
