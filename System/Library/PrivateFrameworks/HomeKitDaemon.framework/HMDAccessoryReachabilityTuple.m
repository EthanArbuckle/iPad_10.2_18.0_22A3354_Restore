@implementation HMDAccessoryReachabilityTuple

- (BOOL)isEqual:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  -[HMDAccessoryReachabilityTuple accessoryUUID](self, "accessoryUUID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "accessoryUUID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  LOBYTE(v4) = objc_msgSend(v5, "isEqual:", v6);
  return (char)v4;
}

- (unint64_t)hash
{
  void *v2;
  unint64_t v3;

  -[HMDAccessoryReachabilityTuple accessoryUUID](self, "accessoryUUID");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "hash");

  return v3;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  v3 = (void *)MEMORY[0x24BDD17C8];
  -[HMDAccessoryReachabilityTuple accessoryUUID](self, "accessoryUUID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDAccessoryReachabilityTuple previouslySentReachability](self, "previouslySentReachability");
  HMFBooleanToString();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDAccessoryReachabilityTuple currentReachability](self, "currentReachability");
  HMFBooleanToString();
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("AccessoryUUID: %@, initialReachability: %@, currentReachability: %@"), v4, v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  -[HMDAccessoryReachabilityTuple previouslySentSuspendedState](self, "previouslySentSuspendedState");
  HAPAccessorySuspendedStateDescription();
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDAccessoryReachabilityTuple currentSuspendedState](self, "currentSuspendedState");
  HAPAccessorySuspendedStateDescription();
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "stringByAppendingFormat:", CFSTR(", initialSuspendedState: %@, currentSuspendedState: '%@'"), v8, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (NSString)accessoryUUID
{
  return self->_accessoryUUID;
}

- (void)setAccessoryUUID:(id)a3
{
  objc_storeStrong((id *)&self->_accessoryUUID, a3);
}

- (BOOL)previouslySentReachability
{
  return self->_previouslySentReachability;
}

- (void)setPreviouslySentReachability:(BOOL)a3
{
  self->_previouslySentReachability = a3;
}

- (BOOL)currentReachability
{
  return self->_currentReachability;
}

- (void)setCurrentReachability:(BOOL)a3
{
  self->_currentReachability = a3;
}

- (unint64_t)previouslySentSuspendedState
{
  return self->_previouslySentSuspendedState;
}

- (void)setPreviouslySentSuspendedState:(unint64_t)a3
{
  self->_previouslySentSuspendedState = a3;
}

- (unint64_t)currentSuspendedState
{
  return self->_currentSuspendedState;
}

- (void)setCurrentSuspendedState:(unint64_t)a3
{
  self->_currentSuspendedState = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_accessoryUUID, 0);
}

+ (id)tupleWithAccessoryUUID:(id)a3 reachable:(BOOL)a4
{
  _BOOL8 v4;
  id v5;
  HMDAccessoryReachabilityTuple *v6;

  v4 = a4;
  v5 = a3;
  v6 = objc_alloc_init(HMDAccessoryReachabilityTuple);
  -[HMDAccessoryReachabilityTuple setAccessoryUUID:](v6, "setAccessoryUUID:", v5);

  -[HMDAccessoryReachabilityTuple setPreviouslySentReachability:](v6, "setPreviouslySentReachability:", v4 ^ 1);
  -[HMDAccessoryReachabilityTuple setCurrentReachability:](v6, "setCurrentReachability:", v4);
  return v6;
}

@end
