@implementation BRCXPCBRItemServiceProtocolInterface

void __BRCXPCBRItemServiceProtocolInterface_block_invoke()
{
  uint64_t v0;
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  Class CKRecordIDClass;
  void *v6;
  void *v7;
  NSObject *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  _QWORD v15[8];
  _QWORD v16[3];

  v16[2] = *MEMORY[0x1E0C80C00];
  if (FPIsCloudDocsWithFPFSEnabled())
  {
    v0 = objc_opt_new();
    v1 = (void *)BRCXPCBRItemServiceProtocolInterface_iface;
    BRCXPCBRItemServiceProtocolInterface_iface = v0;

    objc_msgSend((id)BRCXPCBRItemServiceProtocolInterface_iface, "setProtocol:", &unk_1EE4574E0);
    BRCSetupGenericOperations(&unk_1EE4574E0, (void *)BRCXPCBRItemServiceProtocolInterface_iface);
    v16[0] = objc_opt_class();
    v16[1] = objc_opt_class();
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v16, 2);
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    v3 = (void *)BRCXPCBRItemServiceProtocolInterface_iface;
    objc_msgSend(MEMORY[0x1E0C99E60], "setWithArray:", v2);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setClasses:forSelector:argumentIndex:ofReply:", v4, sel_getAttributeValues_reply_, 0, 0);

    v15[0] = objc_opt_class();
    v15[1] = objc_opt_class();
    v15[2] = objc_opt_class();
    v15[3] = objc_opt_class();
    v15[4] = objc_opt_class();
    v15[5] = objc_opt_class();
    v15[6] = objc_opt_class();
    CKRecordIDClass = getCKRecordIDClass();
    if (!CKRecordIDClass)
      CKRecordIDClass = (Class)objc_opt_class();
    v15[7] = CKRecordIDClass;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v15, 8);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    v7 = (void *)BRCXPCBRItemServiceProtocolInterface_iface;
    objc_msgSend(MEMORY[0x1E0C99E60], "setWithArray:", v6);
    v8 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setClasses:forSelector:argumentIndex:ofReply:", v8, sel_getAttributeValues_reply_, 0, 1);
  }
  else
  {
    brc_bread_crumbs((uint64_t)"BRCXPCBRItemServiceProtocolInterface_block_invoke", 549);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log(0);
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_FAULT))
      __BRCXPCBRItemServiceProtocolInterface_block_invoke_cold_1((uint64_t)v6, v8, v9, v10, v11, v12, v13, v14);
  }

}

void __BRCXPCBRItemServiceProtocolInterface_block_invoke_cold_1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_10(&dword_19CBF0000, a2, a3, "[CRIT] UNREACHABLE: Using item service protocol from legacy%@", a5, a6, a7, a8, 2u);
}

@end
