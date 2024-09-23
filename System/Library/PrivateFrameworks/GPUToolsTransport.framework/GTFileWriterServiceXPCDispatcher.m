@implementation GTFileWriterServiceXPCDispatcher

- (GTFileWriterServiceXPCDispatcher)initWithService:(id)a3 properties:(id)a4
{
  id v7;
  void *v8;
  GTFileWriterServiceXPCDispatcher *v9;
  objc_super v11;

  v7 = a3;
  objc_msgSend(a4, "protocolMethods");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v11.receiver = self;
  v11.super_class = (Class)GTFileWriterServiceXPCDispatcher;
  v9 = -[GTXPCDispatcher initWithProtocolMethods:](&v11, sel_initWithProtocolMethods_, v8);

  if (v9)
    objc_storeStrong((id *)&v9->_service, a3);

  return v9;
}

- (void)initiateTransfer_basePath_fromDevice_options_completionHandler_:(id)a3 replyConnection:(id)a4
{
  id v6;
  id v7;
  void *v8;
  uint64_t v9;
  void *nsarray;
  const char *string;
  uint64_t v12;
  void *v13;
  const char *v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  void *nsobject;
  GTFileWriterService *service;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  _QWORD v26[4];
  id v27;
  id v28;
  uint64_t v29;
  void *v30;
  uint64_t v31;
  _QWORD v32[2];

  v32[1] = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  gt_xpc_dictionary_create_reply(v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_opt_class();
  nsarray = (void *)xpc_dictionary_get_nsarray(v6, "fileEntries", v9);
  string = xpc_dictionary_get_string(v6, "path");
  if (string
    && (objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", string),
        (v12 = objc_claimAutoreleasedReturnValue()) != 0))
  {
    v13 = (void *)v12;
    v14 = xpc_dictionary_get_string(v6, "deviceUDID");
    if (v14
      && (objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", v14),
          (v15 = objc_claimAutoreleasedReturnValue()) != 0))
    {
      v16 = (void *)v15;
      v17 = objc_opt_class();
      nsobject = xpc_dictionary_get_nsobject(v6, "options", v17);
      service = self->_service;
      v26[0] = MEMORY[0x24BDAC760];
      v26[1] = 3221225472;
      v26[2] = __116__GTFileWriterServiceXPCDispatcher_initiateTransfer_basePath_fromDevice_options_completionHandler__replyConnection___block_invoke;
      v26[3] = &unk_24F827D08;
      v27 = v8;
      v28 = v7;
      -[GTFileWriterService initiateTransfer:basePath:fromDevice:options:completionHandler:](service, "initiateTransfer:basePath:fromDevice:options:completionHandler:", nsarray, v13, v16, nsobject, v26);

    }
    else
    {
      v23 = (void *)MEMORY[0x24BDD1540];
      v29 = *MEMORY[0x24BDD0FC8];
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Invalid argument sent to service \"%@\": %@"), CFSTR("GTFileWriterServiceXPCDispatcher"), CFSTR("Invalid device UDID passed to initiateTransfer"));
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      v30 = v24;
      objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v30, &v29, 1);
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "errorWithDomain:code:userInfo:", CFSTR("com.apple.gputools.transport"), 4, v25);
      v16 = (void *)objc_claimAutoreleasedReturnValue();

      xpc_dictionary_set_nserror(v8, "error", v16);
      objc_msgSend(v7, "sendMessage:", v8);
    }

  }
  else
  {
    v20 = (void *)MEMORY[0x24BDD1540];
    v31 = *MEMORY[0x24BDD0FC8];
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Invalid argument sent to service \"%@\": %@"), CFSTR("GTFileWriterServiceXPCDispatcher"), CFSTR("Invalid path passed to initiateTransfer"));
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v32[0] = v21;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v32, &v31, 1);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "errorWithDomain:code:userInfo:", CFSTR("com.apple.gputools.transport"), 4, v22);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    xpc_dictionary_set_nserror(v8, "error", v13);
    objc_msgSend(v7, "sendMessage:", v8);
  }

}

uint64_t __116__GTFileWriterServiceXPCDispatcher_initiateTransfer_basePath_fromDevice_options_completionHandler__replyConnection___block_invoke(uint64_t a1, uint64_t a2)
{
  xpc_dictionary_set_nserror(*(_QWORD *)(a1 + 32), "error", a2);
  return objc_msgSend(*(id *)(a1 + 40), "sendMessage:", *(_QWORD *)(a1 + 32));
}

- (void)startTransfer_basePath_fromDevice_options_completionHandler_:(id)a3 replyConnection:(id)a4
{
  id v6;
  id v7;
  void *v8;
  uint64_t v9;
  void *nsarray;
  const char *string;
  uint64_t v12;
  void *v13;
  const char *v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  void *nsobject;
  GTFileWriterService *service;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  _QWORD v26[4];
  id v27;
  id v28;
  uint64_t v29;
  void *v30;
  uint64_t v31;
  _QWORD v32[2];

  v32[1] = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  gt_xpc_dictionary_create_reply(v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_opt_class();
  nsarray = (void *)xpc_dictionary_get_nsarray(v6, "fileEntries", v9);
  string = xpc_dictionary_get_string(v6, "path");
  if (string
    && (objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", string),
        (v12 = objc_claimAutoreleasedReturnValue()) != 0))
  {
    v13 = (void *)v12;
    v14 = xpc_dictionary_get_string(v6, "deviceUDID");
    if (v14
      && (objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", v14),
          (v15 = objc_claimAutoreleasedReturnValue()) != 0))
    {
      v16 = (void *)v15;
      v17 = objc_opt_class();
      nsobject = xpc_dictionary_get_nsobject(v6, "options", v17);
      service = self->_service;
      v26[0] = MEMORY[0x24BDAC760];
      v26[1] = 3221225472;
      v26[2] = __113__GTFileWriterServiceXPCDispatcher_startTransfer_basePath_fromDevice_options_completionHandler__replyConnection___block_invoke;
      v26[3] = &unk_24F827BF0;
      v27 = v8;
      v28 = v7;
      -[GTFileWriterService startTransfer:basePath:fromDevice:options:completionHandler:](service, "startTransfer:basePath:fromDevice:options:completionHandler:", nsarray, v13, v16, nsobject, v26);

    }
    else
    {
      v23 = (void *)MEMORY[0x24BDD1540];
      v29 = *MEMORY[0x24BDD0FC8];
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Invalid argument sent to service \"%@\": %@"), CFSTR("GTFileWriterServiceXPCDispatcher"), CFSTR("Invalid device UDID passed to startTransfer"));
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      v30 = v24;
      objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v30, &v29, 1);
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "errorWithDomain:code:userInfo:", CFSTR("com.apple.gputools.transport"), 4, v25);
      v16 = (void *)objc_claimAutoreleasedReturnValue();

      xpc_dictionary_set_nserror(v8, "error", v16);
      objc_msgSend(v7, "sendMessage:", v8);
    }

  }
  else
  {
    v20 = (void *)MEMORY[0x24BDD1540];
    v31 = *MEMORY[0x24BDD0FC8];
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Invalid argument sent to service \"%@\": %@"), CFSTR("GTFileWriterServiceXPCDispatcher"), CFSTR("Invalid path passed to startTransfer"));
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v32[0] = v21;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v32, &v31, 1);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "errorWithDomain:code:userInfo:", CFSTR("com.apple.gputools.transport"), 4, v22);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    xpc_dictionary_set_nserror(v8, "error", v13);
    objc_msgSend(v7, "sendMessage:", v8);
  }

}

uint64_t __113__GTFileWriterServiceXPCDispatcher_startTransfer_basePath_fromDevice_options_completionHandler__replyConnection___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  void *v5;
  id v6;

  v5 = *(void **)(a1 + 32);
  v6 = a3;
  xpc_dictionary_set_nsobject(v5, "url", a2);
  xpc_dictionary_set_nserror(*(_QWORD *)(a1 + 32), "error", v6);

  return objc_msgSend(*(id *)(a1 + 40), "sendMessage:", *(_QWORD *)(a1 + 32));
}

- (void)beginTransferSessionWithFileEntries_basePath_toDevice_options_sessionID_completionHandler_:(id)a3 replyConnection:(id)a4
{
  id v6;
  id v7;
  void *v8;
  uint64_t v9;
  void *nsarray;
  const char *string;
  uint64_t v12;
  void *v13;
  const char *v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  void *nsobject;
  uint64_t uint64;
  GTFileWriterService *service;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  _QWORD v27[4];
  id v28;
  id v29;
  uint64_t v30;
  void *v31;
  uint64_t v32;
  _QWORD v33[2];

  v33[1] = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  gt_xpc_dictionary_create_reply(v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_opt_class();
  nsarray = (void *)xpc_dictionary_get_nsarray(v6, "fileEntries", v9);
  string = xpc_dictionary_get_string(v6, "path");
  if (string
    && (objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", string),
        (v12 = objc_claimAutoreleasedReturnValue()) != 0))
  {
    v13 = (void *)v12;
    v14 = xpc_dictionary_get_string(v6, "deviceUDID");
    if (v14
      && (objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", v14),
          (v15 = objc_claimAutoreleasedReturnValue()) != 0))
    {
      v16 = (void *)v15;
      v17 = objc_opt_class();
      nsobject = xpc_dictionary_get_nsobject(v6, "options", v17);
      uint64 = xpc_dictionary_get_uint64(v6, "sessionID");
      service = self->_service;
      v27[0] = MEMORY[0x24BDAC760];
      v27[1] = 3221225472;
      v27[2] = __143__GTFileWriterServiceXPCDispatcher_beginTransferSessionWithFileEntries_basePath_toDevice_options_sessionID_completionHandler__replyConnection___block_invoke;
      v27[3] = &unk_24F827D08;
      v28 = v8;
      v29 = v7;
      -[GTFileWriterService beginTransferSessionWithFileEntries:basePath:toDevice:options:sessionID:completionHandler:](service, "beginTransferSessionWithFileEntries:basePath:toDevice:options:sessionID:completionHandler:", nsarray, v13, v16, nsobject, uint64, v27);

    }
    else
    {
      v24 = (void *)MEMORY[0x24BDD1540];
      v30 = *MEMORY[0x24BDD0FC8];
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Invalid argument sent to service \"%@\": %@"), CFSTR("GTFileWriterServiceXPCDispatcher"), CFSTR("Invalid device UDID passed to beginTransferSessionWithFileEntries"));
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      v31 = v25;
      objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v31, &v30, 1);
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "errorWithDomain:code:userInfo:", CFSTR("com.apple.gputools.transport"), 4, v26);
      v16 = (void *)objc_claimAutoreleasedReturnValue();

      xpc_dictionary_set_nserror(v8, "error", v16);
      objc_msgSend(v7, "sendMessage:", v8);
    }

  }
  else
  {
    v21 = (void *)MEMORY[0x24BDD1540];
    v32 = *MEMORY[0x24BDD0FC8];
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Invalid argument sent to service \"%@\": %@"), CFSTR("GTFileWriterServiceXPCDispatcher"), CFSTR("Invalid path passed to beginTransferSessionWithFileEntries"));
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v33[0] = v22;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v33, &v32, 1);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "errorWithDomain:code:userInfo:", CFSTR("com.apple.gputools.transport"), 4, v23);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    xpc_dictionary_set_nserror(v8, "error", v13);
    objc_msgSend(v7, "sendMessage:", v8);
  }

}

uint64_t __143__GTFileWriterServiceXPCDispatcher_beginTransferSessionWithFileEntries_basePath_toDevice_options_sessionID_completionHandler__replyConnection___block_invoke(uint64_t a1, uint64_t a2)
{
  xpc_dictionary_set_nserror(*(_QWORD *)(a1 + 32), "error", a2);
  return objc_msgSend(*(id *)(a1 + 40), "sendMessage:", *(_QWORD *)(a1 + 32));
}

- (void)writeFileData_sessionID_completionHandler_:(id)a3 replyConnection:(id)a4
{
  id v6;
  id v7;
  void *nsdata_nocopy;
  uint64_t uint64;
  void *v10;
  GTFileWriterService *service;
  id v12;
  id v13;
  _QWORD v14[4];
  id v15;
  id v16;

  v6 = a4;
  v7 = a3;
  nsdata_nocopy = (void *)xpc_dictionary_get_nsdata_nocopy(v7, "data");
  uint64 = xpc_dictionary_get_uint64(v7, "sessionID");
  gt_xpc_dictionary_create_reply(v7);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  service = self->_service;
  v14[0] = MEMORY[0x24BDAC760];
  v14[1] = 3221225472;
  v14[2] = __95__GTFileWriterServiceXPCDispatcher_writeFileData_sessionID_completionHandler__replyConnection___block_invoke;
  v14[3] = &unk_24F827D08;
  v15 = v10;
  v16 = v6;
  v12 = v6;
  v13 = v10;
  -[GTFileWriterService writeFileData:sessionID:completionHandler:](service, "writeFileData:sessionID:completionHandler:", nsdata_nocopy, uint64, v14);

}

uint64_t __95__GTFileWriterServiceXPCDispatcher_writeFileData_sessionID_completionHandler__replyConnection___block_invoke(uint64_t a1, uint64_t a2)
{
  xpc_dictionary_set_nserror(*(_QWORD *)(a1 + 32), "error", a2);
  return objc_msgSend(*(id *)(a1 + 40), "sendMessage:", *(_QWORD *)(a1 + 32));
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_service, 0);
}

@end
