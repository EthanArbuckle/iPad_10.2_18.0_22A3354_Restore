@implementation PHSuggestionMessageMatchingResult

- (PHSuggestionMessageMatchingResult)initWithSuggestion:(id)a3 messageContext:(id)a4
{
  id v7;
  id v8;
  PHSuggestionMessageMatchingResult *v9;
  PHSuggestionMessageMatchingResult *v10;
  uint64_t v11;
  NSMutableDictionary *scoreByCMMSuggestionMatchingType;
  objc_super v14;

  v7 = a3;
  v8 = a4;
  v14.receiver = self;
  v14.super_class = (Class)PHSuggestionMessageMatchingResult;
  v9 = -[PHSuggestionMessageMatchingResult init](&v14, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_suggestion, a3);
    objc_storeStrong((id *)&v10->_messageContext, a4);
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v11 = objc_claimAutoreleasedReturnValue();
    scoreByCMMSuggestionMatchingType = v10->_scoreByCMMSuggestionMatchingType;
    v10->_scoreByCMMSuggestionMatchingType = (NSMutableDictionary *)v11;

  }
  return v10;
}

- (void)registerMatchingType:(int64_t)a3 weight:(double)a4
{
  void *v6;
  void *v7;
  void *v8;
  double v9;
  void *v10;
  id v11;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a3);
  v11 = (id)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary objectForKeyedSubscript:](self->_scoreByCMMSuggestionMatchingType, "objectForKeyedSubscript:");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)MEMORY[0x1E0CB37E8];
  if (v6)
  {
    v8 = v6;
    objc_msgSend(v6, "doubleValue");
    objc_msgSend(v7, "numberWithDouble:", v9 + a4);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", a4);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
  }
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->_scoreByCMMSuggestionMatchingType, "setObject:forKeyedSubscript:", v10, v11);

}

- (double)scoreForSuggestionMatchingType:(int64_t)a3
{
  void *v4;
  NSMutableDictionary *scoreByCMMSuggestionMatchingType;
  void *v6;
  void *v7;
  double v8;
  double v9;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  scoreByCMMSuggestionMatchingType = self->_scoreByCMMSuggestionMatchingType;
  if (scoreByCMMSuggestionMatchingType)
  {
    -[NSMutableDictionary objectForKeyedSubscript:](scoreByCMMSuggestionMatchingType, "objectForKeyedSubscript:", v4);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v6;
    if (v6)
    {
      objc_msgSend(v6, "doubleValue");
      v9 = v8;
    }
    else
    {
      v9 = 0.0;
    }

  }
  else
  {
    v9 = 0.0;
  }

  return v9;
}

- (PHSuggestion)suggestion
{
  return self->_suggestion;
}

- (void)setSuggestion:(id)a3
{
  objc_storeStrong((id *)&self->_suggestion, a3);
}

- (PHSuggestionMessageContext)messageContext
{
  return self->_messageContext;
}

- (void)setMessageContext:(id)a3
{
  objc_storeStrong((id *)&self->_messageContext, a3);
}

- (NSMutableDictionary)scoreByCMMSuggestionMatchingType
{
  return self->_scoreByCMMSuggestionMatchingType;
}

- (void)setScoreByCMMSuggestionMatchingType:(id)a3
{
  objc_storeStrong((id *)&self->_scoreByCMMSuggestionMatchingType, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_scoreByCMMSuggestionMatchingType, 0);
  objc_storeStrong((id *)&self->_messageContext, 0);
  objc_storeStrong((id *)&self->_suggestion, 0);
}

@end
