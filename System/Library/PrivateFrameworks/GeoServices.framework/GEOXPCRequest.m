@implementation GEOXPCRequest

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_preferredAuditToken, 0);
  objc_storeStrong((id *)&self->_progressToMirrorOverXPC, 0);
  objc_storeStrong((id *)&self->_throttleToken, 0);
  objc_storeStrong((id *)&self->_traits, 0);
  objc_storeStrong((id *)&self->_peer, 0);
  objc_storeStrong((id *)&self->_method, 0);
  objc_storeStrong((id *)&self->_service, 0);
  objc_storeStrong((id *)&self->_error, 0);
  objc_storeStrong((id *)&self->_object, 0);
}

- (void)setService:(id)a3
{
  objc_storeStrong((id *)&self->_service, a3);
}

- (void)setMethod:(id)a3
{
  objc_storeStrong((id *)&self->_method, a3);
}

- (GEOPeer)peer
{
  return self->_peer;
}

- (void)send:(id)a3 withReply:(id)a4 handler:(id)a5
{
  id v8;
  NSObject *v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  id *v14;
  _QWORD *v15;
  _QWORD v16[4];
  id v17;
  id v18;
  void *v19;
  _QWORD v20[4];
  id v21;
  _QWORD v22[4];
  id v23;
  _QWORD v24[4];
  id v25;
  _QWORD v26[4];
  id v27;
  _QWORD v28[4];
  id v29;
  _QWORD block[4];
  id v31;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  if ((-[GEOXPCRequest conformsToProtocol:](self, "conformsToProtocol:", &unk_1EDF595A8) & 1) == 0)
  {
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __40__GEOXPCRequest_send_withReply_handler___block_invoke;
    block[3] = &unk_1E1C01F48;
    v31 = v10;
    dispatch_async(v9, block);
    v13 = v31;
    goto LABEL_10;
  }
  if (!-[GEOXPCRequest reply](self, "reply"))
  {
    v28[0] = MEMORY[0x1E0C809B0];
    v28[1] = 3221225472;
    v28[2] = __40__GEOXPCRequest_send_withReply_handler___block_invoke_2;
    v28[3] = &unk_1E1C01F48;
    v29 = v10;
    dispatch_async(v9, v28);
    v13 = v29;
    goto LABEL_10;
  }
  v11 = (void *)objc_msgSend((id)objc_opt_class(), "replyClass");
  if ((objc_msgSend(v11, "isSubclassOfClass:", objc_opt_class()) & 1) == 0)
  {
    v26[0] = MEMORY[0x1E0C809B0];
    v26[1] = 3221225472;
    v26[2] = __40__GEOXPCRequest_send_withReply_handler___block_invoke_3;
    v26[3] = &unk_1E1C01F48;
    v27 = v10;
    dispatch_async(v9, v26);
    v13 = v27;
    goto LABEL_10;
  }
  if ((objc_msgSend(v11, "conformsToProtocol:", &unk_1EDF597F0) & 1) == 0)
  {
    v24[0] = MEMORY[0x1E0C809B0];
    v24[1] = 3221225472;
    v24[2] = __40__GEOXPCRequest_send_withReply_handler___block_invoke_4;
    v24[3] = &unk_1E1C01F48;
    v25 = v10;
    dispatch_async(v9, v24);
    v13 = v25;
    goto LABEL_10;
  }
  -[GEOXPCRequest _prepareRequest]((uint64_t)self);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = v12;
  if (!v12)
  {
    v22[0] = MEMORY[0x1E0C809B0];
    v22[1] = 3221225472;
    v22[2] = __40__GEOXPCRequest_send_withReply_handler___block_invoke_5;
    v22[3] = &unk_1E1C01F48;
    v14 = &v23;
    v23 = v10;
    v15 = v22;
LABEL_17:
    dispatch_async(v9, v15);
    goto LABEL_9;
  }
  GEOSetThrottleToken(v12, self->_throttleToken, 0);
  if (!v8)
  {
    -[GEOXPCRequest _createConnectionWithQueue:](self, v9);
    v8 = (id)objc_claimAutoreleasedReturnValue();
    if (!v8)
    {
      v20[0] = MEMORY[0x1E0C809B0];
      v20[1] = 3221225472;
      v20[2] = __40__GEOXPCRequest_send_withReply_handler___block_invoke_6;
      v20[3] = &unk_1E1C01F48;
      v14 = &v21;
      v21 = v10;
      v15 = v20;
      goto LABEL_17;
    }
  }
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __40__GEOXPCRequest_send_withReply_handler___block_invoke_7;
  v16[3] = &unk_1E1C09450;
  v14 = &v17;
  v8 = v8;
  v17 = v8;
  v19 = v11;
  v18 = v10;
  objc_msgSend(v8, "sendMessage:withReply:handler:", v13, v9, v16);

LABEL_9:
LABEL_10:

}

- (GEOXPCRequest)initWithMessage:(id)a3 traits:(id)a4 auditToken:(id)a5 throttleToken:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  GEOXPCRequest *v14;
  void *v15;
  uint64_t v16;
  NSString *service;
  uint64_t v18;
  NSString *method;
  OS_xpc_object *v20;
  OS_xpc_object *object;
  GEOXPCRequest *v22;
  objc_super v24;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  v24.receiver = self;
  v24.super_class = (Class)GEOXPCRequest;
  v14 = -[GEOXPCRequest init](&v24, sel_init);
  if (v14)
  {
    objc_msgSend(v10, "componentsSeparatedByString:", CFSTR("."));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v15, "count") != 2)
    {

      v22 = 0;
      goto LABEL_5;
    }
    v14->_signpostId = -1;
    v14->_flags = 1;
    objc_msgSend(v15, "objectAtIndexedSubscript:", 0);
    v16 = objc_claimAutoreleasedReturnValue();
    service = v14->_service;
    v14->_service = (NSString *)v16;

    objc_msgSend(v15, "objectAtIndexedSubscript:", 1);
    v18 = objc_claimAutoreleasedReturnValue();
    method = v14->_method;
    v14->_method = (NSString *)v18;

    objc_storeStrong((id *)&v14->_traits, a4);
    objc_storeStrong((id *)&v14->_preferredAuditToken, a5);
    objc_storeStrong((id *)&v14->_throttleToken, a6);
    v20 = (OS_xpc_object *)xpc_dictionary_create(0, 0, 0);
    object = v14->_object;
    v14->_object = v20;

  }
  v22 = v14;
LABEL_5:

  return v22;
}

- (id)sendSync:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  id v14;
  uint64_t v15;
  void *v16;
  void *v17;
  id v18;
  id v19;
  id v21;

  v6 = a3;
  if (!-[GEOXPCRequest conformsToProtocol:](self, "conformsToProtocol:", &unk_1EDF595A8)
    || !-[GEOXPCRequest reply](self, "reply")
    || (v7 = (void *)objc_msgSend((id)objc_opt_class(), "replyClass"),
        !objc_msgSend(v7, "isSubclassOfClass:", objc_opt_class()))
    || !objc_msgSend(v7, "conformsToProtocol:", &unk_1EDF597F0))
  {
    v19 = 0;
    goto LABEL_21;
  }
  -[GEOXPCRequest _prepareRequest]((uint64_t)self);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  GEOSetThrottleToken(v8, self->_throttleToken, 0);
  if (!v6)
  {
    -[GEOXPCRequest _createConnectionWithQueue:](self, 0);
    v6 = (id)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(v6, "sendMessageWithReplySync:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (MEMORY[0x18D765A14]() == MEMORY[0x1E0C812F8])
  {
    v21 = 0;
    GEODecodeModernXPCMessage(v9, (objc_class *)v7, (uint64_t)&v21);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = v21;
    objc_msgSend(v13, "error");
    v15 = objc_claimAutoreleasedReturnValue();
    v16 = (void *)v15;
    if (v15)
      v17 = (void *)v15;
    else
      v17 = v14;
    v18 = v17;

    if (!a4)
      goto LABEL_19;
  }
  else
  {
    GEOXPCErrorFromReply(v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = v10;
    if (v10)
    {
      v12 = v10;
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB35C8], "GEOErrorWithCode:reason:", -15, CFSTR("Unexpected response from geod"));
      v12 = (id)objc_claimAutoreleasedReturnValue();
    }
    v18 = v12;

    v13 = 0;
    if (!a4)
      goto LABEL_19;
  }
  if (!v18)
  {
LABEL_19:
    v19 = v13;
    goto LABEL_20;
  }
  v19 = 0;
  *a4 = objc_retainAutorelease(v18);
LABEL_20:

LABEL_21:
  return v19;
}

- (void)send:(id)a3
{
  id v4;
  NSObject *v5;
  NSString *service;
  NSString *method;
  objc_class *v8;
  void *v9;
  void *v10;
  int v11;
  NSString *v12;
  __int16 v13;
  NSString *v14;
  __int16 v15;
  void *v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (-[GEOXPCRequest conformsToProtocol:](self, "conformsToProtocol:", &unk_1EDF595A8))
  {
    if (-[GEOXPCRequest reply](self, "reply") == 1)
    {
      GEOFindOrCreateLog("com.apple.GeoServices", "GEOXPC");
      v5 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      {
        service = self->_service;
        method = self->_method;
        v8 = (objc_class *)objc_opt_class();
        NSStringFromClass(v8);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = 138412802;
        v12 = service;
        v13 = 2112;
        v14 = method;
        v15 = 2112;
        v16 = v9;
        _os_log_impl(&dword_1885A9000, v5, OS_LOG_TYPE_ERROR, "Request %@.%@ %@ expects reply but sending without reply handler", (uint8_t *)&v11, 0x20u);

      }
    }
    -[GEOXPCRequest _prepareRequest]((uint64_t)self);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    GEOSetThrottleToken(v10, self->_throttleToken, 0);
    if (!v4)
    {
      -[GEOXPCRequest _createConnectionWithQueue:](self, 0);
      v4 = (id)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(v4, "sendMessage:", v10);

  }
}

- (id)_prepareRequest
{
  xpc_object_t v2;
  void *v3;
  void *v4;
  void *v5;
  id v6;
  uint64_t v7;
  void *v8;
  void *v9;
  id v10;
  id v12;
  _QWORD v13[3];

  v13[2] = *MEMORY[0x1E0C80C00];
  if (!a1
    || (*(_BYTE *)(a1 + 8) & 1) == 0
    || !objc_msgSend((id)a1, "conformsToProtocol:", &unk_1EDF595A8)
    || !objc_msgSend((id)a1, "isValid"))
  {
    return 0;
  }
  v2 = xpc_dictionary_create(0, 0, 0);
  GEOEncodeModernXPCMessage((void *)a1, v2);
  if (objc_msgSend((id)objc_opt_class(), "reportsProgress"))
  {
    objc_msgSend(MEMORY[0x1E0CB38A8], "currentProgress");
    v3 = (void *)objc_claimAutoreleasedReturnValue();

    if (v3)
    {
      objc_msgSend(MEMORY[0x1E0CB38A8], "progressWithTotalUnitCount:", 1);
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = 0;
      objc_msgSend(MEMORY[0x1E0CB38A8], "_geo_mirroredProgressForReceivingOverXPC:", &v12);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = v12;
      objc_msgSend(v4, "addChild:withPendingUnitCount:", v5, 1);

      if (v6)
      {
        xpc_dictionary_set_value(v2, "progress_observer_endpoint", v6);

      }
    }
  }
  v7 = *(_QWORD *)(a1 + 40);
  v13[0] = *(_QWORD *)(a1 + 32);
  v13[1] = v7;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v13, 2);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "componentsJoinedByString:", CFSTR("."));
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = objc_retainAutorelease(v9);
  xpc_dictionary_set_string(v2, "message", (const char *)objc_msgSend(v10, "UTF8String"));

  return v2;
}

+ (BOOL)reportsProgress
{
  return 0;
}

- (void)encodeToXPCDictionary:(id)a3
{
  GEOMapServiceTraits *traits;
  id v5;
  xpc_object_t v6;
  xpc_object_t xdict;

  xdict = a3;
  if ((self->_flags & 1) != 0)
  {
    traits = self->_traits;
    if (traits)
    {
      -[GEOMapServiceTraits data](traits, "data");
      v5 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
      xpc_dictionary_set_data(xdict, "__traits", (const void *)objc_msgSend(v5, "bytes"), objc_msgSend(v5, "length"));

    }
    if (self->_preferredAuditToken)
    {
      v6 = xpc_dictionary_create(0, 0, 0);
      -[GEOApplicationAuditToken encodeToXPCDictionary:](self->_preferredAuditToken, "encodeToXPCDictionary:", v6);
      xpc_dictionary_set_value(xdict, "__audit_token", v6);

    }
  }

}

- (GEOMapServiceTraits)traits
{
  return self->_traits;
}

- (GEODataRequestThrottlerToken)throttleToken
{
  return self->_throttleToken;
}

- (GEOApplicationAuditToken)preferredAuditToken
{
  return self->_preferredAuditToken;
}

- (void)setPeer:(id)a3
{
  id v5;
  NSObject *v6;
  GEOPeer *peer;
  GEOApplicationAuditToken *v8;
  GEOApplicationAuditToken *v9;
  GEOApplicationAuditToken *preferredAuditToken;
  int v11;
  GEOPeer *v12;
  __int16 v13;
  const __CFString *v14;
  __int16 v15;
  GEOApplicationAuditToken *v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  objc_storeStrong((id *)&self->_peer, a3);
  if (!self->_preferredAuditToken)
  {
LABEL_6:
    objc_msgSend(v5, "auditToken");
    v9 = (GEOApplicationAuditToken *)objc_claimAutoreleasedReturnValue();
    preferredAuditToken = self->_preferredAuditToken;
    self->_preferredAuditToken = v9;

    goto LABEL_7;
  }
  if (!-[GEOPeer hasEntitlement:](self->_peer, "hasEntitlement:", CFSTR("com.apple.private.network.socket-delegate")))
  {
    GEOFindOrCreateLog("com.apple.GeoServices", "GEOXPC");
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      peer = self->_peer;
      v8 = self->_preferredAuditToken;
      v11 = 138543875;
      v12 = peer;
      v13 = 2113;
      v14 = CFSTR("com.apple.private.network.socket-delegate");
      v15 = 2113;
      v16 = v8;
      _os_log_impl(&dword_1885A9000, v6, OS_LOG_TYPE_ERROR, "peer %{public}@ is missing entitlement \"%{private}@\"; will not attribute to \"%{private}@\",
        (uint8_t *)&v11,
        0x20u);
    }

    goto LABEL_6;
  }
LABEL_7:

}

- (GEOXPCRequest)initWithXPCDictionary:(id)a3 error:(id *)a4
{
  id v5;
  GEOXPCRequest *v6;
  GEOXPCRequest *v7;
  const void *data;
  void *v9;
  GEOMapServiceTraits *v10;
  GEOMapServiceTraits *traits;
  void *v12;
  GEOApplicationAuditToken *v13;
  GEOApplicationAuditToken *preferredAuditToken;
  GEOXPCRequest *v15;
  size_t length;
  objc_super v18;

  v5 = a3;
  v18.receiver = self;
  v18.super_class = (Class)GEOXPCRequest;
  v6 = -[GEOXPCRequest init](&v18, sel_init);
  v7 = v6;
  if (v6)
  {
    v6->_signpostId = -1;
    v6->_flags = 2;
    length = 0;
    data = xpc_dictionary_get_data(v5, "__traits", &length);
    if (data)
    {
      objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytes:length:", data, length);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = -[GEOMapServiceTraits initWithData:]([GEOMapServiceTraits alloc], "initWithData:", v9);
      traits = v7->_traits;
      v7->_traits = v10;

    }
    xpc_dictionary_get_dictionary(v5, "__audit_token");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if (v12)
    {
      v13 = -[GEOApplicationAuditToken initWithXPCDictionary:error:]([GEOApplicationAuditToken alloc], "initWithXPCDictionary:error:", v12, 0);
      preferredAuditToken = v7->_preferredAuditToken;
      v7->_preferredAuditToken = v13;

    }
    v15 = v7;

  }
  return v7;
}

- (id)_createConnectionWithQueue:(id)a1
{
  id v2;
  id v3;
  uint64_t v4;
  objc_class *v5;
  void *v6;

  v2 = a1;
  if (a1)
  {
    v3 = a2;
    v4 = GEOXPCServerTypeForIdentifier();
    v5 = (objc_class *)objc_opt_class();
    NSStringFromClass(v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    +[GEOXPCConnection createServerConnectionFor:debugIdentifier:queue:eventHandler:](GEOXPCConnection, "createServerConnectionFor:debugIdentifier:queue:eventHandler:", v4, v6, v3, 0);
    v2 = (id)objc_claimAutoreleasedReturnValue();

  }
  return v2;
}

void __40__GEOXPCRequest_send_withReply_handler___block_invoke_7(uint64_t a1, void *a2)
{
  id v4;
  id v5;
  void *v6;
  id v7;
  objc_class *v8;
  void *v9;
  id v10;
  uint64_t v11;
  void *v12;
  void *v13;
  id v14;
  id v15;

  v4 = *(id *)(a1 + 32);
  v5 = a2;
  if (MEMORY[0x18D765A14]() == MEMORY[0x1E0C812F8])
  {
    v8 = *(objc_class **)(a1 + 48);
    v15 = 0;
    GEODecodeModernXPCMessage(v5, v8, (uint64_t)&v15);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    v10 = v15;
    objc_msgSend(v9, "error");
    v11 = objc_claimAutoreleasedReturnValue();
    v12 = (void *)v11;
    if (v11)
      v13 = (void *)v11;
    else
      v13 = v10;
    v14 = v13;

  }
  else
  {
    GEOXPCErrorFromReply(v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (v6)
    {
      v7 = v6;
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB35C8], "GEOErrorWithCode:reason:", -15, CFSTR("Unexpected response from geod"));
      v7 = (id)objc_claimAutoreleasedReturnValue();
    }
    v14 = v7;

    v9 = 0;
  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

- (GEOXPCRequest)init
{
  GEOXPCRequest *result;

  result = (GEOXPCRequest *)objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", CFSTR("GEOMethodNotAvailableException"), CFSTR("This method is unavailable."));
  __break(1u);
  return result;
}

void __40__GEOXPCRequest_send_withReply_handler___block_invoke(uint64_t a1)
{
  uint64_t v1;
  id v2;

  v1 = *(_QWORD *)(a1 + 32);
  objc_msgSend(MEMORY[0x1E0CB35C8], "GEOErrorWithCode:", -10);
  v2 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, _QWORD, id))(v1 + 16))(v1, 0, v2);

}

void __40__GEOXPCRequest_send_withReply_handler___block_invoke_2(uint64_t a1)
{
  uint64_t v1;
  id v2;

  v1 = *(_QWORD *)(a1 + 32);
  objc_msgSend(MEMORY[0x1E0CB35C8], "GEOErrorWithCode:", -10);
  v2 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, _QWORD, id))(v1 + 16))(v1, 0, v2);

}

void __40__GEOXPCRequest_send_withReply_handler___block_invoke_3(uint64_t a1)
{
  uint64_t v1;
  id v2;

  v1 = *(_QWORD *)(a1 + 32);
  objc_msgSend(MEMORY[0x1E0CB35C8], "GEOErrorWithCode:", -10);
  v2 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, _QWORD, id))(v1 + 16))(v1, 0, v2);

}

void __40__GEOXPCRequest_send_withReply_handler___block_invoke_4(uint64_t a1)
{
  uint64_t v1;
  id v2;

  v1 = *(_QWORD *)(a1 + 32);
  objc_msgSend(MEMORY[0x1E0CB35C8], "GEOErrorWithCode:", -10);
  v2 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, _QWORD, id))(v1 + 16))(v1, 0, v2);

}

void __40__GEOXPCRequest_send_withReply_handler___block_invoke_5(uint64_t a1)
{
  uint64_t v1;
  id v2;

  v1 = *(_QWORD *)(a1 + 32);
  objc_msgSend(MEMORY[0x1E0CB35C8], "GEOErrorWithCode:", -10);
  v2 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, _QWORD, id))(v1 + 16))(v1, 0, v2);

}

void __40__GEOXPCRequest_send_withReply_handler___block_invoke_6(uint64_t a1)
{
  uint64_t v1;
  id v2;

  v1 = *(_QWORD *)(a1 + 32);
  objc_msgSend(MEMORY[0x1E0CB35C8], "GEOErrorWithCode:", -301);
  v2 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, _QWORD, id))(v1 + 16))(v1, 0, v2);

}

- (NSString)description
{
  void *v3;
  objc_class *v4;
  void *v5;
  void *v6;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: %p {flags: 0x%x service: %@ method: %@ peer: %@ token: %@ object: %@ error: %@}>"), v5, self, self->_flags, self->_service, self->_method, self->_peer, self->_preferredAuditToken, self->_object, self->_error);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v6;
}

- (NSString)service
{
  return self->_service;
}

- (NSString)method
{
  return self->_method;
}

- (unint64_t)signpostId
{
  return self->_signpostId;
}

- (void)setSignpostId:(unint64_t)a3
{
  self->_signpostId = a3;
}

@end
