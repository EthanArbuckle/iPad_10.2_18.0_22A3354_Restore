@implementation ATXSleepSuggestion

- (ATXSleepSuggestion)initWithOccurence:(id)a3
{
  id v5;
  ATXSleepSuggestion *v6;
  ATXSleepSuggestion *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)ATXSleepSuggestion;
  v6 = -[ATXSleepSuggestion init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_occurrence, a3);

  return v7;
}

- (void)encodeWithCoder:(id)a3
{
  objc_msgSend(a3, "encodeObject:forKey:", self->_occurrence, CFSTR("occurrence"));
}

- (ATXSleepSuggestion)initWithCoder:(id)a3
{
  id v4;
  ATXSleepSuggestion *v5;
  uint64_t v6;
  ATXSleepSuggestionOccurrence *occurrence;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)ATXSleepSuggestion;
  v5 = -[ATXSleepSuggestion init](&v9, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("occurrence"));
    v6 = objc_claimAutoreleasedReturnValue();
    occurrence = v5->_occurrence;
    v5->_occurrence = (ATXSleepSuggestionOccurrence *)v6;

  }
  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (ATXSleepSuggestionOccurrence)occurrence
{
  return self->_occurrence;
}

- (void)setOccurrence:(id)a3
{
  objc_storeStrong((id *)&self->_occurrence, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_occurrence, 0);
}

@end
