@implementation FSKitConstants

+ (NSXPCInterface)FSModuleExtensionXPCProtocol
{
  void *v2;
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;

  objc_msgSend(MEMORY[0x24BDD1990], "interfaceWithProtocol:", &unk_256A0D100);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2)
  {
    v3 = (void *)MEMORY[0x24BDBCF20];
    v4 = objc_opt_class();
    objc_msgSend(v3, "setWithObjects:", v4, objc_opt_class(), 0);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "setClasses:forSelector:argumentIndex:ofReply:", v5, sel_loadResource_options_replyHandler_, 0, 1);

    v6 = (void *)MEMORY[0x24BDBCF20];
    v7 = objc_opt_class();
    v8 = objc_opt_class();
    v9 = objc_opt_class();
    objc_msgSend(v6, "setWithObjects:", v7, v8, v9, objc_opt_class(), 0);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "setClasses:forSelector:argumentIndex:ofReply:", v10, sel_activateVolume_resource_options_replyHandler_, 0, 1);

  }
  return (NSXPCInterface *)v2;
}

+ (NSXPCInterface)FSModuleExtensionHostXPCProtocol
{
  return (NSXPCInterface *)objc_msgSend(MEMORY[0x24BDD1990], "interfaceWithProtocol:", &unk_256A15940);
}

+ (void)setArgumentsForFSClientXPC:(id)a3
{
  void *v3;
  id v4;
  uint64_t v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  id v26;

  v3 = (void *)MEMORY[0x24BDBCF20];
  v4 = a3;
  v5 = objc_opt_class();
  objc_msgSend(v3, "setWithObjects:", v5, objc_opt_class(), 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setClasses:forSelector:argumentIndex:ofReply:", v6, sel_installedExtensions_, 0, 1);

  v7 = (void *)MEMORY[0x24BDBCF20];
  v8 = objc_opt_class();
  objc_msgSend(v7, "setWithObjects:", v8, objc_opt_class(), 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setClasses:forSelector:argumentIndex:ofReply:", v9, sel_currentTasks_, 0, 1);

  v10 = (void *)MEMORY[0x24BDBCF20];
  v11 = objc_opt_class();
  objc_msgSend(v10, "setWithObjects:", v11, objc_opt_class(), 0);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setClasses:forSelector:argumentIndex:ofReply:", v12, sel_currentResourceIDs_, 0, 1);

  v13 = (void *)MEMORY[0x24BDBCF20];
  v14 = objc_opt_class();
  objc_msgSend(v13, "setWithObjects:", v14, objc_opt_class(), 0);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setClasses:forSelector:argumentIndex:ofReply:", v15, sel_loadResource_usingBundle_options_replyHandler_, 0, 1);

  v16 = (void *)MEMORY[0x24BDBCF20];
  v17 = objc_opt_class();
  objc_msgSend(v16, "setWithObjects:", v17, objc_opt_class(), 0);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setClasses:forSelector:argumentIndex:ofReply:", v18, sel_loadResource_shortName_options_replyHandler_, 0, 1);

  v19 = (void *)MEMORY[0x24BDBCF20];
  v20 = objc_opt_class();
  v21 = objc_opt_class();
  v22 = objc_opt_class();
  v23 = objc_opt_class();
  v24 = objc_opt_class();
  v25 = objc_opt_class();
  objc_msgSend(v19, "setWithObjects:", v20, v21, v22, v23, v24, v25, objc_opt_class(), 0);
  v26 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setClasses:forSelector:argumentIndex:ofReply:", v26, sel_currentContainers_, 0, 1);

}

+ (NSXPCInterface)FSClientXPCProtocol
{
  void *v3;

  objc_msgSend(MEMORY[0x24BDD1990], "interfaceWithProtocol:", &unk_256A13A50);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
    objc_msgSend(a1, "setArgumentsForFSClientXPC:", v3);
  return (NSXPCInterface *)v3;
}

+ (NSXPCInterface)FSClientHostXPCProtocol
{
  return (NSXPCInterface *)objc_msgSend(MEMORY[0x24BDD1990], "interfaceWithProtocol:", &unk_256A10768);
}

+ (NSXPCInterface)FSAllClientXPCProtocols
{
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  void *v20;
  uint64_t v21;
  void *v22;

  objc_msgSend(MEMORY[0x24BDD1990], "interfaceWithProtocol:", &unk_256A159A0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    objc_msgSend(a1, "setArgumentsForFSClientXPC:", v3);
    v4 = (void *)MEMORY[0x24BDBCF20];
    v5 = objc_opt_class();
    objc_msgSend(v4, "setWithObjects:", v5, objc_opt_class(), 0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setClasses:forSelector:argumentIndex:ofReply:", v6, sel_installedExtensionsForAuditToken_replyHandler_, 0, 1);

    v7 = (void *)MEMORY[0x24BDBCF20];
    v8 = objc_opt_class();
    objc_msgSend(v7, "setWithObjects:", v8, objc_opt_class(), 0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setClasses:forSelector:argumentIndex:ofReply:", v9, sel_currentTasksForAuditToken_replyHandler_, 0, 1);

    v10 = (void *)MEMORY[0x24BDBCF20];
    v11 = objc_opt_class();
    objc_msgSend(v10, "setWithObjects:", v11, objc_opt_class(), 0);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setClasses:forSelector:argumentIndex:ofReply:", v12, sel_currentResourceIDsForAuditToken_replyHandler_, 0, 1);

    v13 = (void *)MEMORY[0x24BDBCF20];
    v14 = objc_opt_class();
    v15 = objc_opt_class();
    v16 = objc_opt_class();
    v17 = objc_opt_class();
    v18 = objc_opt_class();
    objc_msgSend(v13, "setWithObjects:", v14, v15, v16, v17, v18, objc_opt_class(), 0);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setClasses:forSelector:argumentIndex:ofReply:", v19, sel_currentContainersForAuditToken_replyHandler_, 0, 1);

    v20 = (void *)MEMORY[0x24BDBCF20];
    v21 = objc_opt_class();
    objc_msgSend(v20, "setWithObjects:", v21, objc_opt_class(), 0);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setClasses:forSelector:argumentIndex:ofReply:", v22, sel_loadResource_usingBundle_options_auditToken_replyHandler_, 0, 1);

  }
  return (NSXPCInterface *)v3;
}

+ (NSXPCInterface)FSTaskMessageOperations
{
  return (NSXPCInterface *)objc_msgSend(MEMORY[0x24BDD1990], "interfaceWithProtocol:", &unk_256A0B6C0);
}

+ (NSXPCInterface)FSTaskOperations
{
  return (NSXPCInterface *)objc_msgSend(MEMORY[0x24BDD1990], "interfaceWithProtocol:", &unk_256A0B798);
}

+ (NSXPCInterface)FSTaskProgressXPCProtocol
{
  return (NSXPCInterface *)objc_msgSend(MEMORY[0x24BDD1990], "interfaceWithProtocol:", &unk_256A0D928);
}

+ (NSXPCInterface)FSKitHelperProtocol
{
  return (NSXPCInterface *)objc_msgSend(MEMORY[0x24BDD1990], "interfaceWithProtocol:", &unk_256A15A00);
}

+ (NSXPCInterface)FSVolumeXPCProtocol
{
  return (NSXPCInterface *)objc_msgSend(MEMORY[0x24BDD1990], "interfaceWithProtocol:", &unk_256A12500);
}

+ (NSXPCInterface)FSAgentXPCProtocol
{
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;

  objc_msgSend(MEMORY[0x24BDD1990], "interfaceWithProtocol:", &unk_256A15A60);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2)
  {
    v3 = (void *)MEMORY[0x24BDBCF20];
    v4 = objc_opt_class();
    v5 = objc_opt_class();
    objc_msgSend(v3, "setWithObjects:", v4, v5, objc_opt_class(), 0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "setClasses:forSelector:argumentIndex:ofReply:", v6, sel_installedExtensions_, 0, 1);

    v7 = (void *)MEMORY[0x24BDBCF20];
    v8 = objc_opt_class();
    objc_msgSend(v7, "setWithObjects:", v8, objc_opt_class(), 0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "setClasses:forSelector:argumentIndex:ofReply:", v9, sel_installedExtensions_, 1, 1);

  }
  return (NSXPCInterface *)v2;
}

+ (NSXPCInterface)FSAgentHostXPCProtocol
{
  return (NSXPCInterface *)objc_msgSend(MEMORY[0x24BDD1990], "interfaceWithProtocol:", &unk_256A0EBA0);
}

+ (NSSet)errorTypes
{
  if (errorTypes_onceToken != -1)
    dispatch_once(&errorTypes_onceToken, &__block_literal_global_1);
  return (NSSet *)(id)errorTypes_errorTypes;
}

void __37__FSKitConstants_project__errorTypes__block_invoke()
{
  void *v0;
  void *v1;
  uint64_t v2;
  void *v3;
  _QWORD v4[9];

  v4[8] = *MEMORY[0x24BDAC8D0];
  v0 = (void *)MEMORY[0x24BDBCF20];
  v4[0] = objc_opt_class();
  v4[1] = objc_opt_class();
  v4[2] = objc_opt_class();
  v4[3] = objc_opt_class();
  v4[4] = objc_opt_class();
  v4[5] = objc_opt_class();
  v4[6] = objc_opt_class();
  v4[7] = objc_opt_class();
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v4, 8);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "setWithArray:", v1);
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = (void *)errorTypes_errorTypes;
  errorTypes_errorTypes = v2;

}

+ (NSSet)plistTypes
{
  if (plistTypes_onceToken != -1)
    dispatch_once(&plistTypes_onceToken, &__block_literal_global_312);
  return (NSSet *)(id)plistTypes_plistTypes;
}

void __37__FSKitConstants_project__plistTypes__block_invoke()
{
  void *v0;
  void *v1;
  uint64_t v2;
  void *v3;
  _QWORD v4[11];

  v4[10] = *MEMORY[0x24BDAC8D0];
  v0 = (void *)MEMORY[0x24BDBCF20];
  v4[0] = objc_opt_class();
  v4[1] = objc_opt_class();
  v4[2] = objc_opt_class();
  v4[3] = objc_opt_class();
  v4[4] = objc_opt_class();
  v4[5] = objc_opt_class();
  v4[6] = objc_opt_class();
  v4[7] = objc_opt_class();
  v4[8] = objc_opt_class();
  v4[9] = objc_opt_class();
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v4, 10);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "setWithArray:", v1);
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = (void *)plistTypes_plistTypes;
  plistTypes_plistTypes = v2;

}

+ (NSSet)plistAndValueTypes
{
  _QWORD block[5];

  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __45__FSKitConstants_project__plistAndValueTypes__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (plistAndValueTypes_onceToken != -1)
    dispatch_once(&plistAndValueTypes_onceToken, block);
  return (NSSet *)(id)plistAndValueTypes_types;
}

void __45__FSKitConstants_project__plistAndValueTypes__block_invoke(uint64_t a1)
{
  uint64_t v1;
  void *v2;
  id v3;

  objc_msgSend(*(id *)(a1 + 32), "plistTypes");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setByAddingObject:", objc_opt_class());
  v1 = objc_claimAutoreleasedReturnValue();
  v2 = (void *)plistAndValueTypes_types;
  plistAndValueTypes_types = v1;

}

+ (NSSet)extensionItemTypes
{
  _QWORD block[5];

  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __45__FSKitConstants_project__extensionItemTypes__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (extensionItemTypes_onceToken != -1)
    dispatch_once(&extensionItemTypes_onceToken, block);
  return (NSSet *)(id)extensionItemTypes_types;
}

void __45__FSKitConstants_project__extensionItemTypes__block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  v2 = (void *)MEMORY[0x24BDBCEF0];
  objc_msgSend(*(id *)(a1 + 32), "plistTypes");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setWithSet:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(a1 + 32), "errorTypes");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "unionSet:", v5);

  v9 = objc_opt_class();
  v10 = objc_opt_class();
  v11 = objc_opt_class();
  v12 = objc_opt_class();
  v13 = objc_opt_class();
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v9, 5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "addObjectsFromArray:", v6, v9, v10, v11, v12);

  v7 = objc_msgSend(v4, "copy");
  v8 = (void *)extensionItemTypes_types;
  extensionItemTypes_types = v7;

}

@end
