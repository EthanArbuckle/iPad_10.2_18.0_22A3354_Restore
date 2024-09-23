@implementation MapsSuggestionsTransportTypePreferenceCondition

- (MapsSuggestionsTransportTypePreferenceCondition)initWithName:(id)a3 requiresTransportType:(int64_t)a4
{
  MapsSuggestionsTransportTypePreferenceCondition *result;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)MapsSuggestionsTransportTypePreferenceCondition;
  result = -[MapsSuggestionsBaseCondition initWithName:](&v6, sel_initWithName_, a3);
  if (result)
    result->_requiredTransportTypePreference = a4;
  return result;
}

- (MapsSuggestionsTransportTypePreferenceCondition)initWithName:(id)a3
{
  return -[MapsSuggestionsTransportTypePreferenceCondition initWithName:requiresTransportType:](self, "initWithName:requiresTransportType:", a3, 0);
}

- (BOOL)isTrue
{
  return GEOGetUserTransportTypePreference() == self->_requiredTransportTypePreference;
}

@end
