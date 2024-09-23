@implementation MCProfileConnectionXPCProtocolInterface

void __MCProfileConnectionXPCProtocolInterface_block_invoke()
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
  void *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  _QWORD v17[3];
  uint64_t v18;
  _QWORD v19[11];

  v19[10] = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CB3B50], "interfaceWithProtocol:", &unk_1EE53A948);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)MCProfileConnectionXPCProtocolInterface_interface;
  MCProfileConnectionXPCProtocolInterface_interface = v0;

  v2 = (void *)MEMORY[0x1E0C99E60];
  v19[0] = objc_opt_class();
  v19[1] = objc_opt_class();
  v19[2] = objc_opt_class();
  v19[3] = objc_opt_class();
  v19[4] = objc_opt_class();
  v19[5] = objc_opt_class();
  v19[6] = objc_opt_class();
  v19[7] = objc_opt_class();
  v19[8] = objc_opt_class();
  v19[9] = objc_opt_class();
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v19, 10);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setWithArray:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v18 = objc_opt_class();
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v18, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setByAddingObjectsFromArray:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend((id)MCProfileConnectionXPCProtocolInterface_interface, "setClasses:forSelector:argumentIndex:ofReply:", v6, sel_doMCICDidUpdateStatus_completion_, 0, 1);
  objc_msgSend((id)MCProfileConnectionXPCProtocolInterface_interface, "setClasses:forSelector:argumentIndex:ofReply:", v6, sel_doMCICDidBeginInstallingNextProfileData_completion_, 0, 1);
  objc_msgSend((id)MCProfileConnectionXPCProtocolInterface_interface, "setClasses:forSelector:argumentIndex:ofReply:", v6, sel_doMCICDidFinishInstallationWithIdentifier_error_completion_, 1, 0);
  objc_msgSend((id)MCProfileConnectionXPCProtocolInterface_interface, "setClasses:forSelector:argumentIndex:ofReply:", v6, sel_doMCICDidFinishInstallationWithIdentifier_error_completion_, 0, 1);
  objc_msgSend((id)MCProfileConnectionXPCProtocolInterface_interface, "setClasses:forSelector:argumentIndex:ofReply:", v4, sel_doMCICDidRequestUserInput_completion_, 0, 1);
  objc_msgSend((id)MCProfileConnectionXPCProtocolInterface_interface, "setClasses:forSelector:argumentIndex:ofReply:", v6, sel_doMCICDidRequestUserInput_completion_, 3, 1);
  objc_msgSend((id)MCProfileConnectionXPCProtocolInterface_interface, "setClasses:forSelector:argumentIndex:ofReply:", v6, sel_doMCICDidRequestMAIDSignIn_personaID_completion_, 1, 1);
  objc_msgSend((id)MCProfileConnectionXPCProtocolInterface_interface, "setClasses:forSelector:argumentIndex:ofReply:", v6, sel_doMCICDidRequestManagedRestoreWithManagedAppleID_personaID_completion_, 1, 1);
  objc_msgSend((id)MCProfileConnectionXPCProtocolInterface_interface, "setClasses:forSelector:argumentIndex:ofReply:", v6, sel_doMCICDidFinishPreflightWithError_completion_, 0, 0);
  objc_msgSend((id)MCProfileConnectionXPCProtocolInterface_interface, "setClasses:forSelector:argumentIndex:ofReply:", v6, sel_doMCICDidFinishPreflightWithError_completion_, 3, 1);
  v7 = (void *)MCProfileConnectionXPCProtocolInterface_interface;
  v8 = (void *)MEMORY[0x1E0C99E60];
  v17[0] = objc_opt_class();
  v17[1] = objc_opt_class();
  v17[2] = objc_opt_class();
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v17, 3);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setWithArray:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setClasses:forSelector:argumentIndex:ofReply:", v10, sel_doMCICDidRequestShowUserWarnings_completion_, 1, 0);

  objc_msgSend((id)MCProfileConnectionXPCProtocolInterface_interface, "setClasses:forSelector:argumentIndex:ofReply:", v6, sel_doMCICDidRequestShowUserWarnings_completion_, 1, 1);
  v11 = (void *)MEMORY[0x1E0C99E60];
  v14 = objc_opt_class();
  v15 = objc_opt_class();
  v16 = objc_opt_class();
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v14, 3);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setWithArray:", v12, v14, v15);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend((id)MCProfileConnectionXPCProtocolInterface_interface, "setClasses:forSelector:argumentIndex:ofReply:", v13, sel_doMCICDidRequestShowUserWarnings_completion_, 0, 0);
  objc_msgSend((id)MCProfileConnectionXPCProtocolInterface_interface, "setClasses:forSelector:argumentIndex:ofReply:", v6, sel_doMCICDidRequestCurrentPasscodeWithCompletion_, 2, 1);

}

@end
