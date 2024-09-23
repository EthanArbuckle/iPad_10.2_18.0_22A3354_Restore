@implementation MRMediaRemoteServiceCopyPickableRoutes

void __MRMediaRemoteServiceCopyPickableRoutes_block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v6;
  const void *data;
  NSObject *v8;
  uint64_t v9;
  uint8_t v10[8];
  size_t length;

  v3 = a2;
  v4 = v3;
  if (v3 == (id)MEMORY[0x1E0C81258] || v3 == (id)MEMORY[0x1E0C81260])
  {
    _MRServiceLogReplyError();
    v6 = 0;
  }
  else
  {
    length = 0;
    data = xpc_dictionary_get_data(v3, "MRXPC_ROUTES_DATA_KEY", &length);
    if (data)
    {
      objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytesNoCopy:length:freeWhenDone:", data, length, 0);
      v8 = objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB38B0], "propertyListWithData:options:format:error:", v8, 0, 0, 0);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      _MRLogForCategory(0);
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v10 = 0;
        _os_log_impl(&dword_193827000, v8, OS_LOG_TYPE_DEFAULT, "Didn't receive any pickable routes from the reply.", v10, 2u);
      }
      v6 = 0;
    }

  }
  v9 = *(_QWORD *)(a1 + 32);
  if (v9)
    (*(void (**)(uint64_t, void *))(v9 + 16))(v9, v6);
  kdebug_trace();

}

@end
