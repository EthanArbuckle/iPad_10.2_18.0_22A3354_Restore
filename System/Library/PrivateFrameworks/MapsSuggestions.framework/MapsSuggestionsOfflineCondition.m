@implementation MapsSuggestionsOfflineCondition

- (MapsSuggestionsOfflineCondition)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)MapsSuggestionsOfflineCondition;
  return -[MapsSuggestionsBaseCondition initWithName:](&v3, sel_initWithName_, CFSTR("MapsSuggestionsOfflineCondition"));
}

- (BOOL)isTrue
{
  void *v2;
  char v3;

  objc_msgSend(MEMORY[0x1E0D272C0], "shared");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isUsingOffline");

  return v3;
}

@end
