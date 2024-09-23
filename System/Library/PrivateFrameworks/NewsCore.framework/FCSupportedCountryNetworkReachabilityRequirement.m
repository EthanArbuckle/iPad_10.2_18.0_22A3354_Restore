@implementation FCSupportedCountryNetworkReachabilityRequirement

- (BOOL)isSatisfied
{
  return self->_satisfied;
}

- (void)setObserver:(id)a3
{
  objc_storeWeak((id *)&self->observer, a3);
}

- (FCSupportedCountryNetworkReachabilityRequirement)init
{
  FCSupportedCountryNetworkReachabilityRequirement *v2;
  FCSupportedCountryNetworkReachabilityRequirement *v3;
  void *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)FCSupportedCountryNetworkReachabilityRequirement;
  v2 = -[FCSupportedCountryNetworkReachabilityRequirement init](&v6, sel_init);
  v3 = v2;
  if (v2)
  {
    -[FCSupportedCountryNetworkReachabilityRequirement _update](v2, "_update");
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "addObserver:selector:name:object:", v3, sel__update, *MEMORY[0x1E0D26550], 0);

  }
  return v3;
}

- (void)_update
{
  int v3;
  int satisfied;
  id v5;

  v3 = +[FCGeoUtilities isRunningInSupportedRegion](FCGeoUtilities, "isRunningInSupportedRegion");
  satisfied = self->_satisfied;
  self->_satisfied = v3;
  if (satisfied != v3)
  {
    -[FCSupportedCountryNetworkReachabilityRequirement observer](self, "observer");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "networkReachabilityRequirementDidBecomeDirty:", self);

  }
}

- (FCNetworkReachabilityRequirementObserving)observer
{
  return (FCNetworkReachabilityRequirementObserving *)objc_loadWeakRetained((id *)&self->observer);
}

- (int64_t)offlineReason
{
  return 3;
}

- (void)setSatisfied:(BOOL)a3
{
  self->_satisfied = a3;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->observer);
}

@end
