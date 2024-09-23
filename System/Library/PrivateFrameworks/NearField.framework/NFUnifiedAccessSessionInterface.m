@implementation NFUnifiedAccessSessionInterface

+ (id)interface
{
  if (qword_1ECFF6190 != -1)
    dispatch_once(&qword_1ECFF6190, &__block_literal_global_0);
  return (id)_MergedGlobals_14;
}

void __44__NFUnifiedAccessSessionInterface_interface__block_invoke()
{
  uint64_t v0;
  void *v1;
  NFUnifiedAccessSessionInterface *v2;

  v2 = -[NFSecureTransactionServicesHandoverBaseSessionInterface initWithProtocol:]([NFUnifiedAccessSessionInterface alloc], "initWithProtocol:", &unk_1EE40DDB8);
  -[NFSecureTransactionServicesHandoverBaseSessionInterface protocolInterface](v2, "protocolInterface");
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)_MergedGlobals_14;
  _MergedGlobals_14 = v0;

}

- (void)setupInterface
{
  objc_super v2;

  v2.receiver = self;
  v2.super_class = (Class)NFUnifiedAccessSessionInterface;
  -[NFSecureTransactionServicesHandoverBaseSessionInterface setupInterface](&v2, sel_setupInterface);
}

@end
