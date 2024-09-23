@implementation NFSecureTransactionServicesHandoverBaseSessionInterface

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_protocolInterface, 0);
}

- (NSXPCInterface)protocolInterface
{
  return self->_protocolInterface;
}

- (NFSecureTransactionServicesHandoverBaseSessionInterface)initWithProtocol:(id)a3
{
  id v4;
  NFSecureTransactionServicesHandoverBaseSessionInterface *v5;
  uint64_t v6;
  NSXPCInterface *protocolInterface;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)NFSecureTransactionServicesHandoverBaseSessionInterface;
  v5 = -[NFSecureTransactionServicesHandoverBaseSessionInterface init](&v9, sel_init);
  if (v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3B50], "interfaceWithProtocol:", v4);
    v6 = objc_claimAutoreleasedReturnValue();
    protocolInterface = v5->_protocolInterface;
    v5->_protocolInterface = (NSXPCInterface *)v6;

    -[NFSecureTransactionServicesHandoverBaseSessionInterface setupInterface](v5, "setupInterface");
  }

  return v5;
}

+ (id)interface
{
  if (qword_1ECFF6210 != -1)
    dispatch_once(&qword_1ECFF6210, &__block_literal_global_5);
  return (id)_MergedGlobals_18;
}

void __68__NFSecureTransactionServicesHandoverBaseSessionInterface_interface__block_invoke()
{
  uint64_t v0;
  void *v1;
  NFSecureTransactionServicesHandoverBaseSessionInterface *v2;

  v2 = -[NFSecureTransactionServicesHandoverBaseSessionInterface initWithProtocol:]([NFSecureTransactionServicesHandoverBaseSessionInterface alloc], "initWithProtocol:", &unk_1EE409E70);
  -[NFSecureTransactionServicesHandoverBaseSessionInterface protocolInterface](v2, "protocolInterface");
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)_MergedGlobals_18;
  _MergedGlobals_18 = v0;

}

@end
