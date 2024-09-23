@implementation CKVRegisterIndexMaintenanceActivity

void __CKVRegisterIndexMaintenanceActivity_block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4;
  id v5;
  void *v6;
  id v7;
  _QWORD v8[4];
  id v9;

  v4 = a2;
  v5 = a3;
  +[CKVDispatcher sharedInstance](CKVDispatcher, "sharedInstance");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __CKVRegisterIndexMaintenanceActivity_block_invoke_2;
  v8[3] = &unk_1E4D291A8;
  v9 = v4;
  v7 = v4;
  objc_msgSend(v6, "runMaintenanceWithShouldDefer:completion:", v8, v5);

}

BOOL __CKVRegisterIndexMaintenanceActivity_block_invoke_2(uint64_t a1)
{
  return xpc_activity_should_defer(*(xpc_activity_t *)(a1 + 32));
}

@end
