@implementation FBSOrientationObserverClient

- (FBSOrientationObserverClient)initWithDelegate:(id)a3 calloutQueue:(id)a4
{
  id v6;
  id v7;
  id v8;
  FBSOrientationObserverClient *v9;
  FBSOrientationObserverClient *v10;
  objc_super v12;
  _QWORD v13[4];
  id v14;

  v6 = a3;
  v7 = a4;
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __62__FBSOrientationObserverClient_initWithDelegate_calloutQueue___block_invoke;
  v13[3] = &unk_1E38EC8B0;
  v8 = v7;
  v14 = v8;
  v12.receiver = self;
  v12.super_class = (Class)FBSOrientationObserverClient;
  v9 = -[FBSServiceFacilityClient initWithConfigurator:](&v12, sel_initWithConfigurator_, v13);
  v10 = v9;
  if (v9)
    objc_storeWeak((id *)&v9->_delegate, v6);

  return v10;
}

void __91__FBSOrientationObserverClient__getActiveInterfaceOrientationSynchronously_withCompletion___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  int64_t int64;
  uint64_t uint64;
  NSObject *v7;
  FBSOrientationUpdate *v8;
  uint64_t v9;

  objc_msgSend(a2, "payload");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    int64 = xpc_dictionary_get_int64(v3, "uiorientation");
    uint64 = xpc_dictionary_get_uint64(v4, "sequence-number");
  }
  else
  {
    FBLogInterfaceOrientationObserver();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      __91__FBSOrientationObserverClient__getActiveInterfaceOrientationSynchronously_withCompletion___block_invoke_cold_1(a1, v7);

    uint64 = 0;
    int64 = 0;
  }
  v8 = -[FBSOrientationUpdate initWithOrientation:sequenceNumber:duration:rotationDirection:]([FBSOrientationUpdate alloc], "initWithOrientation:sequenceNumber:duration:rotationDirection:", int64, uint64, 0, 0.0);
  v9 = *(_QWORD *)(a1 + 40);
  if (v9)
    (*(void (**)(uint64_t, FBSOrientationUpdate *))(v9 + 16))(v9, v8);

}

- (void)activeInterfaceOrientationWithCompletion:(id)a3
{
  -[FBSOrientationObserverClient _getActiveInterfaceOrientationSynchronously:withCompletion:](self, "_getActiveInterfaceOrientationSynchronously:withCompletion:", 0, a3);
}

- (void)_getActiveInterfaceOrientationSynchronously:(BOOL)a3 withCompletion:(id)a4
{
  _BOOL8 v4;
  id v6;
  void *v7;
  id v8;
  _QWORD v9[5];
  id v10;

  v4 = a3;
  v6 = a4;
  +[FBSXPCMessage message](FBSXPCMessage, "message");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __91__FBSOrientationObserverClient__getActiveInterfaceOrientationSynchronously_withCompletion___block_invoke;
  v9[3] = &unk_1E38EC948;
  v9[4] = self;
  v10 = v6;
  v8 = v6;
  -[FBSServiceFacilityClient sendMessage:withType:replyHandler:waitForReply:timeout:](self, "sendMessage:withType:replyHandler:waitForReply:timeout:", v7, 1, v9, v4, 0.0);

}

- (void)registerOrientationInterest:(unsigned int)a3
{
  uint64_t v5;
  _QWORD *v6;
  void *v7;
  void *v8;
  _QWORD v9[4];
  unsigned int v10;
  _QWORD v11[5];

  self->_interest = a3;
  v5 = MEMORY[0x1E0C809B0];
  if (a3)
  {
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = __60__FBSOrientationObserverClient_registerOrientationInterest___block_invoke;
    v11[3] = &unk_1E38EC900;
    v6 = v11;
    v11[4] = self;
  }
  else
  {
    v6 = 0;
  }
  v7 = (void *)MEMORY[0x19AECA324](v6, a2);
  v9[0] = v5;
  v9[1] = 3221225472;
  v9[2] = __60__FBSOrientationObserverClient_registerOrientationInterest___block_invoke_2;
  v9[3] = &__block_descriptor_36_e33_v16__0__NSObject_OS_xpc_object__8l;
  v10 = a3;
  +[FBSXPCMessage messageWithPacker:](FBSXPCMessage, "messageWithPacker:", v9);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[FBSServiceFacilityClient sendMessage:withType:replyHandler:waitForReply:timeout:](self, "sendMessage:withType:replyHandler:waitForReply:timeout:", v8, 0, v7, 0, 0.0);

}

- (void)configureConnectMessage:(id)a3
{
  FBSOrientationObserverClientDelegate **p_delegate;
  id v5;
  id WeakRetained;
  xpc_object_t xdict;

  p_delegate = &self->_delegate;
  v5 = a3;
  WeakRetained = objc_loadWeakRetained((id *)p_delegate);
  objc_msgSend(WeakRetained, "handleOrientationResetForClient:", self);

  objc_msgSend(v5, "payload");
  xdict = (xpc_object_t)objc_claimAutoreleasedReturnValue();

  xpc_dictionary_set_uint64(xdict, "interest", self->_interest);
}

- (void)handleMessage:(id)a3 withType:(int64_t)a4
{
  void *v6;
  void *v7;
  int64_t int64;
  uint64_t uint64;
  NSObject *v10;
  void *v11;
  void *v12;
  double value;
  void *v14;
  void *v15;
  int64_t v16;
  FBSOrientationUpdate *v17;
  id WeakRetained;

  objc_msgSend(a3, "payload");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (!a4)
  {
    int64 = xpc_dictionary_get_int64(v6, "uiorientation");
    uint64 = xpc_dictionary_get_uint64(v7, "sequence-number");
    if (!uint64)
    {
      FBLogInterfaceOrientationObserver();
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
        -[FBSOrientationObserverClient handleMessage:withType:].cold.1((uint64_t)self, v10);

    }
    xpc_dictionary_get_value(v7, "duration");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = v11;
    value = 0.0;
    if (v11 && object_getClass(v11) == (Class)MEMORY[0x1E0C81300])
      value = xpc_double_get_value(v12);
    xpc_dictionary_get_value(v7, "rotation-direction");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = v14;
    if (v14 && object_getClass(v14) == (Class)MEMORY[0x1E0C81328])
      v16 = xpc_int64_get_value(v15);
    else
      v16 = 0;
    v17 = -[FBSOrientationUpdate initWithOrientation:sequenceNumber:duration:rotationDirection:]([FBSOrientationUpdate alloc], "initWithOrientation:sequenceNumber:duration:rotationDirection:", int64, uint64, v16, value);
    WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    objc_msgSend(WeakRetained, "client:handleOrientationUpdate:", self, v17);

  }
}

void __60__FBSOrientationObserverClient_registerOrientationInterest___block_invoke_2(uint64_t a1, xpc_object_t xdict)
{
  xpc_dictionary_set_uint64(xdict, "interest", *(unsigned int *)(a1 + 32));
}

void __62__FBSOrientationObserverClient_initWithDelegate_calloutQueue___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  id v5;

  v5 = a2;
  +[FBSServiceFacilityClient defaultShellEndpoint](FBSServiceFacilityClient, "defaultShellEndpoint");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setEndpoint:", v3);

  objc_msgSend(v5, "setIdentifier:", CFSTR("com.apple.frontboardservices.orientation-observer"));
  objc_msgSend(off_1E38E9E80, "userInitiated");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setServiceQuality:", v4);

  if (*(_QWORD *)(a1 + 32))
    objc_msgSend(v5, "setCalloutQueue:");

}

uint64_t __60__FBSOrientationObserverClient_registerOrientationInterest___block_invoke(uint64_t result, uint64_t a2)
{
  if (a2)
    return objc_msgSend(*(id *)(result + 32), "handleMessage:withType:", a2, 0);
  return result;
}

- (void)invalidate
{
  objc_super v3;

  objc_storeWeak((id *)&self->_delegate, 0);
  v3.receiver = self;
  v3.super_class = (Class)FBSOrientationObserverClient;
  -[FBSServiceFacilityClient invalidate](&v3, sel_invalidate);
}

- (int64_t)activeInterfaceOrientation
{
  int64_t v2;
  _QWORD v4[5];
  uint64_t v5;
  uint64_t *v6;
  uint64_t v7;
  uint64_t v8;

  v5 = 0;
  v6 = &v5;
  v7 = 0x2020000000;
  v8 = 0;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __58__FBSOrientationObserverClient_activeInterfaceOrientation__block_invoke;
  v4[3] = &unk_1E38EC8D8;
  v4[4] = &v5;
  -[FBSOrientationObserverClient _getActiveInterfaceOrientationSynchronously:withCompletion:](self, "_getActiveInterfaceOrientationSynchronously:withCompletion:", 1, v4);
  v2 = v6[3];
  _Block_object_dispose(&v5, 8);
  return v2;
}

uint64_t __58__FBSOrientationObserverClient_activeInterfaceOrientation__block_invoke(uint64_t result, void *a2)
{
  uint64_t v2;

  if (a2)
  {
    v2 = result;
    result = objc_msgSend(a2, "orientation");
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(v2 + 32) + 8) + 24) = result;
  }
  return result;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
}

void __91__FBSOrientationObserverClient__getActiveInterfaceOrientationSynchronously_withCompletion___block_invoke_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v2;
  int v3;
  uint64_t v4;
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  v2 = *(_QWORD *)(a1 + 32);
  v3 = 134217984;
  v4 = v2;
  _os_log_error_impl(&dword_19A6D4000, a2, OS_LOG_TYPE_ERROR, "<%p>: _getActiveInterfaceOrientationSynchronously:withCompletion - nil reply payload.", (uint8_t *)&v3, 0xCu);
}

- (void)handleMessage:(uint64_t)a1 withType:(NSObject *)a2 .cold.1(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  __int16 v4;
  uint64_t v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  v2 = 134218240;
  v3 = a1;
  v4 = 2048;
  v5 = 0;
  _os_log_error_impl(&dword_19A6D4000, a2, OS_LOG_TYPE_ERROR, "<%p>: handleMessage:withType: - invalid sequenceNumber: %lu for orientation change.", (uint8_t *)&v2, 0x16u);
}

@end
