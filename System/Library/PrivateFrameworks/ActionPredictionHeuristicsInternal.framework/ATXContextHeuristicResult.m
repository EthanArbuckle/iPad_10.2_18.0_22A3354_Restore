@implementation ATXContextHeuristicResult

- (ATXContextHeuristicResult)init
{
  void *v3;
  void *v4;
  ATXContextHeuristicResult *v5;

  objc_msgSend(MEMORY[0x1E0C99D20], "array");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E60], "set");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[ATXContextHeuristicResult initWithSuggestions:additionalRefreshTriggers:](self, "initWithSuggestions:additionalRefreshTriggers:", v3, v4);

  return v5;
}

- (ATXContextHeuristicResult)initWithSuggestions:(id)a3 additionalRefreshTriggers:(id)a4
{
  id v6;
  id v7;
  ATXContextHeuristicResult *v8;
  uint64_t v9;
  NSArray *suggestions;
  uint64_t v11;
  NSSet *additionalRefreshTriggers;
  objc_super v14;

  v6 = a3;
  v7 = a4;
  v14.receiver = self;
  v14.super_class = (Class)ATXContextHeuristicResult;
  v8 = -[ATXContextHeuristicResult init](&v14, sel_init);
  if (v8)
  {
    v9 = objc_msgSend(v6, "copy");
    suggestions = v8->_suggestions;
    v8->_suggestions = (NSArray *)v9;

    v11 = objc_msgSend(v7, "copy");
    additionalRefreshTriggers = v8->_additionalRefreshTriggers;
    v8->_additionalRefreshTriggers = (NSSet *)v11;

  }
  return v8;
}

- (NSArray)suggestions
{
  return self->_suggestions;
}

- (NSSet)additionalRefreshTriggers
{
  return self->_additionalRefreshTriggers;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_additionalRefreshTriggers, 0);
  objc_storeStrong((id *)&self->_suggestions, 0);
}

@end
