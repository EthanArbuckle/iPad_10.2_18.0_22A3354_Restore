@implementation NFSecureTransactionServicesHandoverSessionInterface

void __64__NFSecureTransactionServicesHandoverSessionInterface_interface__block_invoke()
{
  uint64_t v0;
  void *v1;
  NFSecureTransactionServicesHandoverSessionInterface *v2;

  v2 = -[NFSecureTransactionServicesHandoverSessionInterface initWithProtocol:]([NFSecureTransactionServicesHandoverSessionInterface alloc], "initWithProtocol:", &unk_1EE40DFF8);
  -[NFSecureTransactionServicesHandoverBaseSessionInterface protocolInterface](v2, "protocolInterface");
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)_MergedGlobals_17;
  _MergedGlobals_17 = v0;

}

- (NFSecureTransactionServicesHandoverSessionInterface)initWithProtocol:(id)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)NFSecureTransactionServicesHandoverSessionInterface;
  return -[NFSecureTransactionServicesHandoverBaseSessionInterface initWithProtocol:](&v4, sel_initWithProtocol_, a3);
}

- (void)setupInterface
{
  void *v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)NFSecureTransactionServicesHandoverSessionInterface;
  -[NFSecureTransactionServicesHandoverBaseSessionInterface setupInterface](&v4, sel_setupInterface);
  -[NFSecureTransactionServicesHandoverBaseSessionInterface protocolInterface](self, "protocolInterface");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  SetNFTNEPProtocolConformance(v3);

}

+ (id)interface
{
  if (qword_1ECFF61F0 != -1)
    dispatch_once(&qword_1ECFF61F0, &__block_literal_global_3);
  return (id)_MergedGlobals_17;
}

@end
