@implementation GEOPeer

- (NSString)peerID
{
  return self->_peerID;
}

- (GEOXPCConnection)connection
{
  return self->_connection;
}

- (NSString)bundleIdentifier
{
  void *v2;
  void *v3;

  -[GEOPeer auditToken](self, "auditToken");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "bundleId");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (GEOApplicationAuditToken)auditToken
{
  return self->_auditToken;
}

- (void)_handleEvent:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  GEOPeer *v8;
  NSObject *v9;
  const char *v10;
  NSObject *v11;
  os_log_type_t v12;
  NSObject *v13;
  os_signpost_id_t v14;
  NSObject *v15;
  NSObject *v16;
  GEOPeer *v17;
  id v18;
  NSObject *v19;
  _BOOL4 v20;
  const char *v21;
  void *v22;
  uint64_t v23;
  id *WeakRetained;
  id v25;
  GEOPeer *v26;
  id v27;
  id v28;
  int v29;
  NSObject *v30;
  const char *v31;
  NSObject *v32;
  NSObject *v33;
  GEOPeer *v34;
  const char *v35;
  const char *string;
  const char *v37;
  const char *v38;
  void *v39;
  void *v40;
  const char *v41;
  void *v42;
  void *v43;
  uint64_t v44;
  void *v45;
  void *v46;
  uint64_t v47;
  void *v48;
  uint64_t v49;
  void *v50;
  uint64_t v51;
  void *v52;
  uint64_t v53;
  NSObject *v54;
  GEOPeer *v55;
  const char *v56;
  GEOPeer *v57;
  char *v58;
  void *v59;
  int v60;
  int v61;
  NSObject *v62;
  os_signpost_id_t v63;
  NSObject *v64;
  NSObject *v65;
  GEOPeer *v66;
  GEOPeer *v67;
  NSObject *v68;
  NSObject *v69;
  NSObject *v70;
  GEOPeer *v71;
  void *v72;
  uint64_t v73;
  NSObject *v74;
  NSObject *v75;
  NSObject *v76;
  GEOPeer *v77;
  void *v78;
  char v79;
  void *v80;
  NSObject *v81;
  GEOPeer *v82;
  const char *v83;
  int v84;
  void *v85;
  os_signpost_id_t spid;
  os_signpost_id_t spida;
  void *v88;
  void *v89;
  uint8_t buf[4];
  GEOPeer *v91;
  __int16 v92;
  GEOPeer *v93;
  __int16 v94;
  const char *v95;
  uint64_t v96;

  v96 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = (void *)MEMORY[0x18D764E2C]();
  v6 = MEMORY[0x18D765A14](v4);
  if (v6 != MEMORY[0x1E0C81310])
  {
    v7 = MEMORY[0x1E0C812F8];
    if (v6 != MEMORY[0x1E0C812F8])
    {
      v8 = (GEOPeer *)MEMORY[0x18D765864](v4);
      GEOGetGEODaemonLog();
      v9 = objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      {
LABEL_6:

        free(v8);
        goto LABEL_68;
      }
      *(_DWORD *)buf = 138412546;
      v91 = self;
      v92 = 2080;
      v93 = v8;
      v10 = "Unexpected message from peer %@: %s";
      v11 = v9;
      v12 = OS_LOG_TYPE_ERROR;
LABEL_5:
      _os_log_impl(&dword_1885A9000, v11, v12, v10, buf, 0x16u);
      goto LABEL_6;
    }
    -[GEOPeer serverIdentifier](self, "serverIdentifier");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = objc_msgSend(v22, "length");

    if (!v23)
    {
      string = xpc_dictionary_get_string(v4, "peer_server_identifier");
      v37 = xpc_dictionary_get_string(v4, "peer_debug_identifier");
      if (!string || !*string)
      {
        v8 = (GEOPeer *)MEMORY[0x18D765864](v4);
        GEOGetGEODaemonLog();
        v9 = objc_claimAutoreleasedReturnValue();
        if (!os_log_type_enabled(v9, OS_LOG_TYPE_FAULT))
          goto LABEL_6;
        *(_DWORD *)buf = 138412546;
        v91 = self;
        v92 = 2080;
        v93 = v8;
        v10 = "Peer %@ didn't say hello before sending: %s";
        v11 = v9;
        v12 = OS_LOG_TYPE_FAULT;
        goto LABEL_5;
      }
      v38 = v37;
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", string);
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      -[GEOPeer setServerIdentifier:](self, "setServerIdentifier:", v39);

      if (v38)
      {
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", v38);
        v40 = (void *)objc_claimAutoreleasedReturnValue();
        -[GEOPeer setDebugIdentifier:](self, "setDebugIdentifier:", v40);

      }
      WeakRetained = (id *)objc_loadWeakRetained((id *)&self->_daemon);
      objc_msgSend(WeakRetained, "peerDidConnect:", self);
LABEL_67:

      goto LABEL_68;
    }
    WeakRetained = (id *)objc_loadWeakRetained((id *)&self->_daemon);
    v25 = v4;
    v26 = self;
    if (!WeakRetained)
    {
LABEL_66:

      goto LABEL_67;
    }
    if (MEMORY[0x18D765A14](v25) != v7 || (v41 = xpc_dictionary_get_string(v25, "message")) == 0)
    {
      v27 = 0;
      v28 = 0;
      v29 = 0;
      goto LABEL_53;
    }
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", v41);
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3500], "alphanumericCharacterSet");
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v43, "invertedSet");
    v44 = objc_claimAutoreleasedReturnValue();

    objc_msgSend(v42, "componentsSeparatedByString:", CFSTR("."));
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    v88 = (void *)v44;
    if (objc_msgSend(v45, "count") != 2)
      goto LABEL_51;
    objc_msgSend(v45, "objectAtIndexedSubscript:", 0);
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    v47 = objc_msgSend(v46, "rangeOfCharacterFromSet:", v44);

    if (v47 == 0x7FFFFFFFFFFFFFFFLL)
    {
      objc_msgSend(v45, "objectAtIndexedSubscript:", 0);
      v48 = (void *)objc_claimAutoreleasedReturnValue();
      v49 = objc_msgSend(v48, "length");

      if (v49)
      {
        objc_msgSend(v45, "objectAtIndexedSubscript:", 1);
        v50 = (void *)objc_claimAutoreleasedReturnValue();
        v51 = objc_msgSend(v50, "rangeOfCharacterFromSet:", v88);

        if (v51 == 0x7FFFFFFFFFFFFFFFLL)
        {
          objc_msgSend(v45, "objectAtIndexedSubscript:", 1);
          v52 = (void *)objc_claimAutoreleasedReturnValue();
          v53 = objc_msgSend(v52, "length");

          if (v53)
          {
            objc_msgSend(v45, "firstObject");
            v27 = (id)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v45, "lastObject");
            v28 = (id)objc_claimAutoreleasedReturnValue();
            v29 = 1;
LABEL_52:

LABEL_53:
            v57 = (GEOPeer *)v27;
            v58 = (char *)v28;
            if (v29 && -[GEOPeer length](v57, "length") && objc_msgSend(v58, "length"))
            {
              if (-[GEOPeer isForServerIdentifier:](v26, "isForServerIdentifier:", v57))
              {
                objc_msgSend(WeakRetained[1], "objectForKey:", v57);
                v59 = (void *)objc_claimAutoreleasedReturnValue();
                v60 = objc_msgSend((id)objc_msgSend(v59, "serverClass"), "wantsPerMessageSignposts");
                v61 = v60;
                v89 = v59;
                if (v60)
                {
                  v84 = v60;
                  GEOGetGEODaemonLog();
                  v62 = objc_claimAutoreleasedReturnValue();
                  v63 = os_signpost_id_generate(v62);

                  GEOGetGEODaemonLog();
                  v64 = objc_claimAutoreleasedReturnValue();
                  v65 = v64;
                  spid = v63;
                  if (v63 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v64))
                  {
                    -[GEOPeer bundleIdentifier](v26, "bundleIdentifier");
                    v66 = (GEOPeer *)objc_claimAutoreleasedReturnValue();
                    *(_DWORD *)buf = 138412802;
                    v91 = v66;
                    v92 = 2112;
                    v93 = v57;
                    v94 = 2112;
                    v95 = v58;
                    _os_signpost_emit_with_name_impl(&dword_1885A9000, v65, OS_SIGNPOST_INTERVAL_BEGIN, v63, "HandleRequest", "type=message,peer=%@,message=%@.%@", buf, 0x20u);

                  }
                  v59 = v89;
                  v61 = v84;
                }
                else
                {
                  spid = -1;
                }
                GEOGetGEODaemonLog();
                v70 = objc_claimAutoreleasedReturnValue();
                if (os_log_type_enabled(v70, OS_LOG_TYPE_DEBUG))
                {
                  -[GEOPeer peerID](v26, "peerID");
                  v71 = (GEOPeer *)objc_claimAutoreleasedReturnValue();
                  *(_DWORD *)buf = 138543874;
                  v91 = v71;
                  v92 = 2114;
                  v93 = v57;
                  v94 = 2114;
                  v95 = v58;
                  _os_log_impl(&dword_1885A9000, v70, OS_LOG_TYPE_DEBUG, "peerID %{public}@ sent messaageName %{public}@.%{public}@", buf, 0x20u);

                  v59 = v89;
                }

                if (v59)
                {
                  objc_msgSend(v59, "server");
                  v72 = (void *)objc_claimAutoreleasedReturnValue();

                  if (!v72)
                    objc_msgSend(v59, "startServerWithDaemon:", WeakRetained);
                  xpc_dictionary_get_value(v25, "progress_observer_endpoint");
                  v73 = objc_claimAutoreleasedReturnValue();
                  v85 = (void *)v73;
                  if (v73)
                  {
                    objc_msgSend(MEMORY[0x1E0CB38A8], "_geo_mirroredProgressFromReportingXPCEndpoint:totalUnitCount:", v73, 1);
                    v74 = objc_claimAutoreleasedReturnValue();
                    -[NSObject becomeCurrentWithPendingUnitCount:](v74, "becomeCurrentWithPendingUnitCount:", 1);
                  }
                  else
                  {
                    v74 = 0;
                  }
                  objc_msgSend(v59, "server");
                  v78 = (void *)objc_claimAutoreleasedReturnValue();
                  v79 = objc_msgSend(v78, "handleIncomingMessage:withObject:fromPeer:signpostId:", v58, v25, v26, spid);

                  if ((v79 & 1) == 0)
                  {
                    v80 = (void *)MEMORY[0x18D765864](v25);
                    GEOGetGEODaemonLog();
                    v81 = objc_claimAutoreleasedReturnValue();
                    if (os_log_type_enabled(v81, OS_LOG_TYPE_FAULT))
                    {
                      NSStringFromSelector(sel_handleIncomingMessage_fromPeer_);
                      spida = (os_signpost_id_t)v80;
                      v82 = (GEOPeer *)objc_claimAutoreleasedReturnValue();
                      *(_DWORD *)buf = 138412546;
                      v91 = v82;
                      v92 = 2080;
                      v93 = (GEOPeer *)spida;
                      _os_log_impl(&dword_1885A9000, v81, OS_LOG_TYPE_FAULT, "%@: Unhandled message: %s", buf, 0x16u);

                      v80 = (void *)spida;
                    }

                    free(v80);
                  }
                  -[NSObject resignCurrent](v74, "resignCurrent");

                  v59 = v89;
                }
                else
                {
                  if (v61)
                  {
                    GEOGetGEODaemonLog();
                    v75 = objc_claimAutoreleasedReturnValue();
                    v76 = v75;
                    if (spid - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v75))
                    {
                      -[GEOPeer bundleIdentifier](v26, "bundleIdentifier");
                      v77 = (GEOPeer *)objc_claimAutoreleasedReturnValue();
                      *(_DWORD *)buf = 138412802;
                      v91 = v77;
                      v92 = 2112;
                      v93 = v57;
                      v94 = 2112;
                      v95 = v58;
                      _os_signpost_emit_with_name_impl(&dword_1885A9000, v76, OS_SIGNPOST_INTERVAL_END, spid, "HandleRequest", "type=message,peer=%@,message=%@.%@", buf, 0x20u);

                    }
                    v59 = v89;
                  }
                  GEOGetGEODaemonLog();
                  v74 = objc_claimAutoreleasedReturnValue();
                  if (os_log_type_enabled(v74, OS_LOG_TYPE_FAULT))
                  {
                    *(_DWORD *)buf = 138412546;
                    v91 = v57;
                    v92 = 2112;
                    v93 = (GEOPeer *)v58;
                    _os_log_impl(&dword_1885A9000, v74, OS_LOG_TYPE_FAULT, "No handler is registered for message %@.%@", buf, 0x16u);
                  }
                }

              }
              else
              {
                GEOGetGEODaemonLog();
                v69 = objc_claimAutoreleasedReturnValue();
                if (os_log_type_enabled(v69, OS_LOG_TYPE_FAULT))
                {
                  *(_DWORD *)buf = 138412546;
                  v91 = v57;
                  v92 = 2112;
                  v93 = v26;
                  _os_log_impl(&dword_1885A9000, v69, OS_LOG_TYPE_FAULT, "Got message for server \"%@\" from peer not associated with it: %@", buf, 0x16u);
                }

              }
            }
            else
            {
              v67 = (GEOPeer *)MEMORY[0x18D765864](v25);
              GEOGetGEODaemonLog();
              v68 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v68, OS_LOG_TYPE_ERROR))
              {
                *(_DWORD *)buf = 138412546;
                v91 = v26;
                v92 = 2080;
                v93 = v67;
                _os_log_impl(&dword_1885A9000, v68, OS_LOG_TYPE_ERROR, "Received unparsable message from %@: %s", buf, 0x16u);
              }

              free(v67);
            }

            goto LABEL_66;
          }
          GEOGetGEODaemonLog();
          v54 = objc_claimAutoreleasedReturnValue();
          if (!os_log_type_enabled(v54, OS_LOG_TYPE_ERROR))
            goto LABEL_50;
          objc_msgSend(v45, "firstObject");
          v55 = (GEOPeer *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138412290;
          v91 = v55;
          v56 = "Message name (%@) is empty. Ignoring.";
          goto LABEL_49;
        }
        GEOGetGEODaemonLog();
        v54 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v54, OS_LOG_TYPE_ERROR))
        {
          objc_msgSend(v45, "objectAtIndexedSubscript:", 1);
          v55 = (GEOPeer *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138412290;
          v91 = v55;
          v56 = "Message name (%@) contains invalid characters. Ignoring.";
          goto LABEL_49;
        }
LABEL_50:

LABEL_51:
        v27 = 0;
        v28 = 0;
        v29 = 0;
        goto LABEL_52;
      }
      GEOGetGEODaemonLog();
      v54 = objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v54, OS_LOG_TYPE_ERROR))
        goto LABEL_50;
      objc_msgSend(v45, "firstObject");
      v55 = (GEOPeer *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v91 = v55;
      v56 = "Service name (%@) is empty. Ignoring.";
    }
    else
    {
      GEOGetGEODaemonLog();
      v54 = objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v54, OS_LOG_TYPE_ERROR))
        goto LABEL_50;
      objc_msgSend(v45, "firstObject");
      v55 = (GEOPeer *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v91 = v55;
      v56 = "Service name (%@) contains invalid characters. Ignoring.";
    }
LABEL_49:
    _os_log_impl(&dword_1885A9000, v54, OS_LOG_TYPE_ERROR, v56, buf, 0xCu);

    goto LABEL_50;
  }
  GEOGetGEODaemonLog();
  v13 = objc_claimAutoreleasedReturnValue();
  v14 = os_signpost_id_generate(v13);

  GEOGetGEODaemonLog();
  v15 = objc_claimAutoreleasedReturnValue();
  v16 = v15;
  if (v14 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v15))
  {
    -[GEOPeer bundleIdentifier](self, "bundleIdentifier");
    v17 = (GEOPeer *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412290;
    v91 = v17;
    _os_signpost_emit_with_name_impl(&dword_1885A9000, v16, OS_SIGNPOST_INTERVAL_BEGIN, v14, "HandleRequest", "type=error,peer=%@", buf, 0xCu);

  }
  if (v4 == (id)MEMORY[0x1E0C81258] || v4 == (id)MEMORY[0x1E0C81260])
  {
    GEOGetGEODaemonLog();
    v30 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v30, OS_LOG_TYPE_DEBUG))
    {
      v31 = xpc_dictionary_get_string(v4, (const char *)*MEMORY[0x1E0C81270]);
      *(_DWORD *)buf = 138412546;
      v91 = self;
      v92 = 2080;
      v93 = (GEOPeer *)v31;
      _os_log_impl(&dword_1885A9000, v30, OS_LOG_TYPE_DEBUG, "Lost connection with peer %@: %s.", buf, 0x16u);
    }

    v19 = objc_loadWeakRetained((id *)&self->_daemon);
    -[NSObject peerDidDisconnect:](v19, "peerDidDisconnect:", self);
    v21 = "interrupted";
  }
  else
  {
    v18 = (id)MEMORY[0x1E0C81288];
    GEOGetGEODaemonLog();
    v19 = objc_claimAutoreleasedReturnValue();
    v20 = os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG);
    if (v4 != v18)
    {
      if (v20)
      {
        v83 = xpc_dictionary_get_string(v4, (const char *)*MEMORY[0x1E0C81270]);
        *(_DWORD *)buf = 138412546;
        v91 = self;
        v92 = 2080;
        v93 = (GEOPeer *)v83;
        _os_log_impl(&dword_1885A9000, v19, OS_LOG_TYPE_DEBUG, "Unexpected connection error for peer %@: %s", buf, 0x16u);
      }

      abort();
    }
    if (v20)
    {
      *(_DWORD *)buf = 138412290;
      v91 = self;
      _os_log_impl(&dword_1885A9000, v19, OS_LOG_TYPE_DEBUG, "Termination imminent for peer %@", buf, 0xCu);
    }
    v21 = "terminating";
  }

  GEOGetGEODaemonLog();
  v32 = objc_claimAutoreleasedReturnValue();
  v33 = v32;
  if (v14 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v32))
  {
    -[GEOPeer bundleIdentifier](self, "bundleIdentifier");
    v34 = (GEOPeer *)objc_claimAutoreleasedReturnValue();
    v35 = xpc_dictionary_get_string(v4, (const char *)*MEMORY[0x1E0C81270]);
    *(_DWORD *)buf = 138412802;
    v91 = v34;
    v92 = 2080;
    v93 = (GEOPeer *)v21;
    v94 = 2080;
    v95 = v35;
    _os_signpost_emit_with_name_impl(&dword_1885A9000, v33, OS_SIGNPOST_INTERVAL_END, v14, "HandleRequest", "type=error,peer=%@,errorType=%s,message=%s", buf, 0x20u);

  }
LABEL_68:
  objc_autoreleasePoolPop(v5);

}

- (NSString)serverIdentifier
{
  return self->_serverIdentifier;
}

- (void)setServerIdentifier:(id)a3
{
  NSString *v4;
  NSString *serverIdentifier;

  v4 = (NSString *)objc_msgSend(a3, "copy");
  serverIdentifier = self->_serverIdentifier;
  self->_serverIdentifier = v4;

  self->_serverType = GEOXPCServerTypeForIdentifier();
  -[GEOPeer _updateConnectionDebugIdentifier](self, "_updateConnectionDebugIdentifier");
}

- (void)setDebugIdentifier:(id)a3
{
  NSString *v4;
  NSString *debugIdentifier;

  v4 = (NSString *)objc_msgSend(a3, "copy");
  debugIdentifier = self->_debugIdentifier;
  self->_debugIdentifier = v4;

  -[GEOPeer _updateConnectionDebugIdentifier](self, "_updateConnectionDebugIdentifier");
}

- (BOOL)isForServerType:(unint64_t)a3
{
  return !-[GEOPeer serverType](self, "serverType") || -[GEOPeer serverType](self, "serverType") == a3;
}

- (unint64_t)serverType
{
  return self->_serverType;
}

- (BOOL)isForServerIdentifier:(id)a3
{
  return -[GEOPeer isForServerType:](self, "isForServerType:", GEOXPCServerTypeForIdentifier());
}

- (BOOL)preloading
{
  return self->_preloading;
}

- (BOOL)hasEntitlement:(id)a3
{
  id v4;
  void *v5;
  char v6;

  v4 = a3;
  -[GEOPeer auditToken](self, "auditToken");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "hasEntitlement:", v4);

  return v6;
}

void __37__GEOPeer_initWithConnection_daemon___block_invoke(uint64_t a1, void *a2)
{
  id *v2;
  id v3;
  id WeakRetained;

  v2 = (id *)(a1 + 32);
  v3 = a2;
  WeakRetained = objc_loadWeakRetained(v2);
  objc_msgSend(WeakRetained, "_handleEvent:", v3);

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_serverIdentifier, 0);
  objc_storeStrong((id *)&self->_debugIdentifier, 0);
  objc_storeStrong((id *)&self->_peerID, 0);
  objc_storeStrong((id *)&self->_auditToken, 0);
  objc_storeStrong((id *)&self->_connection, 0);
  objc_storeStrong((id *)&self->_preloadingTransaction, 0);
  objc_storeStrong((id *)&self->_peerTransaction, 0);
  objc_storeStrong((id *)&self->_entitlementValueCache, 0);
  objc_destroyWeak((id *)&self->_daemon);
}

- (void)dealloc
{
  objc_super v3;

  -[GEOXPCConnection close](self->_connection, "close");
  v3.receiver = self;
  v3.super_class = (Class)GEOPeer;
  -[GEOPeer dealloc](&v3, sel_dealloc);
}

- (GEOPeer)initWithConnection:(id)a3 daemon:(id)a4
{
  _xpc_connection_s *v6;
  id v7;
  GEOPeer *v8;
  GEOPeer *v9;
  GEOApplicationAuditToken *v10;
  GEOApplicationAuditToken *auditToken;
  GEOXPCConnection *v12;
  void *v13;
  uint64_t v14;
  GEOXPCConnection *connection;
  unint64_t v16;
  unint64_t v17;
  uint64_t v18;
  NSString *peerID;
  id v20;
  uint64_t v21;
  NSObject *peerTransaction;
  NSObject *v23;
  GEOPeer *v24;
  unint64_t v26;
  uint64_t v27;
  _QWORD handler[4];
  id v29;
  id location;
  objc_super v31;

  v6 = (_xpc_connection_s *)a3;
  v7 = a4;
  v31.receiver = self;
  v31.super_class = (Class)GEOPeer;
  v8 = -[GEOPeer init](&v31, sel_init);
  v9 = v8;
  if (v8)
  {
    objc_storeWeak((id *)&v8->_daemon, v7);
    v10 = -[GEOApplicationAuditToken initWithXPCConnection:]([GEOApplicationAuditToken alloc], "initWithXPCConnection:", v6);
    auditToken = v9->_auditToken;
    v9->_auditToken = v10;

    v12 = [GEOXPCConnection alloc];
    -[GEOPeer bundleIdentifier](v9, "bundleIdentifier");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = -[GEOXPCConnection initWithClientConnection:debugIdentifier:](v12, "initWithClientConnection:debugIdentifier:", v6, v13);
    connection = v9->_connection;
    v9->_connection = (GEOXPCConnection *)v14;

    do
    {
      v16 = __ldxr(&initWithConnection_daemon___peerCounter);
      v17 = v16 + 1;
    }
    while (__stxr(v16 + 1, &initWithConnection_daemon___peerCounter));
    v18 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("%qd"), v17);
    peerID = v9->_peerID;
    v9->_peerID = (NSString *)v18;

    if (GEOConfigGetBOOL(GeoServicesConfig_TransactionsForPeers, (uint64_t)off_1EDF4D138))
    {
      -[GEOPeer bundleIdentifier](v9, "bundleIdentifier");
      v20 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
      v26 = v17;
      v27 = objc_msgSend(v20, "UTF8String");
      _GEOCreateTransaction();
      v21 = objc_claimAutoreleasedReturnValue();
      peerTransaction = v9->_peerTransaction;
      v9->_peerTransaction = v21;

    }
    objc_msgSend(v7, "serverQueue", v26, v27);
    v23 = objc_claimAutoreleasedReturnValue();
    xpc_connection_set_target_queue(v6, v23);

    objc_initWeak(&location, v9);
    handler[0] = MEMORY[0x1E0C809B0];
    handler[1] = 3221225472;
    handler[2] = __37__GEOPeer_initWithConnection_daemon___block_invoke;
    handler[3] = &unk_1E1C07998;
    objc_copyWeak(&v29, &location);
    xpc_connection_set_event_handler(v6, handler);
    xpc_connection_activate(v6);
    v24 = v9;
    objc_destroyWeak(&v29);
    objc_destroyWeak(&location);
  }

  return v9;
}

- (NSString)offlineCohortId
{
  void *v2;
  void *v3;

  -[GEOPeer auditToken](self, "auditToken");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "offlineCohortId");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  objc_super v12;

  v3 = (void *)MEMORY[0x1E0CB37A0];
  v12.receiver = self;
  v12.super_class = (Class)GEOPeer;
  -[GEOPeer description](&v12, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[GEOPeer peerID](self, "peerID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[GEOPeer bundleIdentifier](self, "bundleIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[GEOPeer serverIdentifier](self, "serverIdentifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[GEOPeer debugIdentifier](self, "debugIdentifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@{peerId: %@ bundleId: %@ serverId: %@ debugId: %@"), v4, v5, v6, v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  -[GEOPeer offlineCohortId](self, "offlineCohortId");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "appendFormat:", CFSTR(" offlineCohortId: %@"), v10);

  objc_msgSend(v9, "appendFormat:", CFSTR(" connection: %p}"), self->_connection);
  return v9;
}

- (void)_updateConnectionDebugIdentifier
{
  void *v3;
  void *v4;
  uint64_t v5;
  NSString *serverIdentifier;
  void *v7;
  uint64_t v8;
  id v9;

  if (self->_serverIdentifier && self->_debugIdentifier)
  {
    v3 = (void *)MEMORY[0x1E0CB3940];
    -[GEOPeer bundleIdentifier](self, "bundleIdentifier");
    v9 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "stringWithFormat:", CFSTR("%@:%@:%@"), v9, self->_serverIdentifier, self->_debugIdentifier);
  }
  else
  {
    v4 = (void *)MEMORY[0x1E0CB3940];
    -[GEOPeer bundleIdentifier](self, "bundleIdentifier");
    v5 = objc_claimAutoreleasedReturnValue();
    serverIdentifier = self->_serverIdentifier;
    if (!serverIdentifier)
      serverIdentifier = self->_debugIdentifier;
    v9 = (id)v5;
    objc_msgSend(v4, "stringWithFormat:", CFSTR("%@:%@"), v5, serverIdentifier, v8);
  }
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[GEOXPCConnection setDebugIdentifier:](self->_connection, "setDebugIdentifier:", v7);

}

- (BOOL)isLocationd
{
  void *v2;
  char v3;

  -[GEOPeer bundleIdentifier](self, "bundleIdentifier");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isEqualToString:", CFSTR("locationd"));

  return v3;
}

- (void)setPreloading:(BOOL)a3
{
  NSObject *v4;
  NSObject *preloadingTransaction;
  NSObject *v6;
  NSObject *v7;

  if (self->_preloading != a3)
  {
    self->_preloading = a3;
    if (GEOConfigGetBOOL(GeoServicesConfig_TransactionsForPreloaders, (uint64_t)off_1EDF4D148))
    {
      if (self->_preloading)
      {
        -[GEOPeer peerID](self, "peerID");
        v7 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
        -[NSObject UTF8String](v7, "UTF8String");
        _GEOCreateTransaction();
        v4 = objc_claimAutoreleasedReturnValue();
        preloadingTransaction = self->_preloadingTransaction;
        self->_preloadingTransaction = v4;

        v6 = v7;
      }
      else
      {
        v6 = self->_preloadingTransaction;
        self->_preloadingTransaction = 0;
      }

    }
  }
}

- (id)valueForEntitlement:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  -[GEOPeer auditToken](self, "auditToken");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "valueForEntitlement:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (BOOL)preloadingExclusively
{
  return self->_preloadingExclusively;
}

- (void)setPreloadingExclusively:(BOOL)a3
{
  self->_preloadingExclusively = a3;
}

- (NSString)debugIdentifier
{
  return self->_debugIdentifier;
}

@end
