@implementation ATXImmutableCandidateRelevanceModelFeaturizer

- (ATXImmutableCandidateRelevanceModelFeaturizer)initWithFeatureValueNames:(id)a3
{
  id v5;
  ATXImmutableCandidateRelevanceModelFeaturizer *v6;
  ATXImmutableCandidateRelevanceModelFeaturizer *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)ATXImmutableCandidateRelevanceModelFeaturizer;
  v6 = -[ATXImmutableCandidateRelevanceModelFeaturizer init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_featureValueNames, a3);

  return v7;
}

- (unint64_t)dimensions
{
  return -[NSArray count](self->_featureValueNames, "count");
}

- (id)featureVectorForContext:(id)a3 candidate:(id)a4
{
  id v5;
  id result;

  v5 = a3;
  result = a4;
  __break(1u);
  return result;
}

- (BOOL)isEqual:(id)a3
{
  ATXImmutableCandidateRelevanceModelFeaturizer *v4;
  ATXImmutableCandidateRelevanceModelFeaturizer *v5;
  BOOL v6;

  v4 = (ATXImmutableCandidateRelevanceModelFeaturizer *)a3;
  v5 = v4;
  if (v4 == self)
    v6 = 1;
  else
    v6 = v4
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && -[ATXImmutableCandidateRelevanceModelFeaturizer isEqualToATXImmutableCandidateRelevanceModelFeaturizer:](self, "isEqualToATXImmutableCandidateRelevanceModelFeaturizer:", v5);

  return v6;
}

- (BOOL)isEqualToATXImmutableCandidateRelevanceModelFeaturizer:(id)a3
{
  _QWORD *v4;
  unint64_t v5;
  BOOL v6;

  v4 = a3;
  v5 = -[ATXImmutableCandidateRelevanceModelFeaturizer dimensions](self, "dimensions");
  v6 = v5 == objc_msgSend(v4, "dimensions")
    && -[NSArray isEqualToArray:](self->_featureValueNames, "isEqualToArray:", v4[1]);

  return v6;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  objc_msgSend(a3, "encodeObject:forKey:", self->_featureValueNames, CFSTR("featureValueNames"));
}

- (ATXImmutableCandidateRelevanceModelFeaturizer)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  ATXImmutableCandidateRelevanceModelFeaturizer *v12;

  v4 = a3;
  v5 = (void *)MEMORY[0x1E0D81610];
  v6 = (void *)MEMORY[0x1CAA48B6C]();
  v7 = objc_alloc(MEMORY[0x1E0C99E60]);
  v8 = objc_opt_class();
  v9 = (void *)objc_msgSend(v7, "initWithObjects:", v8, objc_opt_class(), 0);
  objc_autoreleasePoolPop(v6);
  __atxlog_handle_relevance_model();
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "robustDecodeObjectOfClasses:forKey:withCoder:expectNonNull:errorDomain:errorCode:logHandle:", v9, CFSTR("featureValueNames"), v4, 1, CFSTR("com.apple.duetexpertd.ATXImmutableCandidateRelevanceModelFeaturizer"), -1, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (v11)
  {
    self = -[ATXImmutableCandidateRelevanceModelFeaturizer initWithFeatureValueNames:](self, "initWithFeatureValueNames:", v11);
    v12 = self;
  }
  else
  {
    v12 = 0;
  }

  return v12;
}

- (NSArray)featureValueNames
{
  return self->_featureValueNames;
}

- (void)setFeatureValueNames:(id)a3
{
  objc_storeStrong((id *)&self->_featureValueNames, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_featureValueNames, 0);
}

@end
