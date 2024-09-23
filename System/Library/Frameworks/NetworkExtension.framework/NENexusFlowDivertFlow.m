@implementation NENexusFlowDivertFlow

- (void)dealloc
{
  _NEFlow *flowDivertFlow;
  objc_super v4;

  if (self)
  {
    flowDivertFlow = self->_flowDivertFlow;
    if (flowDivertFlow)
    {
      CFRelease(flowDivertFlow);
      self->_flowDivertFlow = 0;
    }
  }
  v4.receiver = self;
  v4.super_class = (Class)NENexusFlowDivertFlow;
  -[NENexusFlow dealloc](&v4, sel_dealloc);
}

- (id)endpoint
{
  if (self)
    self = (NENexusFlowDivertFlow *)objc_getProperty(self, a2, 48, 1);
  return self;
}

- (id)parameters
{
  if (self)
    self = (NENexusFlowDivertFlow *)objc_getProperty(self, a2, 56, 1);
  return self;
}

- (id)clientIdentifier
{
  if (self)
    self = (NENexusFlowDivertFlow *)objc_getProperty(self, a2, 40, 1);
  return self;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_internalParameters, 0);
  objc_storeStrong((id *)&self->_internalEndpoint, 0);
  objc_storeStrong((id *)&self->_clientID, 0);
}

@end
