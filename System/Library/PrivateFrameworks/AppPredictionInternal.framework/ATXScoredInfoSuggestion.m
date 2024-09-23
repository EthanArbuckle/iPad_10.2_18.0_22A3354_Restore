@implementation ATXScoredInfoSuggestion

- (ATXScoredInfoSuggestion)initWithSuggestion:(id)a3 featureSet:(id)a4 score:(double)a5
{
  id v9;
  id v10;
  ATXScoredInfoSuggestion *v11;
  ATXScoredInfoSuggestion *v12;
  objc_super v14;

  v9 = a3;
  v10 = a4;
  v14.receiver = self;
  v14.super_class = (Class)ATXScoredInfoSuggestion;
  v11 = -[ATXScoredInfoSuggestion init](&v14, sel_init);
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_suggestion, a3);
    objc_storeStrong((id *)&v12->_featureSet, a4);
    v12->_score = a5;
  }

  return v12;
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  _QWORD v8[3];
  _QWORD v9[4];

  v9[3] = *MEMORY[0x1E0C80C00];
  v8[0] = CFSTR("suggestion");
  -[ATXInfoSuggestion dictionaryRepresentation](self->_suggestion, "dictionaryRepresentation");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = v3;
  v8[1] = CFSTR("featureSet");
  -[ATXInformationFeatureSet dictionaryRepresentation](self->_featureSet, "dictionaryRepresentation");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v9[1] = v4;
  v8[2] = CFSTR("score");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_score);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v9[2] = v5;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v9, v8, 3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)description
{
  void *v2;
  void *v3;
  void *v4;

  -[ATXScoredInfoSuggestion dictionaryRepresentation](self, "dictionaryRepresentation");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99DC8], "currentLocale");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "descriptionWithLocale:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)copyWithZone:(_NSZone *)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  v4 = (void *)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3);
  v5 = (void *)-[ATXInfoSuggestion copy](self->_suggestion, "copy");
  v6 = (void *)-[ATXInformationFeatureSet copy](self->_featureSet, "copy");
  v7 = (void *)objc_msgSend(v4, "initWithSuggestion:featureSet:score:", v5, v6, self->_score);

  return v7;
}

- (ATXInfoSuggestion)suggestion
{
  return self->_suggestion;
}

- (ATXInformationFeatureSet)featureSet
{
  return self->_featureSet;
}

- (double)score
{
  return self->_score;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_featureSet, 0);
  objc_storeStrong((id *)&self->_suggestion, 0);
}

@end
