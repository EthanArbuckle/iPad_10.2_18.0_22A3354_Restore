@implementation NSXPCInterface

void __51__NSXPCInterface_IL__il_messageFilterHostInterface__block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x24BDD1990], "interfaceWithProtocol:", &unk_254B5ADA8);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)il_messageFilterHostInterface_interface;
  il_messageFilterHostInterface_interface = v0;

}

void __69__NSXPCInterface_IL_Internal__il_messageFilterExtensionHostInterface__block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x24BDD1990], "interfaceWithProtocol:", &unk_254B57C00);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)il_messageFilterExtensionHostInterface_interface;
  il_messageFilterExtensionHostInterface_interface = v0;

}

void __71__NSXPCInterface_IL_Internal__il_messageFilterExtensionVendorInterface__block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x24BDD1990], "interfaceWithProtocol:", &unk_254B585C0);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)il_messageFilterExtensionVendorInterface_interface;
  il_messageFilterExtensionVendorInterface_interface = v0;

}

void __72__NSXPCInterface_IL_Internal__il_classificationUIExtensionHostInterface__block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x24BDD1990], "interfaceWithProtocol:", &unk_254B5AE08);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)il_classificationUIExtensionHostInterface_interface;
  il_classificationUIExtensionHostInterface_interface = v0;

}

void __74__NSXPCInterface_IL_Internal__il_classificationUIExtensionVendorInterface__block_invoke()
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
  _QWORD v14[5];
  _QWORD v15[3];
  _QWORD v16[7];

  v16[6] = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BDD1990], "interfaceWithProtocol:", &unk_254B5AE68);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)il_classificationUIExtensionVendorInterface_interface;
  il_classificationUIExtensionVendorInterface_interface = v0;

  v2 = (void *)il_classificationUIExtensionVendorInterface_interface;
  v3 = (void *)MEMORY[0x24BDBCF20];
  v16[0] = objc_opt_class();
  v16[1] = objc_opt_class();
  v16[2] = objc_opt_class();
  v16[3] = objc_opt_class();
  v16[4] = objc_opt_class();
  v16[5] = objc_opt_class();
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v16, 6);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setWithArray:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setClasses:forSelector:argumentIndex:ofReply:", v5, sel_classificationResponseForRequest_completion_, 0, 0);

  v6 = (void *)il_classificationUIExtensionVendorInterface_interface;
  v7 = (void *)MEMORY[0x24BDBCF20];
  v15[0] = objc_opt_class();
  v15[1] = objc_opt_class();
  v15[2] = objc_opt_class();
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v15, 3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setWithArray:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setClasses:forSelector:argumentIndex:ofReply:", v9, sel_classificationResponseForRequest_completion_, 0, 1);

  v10 = (void *)il_classificationUIExtensionVendorInterface_interface;
  v11 = (void *)MEMORY[0x24BDBCF20];
  v14[0] = objc_opt_class();
  v14[1] = objc_opt_class();
  v14[2] = objc_opt_class();
  v14[3] = objc_opt_class();
  v14[4] = objc_opt_class();
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v14, 5);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setWithArray:", v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setClasses:forSelector:argumentIndex:ofReply:", v13, sel_prepareForClassificationRequest_, 0, 0);

}

@end
