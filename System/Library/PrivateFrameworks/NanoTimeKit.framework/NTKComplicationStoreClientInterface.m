@implementation NTKComplicationStoreClientInterface

void __NTKComplicationStoreClientInterface_block_invoke()
{
  uint64_t v0;
  void *v1;
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  id v19;

  objc_msgSend(MEMORY[0x1E0CB3B50], "interfaceWithProtocol:", &unk_1F8E8A110);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)NTKComplicationStoreClientInterface_interface;
  NTKComplicationStoreClientInterface_interface = v0;

  v2 = (void *)MEMORY[0x1E0C99E60];
  v3 = objc_opt_class();
  v4 = objc_opt_class();
  v5 = objc_opt_class();
  v6 = objc_opt_class();
  v7 = objc_opt_class();
  v8 = objc_opt_class();
  v9 = objc_opt_class();
  v10 = objc_opt_class();
  objc_msgSend(v2, "setWithObjects:", v3, v4, v5, v6, v7, v8, v9, v10, objc_opt_class(), 0);
  v19 = (id)objc_claimAutoreleasedReturnValue();
  v11 = (void *)MEMORY[0x1E0C99E60];
  v12 = objc_opt_class();
  v13 = objc_opt_class();
  v14 = objc_opt_class();
  objc_msgSend(v11, "setWithObjects:", v12, v13, v14, objc_opt_class(), 0);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)NTKComplicationStoreClientInterface_interface, "setClasses:forSelector:argumentIndex:ofReply:", v19, sel_loadFullCollectionWithLocalizableSampleTemplates_complicationDescriptors_seqId_, 0, 0);
  objc_msgSend((id)NTKComplicationStoreClientInterface_interface, "setClasses:forSelector:argumentIndex:ofReply:", v15, sel_loadFullCollectionWithLocalizableSampleTemplates_complicationDescriptors_seqId_, 1, 0);
  v16 = (void *)MEMORY[0x1E0C99E60];
  v17 = objc_opt_class();
  objc_msgSend(v16, "setWithObjects:", v17, objc_opt_class(), 0);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)NTKComplicationStoreClientInterface_interface, "setClasses:forSelector:argumentIndex:ofReply:", v18, sel_updateComplicationDescriptors_forClientIdentifier_seqId_, 0, 0);

}

@end
