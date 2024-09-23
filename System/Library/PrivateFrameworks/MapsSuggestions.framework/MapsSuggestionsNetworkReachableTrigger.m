@implementation MapsSuggestionsNetworkReachableTrigger

- (MapsSuggestionsNetworkReachableTrigger)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)MapsSuggestionsNetworkReachableTrigger;
  return -[MapsSuggestionsBaseTrigger initWithName:](&v3, sel_initWithName_, CFSTR("MapsSuggestionsNetworkReachableTrigger"));
}

- (void)_reachabilityChanged
{
  if (-[MapsSuggestionsNetworkReachableTrigger isTrue](self, "isTrue"))
    -[MapsSuggestionsBaseTrigger triggerMyObservers](self, "triggerMyObservers");
}

- (void)didAddFirstObserver
{
  id v3;

  objc_msgSend(MEMORY[0x1E0D27298], "sharedNetworkObserver");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addNetworkReachableObserver:selector:", self, sel__reachabilityChanged);

}

- (void)didRemoveLastObserver
{
  id v3;

  objc_msgSend(MEMORY[0x1E0D27298], "sharedNetworkObserver");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeNetworkReachableObserver:", self);

}

- (BOOL)isTrue
{
  void *v2;
  char v3;

  objc_msgSend(MEMORY[0x1E0D27298], "sharedNetworkObserver");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isNetworkReachable");

  return v3;
}

- (id)objectForJSON
{
  return MSg::jsonFor((MSg *)-[MapsSuggestionsNetworkReachableTrigger isTrue](self, "isTrue"));
}

@end
