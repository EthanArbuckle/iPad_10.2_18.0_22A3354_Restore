@implementation NFSecureTransactionServicesHandoverHybridSessionInterface

+ (id)interface
{
  if (qword_1ECFF6230 != -1)
    dispatch_once(&qword_1ECFF6230, &__block_literal_global_7);
  return (id)_MergedGlobals_19;
}

void __70__NFSecureTransactionServicesHandoverHybridSessionInterface_interface__block_invoke()
{
  uint64_t v0;
  void *v1;
  id v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  void *v6;
  NFSecureTransactionServicesHandoverHybridSessionInterface *v7;

  v7 = -[NFSecureTransactionServicesHandoverHybridSessionInterface initWithProtocol:]([NFSecureTransactionServicesHandoverHybridSessionInterface alloc], "initWithProtocol:", &unk_1EE40E118);
  -[NFSecureTransactionServicesHandoverBaseSessionInterface protocolInterface](v7, "protocolInterface");
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)_MergedGlobals_19;
  _MergedGlobals_19 = v0;

  v2 = objc_alloc(MEMORY[0x1E0C99E60]);
  v3 = objc_opt_class();
  v4 = objc_opt_class();
  v5 = (void *)objc_msgSend(v2, "initWithObjects:", v3, v4, objc_opt_class(), 0);
  v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E60]), "initWithObjects:", objc_opt_class(), 0);
  objc_msgSend((id)_MergedGlobals_19, "setClasses:forSelector:argumentIndex:ofReply:", v5, sel_getAppletsWithCompletion_, 0, 1);
  objc_msgSend((id)_MergedGlobals_19, "setClasses:forSelector:argumentIndex:ofReply:", v6, sel_getAppletsWithCompletion_, 1, 1);
  objc_msgSend((id)_MergedGlobals_19, "setClasses:forSelector:argumentIndex:ofReply:", v6, sel_setActivePaymentApplet_keys_authorization_completion_, 0, 0);
  objc_msgSend((id)_MergedGlobals_19, "setClasses:forSelector:argumentIndex:ofReply:", v6, sel_setActivePaymentApplet_keys_authorization_completion_, 0, 1);

}

- (NFSecureTransactionServicesHandoverHybridSessionInterface)initWithProtocol:(id)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)NFSecureTransactionServicesHandoverHybridSessionInterface;
  return -[NFSecureTransactionServicesHandoverBaseSessionInterface initWithProtocol:](&v4, sel_initWithProtocol_, a3);
}

- (void)setupInterface
{
  void *v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)NFSecureTransactionServicesHandoverHybridSessionInterface;
  -[NFSecureTransactionServicesHandoverBaseSessionInterface setupInterface](&v4, sel_setupInterface);
  -[NFSecureTransactionServicesHandoverBaseSessionInterface protocolInterface](self, "protocolInterface");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  SetNFTNEPProtocolConformance(v3);

}

@end
