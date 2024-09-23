@implementation DKDaemonInterface

void ___DKDaemonInterface_block_invoke()
{
  uint64_t v0;
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  void *v25;
  void *v26;

  objc_msgSend(MEMORY[0x1E0CB3B50], "interfaceWithProtocol:", &unk_1EE109C20);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)_DKDaemonInterface_interface;
  _DKDaemonInterface_interface = v0;

  v25 = (void *)MEMORY[0x1E0C99E60];
  v24 = objc_opt_class();
  v23 = objc_opt_class();
  v22 = objc_opt_class();
  v21 = objc_opt_class();
  v20 = objc_opt_class();
  v19 = objc_opt_class();
  v18 = objc_opt_class();
  v2 = objc_opt_class();
  v3 = objc_opt_class();
  v4 = objc_opt_class();
  v5 = objc_opt_class();
  v6 = objc_opt_class();
  v7 = objc_opt_class();
  v8 = objc_opt_class();
  v9 = objc_opt_class();
  v10 = objc_opt_class();
  v11 = objc_opt_class();
  objc_msgSend(v25, "setWithObjects:", v24, v23, v22, v21, v20, v19, v18, v2, v3, v4, v5, v6, v7, v8, v9, v10, v11,
    objc_opt_class(),
    0);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)_DKDaemonInterface_interface, "setClasses:forSelector:argumentIndex:ofReply:", v26, sel_saveObjects_reply_, 0, 0);
  objc_msgSend((id)_DKDaemonInterface_interface, "setClasses:forSelector:argumentIndex:ofReply:", v26, sel_deleteObjects_reply_, 0, 0);
  v12 = (void *)MEMORY[0x1E0C99E60];
  v13 = objc_opt_class();
  v14 = objc_opt_class();
  v15 = objc_opt_class();
  objc_msgSend(v12, "setWithObjects:", v13, v14, v15, objc_opt_class(), 0);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)_DKDaemonInterface_interface, "setClasses:forSelector:argumentIndex:ofReply:", v16, sel_executeQuery_reply_, 0, 0);
  objc_msgSend((id)_DKDaemonInterface_interface, "setClasses:forSelector:argumentIndex:ofReply:", v26, sel_executeQuery_reply_, 0, 1);
  objc_msgSend((id)_DKDaemonInterface_interface, "setClasses:forSelector:argumentIndex:ofReply:", v26, sel_sourceDeviceIdentityWithReply_, 0, 1);
  objc_msgSend((id)_DKDaemonInterface_interface, "setClasses:forSelector:argumentIndex:ofReply:", v26, sel_deviceUUIDWithReply_, 0, 1);
  objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:", objc_opt_class(), 0);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)_DKDaemonInterface_interface, "setClasses:forSelector:argumentIndex:ofReply:", v17, sel_requestBiomeEndpoint_reply_, 0, 1);

}

@end
