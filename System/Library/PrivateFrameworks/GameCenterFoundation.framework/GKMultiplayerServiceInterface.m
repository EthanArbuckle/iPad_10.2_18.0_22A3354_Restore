@implementation GKMultiplayerServiceInterface

+ (id)interfaceProtocol
{
  return &unk_1EF4CF3D0;
}

+ (void)configureInterface:(id)a3
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  uint64_t v19;
  void *v20;
  void *v21;
  uint64_t v22;
  void *v23;
  id v24;

  v3 = (void *)MEMORY[0x1E0C99E60];
  v24 = a3;
  v4 = objc_opt_class();
  objc_msgSend(v3, "setWithObjects:", v4, objc_opt_class(), 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "setClasses:forSelector:argumentIndex:ofReply:", v5, sel_getCompatibilityMatrix_handler_, 0, 1);

  v6 = (void *)MEMORY[0x1E0C99E60];
  v7 = objc_opt_class();
  objc_msgSend(v6, "setWithObjects:", v7, objc_opt_class(), 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "setClasses:forSelector:argumentIndex:ofReply:", v8, sel_removePlayersFromGameInviteV2_handler_, 0, 0);

  v9 = (void *)MEMORY[0x1E0C99E60];
  v10 = objc_opt_class();
  objc_msgSend(v9, "setWithObjects:", v10, objc_opt_class(), 0);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "setClasses:forSelector:argumentIndex:ofReply:", v11, sel_getPlayersToInviteWithHandlerV2_, 0, 1);

  v12 = (void *)MEMORY[0x1E0C99E60];
  v13 = objc_opt_class();
  objc_msgSend(v12, "setWithObjects:", v13, objc_opt_class(), 0);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "setClasses:forSelector:argumentIndex:ofReply:", v14, sel_putMultiPlayerGroup_participants_playedAt_bundleID_numberOfAutomatched_handler_, 0, 0);

  v15 = (void *)MEMORY[0x1E0C99E60];
  v16 = objc_opt_class();
  objc_msgSend(v15, "setWithObjects:", v16, objc_opt_class(), 0);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "setClasses:forSelector:argumentIndex:ofReply:", v17, sel_putMultiPlayerGroup_participants_playedAt_bundleID_numberOfAutomatched_handler_, 1, 0);

  v18 = (void *)MEMORY[0x1E0C99E60];
  v19 = objc_opt_class();
  objc_msgSend(v18, "setWithObjects:", v19, objc_opt_class(), 0);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "setClasses:forSelector:argumentIndex:ofReply:", v20, sel_putMultiPlayerGroup_participants_playedAt_bundleID_numberOfAutomatched_handler_, 3, 0);

  v21 = (void *)MEMORY[0x1E0C99E60];
  v22 = objc_opt_class();
  objc_msgSend(v21, "setWithObjects:", v22, objc_opt_class(), 0);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "setClasses:forSelector:argumentIndex:ofReply:", v23, sel_getMultiPlayerGroups_, 0, 1);

  objc_msgSend(v24, "setClass:forSelector:argumentIndex:ofReply:", objc_opt_class(), sel_fileMultiplayerTTRWithCallBackIdentifier_descriptionAddition_handler_, 0, 0);
  objc_msgSend(v24, "setClass:forSelector:argumentIndex:ofReply:", objc_opt_class(), sel_fileMultiplayerTTRWithCallBackIdentifier_descriptionAddition_handler_, 1, 0);
  objc_msgSend(v24, "setClass:forSelector:argumentIndex:ofReply:", objc_opt_class(), sel_uploadLogsForRadar_from_handler_, 0, 0);
  objc_msgSend(v24, "setClass:forSelector:argumentIndex:ofReply:", objc_opt_class(), sel_uploadLogsForRadar_from_handler_, 1, 0);

}

@end
