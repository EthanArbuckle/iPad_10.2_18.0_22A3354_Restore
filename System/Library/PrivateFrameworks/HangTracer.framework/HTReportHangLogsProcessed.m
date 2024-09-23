@implementation HTReportHangLogsProcessed

void __HTReportHangLogsProcessed_block_invoke(uint64_t a1)
{
  uint64_t v1;
  void *v2;
  id v3;
  id v4;
  xpc_object_t v5;
  uint64_t i;
  NSObject *v7;
  id v8;
  __int128 values;
  char *keys[2];
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  if (hangTracerConnection)
  {
    *(_OWORD *)keys = xmmword_1E5FAA458;
    v1 = *(_QWORD *)(a1 + 32);
    v8 = 0;
    objc_msgSend(MEMORY[0x1E0CB36F8], "archivedDataWithRootObject:requiringSecureCoding:error:", v1, 1, &v8);
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    v3 = v8;
    if (v2)
    {
      *(_QWORD *)&values = xpc_int64_create(12);
      v4 = objc_retainAutorelease(v2);
      *((_QWORD *)&values + 1) = xpc_data_create((const void *)objc_msgSend(v4, "bytes"), objc_msgSend(v4, "length"));
      v5 = xpc_dictionary_create((const char *const *)keys, (xpc_object_t *)&values, 2uLL);
      xpc_connection_send_message((xpc_connection_t)hangTracerConnection, v5);

      for (i = 1; i != -1; --i)
    }
    else
    {
      shared_ht_log_handle();
      v7 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        LODWORD(values) = 136315138;
        *(_QWORD *)((char *)&values + 4) = "HTReportHangLogsProcessed_block_invoke";
        _os_log_impl(&dword_1AF62F000, v7, OS_LOG_TYPE_DEFAULT, "%s: Unable to encode hang log info data", (uint8_t *)&values, 0xCu);
      }

    }
  }
}

@end
