@implementation NTKCollectionClientInterface

void __NTKCollectionClientInterface_block_invoke()
{
  uint64_t v0;
  void *v1;
  void *v2;
  uint64_t v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  id v8;

  objc_msgSend(MEMORY[0x1E0CB3B50], "interfaceWithProtocol:", &unk_1F8E64560);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)NTKCollectionClientInterface_interface;
  NTKCollectionClientInterface_interface = v0;

  v2 = (void *)MEMORY[0x1E0C99E60];
  v3 = objc_opt_class();
  objc_msgSend(v2, "setWithObjects:", v3, objc_opt_class(), 0);
  v8 = (id)objc_claimAutoreleasedReturnValue();
  v4 = (void *)MEMORY[0x1E0C99E60];
  v5 = objc_opt_class();
  v6 = objc_opt_class();
  objc_msgSend(v4, "setWithObjects:", v5, v6, objc_opt_class(), 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)NTKCollectionClientInterface_interface, "setClasses:forSelector:argumentIndex:ofReply:", v8, sel_loadFullCollectionWithOrderedUUIDs_selectedUUID_facesDescriptorsByUUID_seqId_completion_, 0, 0);
  objc_msgSend((id)NTKCollectionClientInterface_interface, "setClasses:forSelector:argumentIndex:ofReply:", v7, sel_loadFullCollectionWithOrderedUUIDs_selectedUUID_facesDescriptorsByUUID_seqId_completion_, 2, 0);
  objc_msgSend((id)NTKCollectionClientInterface_interface, "setClasses:forSelector:argumentIndex:ofReply:", v8, sel_updateOrderedFaceUUIDs_seqId_, 0, 0);

}

@end
