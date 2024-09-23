@implementation NFSecureTransactionServicesHandoverHybridSessionCallbacksInterface

+ (id)interface
{
  if (qword_1ECFF6240 != -1)
    dispatch_once(&qword_1ECFF6240, &__block_literal_global_73);
  return (id)qword_1ECFF6238;
}

void __79__NFSecureTransactionServicesHandoverHybridSessionCallbacksInterface_interface__block_invoke()
{
  uint64_t v0;
  void *v1;
  NFSecureTransactionServicesHandoverHybridSessionCallbacksInterface *v2;

  v2 = -[NFSecureTransactionServicesHandoverHybridSessionCallbacksInterface initWithProtocol:]([NFSecureTransactionServicesHandoverHybridSessionCallbacksInterface alloc], "initWithProtocol:", &unk_1EE401220);
  -[NFSecureTransactionServicesHandoverBaseSessionCallbacksInterface protocolInterface](v2, "protocolInterface");
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)qword_1ECFF6238;
  qword_1ECFF6238 = v0;

}

- (NFSecureTransactionServicesHandoverHybridSessionCallbacksInterface)initWithProtocol:(id)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)NFSecureTransactionServicesHandoverHybridSessionCallbacksInterface;
  return -[NFSecureTransactionServicesHandoverBaseSessionCallbacksInterface initWithProtocol:](&v4, sel_initWithProtocol_, a3);
}

- (void)setupInterface
{
  void *v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)NFSecureTransactionServicesHandoverHybridSessionCallbacksInterface;
  -[NFSecureTransactionServicesHandoverBaseSessionCallbacksInterface setupInterface](&v4, sel_setupInterface);
  -[NFSecureTransactionServicesHandoverBaseSessionCallbacksInterface protocolInterface](self, "protocolInterface");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  SetNFTNEPCallbackProtocolConformance(v3);

}

@end
