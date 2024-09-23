@implementation DADeviceResolveOperation

- (void)invalidate
{
  _DNSServiceRef_t *addrInfoQuery;
  _DNSServiceRef_t *srvQuery;

  addrInfoQuery = self->_addrInfoQuery;
  if (addrInfoQuery)
  {
    DNSServiceRefDeallocate(addrInfoQuery);
    self->_addrInfoQuery = 0;
  }
  srvQuery = self->_srvQuery;
  if (srvQuery)
  {
    DNSServiceRefDeallocate(srvQuery);
    self->_srvQuery = 0;
  }
}

- (_DNSServiceRef_t)addrInfoQuery
{
  return self->_addrInfoQuery;
}

- (void)setAddrInfoQuery:(_DNSServiceRef_t *)a3
{
  self->_addrInfoQuery = a3;
}

- (DAEndpoint)endpoint
{
  return self->_endpoint;
}

- (void)setEndpoint:(id)a3
{
  objc_storeStrong((id *)&self->_endpoint, a3);
}

- (DADeviceResolver)resolver
{
  return self->_resolver;
}

- (void)setResolver:(id)a3
{
  objc_storeStrong((id *)&self->_resolver, a3);
}

- (_DNSServiceRef_t)srvQuery
{
  return self->_srvQuery;
}

- (void)setSrvQuery:(_DNSServiceRef_t *)a3
{
  self->_srvQuery = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_resolver, 0);
  objc_storeStrong((id *)&self->_endpoint, 0);
}

@end
