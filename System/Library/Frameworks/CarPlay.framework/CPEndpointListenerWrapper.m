@implementation CPEndpointListenerWrapper

- (CPEndpointListenerWrapper)initWithXPCEndpoint:(id)a3
{
  id v5;
  CPEndpointListenerWrapper *v6;
  CPEndpointListenerWrapper *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)CPEndpointListenerWrapper;
  v6 = -[CPEndpointListenerWrapper init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_endpoint, a3);

  return v7;
}

- (CPEndpointListenerWrapper)initWithXPCDictionary:(id)a3
{
  id v4;
  CPEndpointListenerWrapper *v5;
  uint64_t v6;
  OS_xpc_object *endpoint;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)CPEndpointListenerWrapper;
  v5 = -[CPEndpointListenerWrapper init](&v9, sel_init);
  if (v5)
  {
    xpc_dictionary_get_value(v4, "endpoint");
    v6 = objc_claimAutoreleasedReturnValue();
    endpoint = v5->_endpoint;
    v5->_endpoint = (OS_xpc_object *)v6;

  }
  return v5;
}

- (void)encodeWithXPCDictionary:(id)a3
{
  xpc_dictionary_set_value(a3, "endpoint", self->_endpoint);
}

- (OS_xpc_object)endpoint
{
  return self->_endpoint;
}

- (void)setEndpoint:(id)a3
{
  objc_storeStrong((id *)&self->_endpoint, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_endpoint, 0);
}

@end
