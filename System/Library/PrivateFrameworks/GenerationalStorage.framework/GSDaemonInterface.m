@implementation GSDaemonInterface

void __GSDaemonInterface_block_invoke()
{
  void *v0;
  void *v1;
  uint64_t v2;
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *context;

  context = (void *)MEMORY[0x1D825874C]();
  objc_msgSend(MEMORY[0x1E0CB3B50], "interfaceWithProtocol:", &unk_1EFE39818);
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v1 = (void *)MEMORY[0x1E0C99E60];
  v2 = objc_opt_class();
  objc_msgSend(v1, "setWithObjects:", v2, objc_opt_class(), 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "setClasses:forSelector:argumentIndex:ofReply:", v3, sel_listAdditionsOfStorage_nameSpace_withOptions_withoutOptions_andEnumerationState_completionHandler_, 4, 0);
  objc_msgSend(v0, "setClasses:forSelector:argumentIndex:ofReply:", v3, sel_listAdditionsOfStorage_nameSpace_withOptions_withoutOptions_andEnumerationState_completionHandler_, 3, 1);
  objc_msgSend(v0, "setClasses:forSelector:argumentIndex:ofReply:", v3, sel_listAdditionsUnderPath_withNameSpace_withOptions_withoutOptions_andEnumerationState_completionHandler_, 4, 0);
  objc_msgSend(v0, "setClasses:forSelector:argumentIndex:ofReply:", v3, sel_listAdditionsUnderPath_withNameSpace_withOptions_withoutOptions_andEnumerationState_completionHandler_, 1, 1);
  v4 = (void *)MEMORY[0x1E0C99E60];
  v5 = objc_opt_class();
  v6 = objc_opt_class();
  objc_msgSend(v4, "setWithObjects:", v5, v6, objc_opt_class(), 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v0, "setClasses:forSelector:argumentIndex:ofReply:", v7, sel_removeAdditionsInStorage_removalSpec_completionHandler_, 1, 0);
  v8 = (void *)MEMORY[0x1E0C99E60];
  v9 = objc_opt_class();
  v10 = objc_opt_class();
  objc_msgSend(v8, "setWithObjects:", v9, v10, objc_opt_class(), 0);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v0, "setClasses:forSelector:argumentIndex:ofReply:", v11, sel_removeAdditionsInStorage_removalSpec_completionHandler_, 0, 1);
  objc_msgSend(v0, "setClasses:forSelector:argumentIndex:ofReply:", v11, sel_removeAdditionsUnderPath_additionsList_completionHandler_, 0, 1);
  v12 = (void *)MEMORY[0x1E0C99E60];
  v13 = objc_opt_class();
  v14 = objc_opt_class();
  v15 = objc_opt_class();
  v16 = objc_opt_class();
  v17 = objc_opt_class();
  objc_msgSend(v12, "setWithObjects:", v13, v14, v15, v16, v17, objc_opt_class(), 0);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v0, "setClasses:forSelector:argumentIndex:ofReply:", v18, sel_removeAdditionsUnderPath_additionsList_completionHandler_, 1, 0);
  objc_msgSend(v0, "setClasses:forSelector:argumentIndex:ofReply:", v18, sel_getAdditionInStorage_andNameSpace_named_completionHandler_, 0, 1);
  objc_msgSend(v0, "setClasses:forSelector:argumentIndex:ofReply:", v18, sel_getAdditionsInStorage_andNameSpace_named_completionHandler_, 0, 1);
  objc_msgSend(v0, "setClasses:forSelector:argumentIndex:ofReply:", v18, sel_listAdditionsOfStorage_nameSpace_withOptions_withoutOptions_andEnumerationState_completionHandler_, 0, 1);
  objc_msgSend(v0, "setClasses:forSelector:argumentIndex:ofReply:", v18, sel_listAdditionsUnderPath_withNameSpace_withOptions_withoutOptions_andEnumerationState_completionHandler_, 0, 1);
  objc_msgSend(v0, "setClasses:forSelector:argumentIndex:ofReply:", v18, sel_setAdditionNameSpaceInStorage_nameSpace_additionName_value_completionHandler_, 0, 1);
  objc_msgSend(v0, "setClasses:forSelector:argumentIndex:ofReply:", v18, sel_createAdditionInStorage_stagedFileDescriptor_creationInfo_completionHandler_, 0, 1);
  v19 = (void *)sGSDaemonInterface;
  sGSDaemonInterface = (uint64_t)v0;

  objc_autoreleasePoolPop(context);
}

@end
