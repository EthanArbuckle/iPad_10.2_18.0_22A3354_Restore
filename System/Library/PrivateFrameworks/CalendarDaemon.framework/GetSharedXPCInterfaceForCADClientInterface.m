@implementation GetSharedXPCInterfaceForCADClientInterface

void __GetSharedXPCInterfaceForCADClientInterface_block_invoke()
{
  uint64_t v0;
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  _QWORD v5[3];

  v5[2] = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CB3B50], "interfaceWithProtocol:", &unk_1EF159C80);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)GetSharedXPCInterfaceForCADClientInterface____clientInterface;
  GetSharedXPCInterfaceForCADClientInterface____clientInterface = v0;

  objc_msgSend((id)GetSharedXPCInterfaceForCADClientInterface____clientInterface, "classesForSelector:argumentIndex:ofReply:", sel_CADClientReceiveDiagnosticsCollectionResults_forToken_finished_, 0, 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v5[0] = objc_opt_class();
  v5[1] = objc_opt_class();
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v5, 2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setByAddingObjectsFromArray:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)GetSharedXPCInterfaceForCADClientInterface____clientInterface, "setClasses:forSelector:argumentIndex:ofReply:", v4, sel_CADClientReceiveDiagnosticsCollectionResults_forToken_finished_, 0, 0);
  objc_msgSend((id)GetSharedXPCInterfaceForCADClientInterface____clientInterface, "setClasses:forSelector:argumentIndex:ofReply:", v4, sel_CADClientReceiveOccurrenceCacheSearchResults_forSearchToken_finished_, 0, 0);

}

@end
