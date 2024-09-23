@implementation MRSerivceHandleTelevisionMessage

void ___MRSerivceHandleTelevisionMessage_block_invoke(uint64_t a1)
{
  uint64_t uint64;
  uint64_t v3;
  NSObject *v4;
  NSObject *v5;
  NSObject *v6;
  void *v7;
  uint64_t v8;
  int v9;
  uint64_t v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  uint64 = xpc_dictionary_get_uint64(*(xpc_object_t *)(a1 + 32), "MRXPC_MESSAGE_ID_KEY");
  if (uint64 == 0x60000000000000ALL)
  {
    v3 = *(_QWORD *)(a1 + 40);
    v4 = *(id *)(a1 + 32);
    v5 = v4;
    if (v3 && *(_QWORD *)(v3 + 8))
    {
      v6 = MRCreatePropertyListFromXPCMessage(v4, "MRXPC_CUSTOM_DATA_NAME_KEY");
      v7 = (void *)MRCreatePropertyListFromXPCMessage(v5, "MRXPC_CUSTOM_DATA_KEY");
      (*(void (**)(void))(*(_QWORD *)(v3 + 8) + 16))();

    }
    else
    {
      _MRLogForCategory(0);
      v6 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(v9) = 0;
        _os_log_impl(&dword_193827000, v6, OS_LOG_TYPE_DEFAULT, "No callback for television custom data", (uint8_t *)&v9, 2u);
      }
    }

  }
  else
  {
    v8 = uint64;
    _MRLogForCategory(0);
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      v9 = 134217984;
      v10 = v8;
      _os_log_impl(&dword_193827000, v5, OS_LOG_TYPE_DEFAULT, "Television client message %lu not handled", (uint8_t *)&v9, 0xCu);
    }
  }

}

@end
