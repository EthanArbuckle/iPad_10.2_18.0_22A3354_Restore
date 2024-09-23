@implementation DKPairingService

- (DKPairingService)init
{
  DKPairingService *v2;
  _TtC11DockKitCore25DockKitCorePairingService *v3;
  _TtC11DockKitCore25DockKitCorePairingService *ps;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)DKPairingService;
  v2 = -[DKPairingService init](&v6, sel_init);
  if (v2)
  {
    v3 = objc_alloc_init(_TtC11DockKitCore25DockKitCorePairingService);
    ps = v2->_ps;
    v2->_ps = v3;

  }
  return v2;
}

- (void)setSetupPayloadWithUrl:(id)a3
{
  -[DockKitCorePairingService setSetupPayloadWithUri:completionHandler:](self->_ps, "setSetupPayloadWithUri:completionHandler:", a3, &__block_literal_global_1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_ps, 0);
}

@end
