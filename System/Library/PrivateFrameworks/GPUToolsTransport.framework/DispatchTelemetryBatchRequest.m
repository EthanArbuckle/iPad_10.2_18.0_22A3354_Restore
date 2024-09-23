@implementation DispatchTelemetryBatchRequest

uint64_t __DispatchTelemetryBatchRequest_block_invoke(uint64_t a1, size_t a2, void *a3)
{
  id v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  id nsobject_classes;

  v5 = a3;
  v6 = (void *)MEMORY[0x24BDBCF20];
  v7 = objc_opt_class();
  v8 = objc_opt_class();
  v9 = objc_opt_class();
  objc_msgSend(v6, "setWithObjects:", v7, v8, v9, objc_opt_class(), 0);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  nsobject_classes = (id)xpc_array_get_nsobject_classes(*(void **)(a1 + 32), a2, v10);
  if (!nsobject_classes)
  {
    nsobject_classes = -[GTTelemetryRequestUnknown initNoRequestID]([GTTelemetryRequestUnknown alloc], "initNoRequestID");
    objc_msgSend(nsobject_classes, "setRequestID:", xpc_uint64_get_value(v5));
  }
  objc_msgSend(*(id *)(a1 + 40), "setObject:atIndexedSubscript:", nsobject_classes, a2);

  return 1;
}

uint64_t __DispatchTelemetryBatchRequest_block_invoke_2(uint64_t a1, uint64_t a2)
{
  xpc_dictionary_set_nsobject(*(void **)(a1 + 32), "response", a2);
  return objc_msgSend(*(id *)(a1 + 40), "sendMessage:", *(_QWORD *)(a1 + 32));
}

@end
