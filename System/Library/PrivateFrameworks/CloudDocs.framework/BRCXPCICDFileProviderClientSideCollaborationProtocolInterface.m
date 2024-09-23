@implementation BRCXPCICDFileProviderClientSideCollaborationProtocolInterface

void __BRCXPCICDFileProviderClientSideCollaborationProtocolInterface_block_invoke()
{
  uint64_t v0;
  void *v1;
  void *v2;
  NSObject *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  if (FPIsCloudDocsWithFPFSEnabled())
  {
    v0 = objc_opt_new();
    v1 = (void *)BRCXPCICDFileProviderClientSideCollaborationProtocolInterface_iface;
    BRCXPCICDFileProviderClientSideCollaborationProtocolInterface_iface = v0;

    objc_msgSend((id)BRCXPCICDFileProviderClientSideCollaborationProtocolInterface_iface, "setProtocol:", &unk_1EE457540);
    BRCSetupGenericOperations(&unk_1EE457540, (void *)BRCXPCICDFileProviderClientSideCollaborationProtocolInterface_iface);
  }
  else
  {
    brc_bread_crumbs((uint64_t)"BRCXPCICDFileProviderClientSideCollaborationProtocolInterface_block_invoke", 569);
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log(0);
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_FAULT))
      __BRCXPCICDFileProviderClientSideCollaborationProtocolInterface_block_invoke_cold_1((uint64_t)v2, v3, v4, v5, v6, v7, v8, v9);

  }
}

void __BRCXPCICDFileProviderClientSideCollaborationProtocolInterface_block_invoke_cold_1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_10(&dword_19CBF0000, a2, a3, "[CRIT] UNREACHABLE: Using client side collaboration service protocol from legacy%@", a5, a6, a7, a8, 2u);
}

@end
