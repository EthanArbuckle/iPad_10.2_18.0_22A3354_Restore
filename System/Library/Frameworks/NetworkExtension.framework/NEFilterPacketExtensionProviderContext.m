@implementation NEFilterPacketExtensionProviderContext

- (id)extensionPoint
{
  return CFSTR("com.apple.networkextension.filter-packet");
}

- (Class)requiredProviderSuperClass
{
  return (Class)objc_opt_class();
}

- (void)startFilterWithOptions:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  void *v8;
  _QWORD v9[5];
  objc_super v10;

  v6 = a4;
  v7 = a3;
  -[NEExtensionProviderContext _principalObject](self, "_principalObject");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v10.receiver = self;
  v10.super_class = (Class)NEFilterPacketExtensionProviderContext;
  -[NEFilterExtensionProviderContext startFilterWithOptions:completionHandler:](&v10, sel_startFilterWithOptions_completionHandler_, v7, v6);

  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __83__NEFilterPacketExtensionProviderContext_startFilterWithOptions_completionHandler___block_invoke;
  v9[3] = &unk_1E3CC45C8;
  v9[4] = self;
  objc_msgSend(v8, "startFilterWithCompletionHandler:", v9);

}

- (void)dealloc
{
  NSObject *v3;
  objc_super v4;
  uint8_t buf[4];
  NEFilterPacketExtensionProviderContext *v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  ne_log_obj();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138412290;
    v6 = self;
    _os_log_debug_impl(&dword_19BD16000, v3, OS_LOG_TYPE_DEBUG, "%@: dealloc", buf, 0xCu);
  }

  v4.receiver = self;
  v4.super_class = (Class)NEFilterPacketExtensionProviderContext;
  -[NEExtensionProviderContext dealloc](&v4, sel_dealloc);
}

- (void)stopWithReason:(int)a3
{
  uint64_t v3;
  os_unfair_lock_s *p_lock;
  const char *v6;
  const char *v7;
  SEL v8;
  const char *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  SEL v15;
  NSObject *v16;
  uint64_t v17;
  objc_super v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  uint8_t buf[4];
  NEFilterPacketExtensionProviderContext *v24;
  __int16 v25;
  uint64_t v26;
  _BYTE v27[128];
  uint64_t v28;

  v3 = *(_QWORD *)&a3;
  v28 = *MEMORY[0x1E0C80C00];
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  if (self)
  {
    if (objc_getProperty(self, v6, 112, 1))
    {
      objc_getProperty(self, v7, 112, 1);
      nw_interpose_cancel();
      objc_setProperty_atomic(self, v8, 0, 112);
    }
    if (objc_getProperty(self, v7, 120, 1))
    {
      v21 = 0u;
      v22 = 0u;
      v19 = 0u;
      v20 = 0u;
      objc_msgSend(objc_getProperty(self, v9, 120, 1), "allValues");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v19, v27, 16);
      if (v11)
      {
        v12 = v11;
        v13 = *(_QWORD *)v20;
        do
        {
          v14 = 0;
          do
          {
            if (*(_QWORD *)v20 != v13)
              objc_enumerationMutation(v10);
            -[NEFilterPacketInterpose close](*(os_unfair_lock_s **)(*((_QWORD *)&v19 + 1) + 8 * v14++));
          }
          while (v12 != v14);
          v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v19, v27, 16);
        }
        while (v12);
      }

      objc_setProperty_atomic(self, v15, 0, 120);
    }
  }
  os_unfair_lock_unlock(p_lock);
  ne_log_obj();
  v16 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
  {
    v17 = ne_session_stop_reason_to_string();
    *(_DWORD *)buf = 138412546;
    v24 = self;
    v25 = 2080;
    v26 = v17;
    _os_log_impl(&dword_19BD16000, v16, OS_LOG_TYPE_INFO, "%@: Calling stopFilterWithReason because: %s", buf, 0x16u);
  }

  v18.receiver = self;
  v18.super_class = (Class)NEFilterPacketExtensionProviderContext;
  -[NEFilterExtensionProviderContext stopWithReason:](&v18, sel_stopWithReason_, v3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_interposes, 0);
  objc_storeStrong((id *)&self->_nw_interpose, 0);
}

void __83__NEFilterPacketExtensionProviderContext_startFilterWithOptions_completionHandler___block_invoke(uint64_t a1, uint64_t a2)
{
  _QWORD *v3;
  void *v4;
  _QWORD v5[5];

  v3 = *(_QWORD **)(a1 + 32);
  if (a2)
  {
    objc_msgSend(v3, "startedWithError:", a2);
  }
  else
  {
    -[NEExtensionProviderContext hostContext](v3, 0);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5[0] = MEMORY[0x1E0C809B0];
    v5[1] = 3221225472;
    v5[2] = __83__NEFilterPacketExtensionProviderContext_startFilterWithOptions_completionHandler___block_invoke_2;
    v5[3] = &unk_1E3CC2EF8;
    v5[4] = *(_QWORD *)(a1 + 32);
    objc_msgSend(v4, "createPacketChannelWithCompletionHandler:", v5);

  }
}

void __83__NEFilterPacketExtensionProviderContext_startFilterWithOptions_completionHandler___block_invoke_2(uint64_t a1, void *a2)
{
  _DWORD *v3;
  id v4;
  NSObject *v5;
  void *v6;
  SEL v7;
  SEL v8;
  const char *v9;
  const char *v10;
  id v11;
  SEL v12;
  SEL v13;
  NSObject *v14;
  void *v15;
  id v16;
  _QWORD v17[2];
  uint8_t buf[4];
  _DWORD *v19;
  __int16 v20;
  id v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v3 = *(_DWORD **)(a1 + 32);
  v4 = a2;
  if (!v3)
    goto LABEL_12;
  ne_log_obj();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138412546;
    v19 = v3;
    v20 = 2112;
    v21 = v4;
    _os_log_debug_impl(&dword_19BD16000, v5, OS_LOG_TYPE_DEBUG, " %@: necpClientClaimWithUUID <%@>", buf, 0x16u);
  }

  if (!v4)
    goto LABEL_12;
  v17[0] = 0;
  v17[1] = 0;
  objc_msgSend(v4, "getUUIDBytes:", v17);
  v6 = (void *)nw_interpose_client_claim();
  objc_setProperty_atomic(v3, v7, v6, 112);

  if (!objc_getProperty(v3, v8, 112, 1))
  {
    ne_log_obj();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412546;
      v19 = v3;
      v20 = 2112;
      v21 = v4;
      _os_log_error_impl(&dword_19BD16000, v14, OS_LOG_TYPE_ERROR, "%@: necpClientClaimWithUUID <%@>: failed claim", buf, 0x16u);
    }

LABEL_12:
    v15 = *(void **)(a1 + 32);
    v16 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB35C8]), "initWithDomain:code:userInfo:", CFSTR("NEFilterErrorDomain"), 1, 0);
    objc_msgSend(v15, "startedWithError:");

    return;
  }
  if (!objc_getProperty(v3, v9, 120, 1))
  {
    v11 = objc_alloc_init(MEMORY[0x1E0C99E08]);
    objc_setProperty_atomic(v3, v12, v11, 120);

  }
  v3[26] = 0;
  objc_getProperty(v3, v10, 112, 1);
  nw_interpose_set_flow_event_handler();
  objc_getProperty(v3, v13, 112, 1);
  nw_interpose_start();

  objc_msgSend(*(id *)(a1 + 32), "startedWithError:", 0);
}

void __65__NEFilterPacketExtensionProviderContext_interposeClaimWithUUID___block_invoke(uint64_t a1, int a2, void *a3, const unsigned __int8 *a4, const char *a5, int a6, uint64_t a7, int a8)
{
  os_unfair_lock_s *v15;
  NSObject *v16;
  void *v17;
  const char *name;
  void *v19;
  os_unfair_lock_s *v20;
  SEL v21;
  os_unfair_lock_s *v22;
  os_unfair_lock_s *v23;
  _BOOL4 v24;
  NSObject *v25;
  _BOOL4 v26;
  id v27;
  NSObject *v28;
  void *v29;
  SEL v30;
  NSObject *v31;
  int *v32;
  SEL v33;
  void *v34;
  NEFilterPacketInterpose *v35;
  NSObject *v36;
  NSObject *v37;
  id *v38;
  uint64_t v39;
  void *v40;
  uint64_t v41;
  void *v42;
  NEFilterPacketContext *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  uint64_t v48;
  NSObject *v49;
  _BOOL4 v50;
  SEL v51;
  NSObject *v52;
  NSObject *v53;
  uint64_t v54;
  int v55;
  int v56;
  const char *v57;
  NSObject *v58;
  uint32_t v59;
  int v60;
  int v61;
  int v62;
  NSObject *v63;
  const char *v64;
  NSObject *v65;
  SEL v66;
  uint64_t extended;
  int fd;
  NSObject *v69;
  NSObject *v70;
  uint64_t v71;
  NSObject *v72;
  NSObject *v73;
  NSObject *v74;
  uint64_t v75;
  uint64_t v76;
  const char *v77;
  NSObject *v78;
  uint32_t v79;
  uint64_t v80;
  uint64_t v81;
  const char *v82;
  NSObject *v83;
  uint32_t v84;
  id Property;
  int v86;
  id v87;
  NSObject *v88;
  uint64_t v89;
  os_unfair_lock_s *self;
  _BYTE v91[18];
  uint8_t buf[4];
  id v93;
  __int16 v94;
  _BYTE v95[10];
  _QWORD v96[3];

  v96[2] = *MEMORY[0x1E0C80C00];
  v15 = *(os_unfair_lock_s **)(a1 + 32);
  v16 = a3;
  if (v15)
  {
    os_unfair_lock_lock(v15 + 26);
    self = v15;
    v17 = (void *)MEMORY[0x1E0CB3940];
    name = nw_interface_get_name(v16);
    v19 = v17;
    v20 = self;
    objc_msgSend(v19, "stringWithUTF8String:", name);
    v89 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(objc_getProperty(self, v21, 120, 1), "objectForKeyedSubscript:", v89);
    v22 = (os_unfair_lock_s *)objc_claimAutoreleasedReturnValue();
    v23 = v22;
    v88 = v16;
    if (a2 == 1)
    {
      if (!v22)
      {
        v27 = 0;
        goto LABEL_19;
      }
      if (-[NEFilterPacketInterpose matchFlow:flowId:](v22, a5, a4))
      {
        ne_log_obj();
        v28 = objc_claimAutoreleasedReturnValue();
        v29 = (void *)v89;
        if (os_log_type_enabled(v28, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)v91 = 138412290;
          *(_QWORD *)&v91[4] = v23;
          _os_log_debug_impl(&dword_19BD16000, v28, OS_LOG_TYPE_DEBUG, "%@: interposeHandleFlowEvent: removing channel", v91, 0xCu);
        }

        -[NEFilterPacketInterpose close](v23);
        objc_msgSend(objc_getProperty(self, v30, 120, 1), "setObject:forKeyedSubscript:", 0, v89);
        v27 = v23;
        goto LABEL_39;
      }
    }
    else
    {
      if (!a2)
      {
        if (v22)
        {
          v24 = -[NEFilterPacketInterpose matchFlow:flowId:](v22, a5, a4);
          ne_log_obj();
          v25 = objc_claimAutoreleasedReturnValue();
          v26 = os_log_type_enabled(v25, OS_LOG_TYPE_DEBUG);
          if (v24)
          {
            if (v26)
            {
              *(_DWORD *)v91 = 138412290;
              *(_QWORD *)&v91[4] = v23;
              _os_log_debug_impl(&dword_19BD16000, v25, OS_LOG_TYPE_DEBUG, "%@: interposeHandleFlowEvent: flow already exists", v91, 0xCu);
            }

            v27 = v23;
            v20 = self;
            goto LABEL_19;
          }
          if (v26)
          {
            *(_DWORD *)v91 = 138412290;
            *(_QWORD *)&v91[4] = v23;
            _os_log_debug_impl(&dword_19BD16000, v25, OS_LOG_TYPE_DEBUG, "%@: interposeHandleFlowEvent: removing channel", v91, 0xCu);
          }

          -[NEFilterPacketInterpose close](v23);
          v20 = self;
          objc_msgSend(objc_getProperty(self, v33, 120, 1), "setObject:forKeyedSubscript:", 0, v89);
        }
        -[os_unfair_lock_s _principalObject](v20, "_principalObject");
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        v35 = [NEFilterPacketInterpose alloc];
        v36 = v16;
        v27 = v35;
        v37 = v36;
        v87 = v34;
        if (v27)
        {
          *(_QWORD *)v91 = v27;
          *(_QWORD *)&v91[8] = NEFilterPacketInterpose;
          v38 = (id *)objc_msgSendSuper2((objc_super *)v91, sel_init);
          v27 = v38;
          if (v38)
          {
            *((_DWORD *)v38 + 2) = 0;
            objc_storeStrong(v38 + 17, a3);
            v39 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3A28]), "initWithUUIDBytes:", a5);
            v40 = (void *)*((_QWORD *)v27 + 22);
            *((_QWORD *)v27 + 22) = v39;

            *((_QWORD *)v27 + 23) = a7;
            *((_DWORD *)v27 + 39) = a6;
            *((_DWORD *)v27 + 40) = a8;
            v41 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3A28]), "initWithUUIDBytes:", a4);
            v42 = (void *)*((_QWORD *)v27 + 21);
            *((_QWORD *)v27 + 21) = v41;

            objc_storeStrong((id *)v27 + 16, v34);
            v43 = objc_alloc_init(NEFilterPacketContext);
            v44 = (void *)*((_QWORD *)v27 + 18);
            *((_QWORD *)v27 + 18) = v43;

          }
        }
        v45 = v87;

        v29 = (void *)v89;
        v20 = self;
        if (!v27)
          goto LABEL_36;
        v46 = (void *)*((_QWORD *)v27 + 16);
        if (v46
          && (objc_msgSend(v46, "packetHandler"),
              v47 = (void *)objc_claimAutoreleasedReturnValue(),
              v47,
              v47))
        {
          v48 = *((_QWORD *)v27 + 2);
          ne_log_obj();
          v49 = objc_claimAutoreleasedReturnValue();
          v50 = os_log_type_enabled(v49, OS_LOG_TYPE_DEBUG);
          if (v48)
          {
            if (v50)
            {
              *(_DWORD *)buf = 138412290;
              v93 = v27;
              _os_log_debug_impl(&dword_19BD16000, v49, OS_LOG_TYPE_DEBUG, "%@: createChannel: channel already exists", buf, 0xCu);
            }

            objc_msgSend(objc_getProperty(self, v51, 120, 1), "setObject:forKeyedSubscript:", v27, v89);
            ne_log_obj();
            v52 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v52, OS_LOG_TYPE_DEBUG))
            {
              *(_DWORD *)v91 = 138412290;
              *(_QWORD *)&v91[4] = v27;
              _os_log_debug_impl(&dword_19BD16000, v52, OS_LOG_TYPE_DEBUG, "%@: interposeHandleFlowEvent: added channel", v91, 0xCu);
            }
LABEL_38:

LABEL_39:
            v32 = &OBJC_IVAR___NEIKEv2SessionConfiguration__ppkMandatory;
            goto LABEL_40;
          }
          if (v50)
          {
            *(_DWORD *)buf = 138412290;
            v93 = v27;
            _os_log_debug_impl(&dword_19BD16000, v49, OS_LOG_TYPE_DEBUG, "%@: Establishing channel", buf, 0xCu);
          }

          if (*((_QWORD *)v27 + 23) && *((_DWORD *)v27 + 40))
          {
            v54 = os_channel_attr_create();
            *((_QWORD *)v27 + 3) = v54;
            if (v54)
            {
              v55 = os_channel_attr_set_key();
              if (v55)
              {
                v56 = v55;
                ne_log_obj();
                v53 = objc_claimAutoreleasedReturnValue();
                if (os_log_type_enabled(v53, OS_LOG_TYPE_ERROR))
                {
                  *(_DWORD *)buf = 138412546;
                  v93 = v27;
                  v94 = 1024;
                  *(_DWORD *)v95 = v56;
                  v57 = "%@: createChannel failed to set key <err %d> ";
LABEL_63:
                  v58 = v53;
                  v59 = 18;
                  goto LABEL_54;
                }
LABEL_35:

                goto LABEL_36;
              }
              v60 = os_channel_attr_set();
              if (v60)
              {
                v61 = v60;
                ne_log_obj();
                v53 = objc_claimAutoreleasedReturnValue();
                if (!os_log_type_enabled(v53, OS_LOG_TYPE_ERROR))
                  goto LABEL_35;
                *(_DWORD *)buf = 138412546;
                v93 = v27;
                v94 = 1024;
                *(_DWORD *)v95 = v61;
                v57 = "%@: createChannel failed to set user-packet-pool attribute <err %d> ";
                goto LABEL_63;
              }
              v62 = os_channel_attr_set();
              ne_log_obj();
              v63 = objc_claimAutoreleasedReturnValue();
              v53 = v63;
              if (v62)
              {
                if (!os_log_type_enabled(v63, OS_LOG_TYPE_ERROR))
                  goto LABEL_35;
                *(_DWORD *)buf = 138412546;
                v93 = v27;
                v94 = 1024;
                *(_DWORD *)v95 = v62;
                v57 = "%@: createChannel failed to set filter attribute <err %d>";
                goto LABEL_63;
              }
              if (os_log_type_enabled(v63, OS_LOG_TYPE_DEBUG))
              {
                Property = objc_getProperty(v27, v64, 176, 1);
                *(_DWORD *)buf = 138412546;
                v93 = v27;
                v94 = 2112;
                *(_QWORD *)v95 = Property;
                _os_log_debug_impl(&dword_19BD16000, v53, OS_LOG_TYPE_DEBUG, "%@ createChannel: nexusInstance %@", buf, 0x16u);
              }

              ne_log_obj();
              v65 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v65, OS_LOG_TYPE_DEBUG))
              {
                v86 = *((_DWORD *)v27 + 39);
                *(_DWORD *)buf = 138412546;
                v93 = v27;
                v94 = 1024;
                *(_DWORD *)v95 = v86;
                _os_log_debug_impl(&dword_19BD16000, v65, OS_LOG_TYPE_DEBUG, "%@ createChannel: nexusPort %d", buf, 0x12u);
              }

              v96[0] = 0;
              v96[1] = 0;
              objc_msgSend(objc_getProperty(v27, v66, 176, 1), "getUUIDBytes:", v96);
              extended = os_channel_create_extended();
              *((_QWORD *)v27 + 2) = extended;
              if (!extended)
              {
                ne_log_obj();
                v74 = objc_claimAutoreleasedReturnValue();
                if (os_log_type_enabled(v74, OS_LOG_TYPE_ERROR))
                {
                  *(_DWORD *)buf = 138412290;
                  v93 = v27;
                  _os_log_error_impl(&dword_19BD16000, v74, OS_LOG_TYPE_ERROR, "%@: createChannel failed to create channel", buf, 0xCu);
                }

                goto LABEL_36;
              }
              fd = os_channel_get_fd();
              *((_DWORD *)v27 + 8) = fd;
              ne_log_obj();
              v69 = objc_claimAutoreleasedReturnValue();
              v70 = v69;
              if (fd < 0)
              {
                if (os_log_type_enabled(v69, OS_LOG_TYPE_ERROR))
                {
                  *(_DWORD *)buf = 138412290;
                  v93 = v27;
                  v77 = "%@: createChannel failed to get channel fd";
                  v78 = v70;
                  v79 = 12;
                  goto LABEL_91;
                }
              }
              else
              {
                if (os_log_type_enabled(v69, OS_LOG_TYPE_DEBUG))
                {
                  *(_DWORD *)buf = 138412290;
                  v93 = v27;
                  _os_log_debug_impl(&dword_19BD16000, v70, OS_LOG_TYPE_DEBUG, "%@: createChannel: created channel", buf, 0xCu);
                }

                *((_QWORD *)v27 + 12) = os_channel_rx_ring();
                *((_QWORD *)v27 + 13) = os_channel_tx_ring();
                *((_QWORD *)v27 + 14) = os_channel_rx_ring();
                v71 = os_channel_tx_ring();
                *((_QWORD *)v27 + 15) = v71;
                if (*((_QWORD *)v27 + 12) && *((_QWORD *)v27 + 13))
                {
                  if (*((_QWORD *)v27 + 14) && v71)
                  {
                    os_channel_read_attr();
                    os_channel_attr_get();
                    *((_WORD *)v27 + 18) = 0;
                    ne_log_obj();
                    v72 = objc_claimAutoreleasedReturnValue();
                    v73 = v72;
                    if (!os_log_type_enabled(v72, OS_LOG_TYPE_ERROR))
                      goto LABEL_89;
                    *(_DWORD *)buf = 138412290;
                    v93 = v27;
                    v82 = "%@: createChannel: channel slot size 0, clean up channel";
                    v83 = v73;
                    v84 = 12;
                  }
                  else
                  {
                    ne_log_obj();
                    v73 = objc_claimAutoreleasedReturnValue();
                    if (!os_log_type_enabled(v73, OS_LOG_TYPE_ERROR))
                    {
LABEL_89:

                      os_unfair_lock_lock((os_unfair_lock_t)v27 + 2);
                      -[NEFilterPacketInterpose close_nolock:]((uint64_t)v27, 0);
                      os_unfair_lock_unlock((os_unfair_lock_t)v27 + 2);
                      v29 = (void *)v89;
                      v20 = self;
                      v45 = v87;
LABEL_36:
                      ne_log_obj();
                      v52 = objc_claimAutoreleasedReturnValue();
                      if (os_log_type_enabled(v52, OS_LOG_TYPE_ERROR))
                      {
                        *(_DWORD *)v91 = 138412290;
                        *(_QWORD *)&v91[4] = v27;
                        _os_log_error_impl(&dword_19BD16000, v52, OS_LOG_TYPE_ERROR, "%@: interposeHandleFlowEvent: failed to create channel", v91, 0xCu);
                      }
                      goto LABEL_38;
                    }
                    v80 = *((_QWORD *)v27 + 14);
                    v81 = *((_QWORD *)v27 + 15);
                    *(_DWORD *)buf = 138412802;
                    v93 = v27;
                    v94 = 1024;
                    *(_DWORD *)v95 = v80;
                    *(_WORD *)&v95[4] = 1024;
                    *(_DWORD *)&v95[6] = v81;
                    v82 = "%@: createChannel failed to get Egress input / output rings (%X %X)";
                    v83 = v73;
                    v84 = 24;
                  }
                  _os_log_error_impl(&dword_19BD16000, v83, OS_LOG_TYPE_ERROR, v82, buf, v84);
                  goto LABEL_89;
                }
                ne_log_obj();
                v70 = objc_claimAutoreleasedReturnValue();
                if (os_log_type_enabled(v70, OS_LOG_TYPE_ERROR))
                {
                  v75 = *((_QWORD *)v27 + 12);
                  v76 = *((_QWORD *)v27 + 13);
                  *(_DWORD *)buf = 138412802;
                  v93 = v27;
                  v94 = 1024;
                  *(_DWORD *)v95 = v75;
                  *(_WORD *)&v95[4] = 1024;
                  *(_DWORD *)&v95[6] = v76;
                  v77 = "%@: createChannel failed to get Ingress input / output rings (%X %X)";
                  v78 = v70;
                  v79 = 24;
LABEL_91:
                  _os_log_error_impl(&dword_19BD16000, v78, OS_LOG_TYPE_ERROR, v77, buf, v79);
                }
              }

              os_unfair_lock_lock((os_unfair_lock_t)v27 + 2);
              -[NEFilterPacketInterpose close_nolock:]((uint64_t)v27, 0);
              os_unfair_lock_unlock((os_unfair_lock_t)v27 + 2);
              goto LABEL_36;
            }
            ne_log_obj();
            v53 = objc_claimAutoreleasedReturnValue();
            if (!os_log_type_enabled(v53, OS_LOG_TYPE_ERROR))
              goto LABEL_35;
            *(_DWORD *)buf = 138412290;
            v93 = v27;
            v57 = "%@: createChannel failed to create channel attributes";
          }
          else
          {
            ne_log_obj();
            v53 = objc_claimAutoreleasedReturnValue();
            if (!os_log_type_enabled(v53, OS_LOG_TYPE_ERROR))
              goto LABEL_35;
            *(_DWORD *)buf = 138412290;
            v93 = v27;
            v57 = "%@: createChannel no key or 0 key length";
          }
        }
        else
        {
          ne_log_obj();
          v53 = objc_claimAutoreleasedReturnValue();
          if (!os_log_type_enabled(v53, OS_LOG_TYPE_ERROR))
            goto LABEL_35;
          *(_DWORD *)buf = 138412290;
          v93 = v27;
          v57 = "%@: createChannel: no provider / packetHandler";
        }
        v58 = v53;
        v59 = 12;
LABEL_54:
        _os_log_error_impl(&dword_19BD16000, v58, OS_LOG_TYPE_ERROR, v57, buf, v59);
        goto LABEL_35;
      }
      ne_log_obj();
      v31 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)v91 = 138412546;
        *(_QWORD *)&v91[4] = v23;
        *(_WORD *)&v91[12] = 1024;
        *(_DWORD *)&v91[14] = a2;
        _os_log_error_impl(&dword_19BD16000, v31, OS_LOG_TYPE_ERROR, "%@: interposeHandleFlowEvent: unsupported event %d", v91, 0x12u);
      }

    }
    v27 = v23;
LABEL_19:
    v32 = &OBJC_IVAR___NEIKEv2SessionConfiguration__ppkMandatory;
    v29 = (void *)v89;
LABEL_40:
    os_unfair_lock_unlock((os_unfair_lock_s *)((char *)v20 + v32[764]));

    v16 = v88;
  }

}

+ (id)_extensionAuxiliaryVendorProtocol
{
  if (_extensionAuxiliaryVendorProtocol_protocolInit_17965 != -1)
    dispatch_once(&_extensionAuxiliaryVendorProtocol_protocolInit_17965, &__block_literal_global_17966);
  return (id)_extensionAuxiliaryVendorProtocol_protocol_17967;
}

+ (id)_extensionAuxiliaryHostProtocol
{
  if (_extensionAuxiliaryHostProtocol_protocolInit_17961 != -1)
    dispatch_once(&_extensionAuxiliaryHostProtocol_protocolInit_17961, &__block_literal_global_62_17962);
  return (id)_extensionAuxiliaryHostProtocol_protocol_17963;
}

void __73__NEFilterPacketExtensionProviderContext__extensionAuxiliaryHostProtocol__block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0CB3B50], "interfaceWithProtocol:", &unk_1EE426568);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)_extensionAuxiliaryHostProtocol_protocol_17963;
  _extensionAuxiliaryHostProtocol_protocol_17963 = v0;

}

void __75__NEFilterPacketExtensionProviderContext__extensionAuxiliaryVendorProtocol__block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0CB3B50], "interfaceWithProtocol:", &unk_1EE41A188);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)_extensionAuxiliaryVendorProtocol_protocol_17967;
  _extensionAuxiliaryVendorProtocol_protocol_17967 = v0;

}

@end
