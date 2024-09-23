@implementation CESRSpeechProfileAdminXPCServiceWrapper

- (CESRSpeechProfileAdminXPCServiceWrapper)init
{
  CESRSpeechProfileAdminXPCServiceWrapper *v2;
  CESRSpeechProfileAdminXPCServiceBridge *v3;
  CESRSpeechProfileAdminXPCServiceBridge *xpcServiceBridge;
  CESRSpeechProfileAdminXPCServiceWrapper *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)CESRSpeechProfileAdminXPCServiceWrapper;
  v2 = -[CESRSpeechProfileAdminXPCServiceWrapper init](&v7, sel_init);
  if (v2
    && (v3 = -[CESRSpeechProfileAdminXPCServiceBridge initWithServiceProtocol:machServiceName:]([CESRSpeechProfileAdminXPCServiceBridge alloc], "initWithServiceProtocol:machServiceName:", &unk_1EF08CCA8, CFSTR("com.apple.corespeech.corespeechd.speechprofileadmin.service")), xpcServiceBridge = v2->_xpcServiceBridge, v2->_xpcServiceBridge = v3, xpcServiceBridge, !v2->_xpcServiceBridge))
  {
    v5 = 0;
  }
  else
  {
    v5 = v2;
  }

  return v5;
}

- (void)triggerMaintenance:(BOOL)a3 completion:(id)a4
{
  _BOOL8 v4;
  CESRSpeechProfileAdminXPCServiceBridge *xpcServiceBridge;
  id v6;
  id v7;

  v4 = a3;
  xpcServiceBridge = self->_xpcServiceBridge;
  v6 = a4;
  -[CESRSpeechProfileAdminXPCServiceBridge service](xpcServiceBridge, "service");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "triggerMaintenance:completion:", v4, v6);

}

- (void)rebuildSpeechProfileForUserId:(id)a3 completion:(id)a4
{
  CESRSpeechProfileAdminXPCServiceBridge *xpcServiceBridge;
  id v6;
  id v7;
  id v8;

  xpcServiceBridge = self->_xpcServiceBridge;
  v6 = a4;
  v7 = a3;
  -[CESRSpeechProfileAdminXPCServiceBridge service](xpcServiceBridge, "service");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "rebuildSpeechProfileForUserId:completion:", v7, v6);

}

- (void)beginEvaluation:(id)a3 completion:(id)a4
{
  CESRSpeechProfileAdminXPCServiceBridge *xpcServiceBridge;
  id v6;
  id v7;
  id v8;

  xpcServiceBridge = self->_xpcServiceBridge;
  v6 = a4;
  v7 = a3;
  -[CESRSpeechProfileAdminXPCServiceBridge service](xpcServiceBridge, "service");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "beginEvaluation:completion:", v7, v6);

}

- (void)endEvaluation:(id)a3
{
  CESRSpeechProfileAdminXPCServiceBridge *xpcServiceBridge;
  id v4;
  id v5;

  xpcServiceBridge = self->_xpcServiceBridge;
  v4 = a3;
  -[CESRSpeechProfileAdminXPCServiceBridge service](xpcServiceBridge, "service");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "endEvaluation:", v4);

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_xpcServiceBridge, 0);
}

@end
