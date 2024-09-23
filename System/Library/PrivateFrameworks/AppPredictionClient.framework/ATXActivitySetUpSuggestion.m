@implementation ATXActivitySetUpSuggestion

- (ATXActivitySetUpSuggestion)initWithActivity:(id)a3
{
  id v5;
  ATXActivitySetUpSuggestion *v6;
  ATXActivitySetUpSuggestion *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)ATXActivitySetUpSuggestion;
  v6 = -[ATXActivitySetUpSuggestion init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_activity, a3);

  return v7;
}

- (unint64_t)activityType
{
  return -[ATXActivity activityType](self->_activity, "activityType");
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

- (BOOL)allowsSetUpWithoutConfiguration
{
  return 0;
}

- (unint64_t)hash
{
  return -[ATXActivity hash](self->_activity, "hash");
}

- (BOOL)isEqual:(id)a3
{
  ATXActivitySetUpSuggestion *v4;
  ATXActivitySetUpSuggestion *v5;
  BOOL v6;

  v4 = (ATXActivitySetUpSuggestion *)a3;
  v5 = v4;
  if (v4 == self)
    v6 = 1;
  else
    v6 = v4
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && -[ATXActivitySetUpSuggestion isEqualToATXActivitySetUpSuggestion:](self, "isEqualToATXActivitySetUpSuggestion:", v5);

  return v6;
}

- (BOOL)isEqualToATXActivitySetUpSuggestion:(id)a3
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
