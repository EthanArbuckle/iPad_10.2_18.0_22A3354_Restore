@implementation ATXSearchResult

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (ATXSearchResult)initWithCoder:(id)a3
{
  id v4;
  ATXSearchResult *v5;
  uint64_t v6;
  ATXScoredPrediction *scoredBundleId;
  uint64_t v8;
  ATXResponse *response;
  uint64_t v10;
  ATXProactiveSuggestion *proactiveSuggestion;
  objc_super v13;

  v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)ATXSearchResult;
  v5 = -[ATXSearchResult initWithCoder:](&v13, sel_initWithCoder_, v4);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("scoredBundleId"));
    v6 = objc_claimAutoreleasedReturnValue();
    scoredBundleId = v5->_scoredBundleId;
    v5->_scoredBundleId = (ATXScoredPrediction *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("response"));
    v8 = objc_claimAutoreleasedReturnValue();
    response = v5->_response;
    v5->_response = (ATXResponse *)v8;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("proactiveSuggestion"));
    v10 = objc_claimAutoreleasedReturnValue();
    proactiveSuggestion = v5->_proactiveSuggestion;
    v5->_proactiveSuggestion = (ATXProactiveSuggestion *)v10;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  ATXScoredPrediction *scoredBundleId;
  id v5;
  objc_super v6;

  scoredBundleId = self->_scoredBundleId;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", scoredBundleId, CFSTR("scoredBundleId"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_response, CFSTR("response"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_proactiveSuggestion, CFSTR("proactiveSuggestion"));
  v6.receiver = self;
  v6.super_class = (Class)ATXSearchResult;
  -[ATXSearchResult encodeWithCoder:](&v6, sel_encodeWithCoder_, v5);

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_proactiveSuggestion, 0);
  objc_storeStrong((id *)&self->_response, 0);
  objc_storeStrong((id *)&self->_scoredBundleId, 0);
}

- (ATXProactiveSuggestion)proactiveSuggestion
{
  return self->_proactiveSuggestion;
}

- (ATXSearchResult)initWithScoredBundleId:(id)a3 response:(id)a4 proactiveSuggestion:(id)a5
{
  id v9;
  id v10;
  id v11;
  ATXSearchResult *v12;
  ATXSearchResult *v13;
  objc_super v15;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v15.receiver = self;
  v15.super_class = (Class)ATXSearchResult;
  v12 = -[ATXSearchResult init](&v15, sel_init);
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_scoredBundleId, a3);
    objc_storeStrong((id *)&v13->_response, a4);
    objc_storeStrong((id *)&v13->_proactiveSuggestion, a5);
  }

  return v13;
}

- (ATXResponse)response
{
  return self->_response;
}

- (ATXScoredPrediction)scoredBundleId
{
  return self->_scoredBundleId;
}

@end
