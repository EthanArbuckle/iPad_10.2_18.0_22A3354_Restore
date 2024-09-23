@implementation MLMediaLibraryServiceInterface

void __49__MLMediaLibraryServiceInterface_clientInterface__block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0CB3B50], "interfaceWithProtocol:", &unk_1EEC95C48);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)clientInterface_interface;
  clientInterface_interface = v0;

}

void __50__MLMediaLibraryServiceInterface_serviceInterface__block_invoke()
{
  uint64_t v0;
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  _QWORD v12[3];

  v12[2] = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CB3B50], "interfaceWithProtocol:", &unk_1EECA0540);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)serviceInterface_interface;
  serviceInterface_interface = v0;

  objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:", objc_opt_class(), 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", objc_opt_class());
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", objc_opt_class());
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  MSVPropertyListDataClasses();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = objc_opt_class();
  v12[1] = objc_opt_class();
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v12, 2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setByAddingObjectsFromArray:", v4);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", objc_opt_class());
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", objc_opt_class());
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)serviceInterface_interface, "setClasses:forSelector:argumentIndex:ofReply:", v10, sel_beginTransactionForDatabaseWithContext_completionHandler_, 0, 1);
  objc_msgSend((id)serviceInterface_interface, "setClasses:forSelector:argumentIndex:ofReply:", v7, sel_beginTransactionForDatabaseWithContext_completionHandler_, 1, 1);
  objc_msgSend((id)serviceInterface_interface, "setClasses:forSelector:argumentIndex:ofReply:", v2, sel_executeUpdate_withParameters_onTransaction_withCompletionHandler_, 1, 1);
  objc_msgSend((id)serviceInterface_interface, "setClasses:forSelector:argumentIndex:ofReply:", v2, sel_executeQuery_withParameters_options_onTransaction_withCompletionHandler_, 1, 1);
  objc_msgSend((id)serviceInterface_interface, "setClasses:forSelector:argumentIndex:ofReply:", v2, sel_endTransaction_shouldCommit_withCompletionHandler_, 1, 1);
  objc_msgSend((id)serviceInterface_interface, "setClasses:forSelector:argumentIndex:ofReply:", v2, sel_performDatabaseOperation_withAttributes_options_completionHandler_, 1, 1);
  objc_msgSend((id)serviceInterface_interface, "setClasses:forSelector:argumentIndex:ofReply:", v2, sel_setOptions_withCompletionHandler_, 1, 1);
  objc_msgSend((id)serviceInterface_interface, "setClasses:forSelector:argumentIndex:ofReply:", v2, sel_performImport_fromSource_withUUID_completionHandler_, 1, 1);
  objc_msgSend((id)serviceInterface_interface, "setClasses:forSelector:argumentIndex:ofReply:", v2, sel_cancelImportOperation_completionHandler_, 1, 1);
  objc_msgSend((id)serviceInterface_interface, "setClasses:forSelector:argumentIndex:ofReply:", v8, sel_getLanguageResourcesWithCompletion_, 0, 1);
  v5 = (void *)serviceInterface_interface;
  MSVPropertyListDataClasses();
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setClasses:forSelector:argumentIndex:ofReply:", v6, sel_executeQuery_withParameters_options_onTransaction_withCompletionHandler_, 0, 1);

  objc_msgSend((id)serviceInterface_interface, "setClasses:forSelector:argumentIndex:ofReply:", v11, sel_performDatabaseOperation_withAttributes_options_completionHandler_, 1, 0);
  objc_msgSend((id)serviceInterface_interface, "setClasses:forSelector:argumentIndex:ofReply:", v11, sel_performDatabaseOperation_withAttributes_options_completionHandler_, 2, 0);
  objc_msgSend((id)serviceInterface_interface, "setClasses:forSelector:argumentIndex:ofReply:", v9, sel_performImport_fromSource_withUUID_completionHandler_, 0, 0);

}

+ (id)serviceInterface
{
  if (serviceInterface_onceToken != -1)
    dispatch_once(&serviceInterface_onceToken, &__block_literal_global_16157);
  return (id)serviceInterface_interface;
}

+ (id)clientInterface
{
  if (clientInterface_onceToken[0] != -1)
    dispatch_once(clientInterface_onceToken, &__block_literal_global_154);
  return (id)clientInterface_interface;
}

@end
