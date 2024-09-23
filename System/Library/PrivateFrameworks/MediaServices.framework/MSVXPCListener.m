@implementation MSVXPCListener

- (MSVXPCListener)initWithMachServiceName:(id)a3
{
  id v5;
  MSVXPCListener *v6;
  uint64_t v7;
  NSXPCListener *localProxy;
  objc_super v10;

  v5 = a3;
  v10.receiver = self;
  v10.super_class = (Class)MSVXPCListener;
  v6 = -[MSVXPCListener initWithMachServiceName:](&v10, sel_initWithMachServiceName_, v5);
  if (v6)
  {
    objc_msgSend(MEMORY[0x1E0CB3B58], "anonymousListener");
    v7 = objc_claimAutoreleasedReturnValue();
    localProxy = v6->_localProxy;
    v6->_localProxy = (NSXPCListener *)v7;

    objc_storeStrong((id *)&v6->_registeredServiceName, a3);
    +[MSVXPCConnection registerLocalListener:withServiceName:](MSVXPCConnection, "registerLocalListener:withServiceName:", v6, v6->_registeredServiceName);
  }

  return v6;
}

- (id)localProxy
{
  return self->_localProxy;
}

- (void)dealloc
{
  objc_super v3;

  -[NSXPCListener invalidate](self->_localProxy, "invalidate");
  +[MSVXPCConnection unregisterLocalListerWithName:](MSVXPCConnection, "unregisterLocalListerWithName:", self->_registeredServiceName);
  v3.receiver = self;
  v3.super_class = (Class)MSVXPCListener;
  -[MSVXPCListener dealloc](&v3, sel_dealloc);
}

- (void)activate
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)MSVXPCListener;
  -[MSVXPCListener activate](&v3, sel_activate);
  -[NSXPCListener activate](self->_localProxy, "activate");
}

- (void)invalidate
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)MSVXPCListener;
  -[MSVXPCListener invalidate](&v3, sel_invalidate);
  -[NSXPCListener invalidate](self->_localProxy, "invalidate");
}

- (void)resume
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)MSVXPCListener;
  -[MSVXPCListener resume](&v3, sel_resume);
  -[NSXPCListener resume](self->_localProxy, "resume");
}

- (void)suspend
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)MSVXPCListener;
  -[MSVXPCListener suspend](&v3, sel_suspend);
  -[NSXPCListener suspend](self->_localProxy, "suspend");
}

- (void)setDelegate:(id)a3
{
  id v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)MSVXPCListener;
  v4 = a3;
  -[MSVXPCListener setDelegate:](&v5, sel_setDelegate_, v4);
  -[NSXPCListener setDelegate:](self->_localProxy, "setDelegate:", v4, v5.receiver, v5.super_class);

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_localProxy, 0);
  objc_storeStrong((id *)&self->_registeredServiceName, 0);
}

@end
