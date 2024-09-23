@implementation GTBulkDataServiceXPCDispatcher

- (GTBulkDataServiceXPCDispatcher)initWithService:(id)a3 properties:(id)a4
{
  id v7;
  void *v8;
  GTBulkDataServiceXPCDispatcher *v9;
  objc_super v11;

  v7 = a3;
  objc_msgSend(a4, "protocolMethods");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v11.receiver = self;
  v11.super_class = (Class)GTBulkDataServiceXPCDispatcher;
  v9 = -[GTXPCDispatcher initWithProtocolMethods:](&v11, sel_initWithProtocolMethods_, v8);

  if (v9)
    objc_storeStrong((id *)&v9->_service, a3);

  return v9;
}

- (void)downloadData_usingTransferOptions_chunkHandler_:(id)a3 replyConnection:(id)a4
{
  id v6;
  id v7;
  uint64_t uint64;
  uint64_t v9;
  void *nsobject;
  uint64_t v11;
  void *v12;
  GTBulkDataService *service;
  id v14;
  id v15;
  _QWORD v16[4];
  id v17;
  id v18;
  uint64_t v19;

  v6 = a4;
  v7 = a3;
  uint64 = xpc_dictionary_get_uint64(v7, "handle");
  v9 = objc_opt_class();
  nsobject = xpc_dictionary_get_nsobject(v7, "transferOptions", v9);
  v11 = xpc_dictionary_get_uint64(v7, "_replyStreamId");
  xpc_dictionary_get_array(v7, "_pathHistory");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  service = self->_service;
  v16[0] = MEMORY[0x24BDAC760];
  v16[1] = 3221225472;
  v16[2] = __98__GTBulkDataServiceXPCDispatcher_downloadData_usingTransferOptions_chunkHandler__replyConnection___block_invoke;
  v16[3] = &unk_24F827998;
  v18 = v6;
  v19 = v11;
  v17 = v12;
  v14 = v6;
  v15 = v12;
  -[GTBulkDataService downloadData:usingTransferOptions:chunkHandler:](service, "downloadData:usingTransferOptions:chunkHandler:", uint64, nsobject, v16);

}

void __98__GTBulkDataServiceXPCDispatcher_downloadData_usingTransferOptions_chunkHandler__replyConnection___block_invoke(uint64_t a1, void *a2, BOOL a3, void *a4)
{
  id v7;
  id v8;
  id v9;
  xpc_object_t xdict;

  v7 = a4;
  v8 = a2;
  xdict = xpc_dictionary_create_empty();
  xpc_dictionary_set_uint64(xdict, "_port", *(_QWORD *)(a1 + 48));
  xpc_dictionary_set_value(xdict, "_replyPath", *(xpc_object_t *)(a1 + 32));
  MessageSetHasReply(xdict);
  xpc_dictionary_set_nsdata(xdict, "chunk", v8);

  xpc_dictionary_set_BOOL(xdict, "isFinalChunk", a3);
  xpc_dictionary_set_nserror(xdict, "error", v7);

  v9 = (id)objc_msgSend(*(id *)(a1 + 40), "sendMessageWithReplySync:error:", xdict, 0);
}

- (void)newUploadWithDescriptor_error_:(id)a3 replyConnection:(id)a4
{
  id v6;
  id v7;
  void *v8;
  uint64_t v9;
  void *nsobject;
  GTBulkDataService *service;
  uint64_t v12;
  id v13;
  id v14;

  v6 = a4;
  v7 = a3;
  gt_xpc_dictionary_create_reply(v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_opt_class();
  nsobject = xpc_dictionary_get_nsobject(v7, "descriptor", v9);

  service = self->_service;
  v14 = 0;
  v12 = -[GTBulkDataService newUploadWithDescriptor:error:](service, "newUploadWithDescriptor:error:", nsobject, &v14);
  v13 = v14;
  xpc_dictionary_set_uint64(v8, "result", v12);
  xpc_dictionary_set_nserror(v8, "error", v13);

  objc_msgSend(v6, "sendMessage:", v8);
}

- (void)uploadChunk_forHandle_isFinalChunk_error_:(id)a3 replyConnection:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *nsdata;
  uint64_t uint64;
  _BOOL8 v11;
  GTBulkDataService *service;
  id v13;
  id v14;

  v6 = a4;
  v7 = a3;
  gt_xpc_dictionary_create_reply(v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  nsdata = (void *)xpc_dictionary_get_nsdata(v7, "chunk");
  uint64 = xpc_dictionary_get_uint64(v7, "handle");
  v11 = xpc_dictionary_get_BOOL(v7, "isFinalChunk");

  service = self->_service;
  v14 = 0;
  LOBYTE(self) = -[GTBulkDataService uploadChunk:forHandle:isFinalChunk:error:](service, "uploadChunk:forHandle:isFinalChunk:error:", nsdata, uint64, v11, &v14);
  v13 = v14;
  xpc_dictionary_set_BOOL(v8, "result", (BOOL)self);
  xpc_dictionary_set_nserror(v8, "error", v13);

  objc_msgSend(v6, "sendMessage:", v8);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_service, 0);
}

@end
