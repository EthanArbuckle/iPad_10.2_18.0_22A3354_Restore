@implementation MapsSuggestionsAirportArrivalBudget

- (MapsSuggestionsAirportArrivalBudget)init
{
  MapsSuggestionsAirportArrivalBudget *v2;
  uint64_t Integer;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)MapsSuggestionsAirportArrivalBudget;
  v2 = -[MapsSuggestionsBudget initWithDelegate:name:](&v5, sel_initWithDelegate_name_, self, CFSTR("MapsSuggestionsAirportArrivalBudget"));
  if (v2)
  {
    Integer = GEOConfigGetInteger();
    GEOConfigGetDouble();
    -[MapsSuggestionsBudget addRollingWindowOfCount:perTimeInterval:name:](v2, "addRollingWindowOfCount:perTimeInterval:name:", Integer, CFSTR("window"));
  }
  return v2;
}

- (id)readBudgetState
{
  return (id)GEOConfigGetDictionary();
}

- (void)writeBudgetState:(id)a3
{
  GEOConfigSetDictionary();
}

@end
