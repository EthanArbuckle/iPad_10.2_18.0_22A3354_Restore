@implementation BTAccessoryManagerSpatialAudioAllowed

void __BTAccessoryManagerSpatialAudioAllowed_block_invoke(uint64_t a1, xpc_object_t xdict)
{
  NSObject *v3;
  uint64_t v4;
  int v5;
  uint64_t v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = xpc_dictionary_get_uint64(xdict, "kCBMsgArgResult");
  if (MBFLogInitOnce != -1)
    dispatch_once_f(&MBFLogInitOnce, 0, (dispatch_function_t)MBFLogInit);
  v3 = MBFLogComponent;
  if (os_log_type_enabled((os_log_t)MBFLogComponent, OS_LOG_TYPE_DEFAULT))
  {
    v4 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
    v5 = 134217984;
    v6 = v4;
    _os_log_impl(&dword_1B6BF1000, v3, OS_LOG_TYPE_DEFAULT, "BTAccessoryManagerSpatialAudioAllowed reply result:%llx", (uint8_t *)&v5, 0xCu);
  }
}

@end
