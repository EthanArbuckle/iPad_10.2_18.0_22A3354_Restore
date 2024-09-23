@implementation MapsSuggestionsNoCellularDataCondition

- (MapsSuggestionsNoCellularDataCondition)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)MapsSuggestionsNoCellularDataCondition;
  return -[MapsSuggestionsBaseCondition initWithName:](&v3, sel_initWithName_, CFSTR("MapsSuggestionsNoCellularDataCondition"));
}

- (BOOL)isTrue
{
  void *v2;
  char v3;

  objc_msgSend(MEMORY[0x1E0D27298], "sharedNetworkObserver");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isCellConnection") ^ 1;

  return v3;
}

@end
