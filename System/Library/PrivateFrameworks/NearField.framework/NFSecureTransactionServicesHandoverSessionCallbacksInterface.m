@implementation NFSecureTransactionServicesHandoverSessionCallbacksInterface

void __73__NFSecureTransactionServicesHandoverSessionCallbacksInterface_interface__block_invoke()
{
  uint64_t v0;
  void *v1;
  NFSecureTransactionServicesHandoverSessionCallbacksInterface *v2;

  v2 = -[NFSecureTransactionServicesHandoverSessionCallbacksInterface initWithProtocol:]([NFSecureTransactionServicesHandoverSessionCallbacksInterface alloc], "initWithProtocol:", &unk_1EE4085C8);
  -[NFSecureTransactionServicesHandoverBaseSessionCallbacksInterface protocolInterface](v2, "protocolInterface");
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)qword_1ECFF61F8;
  qword_1ECFF61F8 = v0;

}

- (void)setupInterface
{
  void *v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)NFSecureTransactionServicesHandoverSessionCallbacksInterface;
  -[NFSecureTransactionServicesHandoverBaseSessionCallbacksInterface setupInterface](&v4, sel_setupInterface);
  -[NFSecureTransactionServicesHandoverBaseSessionCallbacksInterface protocolInterface](self, "protocolInterface");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  SetNFTNEPCallbackProtocolConformance(v3);

}

- (NFSecureTransactionServicesHandoverSessionCallbacksInterface)initWithProtocol:(id)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)NFSecureTransactionServicesHandoverSessionCallbacksInterface;
  return -[NFSecureTransactionServicesHandoverBaseSessionCallbacksInterface initWithProtocol:](&v4, sel_initWithProtocol_, a3);
}

+ (id)interface
{
  if (qword_1ECFF6200 != -1)
    dispatch_once(&qword_1ECFF6200, &__block_literal_global_46);
  return (id)qword_1ECFF61F8;
}

@end
