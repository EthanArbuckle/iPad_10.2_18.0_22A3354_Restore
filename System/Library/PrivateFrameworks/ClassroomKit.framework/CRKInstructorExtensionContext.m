@implementation CRKInstructorExtensionContext

+ (id)_extensionAuxiliaryVendorProtocol
{
  if (_extensionAuxiliaryVendorProtocol_onceToken_0 != -1)
    dispatch_once(&_extensionAuxiliaryVendorProtocol_onceToken_0, &__block_literal_global_39);
  return (id)_extensionAuxiliaryVendorProtocol_vendorInterface;
}

void __66__CRKInstructorExtensionContext__extensionAuxiliaryVendorProtocol__block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x24BDD1990], "interfaceWithProtocol:", &unk_255025B68);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)_extensionAuxiliaryVendorProtocol_vendorInterface;
  _extensionAuxiliaryVendorProtocol_vendorInterface = v0;

}

+ (id)_extensionAuxiliaryHostProtocol
{
  if (_extensionAuxiliaryHostProtocol_onceToken_0 != -1)
    dispatch_once(&_extensionAuxiliaryHostProtocol_onceToken_0, &__block_literal_global_44);
  return (id)_extensionAuxiliaryHostProtocol_hostInterface;
}

void __64__CRKInstructorExtensionContext__extensionAuxiliaryHostProtocol__block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x24BDD1990], "interfaceWithProtocol:", &unk_255025690);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)_extensionAuxiliaryHostProtocol_hostInterface;
  _extensionAuxiliaryHostProtocol_hostInterface = v0;

}

- (void)listenerEndpointWithCompletion:(id)a3
{
  id v4;
  void *v5;
  NSXPCListener *v6;
  NSXPCListener *mListener;
  id v8;

  v4 = a3;
  v8 = v4;
  if (!self->mListener)
  {
    objc_msgSend(MEMORY[0x24BDD1998], "anonymousListener");
    v6 = (NSXPCListener *)objc_claimAutoreleasedReturnValue();
    mListener = self->mListener;
    self->mListener = v6;

    -[NSXPCListener setDelegate:](self->mListener, "setDelegate:", self);
    -[NSXPCListener resume](self->mListener, "resume");
    v4 = v8;
    if (!v8)
      goto LABEL_4;
    goto LABEL_3;
  }
  if (v4)
  {
LABEL_3:
    -[NSXPCListener endpoint](self->mListener, "endpoint");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, void *))v8 + 2))(v8, v5);

    v4 = v8;
  }
LABEL_4:

}

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  objc_class *v5;
  id v6;
  void *v7;
  void *v8;
  char v9;
  void *v10;

  v5 = (objc_class *)MEMORY[0x24BE2C7B0];
  v6 = a4;
  v7 = (void *)objc_msgSend([v5 alloc], "initWithXPCConnection:", v6);

  -[CRKInstructorExtensionContext _principalObject](self, "_principalObject");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_opt_respondsToSelector();

  if ((v9 & 1) != 0)
  {
    -[CRKInstructorExtensionContext _principalObject](self, "_principalObject");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "didAcceptAdminTransport:", v7);

  }
  else
  {
    objc_msgSend(v7, "invalidate");
  }

  return v9 & 1;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->mListener, 0);
}

@end
