@implementation BTAccessoryManagerGetAACPCapabilityInteger

void __BTAccessoryManagerGetAACPCapabilityInteger_block_invoke(uint64_t a1, xpc_object_t xdict)
{
  NSObject *v4;
  uint64_t v5;
  uint64_t v6;
  int v7;
  int v8;
  uint64_t v9;
  __int16 v10;
  uint64_t v11;
  __int16 v12;
  int v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = xpc_dictionary_get_uint64(xdict, "kCBMsgArgResult");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = xpc_dictionary_get_uint64(xdict, "kCBMsgArgValue");
  if (MBFLogInitOnce != -1)
    dispatch_once_f(&MBFLogInitOnce, 0, (dispatch_function_t)MBFLogInit);
  v4 = MBFLogComponent;
  if (os_log_type_enabled((os_log_t)MBFLogComponent, OS_LOG_TYPE_DEFAULT))
  {
    v5 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
    v6 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24);
    v7 = *(_DWORD *)(a1 + 48);
    v8 = 134218496;
    v9 = v5;
    v10 = 2048;
    v11 = v6;
    v12 = 1024;
    v13 = v7;
    _os_log_impl(&dword_1B6BF1000, v4, OS_LOG_TYPE_DEFAULT, "BTAccessoryManagerGetAACPCapabilityInteger reply result:%llx, value:%llu, index: %u", (uint8_t *)&v8, 0x1Cu);
  }
}

@end
