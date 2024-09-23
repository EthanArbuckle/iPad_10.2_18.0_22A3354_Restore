@implementation DispatchReplayerBatchRequest

uint64_t __DispatchReplayerBatchRequest_block_invoke(uint64_t a1, size_t a2, void *a3)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  uint64_t nsobject_classes;
  id v15;
  void *v16;
  uint64_t v17;
  xpc_object_t xuint;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v32;
  void *v33;

  xuint = a3;
  v33 = (void *)MEMORY[0x24BDBCF20];
  v32 = objc_opt_class();
  v29 = objc_opt_class();
  v28 = objc_opt_class();
  v27 = objc_opt_class();
  v26 = objc_opt_class();
  v25 = objc_opt_class();
  v24 = objc_opt_class();
  v23 = objc_opt_class();
  v22 = objc_opt_class();
  v21 = objc_opt_class();
  v20 = objc_opt_class();
  v3 = objc_opt_class();
  v4 = objc_opt_class();
  v5 = objc_opt_class();
  v6 = objc_opt_class();
  v7 = objc_opt_class();
  v8 = objc_opt_class();
  v9 = objc_opt_class();
  v10 = objc_opt_class();
  v11 = objc_opt_class();
  v12 = objc_opt_class();
  objc_msgSend(v33, "setWithObjects:", v32, v29, v28, v27, v26, v25, v24, v23, v22, v21, v20, v3, v4, v5, v6, v7, v8,
    v9,
    v10,
    v11,
    v12,
    objc_opt_class(),
    0);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  nsobject_classes = xpc_array_get_nsobject_classes(*(void **)(a1 + 32), a2, v13);
  if (nsobject_classes)
  {
    v15 = (id)nsobject_classes;
    v16 = xuint;
    v17 = *(_QWORD *)(a1 + 48);
    if (v17)
      (*(void (**)(uint64_t, id))(v17 + 16))(v17, v15);
  }
  else
  {
    v15 = -[GTReplayRequestUnknown initNoRequestID]([GTReplayRequestUnknown alloc], "initNoRequestID");
    v16 = xuint;
    objc_msgSend(v15, "setRequestID:", xpc_uint64_get_value(xuint));
  }
  objc_msgSend(*(id *)(a1 + 40), "setObject:atIndexedSubscript:", v15, a2);

  return 1;
}

void __DispatchReplayerBatchRequest_block_invoke_2(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  uint64_t v5;
  id v6;

  v6 = a2;
  if (*(_BYTE *)(a1 + 56))
  {
    v3 = *(void **)(a1 + 32);
    objc_msgSend(v6, "data");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v3, "handoverDataForDownload:", v4);

    objc_msgSend(v6, "setData:", 0);
    xpc_dictionary_set_uint64(*(xpc_object_t *)(a1 + 40), "bulkDataHandle", v5);
  }
  xpc_dictionary_set_nsobject(*(void **)(a1 + 40), "response", (uint64_t)v6);
  objc_msgSend(*(id *)(a1 + 48), "sendMessage:", *(_QWORD *)(a1 + 40));

}

@end
