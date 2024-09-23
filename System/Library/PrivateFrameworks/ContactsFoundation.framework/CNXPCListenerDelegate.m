@implementation CNXPCListenerDelegate

- (CNXPCListenerDelegate)initWithWithExportedObject:(id)a3 exportedInterfaceProtocol:(id)a4
{
  id v7;
  id v8;
  CNXPCListenerDelegate *v9;
  CNXPCListenerDelegate *v10;
  CNXPCListenerDelegate *v11;
  objc_super v13;

  v7 = a3;
  v8 = a4;
  v13.receiver = self;
  v13.super_class = (Class)CNXPCListenerDelegate;
  v9 = -[CNXPCListenerDelegate init](&v13, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong(&v9->_exportedObject, a3);
    objc_storeStrong((id *)&v10->_exportedInterfaceProtocol, a4);
    v11 = v10;
  }

  return v10;
}

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  id v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  id v10;

  v5 = a4;
  objc_msgSend(v5, "setExportedObject:", self->_exportedObject);
  objc_msgSend(MEMORY[0x1E0CB3B50], "interfaceWithProtocol:", self->_exportedInterfaceProtocol);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setExportedInterface:", v6);

  objc_msgSend(v5, "resume");
  v7 = self->_exportedObject;
  v8 = &unk_1EE192300;
  if (objc_msgSend(v7, "conformsToProtocol:", v8))
    v9 = v7;
  else
    v9 = 0;
  v10 = v9;

  if (v10)
    objc_msgSend(v10, "setAppConnection:", v5);

  return 1;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_exportedInterfaceProtocol, 0);
  objc_storeStrong(&self->_exportedObject, 0);
}

@end
