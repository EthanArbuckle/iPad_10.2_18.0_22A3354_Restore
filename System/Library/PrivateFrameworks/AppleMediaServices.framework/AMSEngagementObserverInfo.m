@implementation AMSEngagementObserverInfo

- (void)addServiceType:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[AMSEngagementObserverInfo underlyingServiceTypes](self, "underlyingServiceTypes");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addObject:", v4);

}

- (NSMutableSet)underlyingServiceTypes
{
  return self->_underlyingServiceTypes;
}

- (void)addPlacements:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[AMSEngagementObserverInfo underlyingPlacements](self, "underlyingPlacements");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "unionSet:", v4);

}

- (NSMutableSet)underlyingPlacements
{
  return self->_underlyingPlacements;
}

- (void)setDispatchQueue:(id)a3
{
  objc_storeStrong((id *)&self->_dispatchQueue, a3);
}

- (AMSEngagementObserverInfo)initWithQueue:(id)a3
{
  id v5;
  AMSEngagementObserverInfo *v6;
  AMSEngagementObserverInfo *v7;
  uint64_t v8;
  NSMutableSet *underlyingPlacements;
  uint64_t v10;
  NSMutableSet *underlyingServiceTypes;

  v5 = a3;
  v6 = -[AMSEngagementObserverInfo init](self, "init");
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_dispatchQueue, a3);
    objc_msgSend(MEMORY[0x1E0C99E20], "set");
    v8 = objc_claimAutoreleasedReturnValue();
    underlyingPlacements = v7->_underlyingPlacements;
    v7->_underlyingPlacements = (NSMutableSet *)v8;

    objc_msgSend(MEMORY[0x1E0C99E20], "set");
    v10 = objc_claimAutoreleasedReturnValue();
    underlyingServiceTypes = v7->_underlyingServiceTypes;
    v7->_underlyingServiceTypes = (NSMutableSet *)v10;

  }
  return v7;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_underlyingServiceTypes, 0);
  objc_storeStrong((id *)&self->_underlyingPlacements, 0);
  objc_storeStrong((id *)&self->_dispatchQueue, 0);
}

- (NSSet)placements
{
  void *v3;
  uint64_t v4;
  void *v5;

  -[AMSEngagementObserverInfo underlyingPlacements](self, "underlyingPlacements");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "count");

  if (v4)
  {
    -[AMSEngagementObserverInfo underlyingPlacements](self, "underlyingPlacements");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v5 = 0;
  }
  return (NSSet *)v5;
}

- (NSSet)serviceTypes
{
  void *v3;
  uint64_t v4;
  void *v5;

  -[AMSEngagementObserverInfo underlyingServiceTypes](self, "underlyingServiceTypes");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "count");

  if (v4)
  {
    -[AMSEngagementObserverInfo underlyingServiceTypes](self, "underlyingServiceTypes");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v5 = 0;
  }
  return (NSSet *)v5;
}

- (void)removePlacement:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[AMSEngagementObserverInfo underlyingPlacements](self, "underlyingPlacements");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "removeObject:", v4);

}

- (void)removeServiceType:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[AMSEngagementObserverInfo underlyingPlacements](self, "underlyingPlacements");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "removeObject:", v4);

}

- (OS_dispatch_queue)dispatchQueue
{
  return self->_dispatchQueue;
}

- (void)setUnderlyingPlacements:(id)a3
{
  objc_storeStrong((id *)&self->_underlyingPlacements, a3);
}

- (void)setUnderlyingServiceTypes:(id)a3
{
  objc_storeStrong((id *)&self->_underlyingServiceTypes, a3);
}

@end
