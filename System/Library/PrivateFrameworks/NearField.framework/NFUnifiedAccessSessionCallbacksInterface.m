@implementation NFUnifiedAccessSessionCallbacksInterface

+ (id)interface
{
  if (qword_1ECFF61A0 != -1)
    dispatch_once(&qword_1ECFF61A0, &__block_literal_global_27);
  return (id)qword_1ECFF6198;
}

void __53__NFUnifiedAccessSessionCallbacksInterface_interface__block_invoke()
{
  uint64_t v0;
  void *v1;
  NFUnifiedAccessSessionCallbacksInterface *v2;

  v2 = -[NFSecureTransactionServicesHandoverBaseSessionCallbacksInterface initWithProtocol:]([NFUnifiedAccessSessionCallbacksInterface alloc], "initWithProtocol:", &unk_1EE40DE18);
  -[NFSecureTransactionServicesHandoverBaseSessionCallbacksInterface protocolInterface](v2, "protocolInterface");
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)qword_1ECFF6198;
  qword_1ECFF6198 = v0;

}

- (void)setupInterface
{
  objc_super v2;

  v2.receiver = self;
  v2.super_class = (Class)NFUnifiedAccessSessionCallbacksInterface;
  -[NFSecureTransactionServicesHandoverBaseSessionCallbacksInterface setupInterface](&v2, sel_setupInterface);
}

@end
