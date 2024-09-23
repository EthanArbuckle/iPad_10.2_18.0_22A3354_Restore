@implementation NSXPCInterface(MFMailComposeRemoteInterfaces)

+ (id)mf_mailComposeRemoteServiceInterface
{
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
  void *v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  _QWORD v20[2];

  v20[1] = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "interfaceWithProtocol:", &unk_1EECCC5D0);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
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
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "setClasses:forSelector:argumentIndex:ofReply:", v11, sel_setCompositionValues_, 0, 0);
  v12 = (void *)MEMORY[0x1E0C99E60];
  v13 = objc_opt_class();
  v14 = objc_opt_class();
  objc_msgSend(v12, "setWithObjects:", v13, v14, objc_opt_class(), 0);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "setClasses:forSelector:argumentIndex:ofReply:", v15, sel_framesForAttachmentsWithIdentifiers_withReply_, 0, 1);
  v16 = (void *)MEMORY[0x1E0C99E60];
  v20[0] = objc_opt_class();
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v20, 1);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "setWithArray:", v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "setClasses:forSelector:argumentIndex:ofReply:", v18, sel_addAttachmentWithItemProvider_mimeType_filename_hostIdentifier_, 0, 0);

  return v1;
}

+ (uint64_t)mf_mailComposeRemoteHostInterface
{
  return objc_msgSend(a1, "interfaceWithProtocol:", &unk_1EEC9A2D0);
}

@end
