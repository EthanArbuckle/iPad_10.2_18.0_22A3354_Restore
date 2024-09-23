@implementation HAPDiscoveredBTLEAccessoryServerTuple

- (HAPAccessoryServerBTLE)accessoryServer
{
  return self->_accessoryServer;
}

- (double)lastSeen
{
  return self->_lastSeen;
}

- (void)setLastSeen:(double)a3
{
  self->_lastSeen = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_accessoryServer, 0);
}

+ (id)discoveredAccessoryServerTupleWithAccessoryServer:(id)a3
{
  HAPAccessoryServerBTLE *v3;
  HAPDiscoveredBTLEAccessoryServerTuple *v4;
  HAPAccessoryServerBTLE *accessoryServer;

  v3 = (HAPAccessoryServerBTLE *)a3;
  v4 = objc_alloc_init(HAPDiscoveredBTLEAccessoryServerTuple);
  accessoryServer = v4->_accessoryServer;
  v4->_accessoryServer = v3;

  -[HAPDiscoveredBTLEAccessoryServerTuple setLastSeen:](v4, "setLastSeen:", CFAbsoluteTimeGetCurrent());
  return v4;
}

@end
