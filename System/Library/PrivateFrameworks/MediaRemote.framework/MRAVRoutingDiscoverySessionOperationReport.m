@implementation MRAVRoutingDiscoverySessionOperationReport

- (id)description
{
  id v3;

  v3 = objc_alloc_init(MEMORY[0x1E0CB37A0]);
  objc_msgSend(v3, "appendFormat:", CFSTR("\n%@\n"), objc_opt_class());
  objc_msgSend(v3, "appendFormat:", CFSTR("_________________________\n"));
  if (-[NSArray count](self->_discoveredOutputDeviceUIDs, "count"))
    objc_msgSend(v3, "appendFormat:", CFSTR("Discovered %lu device(s)s: %@\n"), -[NSArray count](self->_discoveredOutputDeviceUIDs, "count"), self->_discoveredOutputDeviceUIDs);
  if (-[NSArray count](self->_undiscoveredOutputDeviceUIDs, "count"))
    objc_msgSend(v3, "appendFormat:", CFSTR("Undiscovered %lu device(s): %@"), -[NSArray count](self->_undiscoveredOutputDeviceUIDs, "count"), self->_undiscoveredOutputDeviceUIDs);
  return v3;
}

- (NSError)error
{
  return self->_error;
}

- (void)setError:(id)a3
{
  objc_storeStrong((id *)&self->_error, a3);
}

- (NSArray)discoveredOutputDeviceUIDs
{
  return self->_discoveredOutputDeviceUIDs;
}

- (void)setDiscoveredOutputDeviceUIDs:(id)a3
{
  objc_storeStrong((id *)&self->_discoveredOutputDeviceUIDs, a3);
}

- (NSArray)undiscoveredOutputDeviceUIDs
{
  return self->_undiscoveredOutputDeviceUIDs;
}

- (void)setUndiscoveredOutputDeviceUIDs:(id)a3
{
  objc_storeStrong((id *)&self->_undiscoveredOutputDeviceUIDs, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_undiscoveredOutputDeviceUIDs, 0);
  objc_storeStrong((id *)&self->_discoveredOutputDeviceUIDs, 0);
  objc_storeStrong((id *)&self->_error, 0);
}

@end
