@implementation AFClientServiceDelegateXPCInterface

void __AFClientServiceDelegateXPCInterface_block_invoke()
{
  uint64_t v0;
  void *v1;
  void *v2;
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  id v13;

  objc_msgSend(MEMORY[0x1E0CB3B50], "interfaceWithProtocol:", &unk_1EE3EA228);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)AFClientServiceDelegateXPCInterface_interface;
  AFClientServiceDelegateXPCInterface_interface = v0;

  v2 = (void *)AFClientServiceDelegateXPCInterface_interface;
  v3 = (void *)MEMORY[0x1E0C99E60];
  v4 = objc_opt_class();
  objc_msgSend(v3, "setWithObjects:", v4, objc_opt_class(), 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setClasses:forSelector:argumentIndex:ofReply:", v5, sel_getBulletinContext_, 0, 1);

  v6 = (void *)AFClientServiceDelegateXPCInterface_interface;
  v7 = (void *)MEMORY[0x1E0C99E60];
  v8 = objc_opt_class();
  objc_msgSend(v7, "setWithObjects:", v8, objc_opt_class(), 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setClasses:forSelector:argumentIndex:ofReply:", v9, sel_speechRecordingDidUpdateRecognitionPhrases_utterances_refId_, 0, 0);

  v10 = (void *)AFClientServiceDelegateXPCInterface_interface;
  v11 = (void *)MEMORY[0x1E0C99E60];
  v12 = objc_opt_class();
  objc_msgSend(v11, "setWithObjects:", v12, objc_opt_class(), 0);
  v13 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setClasses:forSelector:argumentIndex:ofReply:", v13, sel_speechRecordingDidUpdateRecognitionPhrases_utterances_refId_, 1, 0);

}

@end
