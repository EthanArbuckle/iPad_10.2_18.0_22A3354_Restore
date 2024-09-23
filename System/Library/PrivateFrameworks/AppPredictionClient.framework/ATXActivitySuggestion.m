@implementation ATXActivitySuggestion

- (ATXActivitySuggestion)initWithActivity:(id)a3
{
  id v5;
  ATXActivitySuggestion *v6;
  ATXActivitySuggestion *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)ATXActivitySuggestion;
  v6 = -[ATXActivitySuggestion init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_activity, a3);

  return v7;
}

- (NSString)uuidString
{
  return -[ATXActivity modeUUID](self->_activity, "modeUUID");
}

- (unint64_t)location
{
  return -[ATXActivity location](self->_activity, "location");
}

- (NSArray)triggers
{
  return -[ATXActivity triggers](self->_activity, "triggers");
}

- (NSString)suggestionUUID
{
  return -[ATXActivity suggestionUUID](self->_activity, "suggestionUUID");
}

- (unint64_t)hash
{
  return -[ATXActivity hash](self->_activity, "hash");
}

- (BOOL)isEqual:(id)a3
{
  ATXActivitySuggestion *v4;
  ATXActivitySuggestion *v5;
  BOOL v6;

  v4 = (ATXActivitySuggestion *)a3;
  v5 = v4;
  if (v4 == self)
    v6 = 1;
  else
    v6 = v4
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && -[ATXActivitySuggestion isEqualToATXActivitySuggestion:](self, "isEqualToATXActivitySuggestion:", v5);

  return v6;
}

- (BOOL)isEqualToATXActivitySuggestion:(id)a3
{
  ATXActivity *activity;
  void *v4;

  activity = self->_activity;
  objc_msgSend(a3, "activity");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(activity) = -[ATXActivity isEqual:](activity, "isEqual:", v4);

  return (char)activity;
}

- (ATXActivity)activity
{
  return self->_activity;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_activity, 0);
}

@end
