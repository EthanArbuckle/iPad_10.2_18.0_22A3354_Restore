@implementation HTCollectHangLogsBundle

void __HTCollectHangLogsBundle_block_invoke(uint64_t a1)
{
  xpc_object_t v2;
  uint64_t i;
  xpc_object_t values[3];
  char *keys[2];
  const char *v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  if (hangTracerConnection)
  {
    *(_OWORD *)keys = xmmword_1E5FAA418;
    v6 = "archiveCompressionBypass";
    values[0] = xpc_int64_create(11);
    values[1] = xpc_string_create((const char *)objc_msgSend(objc_retainAutorelease(*(id *)(a1 + 32)), "UTF8String"));
    values[2] = xpc_BOOL_create(*(_BYTE *)(a1 + 40));
    v2 = xpc_dictionary_create((const char *const *)keys, values, 3uLL);
    xpc_connection_send_message((xpc_connection_t)hangTracerConnection, v2);

    for (i = 2; i != -1; --i)
  }
}

@end
