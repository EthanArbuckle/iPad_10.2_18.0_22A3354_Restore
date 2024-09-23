@implementation GEOMessage

- (NSDictionary)userInfo
{
  return self->_userInfo;
}

- (GEOPeer)peer
{
  return self->_peer;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_throttleToken, 0);
  objc_storeStrong((id *)&self->_preferredAuditToken, 0);
  objc_storeStrong((id *)&self->_peer, 0);
  objc_storeStrong((id *)&self->_userInfo, 0);
  objc_storeStrong((id *)&self->_messageName, 0);
  objc_storeStrong((id *)&self->_xpcMessage, 0);
}

- (GEOMessage)initWithXPCMessage:(id)a3 peer:(id)a4
{
  id v7;
  id v8;
  GEOMessage *v9;
  GEOMessage *v10;
  const char *string;
  uint64_t v12;
  NSString *messageName;
  void *v14;
  uint64_t v15;
  NSDictionary *userInfo;
  uint64_t v17;
  GEOApplicationAuditToken *preferredAuditToken;
  const char *v19;
  const char *v20;
  GEOApplicationAuditToken *v21;
  NSObject *v22;
  uint64_t v23;
  GEOApplicationAuditToken *v24;
  void *v25;
  uint64_t v26;
  __CFString *v27;
  GEODataRequestThrottlerToken *throttleToken;
  NSObject *v29;
  void *v30;
  GEOMessage *v31;
  id v33;
  objc_super v34;
  uint8_t buf[4];
  void *v36;
  __int16 v37;
  const __CFString *v38;
  __int16 v39;
  const char *v40;
  uint64_t v41;

  v41 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  v34.receiver = self;
  v34.super_class = (Class)GEOMessage;
  v9 = -[GEOMessage init](&v34, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_xpcMessage, a3);
    objc_storeStrong((id *)&v10->_peer, a4);
    string = xpc_dictionary_get_string(v7, "message");
    if (string)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", string);
      v12 = objc_claimAutoreleasedReturnValue();
      messageName = v10->_messageName;
      v10->_messageName = (NSString *)v12;

    }
    xpc_dictionary_get_dictionary(v10->_xpcMessage, "userInfo");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    if (v14)
    {
      v15 = _CFXPCCreateCFObjectFromXPCObject();
      userInfo = v10->_userInfo;
      v10->_userInfo = (NSDictionary *)v15;

    }
    if (!v10->_userInfo)
      v10->_userInfo = (NSDictionary *)MEMORY[0x1E0C9AA70];
    objc_msgSend(v8, "auditToken");
    v17 = objc_claimAutoreleasedReturnValue();
    preferredAuditToken = v10->_preferredAuditToken;
    v10->_preferredAuditToken = (GEOApplicationAuditToken *)v17;

    v19 = xpc_dictionary_get_string(v7, "proxiedBundleId");
    if (v19)
    {
      v20 = v19;
      if (objc_msgSend(v8, "hasEntitlement:", CFSTR("com.apple.private.network.socket-delegate")))
      {
        v21 = v10->_preferredAuditToken;
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", v20);
        v22 = objc_claimAutoreleasedReturnValue();
        -[GEOApplicationAuditToken overrideTokenWithProxiedBundleId:](v21, "overrideTokenWithProxiedBundleId:", v22);
        v23 = objc_claimAutoreleasedReturnValue();
        v24 = v10->_preferredAuditToken;
        v10->_preferredAuditToken = (GEOApplicationAuditToken *)v23;

      }
      else
      {
        GEOGetGEODaemonLog();
        v22 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG))
        {
          objc_msgSend(v8, "peerID");
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543875;
          v36 = v25;
          v37 = 2113;
          v38 = CFSTR("com.apple.private.network.socket-delegate");
          v39 = 2081;
          v40 = v20;
          _os_log_impl(&dword_1885A9000, v22, OS_LOG_TYPE_DEBUG, "peerID %{public}@ is missing entitlement \"%{private}@\"; will not attribute to \"%{private}s\",
            buf,
            0x20u);

        }
      }

    }
    v33 = 0;
    GEOGetThrottleToken(v7, (uint64_t)&v33);
    v26 = objc_claimAutoreleasedReturnValue();
    v27 = (__CFString *)v33;
    throttleToken = v10->_throttleToken;
    v10->_throttleToken = (GEODataRequestThrottlerToken *)v26;

    if (v27)
    {
      GEOGetGEODaemonLog();
      v29 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
      {
        objc_msgSend(v8, "peerID");
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v36 = v30;
        v37 = 2114;
        v38 = v27;
        _os_log_impl(&dword_1885A9000, v29, OS_LOG_TYPE_ERROR, "peerID %{public}@ sent invalid throttle token %{public}@", buf, 0x16u);

      }
    }
    v31 = v10;

  }
  return v10;
}

- (void)sendReply:(id)a3
{
  id v4;
  _xpc_connection_s *v5;
  OS_xpc_object *reply;
  _BOOL4 v7;
  void *v8;
  OS_xpc_object *xpcMessage;
  OS_xpc_object *v10;
  int v11;
  OS_xpc_object *v12;
  __int16 v13;
  OS_xpc_object *v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  xpc_dictionary_get_remote_connection(self->_xpcMessage);
  v5 = (_xpc_connection_s *)objc_claimAutoreleasedReturnValue();
  reply = (OS_xpc_object *)xpc_dictionary_create_reply(self->_xpcMessage);
  v7 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG);
  if (reply)
  {
    if (v7)
    {
      xpcMessage = self->_xpcMessage;
      v11 = 134218240;
      v12 = reply;
      v13 = 2048;
      v14 = xpcMessage;
      _os_log_debug_impl(&dword_1885A9000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG, "xpc_dictionary_create_reply(3) returned %p. %p", (uint8_t *)&v11, 0x16u);
      if (v4)
        goto LABEL_4;
    }
    else if (v4)
    {
LABEL_4:
      v8 = (void *)_CFXPCCreateXPCObjectFromCFObject();
      if (v8)
        xpc_dictionary_set_value(reply, "userInfo", v8);

    }
    xpc_connection_send_message(v5, reply);
    -[GEOMessage _endSignpost](self, "_endSignpost");
    goto LABEL_10;
  }
  if (v7)
  {
    v10 = self->_xpcMessage;
    v11 = 134217984;
    v12 = v10;
    _os_log_debug_impl(&dword_1885A9000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG, "xpc_dictionary_create_reply(3) returned NULL. %p", (uint8_t *)&v11, 0xCu);
  }
LABEL_10:

}

- (GEOMessage)init
{
  GEOMessage *result;

  result = (GEOMessage *)objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", CFSTR("GEOMethodNotAvailableException"), CFSTR("This method is unavailable."));
  __break(1u);
  return result;
}

- (void)sendReplyWithXPCUserInfo:(id)a3
{
  id v4;
  _xpc_connection_s *v5;
  OS_xpc_object *reply;
  OS_xpc_object *xpcMessage;
  OS_xpc_object *v8;
  int v9;
  OS_xpc_object *v10;
  __int16 v11;
  OS_xpc_object *v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  xpc_dictionary_get_remote_connection(self->_xpcMessage);
  v5 = (_xpc_connection_s *)objc_claimAutoreleasedReturnValue();
  reply = (OS_xpc_object *)xpc_dictionary_create_reply(self->_xpcMessage);
  if (reply)
  {
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG))
    {
      xpcMessage = self->_xpcMessage;
      v9 = 134218240;
      v10 = reply;
      v11 = 2048;
      v12 = xpcMessage;
      _os_log_debug_impl(&dword_1885A9000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG, "xpc_dictionary_create_reply(3) returned %p. %p", (uint8_t *)&v9, 0x16u);
      if (!v4)
        goto LABEL_5;
    }
    else if (!v4)
    {
LABEL_5:
      xpc_connection_send_message(v5, reply);
      -[GEOMessage _endSignpost](self, "_endSignpost");
      goto LABEL_8;
    }
    xpc_dictionary_set_value(reply, "userInfo", v4);
    goto LABEL_5;
  }
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT))
  {
    v8 = self->_xpcMessage;
    v9 = 134217984;
    v10 = v8;
    _os_log_fault_impl(&dword_1885A9000, MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT, "xpc_dictionary_create_reply(3) returned NULL. %p", (uint8_t *)&v9, 0xCu);
  }
LABEL_8:

}

- (void)_endSignpost
{
  NSObject *v3;
  NSObject *v4;
  os_signpost_id_t signpostId;
  void *v6;
  NSString *messageName;
  int v8;
  void *v9;
  __int16 v10;
  NSString *v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  if (self->_signpostId != -1)
  {
    GEOGetGEODaemonLog();
    v3 = objc_claimAutoreleasedReturnValue();
    v4 = v3;
    signpostId = self->_signpostId;
    if (signpostId - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v3))
    {
      -[GEOPeer bundleIdentifier](self->_peer, "bundleIdentifier");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      messageName = self->_messageName;
      v8 = 138412546;
      v9 = v6;
      v10 = 2112;
      v11 = messageName;
      _os_signpost_emit_with_name_impl(&dword_1885A9000, v4, OS_SIGNPOST_INTERVAL_END, signpostId, "HandleRequest", "type=geo_message,peer=%@,message=%@", (uint8_t *)&v8, 0x16u);

    }
  }
}

- (NSString)messageName
{
  return self->_messageName;
}

- (GEOApplicationAuditToken)preferredAuditToken
{
  return self->_preferredAuditToken;
}

- (GEODataRequestThrottlerToken)throttleToken
{
  return self->_throttleToken;
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
