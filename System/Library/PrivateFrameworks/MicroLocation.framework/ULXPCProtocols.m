@implementation ULXPCProtocols

+ (id)requestInterface
{
  void *v2;
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;

  objc_msgSend(MEMORY[0x24BDD1990], "interfaceWithProtocol:", &unk_257171F20);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)MEMORY[0x24BDBCF20];
  v4 = objc_opt_class();
  objc_msgSend(v3, "setWithObjects:", v4, objc_opt_class(), 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setClasses:forSelector:argumentIndex:ofReply:", v5, sel_queryServicesWithReply_, 0, 1);
  v6 = (void *)MEMORY[0x24BDBCF20];
  v7 = objc_opt_class();
  objc_msgSend(v6, "setWithObjects:", v7, objc_opt_class(), 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setClasses:forSelector:argumentIndex:ofReply:", v8, sel_exportDatabaseWithReply_, 0, 1);
  v9 = (void *)MEMORY[0x24BDBCF20];
  v10 = objc_opt_class();
  v11 = objc_opt_class();
  v12 = objc_opt_class();
  objc_msgSend(v9, "setWithObjects:", v10, v11, v12, objc_opt_class(), 0);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setClasses:forSelector:argumentIndex:ofReply:", v13, sel_getRecordingTriggerUUIDAndRequestMicroLocationRecordingScanWithAdditionalInformation_shouldForceRecording_handler_, 0, 0);
  objc_msgSend(v2, "setClasses:forSelector:argumentIndex:ofReply:", v13, sel_requestMicroLocationRecordingScanWithAdditionalInformation_, 0, 0);
  objc_msgSend(v2, "setClasses:forSelector:argumentIndex:ofReply:", v13, sel_requestCurrentMicroLocationWithAdditionalInformation_, 0, 0);

  return v2;
}

+ (id)responseInterface
{
  void *v2;

  objc_msgSend(MEMORY[0x24BDD1990], "interfaceWithProtocol:", &unk_257171F80);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setClass:forSelector:argumentIndex:ofReply:", objc_opt_class(), sel_didUpdatePrediction_, 0, 0);
  return v2;
}

@end
