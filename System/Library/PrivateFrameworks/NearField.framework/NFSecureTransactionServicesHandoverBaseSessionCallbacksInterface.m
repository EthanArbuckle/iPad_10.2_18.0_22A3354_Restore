@implementation NFSecureTransactionServicesHandoverBaseSessionCallbacksInterface

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_protocolInterface, 0);
}

- (NSXPCInterface)protocolInterface
{
  return self->_protocolInterface;
}

- (NFSecureTransactionServicesHandoverBaseSessionCallbacksInterface)initWithProtocol:(id)a3
{
  id v4;
  NFSecureTransactionServicesHandoverBaseSessionCallbacksInterface *v5;
  uint64_t v6;
  NSXPCInterface *protocolInterface;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)NFSecureTransactionServicesHandoverBaseSessionCallbacksInterface;
  v5 = -[NFSecureTransactionServicesHandoverBaseSessionCallbacksInterface init](&v9, sel_init);
  if (v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3B50], "interfaceWithProtocol:", v4);
    v6 = objc_claimAutoreleasedReturnValue();
    protocolInterface = v5->_protocolInterface;
    v5->_protocolInterface = (NSXPCInterface *)v6;

    -[NFSecureTransactionServicesHandoverBaseSessionCallbacksInterface setupInterface](v5, "setupInterface");
  }

  return v5;
}

+ (id)interface
{
  if (qword_1ECFF6220 != -1)
    dispatch_once(&qword_1ECFF6220, &__block_literal_global_36);
  return (id)qword_1ECFF6218;
}

void __77__NFSecureTransactionServicesHandoverBaseSessionCallbacksInterface_interface__block_invoke()
{
  uint64_t v0;
  void *v1;
  NFSecureTransactionServicesHandoverBaseSessionCallbacksInterface *v2;

  v2 = -[NFSecureTransactionServicesHandoverBaseSessionCallbacksInterface initWithProtocol:]([NFSecureTransactionServicesHandoverBaseSessionCallbacksInterface alloc], "initWithProtocol:", &unk_1EE400FF0);
  -[NFSecureTransactionServicesHandoverBaseSessionCallbacksInterface protocolInterface](v2, "protocolInterface");
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)qword_1ECFF6218;
  qword_1ECFF6218 = v0;

}

@end
