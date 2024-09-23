@implementation MRServiceHandleClientPriorityMessage

void ___MRServiceHandleClientPriorityMessage_block_invoke(uint64_t a1)
{
  uint64_t uint64;
  void (**v3)(void *, uint64_t, void *, __int128 *);
  NSObject *v4;
  uint64_t v5;
  const void *data;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  uint64_t v13;
  NSObject *v14;
  void *v15;
  NSObject *v16;
  void *v17;
  os_signpost_id_t v18;
  void *v19;
  void (*v20)(void *, uint64_t, void *, __int128 *);
  void *v21;
  id v22;
  size_t length;
  __int128 buf;
  void (*v25)(uint64_t, void *);
  void *v26;
  NSObject *v27;
  id v28;
  uint64_t v29;
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  uint64 = xpc_dictionary_get_uint64(*(xpc_object_t *)(a1 + 32), "MRXPC_MESSAGE_ID_KEY");
  if (uint64 == 0x800000000000001)
  {
    v3 = *(void (***)(void *, uint64_t, void *, __int128 *))(a1 + 40);
    v4 = *(id *)(a1 + 32);
    kdebug_trace();
    if (v3 && *v3)
    {
      v5 = xpc_dictionary_get_uint64(v4, "MRXPC_COMMAND_KEY");
      length = 0;
      data = xpc_dictionary_get_data(v4, "MRXPC_COMMAND_OPTIONS_KEY", &length);
      if (data)
      {
        objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytesNoCopy:length:freeWhenDone:", data, length, 0);
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB38B0], "propertyListWithData:options:format:error:", v7, 0, 0, 0);
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        v9 = (void *)objc_msgSend(v8, "mutableCopy");

      }
      else
      {
        v9 = 0;
      }
      objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("kMRMediaRemoteOptionSanboxExtensionToken"));
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = v11;
      if (v11)
      {
        objc_msgSend(objc_retainAutorelease(v11), "UTF8String");
        v13 = sandbox_extension_consume();
        if (v13 == -1)
        {
          _MRLogForCategory(0);
          v14 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
            ___MRServiceHandleClientPriorityMessage_block_invoke_cold_1();
        }
        else
        {
          objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("kMRMediaRemoteOptionPlaybackSessionFilePath"));
          v14 = objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x1E0C99D50], "dataWithContentsOfFile:", v14);
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v9, "setObject:forKeyedSubscript:", v15, CFSTR("kMRMediaRemoteOptionPlaybackSessionData"));

        }
      }
      else
      {
        v13 = -1;
      }
      _MRLogForCategory(2uLL);
      v16 = objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("kMRMediaRemoteOptionCommandID"));
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = objc_msgSend(v17, "hash");

      if (v18 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v16))
      {
        LOWORD(buf) = 0;
        _os_signpost_emit_with_name_impl(&dword_193827000, v16, OS_SIGNPOST_INTERVAL_END, v18, "SendCommandXPCToApp", ", (uint8_t *)&buf, 2u);
      }

      MRCreatePlayerPathFromXPCMessage(v4);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = *v3;
      v21 = (void *)objc_msgSend(v9, "copy");
      *(_QWORD *)&buf = MEMORY[0x1E0C809B0];
      *((_QWORD *)&buf + 1) = 3221225472;
      v25 = ___MRServiceHandleRemoteCommandMessage_block_invoke;
      v26 = &unk_1E30C7FF0;
      v27 = v4;
      v28 = v9;
      v29 = v13;
      v22 = v9;
      v20(v19, v5, v21, &buf);

    }
  }
  else
  {
    v10 = uint64;
    _MRLogForCategory(0);
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      LODWORD(buf) = 134217984;
      *(_QWORD *)((char *)&buf + 4) = v10;
      _os_log_impl(&dword_193827000, v4, OS_LOG_TYPE_DEFAULT, "Client XPC message with ID %lu not handled.", (uint8_t *)&buf, 0xCu);
    }
  }

}

void ___MRServiceHandleClientPriorityMessage_block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_2();
  OUTLINED_FUNCTION_2_0(&dword_193827000, v0, v1, "Failed to consume sandbox extension.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_1();
}

@end
