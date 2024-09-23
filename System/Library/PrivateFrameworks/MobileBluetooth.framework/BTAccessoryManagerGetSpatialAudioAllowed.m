@implementation BTAccessoryManagerGetSpatialAudioAllowed

void __BTAccessoryManagerGetSpatialAudioAllowed_block_invoke(uint64_t a1, xpc_object_t xdict)
{
  NSObject *v4;
  uint64_t v5;
  int v6;
  uint64_t v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = xpc_dictionary_get_uint64(xdict, "kCBMsgArgResult");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = xpc_dictionary_get_uint64(xdict, "kCBMsgArgAccessoryGenericConfigMode");
  if (MBFLogInitOnce != -1)
    dispatch_once_f(&MBFLogInitOnce, 0, (dispatch_function_t)MBFLogInit);
  v4 = MBFLogComponent;
  if (os_log_type_enabled((os_log_t)MBFLogComponent, OS_LOG_TYPE_DEFAULT))
  {
    v5 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
    v6 = 134217984;
    v7 = v5;
    _os_log_impl(&dword_1B6BF1000, v4, OS_LOG_TYPE_DEFAULT, "kCBMsgIdAccessoryGetSpatialAudioAllowed reply result:%llx", (uint8_t *)&v6, 0xCu);
  }
}

@end
