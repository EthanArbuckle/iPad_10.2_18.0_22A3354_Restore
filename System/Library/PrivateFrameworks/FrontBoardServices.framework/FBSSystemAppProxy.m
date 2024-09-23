@implementation FBSSystemAppProxy

void __47__FBSSystemAppProxy_checkoutProxyWithEndpoint___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v2;
  id v3;

  v2 = *(_QWORD *)(a1 + 32);
  v3 = a2;
  objc_msgSend(v3, "setEndpoint:", v2);
  objc_msgSend(v3, "setIdentifier:", CFSTR("com.apple.frontboardservices.system-app-proxy"));

}

void __80__FBSSystemAppProxy__sendMessageType_withMessage_withReplyHandler_waitForReply___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v2;
  id v3;

  v2 = *(_QWORD *)(a1 + 32);
  objc_msgSend(a2, "payload");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, id))(v2 + 16))(v2, v3);

}

void __54__FBSSystemAppProxy_systemApplicationBundleIdentifier__block_invoke_2(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  uint64_t v4;
  void *v5;

  if (a2)
  {
    BSDeserializeStringFromXPCDictionaryWithKey();
    v3 = objc_claimAutoreleasedReturnValue();
    v4 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
    v5 = *(void **)(v4 + 40);
    *(_QWORD *)(v4 + 40) = v3;

  }
}

- (id)systemApplicationBundleIdentifier
{
  id v2;
  _QWORD v4[5];
  uint64_t v5;
  uint64_t *v6;
  uint64_t v7;
  uint64_t (*v8)(uint64_t, uint64_t);
  void (*v9)(uint64_t);
  id v10;

  v5 = 0;
  v6 = &v5;
  v7 = 0x3032000000;
  v8 = __Block_byref_object_copy__11;
  v9 = __Block_byref_object_dispose__11;
  v10 = 0;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __54__FBSSystemAppProxy_systemApplicationBundleIdentifier__block_invoke_2;
  v4[3] = &unk_1E38EB728;
  v4[4] = &v5;
  -[FBSSystemAppProxy _sendMessageType:withMessage:withReplyHandler:waitForReply:](self, "_sendMessageType:withMessage:withReplyHandler:waitForReply:", 0, &__block_literal_global_23, v4, 1);
  v2 = (id)v6[5];
  _Block_object_dispose(&v5, 8);

  return v2;
}

- (void)_sendMessageType:(int64_t)a3 withMessage:(id)a4 withReplyHandler:(id)a5 waitForReply:(BOOL)a6
{
  _BOOL8 v6;
  id v10;
  id v11;
  uint64_t v12;
  id v13;
  void *v14;
  _QWORD v15[4];
  id v16;
  _QWORD v17[4];
  id v18;

  v6 = a6;
  v10 = a4;
  v11 = a5;
  v12 = MEMORY[0x1E0C809B0];
  v17[0] = MEMORY[0x1E0C809B0];
  v17[1] = 3221225472;
  v17[2] = __80__FBSSystemAppProxy__sendMessageType_withMessage_withReplyHandler_waitForReply___block_invoke;
  v17[3] = &unk_1E38EB838;
  v13 = v10;
  v18 = v13;
  +[FBSXPCMessage messageWithPacker:](FBSXPCMessage, "messageWithPacker:", v17);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  if (v11)
  {
    v15[0] = v12;
    v15[1] = 3221225472;
    v15[2] = __80__FBSSystemAppProxy__sendMessageType_withMessage_withReplyHandler_waitForReply___block_invoke_2;
    v15[3] = &unk_1E38EB860;
    v16 = v11;
    -[FBSServiceFacilityClient sendMessage:withType:replyHandler:waitForReply:timeout:](self, "sendMessage:withType:replyHandler:waitForReply:timeout:", v14, a3, v15, v6, 0.0);

  }
  else
  {
    -[FBSServiceFacilityClient sendMessage:withType:replyHandler:waitForReply:timeout:](self, "sendMessage:withType:replyHandler:waitForReply:timeout:", v14, a3, 0, v6, 0.0);

  }
}

uint64_t __80__FBSSystemAppProxy__sendMessageType_withMessage_withReplyHandler_waitForReply___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_processHandle, 0);
  objc_storeStrong((id *)&self->_endpoint, 0);
}

+ (id)checkoutProxyWithEndpoint:(id)a3
{
  id v5;
  id v6;
  id v7;
  id result;
  void *v9;
  _QWORD v10[4];
  id v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t (*v16)(uint64_t, uint64_t);
  void (*v17)(uint64_t);
  id v18;

  v5 = a3;
  if (v5
    || (+[FBSServiceFacilityClient defaultShellEndpoint](FBSSystemAppProxy, "defaultShellEndpoint"),
        (v5 = (id)objc_claimAutoreleasedReturnValue()) != 0))
  {
    v13 = 0;
    v14 = &v13;
    v15 = 0x3032000000;
    v16 = __Block_byref_object_copy__11;
    v17 = __Block_byref_object_dispose__11;
    v18 = 0;
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __47__FBSSystemAppProxy_checkoutProxyWithEndpoint___block_invoke;
    v10[3] = &unk_1E38ED638;
    v12 = &v13;
    v6 = v5;
    v11 = v6;
    __accessProxiesWithBlock(v10);
    v7 = (id)v14[5];

    _Block_object_dispose(&v13, 8);
    return v7;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("cannot checkout proxy without an endpoint"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      +[FBSSystemAppProxy checkoutProxyWithEndpoint:].cold.1(a2, (uint64_t)a1, (uint64_t)v9);
    objc_msgSend(objc_retainAutorelease(v9), "UTF8String");
    result = (id)_bs_set_crash_log_message();
    __break(0);
  }
  return result;
}

- (void)checkin
{
  _QWORD v2[5];

  v2[0] = MEMORY[0x1E0C809B0];
  v2[1] = 3221225472;
  v2[2] = __28__FBSSystemAppProxy_checkin__block_invoke;
  v2[3] = &unk_1E38ED660;
  v2[4] = self;
  __accessProxiesWithBlock(v2);
}

void __28__FBSSystemAppProxy_checkin__block_invoke(uint64_t a1, void *a2)
{
  _QWORD *v2;
  unint64_t v3;
  id v5;

  v2 = *(_QWORD **)(a1 + 32);
  v3 = v2[11];
  if (v3 < 2)
  {
    v5 = a2;
    objc_msgSend(v2, "invalidate");
    objc_msgSend(v5, "removeObjectForKey:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 80));

  }
  else
  {
    v2[11] = v3 - 1;
  }
}

void __47__FBSSystemAppProxy_checkoutProxyWithEndpoint___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  FBSSystemAppProxy *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  id v13;
  _QWORD v14[4];
  id v15;

  v13 = a2;
  objc_msgSend(v13, "objectForKey:", *(_QWORD *)(a1 + 32));
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v5 = *(void **)(v4 + 40);
  *(_QWORD *)(v4 + 40) = v3;

  v6 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40);
  if (v6)
  {
    ++*(_QWORD *)(v6 + 88);
  }
  else
  {
    v7 = [FBSSystemAppProxy alloc];
    v14[0] = MEMORY[0x1E0C809B0];
    v14[1] = 3221225472;
    v14[2] = __47__FBSSystemAppProxy_checkoutProxyWithEndpoint___block_invoke_2;
    v14[3] = &unk_1E38EC8B0;
    v15 = *(id *)(a1 + 32);
    v8 = -[FBSServiceFacilityClient initWithConfigurator:](v7, "initWithConfigurator:", v14);
    v9 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
    v10 = *(void **)(v9 + 40);
    *(_QWORD *)(v9 + 40) = v8;

    v11 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40);
    if (v11)
    {
      objc_msgSend(v13, "setObject:forKey:", v11, *(_QWORD *)(a1 + 32));
      objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40) + 80), *(id *)(a1 + 32));
      v12 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40);
      ++*(_QWORD *)(v12 + 88);
    }

  }
}

- (BOOL)isPasscodeLockedOrBlocked
{
  char v2;
  _QWORD v4[6];
  uint64_t v5;
  uint64_t *v6;
  uint64_t v7;
  char v8;

  v5 = 0;
  v6 = &v5;
  v7 = 0x2020000000;
  v8 = 1;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __46__FBSSystemAppProxy_isPasscodeLockedOrBlocked__block_invoke;
  v4[3] = &unk_1E38ED688;
  v4[4] = self;
  v4[5] = &v5;
  -[FBSSystemAppProxy _sendMessageType:withMessage:withReplyHandler:waitForReply:](self, "_sendMessageType:withMessage:withReplyHandler:waitForReply:", 1, 0, v4, 1);
  v2 = *((_BYTE *)v6 + 24);
  _Block_object_dispose(&v5, 8);
  return v2;
}

void __46__FBSSystemAppProxy_isPasscodeLockedOrBlocked__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  NSObject *v7;

  v3 = a2;
  v4 = v3;
  if (v3)
  {
    xpc_dictionary_get_value(v3, "result-BOOL");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = v5;
    if (v5 && object_getClass(v5) == (Class)MEMORY[0x1E0C812D0])
    {
      *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = xpc_BOOL_get_value(v6);
      goto LABEL_9;
    }
  }
  else
  {
    v6 = 0;
  }
  FBLogCommon();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    __46__FBSSystemAppProxy_isPasscodeLockedOrBlocked__block_invoke_cold_1();

  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 1;
LABEL_9:

}

- (id)processHandleForBundleID:(id)a3
{
  id v4;
  uint64_t v5;
  id v6;
  id v7;
  _QWORD v9[5];
  _QWORD v10[4];
  id v11;
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t (*v15)(uint64_t, uint64_t);
  void (*v16)(uint64_t);
  id v17;

  v4 = a3;
  v12 = 0;
  v13 = &v12;
  v14 = 0x3032000000;
  v15 = __Block_byref_object_copy__11;
  v16 = __Block_byref_object_dispose__11;
  v17 = 0;
  v5 = MEMORY[0x1E0C809B0];
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __46__FBSSystemAppProxy_processHandleForBundleID___block_invoke;
  v10[3] = &unk_1E38EB670;
  v6 = v4;
  v11 = v6;
  v9[0] = v5;
  v9[1] = 3221225472;
  v9[2] = __46__FBSSystemAppProxy_processHandleForBundleID___block_invoke_2;
  v9[3] = &unk_1E38EB728;
  v9[4] = &v12;
  -[FBSSystemAppProxy _sendMessageType:withMessage:withReplyHandler:waitForReply:](self, "_sendMessageType:withMessage:withReplyHandler:waitForReply:", 2, v10, v9, 1);
  v7 = (id)v13[5];

  _Block_object_dispose(&v12, 8);
  return v7;
}

uint64_t __46__FBSSystemAppProxy_processHandleForBundleID___block_invoke()
{
  return BSSerializeStringToXPCDictionaryWithKey();
}

void __46__FBSSystemAppProxy_processHandleForBundleID___block_invoke_2(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  v2 = BSCreateDeserializedBSXPCEncodableObjectFromXPCDictionaryWithKey();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

- (void)sendActions:(id)a3 withResult:(id)a4
{
  id v6;
  id v7;
  id v8;
  _QWORD v9[5];
  id v10;
  _QWORD v11[4];
  id v12;

  v6 = a3;
  v10 = a4;
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __44__FBSSystemAppProxy_sendActions_withResult___block_invoke;
  v11[3] = &unk_1E38EB670;
  v12 = v6;
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __44__FBSSystemAppProxy_sendActions_withResult___block_invoke_2;
  v9[3] = &unk_1E38EB6C0;
  v9[4] = self;
  v7 = v10;
  v8 = v6;
  -[FBSSystemAppProxy _sendMessageType:withMessage:withReplyHandler:waitForReply:](self, "_sendMessageType:withMessage:withReplyHandler:waitForReply:", 3, v11, v9, 0);

}

void __44__FBSSystemAppProxy_sendActions_withResult___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  id v4;

  v4 = a2;
  if (objc_msgSend(*(id *)(a1 + 32), "count"))
  {
    objc_msgSend(*(id *)(a1 + 32), "allObjects");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    BSSerializeArrayOfBSXPCEncodableObjectsToXPCDictionaryWithKey();

  }
}

void __44__FBSSystemAppProxy_sendActions_withResult___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  int64_t int64;
  xpc_object_t xdict;

  v3 = a2;
  xdict = v3;
  if (v3
    && (xpc_dictionary_get_value(v3, "result-int"),
        v4 = (void *)objc_claimAutoreleasedReturnValue(),
        v4,
        v4))
  {
    int64 = xpc_dictionary_get_int64(xdict, "result-int");
  }
  else
  {
    int64 = 0;
  }
  objc_msgSend(*(id *)(a1 + 32), "fireCompletion:openAppErrorCode:", *(_QWORD *)(a1 + 40), int64);

}

- (void)terminateApplication:(id)a3 forReason:(int64_t)a4 andReport:(BOOL)a5 withDescription:(id)a6 completion:(id)a7
{
  id v12;
  id v13;
  id v14;
  NSObject *v15;
  id v16;
  uint64_t v17;
  id v18;
  id v19;
  id v20;
  _QWORD v21[5];
  id v22;
  id v23;
  _QWORD v24[4];
  id v25;
  id v26;
  int64_t v27;
  BOOL v28;
  uint8_t buf[4];
  id v30;
  __int16 v31;
  id v32;
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  v12 = a3;
  v13 = a6;
  v14 = a7;
  FBLogCommon();
  v15 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543618;
    v30 = (id)objc_opt_class();
    v31 = 2114;
    v32 = v12;
    v16 = v30;
    _os_log_impl(&dword_19A6D4000, v15, OS_LOG_TYPE_DEFAULT, "%{public}@: Sending request to terminate application %{public}@", buf, 0x16u);

  }
  v17 = MEMORY[0x1E0C809B0];
  v24[0] = MEMORY[0x1E0C809B0];
  v24[1] = 3221225472;
  v24[2] = __89__FBSSystemAppProxy_terminateApplication_forReason_andReport_withDescription_completion___block_invoke;
  v24[3] = &unk_1E38ED6B0;
  v26 = v13;
  v27 = a4;
  v28 = a5;
  v25 = v12;
  v21[0] = v17;
  v21[1] = 3221225472;
  v21[2] = __89__FBSSystemAppProxy_terminateApplication_forReason_andReport_withDescription_completion___block_invoke_2;
  v21[3] = &unk_1E38ED6D8;
  v21[4] = self;
  v22 = v25;
  v23 = v14;
  v18 = v14;
  v19 = v25;
  v20 = v13;
  -[FBSSystemAppProxy _sendMessageType:withMessage:withReplyHandler:waitForReply:](self, "_sendMessageType:withMessage:withReplyHandler:waitForReply:", 4, v24, v21, 0);

}

void __89__FBSSystemAppProxy_terminateApplication_forReason_andReport_withDescription_completion___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  xpc_object_t xdict;

  xdict = a2;
  xpc_dictionary_set_string(xdict, "bundleID", (const char *)objc_msgSend(objc_retainAutorelease(*(id *)(a1 + 32)), "UTF8String"));
  xpc_dictionary_set_int64(xdict, "t-reason", *(_QWORD *)(a1 + 48));
  xpc_dictionary_set_BOOL(xdict, "t-report", *(_BYTE *)(a1 + 56));
  v3 = *(void **)(a1 + 40);
  if (v3)
    xpc_dictionary_set_string(xdict, "t-desc", (const char *)objc_msgSend(objc_retainAutorelease(v3), "UTF8String"));

}

uint64_t __89__FBSSystemAppProxy_terminateApplication_forReason_andReport_withDescription_completion___block_invoke_2(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "_handleTerminationReply:targetDescription:withCompletion:", a2, *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
}

- (void)terminateApplicationGroup:(int64_t)a3 forReason:(int64_t)a4 andReport:(BOOL)a5 withDescription:(id)a6 completion:(id)a7
{
  id v12;
  id v13;
  NSObject *v14;
  void *v15;
  id v16;
  void *v17;
  id v18;
  id v19;
  _QWORD v20[5];
  id v21;
  int64_t v22;
  _QWORD v23[4];
  id v24;
  int64_t v25;
  int64_t v26;
  BOOL v27;
  uint8_t buf[4];
  void *v29;
  __int16 v30;
  void *v31;
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  v12 = a6;
  v13 = a7;
  FBLogCommon();
  v14 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    v15 = (void *)objc_opt_class();
    v16 = v15;
    FBSApplicationTerminationGroupDescription(a3);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v29 = v15;
    v30 = 2114;
    v31 = v17;
    _os_log_impl(&dword_19A6D4000, v14, OS_LOG_TYPE_DEFAULT, "%{public}@: Sending request to terminate %{public}@", buf, 0x16u);

  }
  v23[0] = MEMORY[0x1E0C809B0];
  v23[1] = 3221225472;
  v23[2] = __94__FBSSystemAppProxy_terminateApplicationGroup_forReason_andReport_withDescription_completion___block_invoke;
  v23[3] = &unk_1E38ED700;
  v25 = a3;
  v26 = a4;
  v27 = a5;
  v24 = v12;
  v20[0] = MEMORY[0x1E0C809B0];
  v20[1] = 3221225472;
  v20[2] = __94__FBSSystemAppProxy_terminateApplicationGroup_forReason_andReport_withDescription_completion___block_invoke_2;
  v20[3] = &unk_1E38ED728;
  v21 = v13;
  v22 = a3;
  v20[4] = self;
  v18 = v13;
  v19 = v12;
  -[FBSSystemAppProxy _sendMessageType:withMessage:withReplyHandler:waitForReply:](self, "_sendMessageType:withMessage:withReplyHandler:waitForReply:", 5, v23, v20, 0);

}

void __94__FBSSystemAppProxy_terminateApplicationGroup_forReason_andReport_withDescription_completion___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  xpc_object_t xdict;

  xdict = a2;
  xpc_dictionary_set_int64(xdict, "t-group", *(_QWORD *)(a1 + 40));
  xpc_dictionary_set_int64(xdict, "t-reason", *(_QWORD *)(a1 + 48));
  xpc_dictionary_set_BOOL(xdict, "t-report", *(_BYTE *)(a1 + 56));
  v3 = *(void **)(a1 + 32);
  if (v3)
    xpc_dictionary_set_string(xdict, "t-desc", (const char *)objc_msgSend(objc_retainAutorelease(v3), "UTF8String"));

}

void __94__FBSSystemAppProxy_terminateApplicationGroup_forReason_andReport_withDescription_completion___block_invoke_2(_QWORD *a1, void *a2)
{
  void *v3;
  uint64_t v4;
  id v5;
  id v6;

  v3 = (void *)a1[4];
  v4 = a1[6];
  v5 = a2;
  FBSApplicationTerminationGroupDescription(v4);
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "_handleTerminationReply:targetDescription:withCompletion:", v5, v6, a1[5]);

}

- (void)shutdownWithOptions:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[4];
  id v7;

  v4 = a3;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __41__FBSSystemAppProxy_shutdownWithOptions___block_invoke;
  v6[3] = &unk_1E38EB670;
  v7 = v4;
  v5 = v4;
  -[FBSSystemAppProxy _sendMessageType:withMessage:withReplyHandler:waitForReply:](self, "_sendMessageType:withMessage:withReplyHandler:waitForReply:", 6, v6, 0, 0);

}

id __41__FBSSystemAppProxy_shutdownWithOptions___block_invoke()
{
  return (id)BSSerializeBSXPCEncodableObjectToXPCDictionary();
}

- (void)setKeyboardFocusApplication:(int)a3 deferringToken:(id)a4 completion:(id)a5
{
  id v6;
  NSObject *v7;
  NSObject *v8;
  _QWORD block[4];
  id v10;

  v6 = a5;
  FBLogCommon();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    -[FBSSystemAppProxy setKeyboardFocusApplication:deferringToken:completion:].cold.1();

  if (v6)
  {
    -[FBSSystemAppProxy clientCallbackQueue](self, "clientCallbackQueue");
    v8 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __75__FBSSystemAppProxy_setKeyboardFocusApplication_deferringToken_completion___block_invoke;
    block[3] = &unk_1E38EB3B8;
    v10 = v6;
    dispatch_async(v8, block);

  }
}

uint64_t __75__FBSSystemAppProxy_setKeyboardFocusApplication_deferringToken_completion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)_handleConnect:(id)a3
{
  void *v4;
  BSProcessHandle *v5;
  BSProcessHandle *obj;

  objc_msgSend(a3, "payload");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  BSDeserializeBSXPCEncodableObjectFromXPCDictionaryWithKey();
  obj = (BSProcessHandle *)objc_claimAutoreleasedReturnValue();

  v5 = obj;
  if (self->_processHandle != obj)
  {
    objc_storeStrong((id *)&self->_processHandle, obj);
    v5 = obj;
  }

}

- (void)_handleTerminationReply:(id)a3 targetDescription:(id)a4 withCompletion:(id)a5
{
  id v8;
  id v9;
  id v10;
  uint64_t v11;
  void *v12;
  void *v13;
  int value;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  NSObject *v20;
  NSObject *v21;
  _QWORD v22[4];
  id v23;
  id v24;
  _QWORD v25[4];
  id v26;
  FBSSystemAppProxy *v27;
  _QWORD v28[4];
  id v29;
  id v30;
  int v31;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = MEMORY[0x1E0C809B0];
  if (v8)
  {
    xpc_dictionary_get_value(v8, "result-int");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = v12;
    if (v12)
    {
      value = xpc_int64_get_value(v12);
      if (!value)
      {
        v15 = 0;
        goto LABEL_8;
      }
    }
    else
    {
      value = -1;
    }
    v18 = (void *)MEMORY[0x1E0CB35C8];
    v19 = *MEMORY[0x1E0CB2FE0];
    v28[0] = v11;
    v28[1] = 3221225472;
    v28[2] = __78__FBSSystemAppProxy__handleTerminationReply_targetDescription_withCompletion___block_invoke;
    v28[3] = &unk_1E38ED750;
    v29 = v9;
    v30 = v8;
    v31 = value;
    objc_msgSend(v18, "bs_errorWithDomain:code:configuration:", v19, value, v28);
    v15 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v16 = (void *)MEMORY[0x1E0CB35C8];
    v17 = *MEMORY[0x1E0CB2FE0];
    v25[0] = MEMORY[0x1E0C809B0];
    v25[1] = 3221225472;
    v25[2] = __78__FBSSystemAppProxy__handleTerminationReply_targetDescription_withCompletion___block_invoke_2;
    v25[3] = &unk_1E38EC4C8;
    v26 = v9;
    v27 = self;
    objc_msgSend(v16, "bs_errorWithDomain:code:configuration:", v17, 64, v25);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = v26;
  }
LABEL_8:

  if (v15)
  {
    FBLogCommon();
    v20 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
      -[FBSSystemAppProxy _handleTerminationReply:targetDescription:withCompletion:].cold.1((uint64_t)self, v15, v20);

  }
  if (v10)
  {
    -[FBSSystemAppProxy clientCallbackQueue](self, "clientCallbackQueue");
    v21 = objc_claimAutoreleasedReturnValue();
    v22[0] = v11;
    v22[1] = 3221225472;
    v22[2] = __78__FBSSystemAppProxy__handleTerminationReply_targetDescription_withCompletion___block_invoke_20;
    v22[3] = &unk_1E38EB888;
    v24 = v10;
    v23 = v15;
    dispatch_async(v21, v22);

  }
}

void __78__FBSSystemAppProxy__handleTerminationReply_targetDescription_withCompletion___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;
  void *v5;
  char *v6;
  void *v7;
  id v8;

  v8 = a2;
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("The request to terminate \"%@\" failed."), *(_QWORD *)(a1 + 32));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setFailureDescription:", v3);

  BSDeserializeStringFromXPCDictionaryWithKey();
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = (void *)v4;
  if (v4)
    objc_msgSend(v8, "setFailureReason:", CFSTR("%@"), v4);
  v6 = strerror(*(_DWORD *)(a1 + 48));
  if (v6)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithCString:encoding:", v6, 4);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setCodeDescription:", v7);

  }
}

void __78__FBSSystemAppProxy__handleTerminationReply_targetDescription_withCompletion___block_invoke_2(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  void *v5;
  id v6;

  v6 = a2;
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("The request to terminate \"%@\" failed."), *(_QWORD *)(a1 + 32));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setFailureDescription:", v3);

  v4 = *(void **)(*(_QWORD *)(a1 + 40) + 96);
  if (v4)
  {
    FBSProcessPrettyDescription(v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setFailureReason:", CFSTR("The system shell (%@) probably crashed."), v5);

  }
  else
  {
    objc_msgSend(v6, "setFailureReason:", CFSTR("The system shell probably crashed."));
  }
  objc_msgSend(v6, "setCodeDescription:", CFSTR("host down"));

}

uint64_t __78__FBSSystemAppProxy__handleTerminationReply_targetDescription_withCompletion___block_invoke_20(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, BOOL))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32) == 0);
}

- (void)handleMessage:(id)a3 withType:(int64_t)a4
{
  if (!a4)
    -[FBSSystemAppProxy _handleConnect:](self, "_handleConnect:", a3);
}

- (id)clientCallbackQueue
{
  return +[FBSSystemService clientCallbackQueue](FBSSystemService, "clientCallbackQueue");
}

- (void)fireCompletion:(id)a3 error:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  _QWORD v9[4];
  id v10;
  id v11;

  v6 = a3;
  v7 = a4;
  if (v6)
  {
    -[FBSSystemAppProxy clientCallbackQueue](self, "clientCallbackQueue");
    v8 = objc_claimAutoreleasedReturnValue();
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __42__FBSSystemAppProxy_fireCompletion_error___block_invoke;
    v9[3] = &unk_1E38EB888;
    v11 = v6;
    v10 = v7;
    dispatch_async(v8, v9);

  }
}

uint64_t __42__FBSSystemAppProxy_fireCompletion_error___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), 0, *(_QWORD *)(a1 + 32));
}

- (void)fireCompletion:(id)a3 openAppErrorCode:(int64_t)a4
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  id v13;

  v13 = a3;
  if (a4)
  {
    FBSOpenApplicationErrorCreate((void *)a4, 0, v6, v7, v8, v9, v10, v11, v12);
    a4 = objc_claimAutoreleasedReturnValue();
  }
  -[FBSSystemAppProxy fireCompletion:error:](self, "fireCompletion:error:", v13, a4);

}

+ (void)checkoutProxyWithEndpoint:(uint64_t)a3 .cold.1(const char *a1, uint64_t a2, uint64_t a3)
{
  void *v5;
  objc_class *v6;
  void *v7;
  int v8;
  void *v9;
  __int16 v10;
  void *v11;
  __int16 v12;
  uint64_t v13;
  __int16 v14;
  const __CFString *v15;
  __int16 v16;
  int v17;
  __int16 v18;
  uint64_t v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  NSStringFromSelector(a1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (objc_class *)objc_opt_class();
  NSStringFromClass(v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = 138544642;
  v9 = v5;
  v10 = 2114;
  v11 = v7;
  v12 = 2048;
  v13 = a2;
  v14 = 2114;
  v15 = CFSTR("FBSSystemAppProxy.m");
  v16 = 1024;
  v17 = 54;
  v18 = 2114;
  v19 = a3;
  _os_log_error_impl(&dword_19A6D4000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", (uint8_t *)&v8, 0x3Au);

}

void __46__FBSSystemAppProxy_isPasscodeLockedOrBlocked__block_invoke_cold_1()
{
  void *v0;
  id v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  v0 = (void *)objc_opt_class();
  v1 = OUTLINED_FUNCTION_2_1(v0);
  OUTLINED_FUNCTION_15(&dword_19A6D4000, v2, v3, "%{public}@: request to get passcode/blocked status timed out - assuming locked", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_20();
}

- (void)setKeyboardFocusApplication:deferringToken:completion:.cold.1()
{
  void *v0;
  id v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  v0 = (void *)objc_opt_class();
  v1 = OUTLINED_FUNCTION_2_1(v0);
  OUTLINED_FUNCTION_15(&dword_19A6D4000, v2, v3, "%{public}@: setKeyboardFocusApplication: is no longer supported", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_20();
}

- (void)_handleTerminationReply:(uint64_t)a1 targetDescription:(void *)a2 withCompletion:(NSObject *)a3 .cold.1(uint64_t a1, void *a2, NSObject *a3)
{
  void *v5;
  id v6;
  void *v7;
  int v8;
  void *v9;
  __int16 v10;
  void *v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v5 = (void *)objc_opt_class();
  v6 = v5;
  objc_msgSend(a2, "descriptionWithMultilinePrefix:", 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = 138543618;
  v9 = v5;
  v10 = 2114;
  v11 = v7;
  _os_log_error_impl(&dword_19A6D4000, a3, OS_LOG_TYPE_ERROR, "%{public}@: Error reported for termination request: %{public}@", (uint8_t *)&v8, 0x16u);

}

@end
