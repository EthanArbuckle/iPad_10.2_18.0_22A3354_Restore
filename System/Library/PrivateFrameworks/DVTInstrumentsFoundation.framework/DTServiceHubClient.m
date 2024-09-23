@implementation DTServiceHubClient

+ (id)localDeviceConnectionWithError:(id *)a3
{
  void *v4;
  id v5;
  _QWORD *v6;
  _xpc_connection_s *mach_service;
  id v8;
  _QWORD v10[2];
  void (*v11)(uint64_t, void *);
  void *v12;
  id v13;
  uint64_t *v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t (*v19)(uint64_t, uint64_t);
  void (*v20)(uint64_t);
  id v21;
  uint64_t v22;
  uint64_t *v23;
  uint64_t v24;
  uint64_t (*v25)(uint64_t, uint64_t);
  void (*v26)(uint64_t);
  id v27;

  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE2A970]), "initWithLocalName:size:", 0, 0x400000);
  v22 = 0;
  v23 = &v22;
  v24 = 0x3032000000;
  v25 = sub_222B8DA0C;
  v26 = sub_222B8DA1C;
  v27 = (id)objc_msgSend(objc_alloc(MEMORY[0x24BE2A948]), "initWithTransport:", v4);
  v16 = 0;
  v17 = &v16;
  v18 = 0x3032000000;
  v19 = sub_222B8DA0C;
  v20 = sub_222B8DA1C;
  v21 = 0;
  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 3221225472;
  v11 = sub_222B8DA24;
  v12 = &unk_24EB2AC60;
  v5 = v4;
  v13 = v5;
  v14 = &v16;
  v15 = &v22;
  v6 = v10;
  mach_service = xpc_connection_create_mach_service("com.apple.instruments.deviceservice.xpc", 0, 0);
  xpc_connection_set_event_handler(mach_service, &unk_24EB279D0);
  xpc_connection_resume(mach_service);
  v11((uint64_t)v6, mach_service);

  if (a3)
    *a3 = objc_retainAutorelease((id)v17[5]);
  v8 = (id)v23[5];

  _Block_object_dispose(&v16, 8);
  _Block_object_dispose(&v22, 8);

  return v8;
}

+ (id)localDeviceConnectionWithXPCConnection:(id)a3
{
  objc_class *v3;
  _xpc_connection_s *v4;
  void *v5;
  void *v6;
  xpc_object_t v7;
  xpc_object_t v8;
  xpc_object_t v9;
  const char *string;
  int v12;
  const char *v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  if (a3)
  {
    v3 = (objc_class *)MEMORY[0x24BE2A970];
    v4 = (_xpc_connection_s *)a3;
    v5 = (void *)objc_msgSend([v3 alloc], "initWithLocalName:size:", 0, 0x400000);
    v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE2A948]), "initWithTransport:", v5);
    v7 = xpc_dictionary_create(0, 0, 0);
    v8 = xpc_shmem_create((void *)objc_msgSend(v5, "sharedMemory"), objc_msgSend(v5, "totalSharedMemorySize"));
    xpc_dictionary_set_value(v7, "dtx_shared_memory", v8);
    v9 = xpc_connection_send_message_with_reply_sync(v4, v7);

    if (MEMORY[0x22767A790](v9) == MEMORY[0x24BDACFB8])
    {
      if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      {
        string = xpc_dictionary_get_string(v9, (const char *)*MEMORY[0x24BDACF40]);
        v12 = 136315138;
        v13 = string;
        _os_log_impl(&dword_222B17000, MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR, "xpc error: %s", (uint8_t *)&v12, 0xCu);
      }

      v6 = 0;
    }

  }
  else
  {
    v6 = 0;
  }
  return v6;
}

+ (id)localDeviceConnection
{
  return (id)MEMORY[0x24BEDD108](a1, sel_localDeviceConnectionWithError_);
}

@end
