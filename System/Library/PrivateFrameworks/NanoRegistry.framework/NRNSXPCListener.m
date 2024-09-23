@implementation NRNSXPCListener

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  id v5;
  NRNSXPCConnection *v6;
  id WeakRetained;

  v5 = a4;
  v6 = -[NRNSXPCConnection initWithConnection:]([NRNSXPCConnection alloc], "initWithConnection:", v5);

  WeakRetained = objc_loadWeakRetained((id *)&self->_listenerDelegate);
  LOBYTE(self) = objc_msgSend(WeakRetained, "listener:shouldAcceptNewConnection:", self, v6);

  return (char)self;
}

- (void)setDelegate:(id)a3
{
  objc_super v5;
  objc_super v6;

  objc_storeWeak((id *)&self->_listenerDelegate, a3);
  if (a3)
    -[NRNSXPCListener setDelegate:](&v6, sel_setDelegate_, self, v5.receiver, v5.super_class, self, NRNSXPCListener);
  else
    -[NRNSXPCListener setDelegate:](&v5, sel_setDelegate_, 0, self, NRNSXPCListener, v6.receiver, v6.super_class);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_listenerDelegate);
}

@end
