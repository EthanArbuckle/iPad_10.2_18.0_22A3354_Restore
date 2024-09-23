@implementation MapsSuggestionsCurrentLocationCondition

- (MapsSuggestionsCurrentLocationCondition)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)MapsSuggestionsCurrentLocationCondition;
  return -[MapsSuggestionsBaseCondition initWithName:](&v3, sel_initWithName_, CFSTR("MapsSuggestionsCurrentLocationCondition"));
}

- (BOOL)isTrue
{
  void *v2;
  BOOL v3;

  MapsSuggestionsCurrentBestLocation();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2 != 0;

  return v3;
}

@end
