@implementation LNXPCListenerEndpointContainer

- (NSXPCListenerEndpoint)listenerEndpoint
{
  return (NSXPCListenerEndpoint *)XPCListenerEndpointContainer.listenerEndpoint.getter();
}

- (void)setListenerEndpoint:(id)a3
{
  id v4;
  LNXPCListenerEndpointContainer *v5;

  v4 = a3;
  v5 = self;
  XPCListenerEndpointContainer.listenerEndpoint.setter(v4);

}

- (NSData)auditTokenData
{
  uint64_t v2;
  unint64_t v3;
  unint64_t v4;
  void *v5;

  v2 = XPCListenerEndpointContainer.auditTokenData.getter();
  v4 = v3;
  v5 = (void *)sub_2281A66C4();
  sub_227EC1FD4(v2, v4);
  return (NSData *)v5;
}

- (void)setAuditTokenData:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  LNXPCListenerEndpointContainer *v8;

  v4 = a3;
  v8 = self;
  v5 = sub_2281A66DC();
  v7 = v6;

  XPCListenerEndpointContainer.auditTokenData.setter(v5, v7);
}

- (LNAction)resolvedAction
{
  return (LNAction *)XPCListenerEndpointContainer.resolvedAction.getter();
}

- (void)setResolvedAction:(id)a3
{
  id v4;
  LNXPCListenerEndpointContainer *v5;

  v4 = a3;
  v5 = self;
  XPCListenerEndpointContainer.resolvedAction.setter(v4);

}

- (LNXPCListenerEndpointContainer)init
{
  XPCListenerEndpointContainer.init()();
}

- (void).cxx_destruct
{

  sub_227EC1FD4(*(uint64_t *)((char *)&self->super.isa + OBJC_IVAR___LNXPCListenerEndpointContainer_auditTokenData), *(_QWORD *)&self->listenerEndpoint[OBJC_IVAR___LNXPCListenerEndpointContainer_auditTokenData]);
}

@end
