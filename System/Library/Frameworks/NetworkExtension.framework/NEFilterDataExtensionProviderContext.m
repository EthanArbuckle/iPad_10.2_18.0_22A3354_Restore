@implementation NEFilterDataExtensionProviderContext

- (id)extensionPoint
{
  return CFSTR("com.apple.networkextension.filter-data");
}

- (Class)requiredProviderSuperClass
{
  return (Class)objc_opt_class();
}

- (void)startFilterWithOptions:(id)a3 completionHandler:(id)a4
{
  _BYTE *v6;
  id v7;
  BOOL v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  NSObject *v15;
  _QWORD v16[4];
  id v17;
  id location;
  objc_super v19;
  uint8_t buf[4];
  NEFilterDataExtensionProviderContext *v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  if (self)
  {
    if (v6)
      v8 = v6[11] & 1;
    else
      v8 = 0;
    self->_controlProviderExists = v8;
  }
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (self)
    objc_storeStrong((id *)&self->_pendingConnections, v9);

  objc_msgSend(MEMORY[0x1E0C99D80], "dictionary");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (self)
    objc_storeStrong((id *)&self->_remediationMap, v10);

  objc_msgSend(MEMORY[0x1E0C99D80], "dictionary");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (self)
    objc_storeStrong((id *)&self->_URLAppendStringMap, v11);

  +[NEAppInfoCache sharedAppInfoCache]();
  v12 = objc_claimAutoreleasedReturnValue();
  v13 = (void *)v12;
  if (v12)
    objc_storeWeak((id *)(v12 + 8), self);

  -[NEExtensionProviderContext _principalObject](self, "_principalObject");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v19.receiver = self;
  v19.super_class = (Class)NEFilterDataExtensionProviderContext;
  -[NEFilterExtensionProviderContext startFilterWithOptions:completionHandler:](&v19, sel_startFilterWithOptions_completionHandler_, v6, v7);
  objc_initWeak(&location, self);
  ne_log_obj();
  v15 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v21 = self;
    _os_log_impl(&dword_19BD16000, v15, OS_LOG_TYPE_DEFAULT, "%@: Calling startFilterWithCompletionHandler", buf, 0xCu);
  }

  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __81__NEFilterDataExtensionProviderContext_startFilterWithOptions_completionHandler___block_invoke;
  v16[3] = &unk_1E3CC3148;
  objc_copyWeak(&v17, &location);
  objc_msgSend(v14, "startFilterWithCompletionHandler:", v16);
  objc_destroyWeak(&v17);
  objc_destroyWeak(&location);

}

- (void)stopWithReason:(int)a3
{
  NSObject *v5;
  _QWORD v6[5];
  int v7;

  -[NEFilterExtensionProviderContext queue](self, "queue");
  v5 = objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __55__NEFilterDataExtensionProviderContext_stopWithReason___block_invoke;
  v6[3] = &unk_1E3CC1388;
  v6[4] = self;
  v7 = a3;
  dispatch_async(v5, v6);

}

- (void)providerControlSocketFileHandle:(id)a3
{
  int v4;
  unsigned int v5;
  NSMutableDictionary *v6;
  NSMutableDictionary *socketFlows;
  NSObject *v8;
  dispatch_source_t v9;
  uint64_t v10;
  NSObject *v11;
  NSObject *v12;
  OS_dispatch_source *source;
  NSObject *v14;
  _QWORD v15[4];
  NSObject *v16;
  NEFilterDataExtensionProviderContext *v17;
  _QWORD handler[4];
  NSObject *v19;
  NEFilterDataExtensionProviderContext *v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v4 = dup(objc_msgSend(a3, "fileDescriptor"));
  if (self)
  {
    v5 = v4;
    if (v4 < 0)
    {
      ne_log_obj();
      v14 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      {
        LODWORD(handler[0]) = 67109120;
        HIDWORD(handler[0]) = v5;
        _os_log_error_impl(&dword_19BD16000, v14, OS_LOG_TYPE_ERROR, "Invalid controlSocket value: %d", (uint8_t *)handler, 8u);
      }
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
      v6 = (NSMutableDictionary *)objc_claimAutoreleasedReturnValue();
      socketFlows = self->_socketFlows;
      self->_socketFlows = v6;

      -[NEFilterExtensionProviderContext queue](self, "queue");
      v8 = objc_claimAutoreleasedReturnValue();
      v9 = dispatch_source_create(MEMORY[0x1E0C80DB8], v5, 0, v8);

      if (!v9)
        return;
      v10 = MEMORY[0x1E0C809B0];
      handler[0] = MEMORY[0x1E0C809B0];
      handler[1] = 3221225472;
      handler[2] = __75__NEFilterDataExtensionProviderContext_setupSocketSourceWithControlSocket___block_invoke;
      handler[3] = &unk_1E3CC2F98;
      v11 = v9;
      v19 = v11;
      v20 = self;
      dispatch_source_set_cancel_handler(v11, handler);
      v15[0] = v10;
      v15[1] = 3221225472;
      v15[2] = __75__NEFilterDataExtensionProviderContext_setupSocketSourceWithControlSocket___block_invoke_119;
      v15[3] = &unk_1E3CC2F98;
      v12 = v11;
      v16 = v12;
      v17 = self;
      dispatch_source_set_event_handler(v12, v15);
      dispatch_resume(v12);
      source = self->_source;
      self->_source = (OS_dispatch_source *)v12;
      v14 = v12;

    }
  }
}

- (void)fetchProviderConnectionWithCompletionHandler:(id)a3
{
  void (**v4)(id, NSXPCListenerEndpoint *);
  NSObject *v5;
  xpc_connection_t v6;
  xpc_connection_t v7;
  OS_xpc_object *clientListener;
  xpc_endpoint_t v9;
  id v10;
  void *v11;
  OS_xpc_object *v12;
  NSXPCListenerEndpoint *listenerEndpoint;
  _QWORD handler[5];

  v4 = (void (**)(id, NSXPCListenerEndpoint *))a3;
  if (!self || !self->_clientListener)
  {
    -[NEFilterExtensionProviderContext queue](self, "queue");
    v5 = objc_claimAutoreleasedReturnValue();
    v6 = xpc_connection_create(0, v5);
    v7 = v6;
    if (self)
    {
      objc_storeStrong((id *)&self->_clientListener, v6);

      clientListener = self->_clientListener;
    }
    else
    {

      clientListener = 0;
    }
    v9 = xpc_endpoint_create(clientListener);
    v10 = objc_alloc_init(MEMORY[0x1E0CB3B60]);
    v11 = v10;
    if (self)
    {
      objc_storeStrong((id *)&self->_listenerEndpoint, v10);

      -[NSXPCListenerEndpoint _setEndpoint:](self->_listenerEndpoint, "_setEndpoint:", v9);
      v12 = self->_clientListener;
    }
    else
    {

      objc_msgSend(0, "_setEndpoint:", v9);
      v12 = 0;
    }
    handler[0] = MEMORY[0x1E0C809B0];
    handler[1] = 3221225472;
    handler[2] = __85__NEFilterDataExtensionProviderContext_fetchProviderConnectionWithCompletionHandler___block_invoke;
    handler[3] = &unk_1E3CC4080;
    handler[4] = self;
    xpc_connection_set_event_handler(v12, handler);
    if (!self)
    {
      xpc_connection_resume(0);

      listenerEndpoint = 0;
      goto LABEL_10;
    }
    xpc_connection_resume(self->_clientListener);

  }
  listenerEndpoint = self->_listenerEndpoint;
LABEL_10:
  v4[2](v4, listenerEndpoint);

}

- (void)handleRulesChanged
{
  id v2;

  -[NEExtensionProviderContext _principalObject](self, "_principalObject");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "handleRulesChanged");

}

- (void)provideRemediationMap:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  -[NEFilterExtensionProviderContext queue](self, "queue");
  v5 = objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __62__NEFilterDataExtensionProviderContext_provideRemediationMap___block_invoke;
  v7[3] = &unk_1E3CC2F98;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(v5, v7);

}

- (void)provideURLAppendStringMap:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  -[NEFilterExtensionProviderContext queue](self, "queue");
  v5 = objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __66__NEFilterDataExtensionProviderContext_provideURLAppendStringMap___block_invoke;
  v7[3] = &unk_1E3CC2F98;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(v5, v7);

}

- (void)sendBrowserContentFilterServerRequest
{
  id v2;

  -[NEExtensionProviderContext hostContext](self, a2);
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "sendBrowserContentFilterServerRequest");

}

- (void)sendSocketContentFilterRequest
{
  id v2;

  -[NEExtensionProviderContext hostContext](self, a2);
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "sendSocketContentFilterRequest");

}

- (void)applySettings:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  const char *v8;
  id v9;

  v6 = a4;
  v7 = a3;
  -[NEExtensionProviderContext hostContext](self, v8);
  v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "applySettings:completionHandler:", v7, v6);

}

- (void)resumeFlow:(id)a3 withVerdict:(id)a4
{
  id v6;
  _BYTE *v7;
  NSObject *v8;
  _BYTE *v9;
  id v10;
  void *v11;
  uint64_t v12;
  const __CFString *v13;
  id v14;
  _QWORD block[5];
  id v16;
  id v17;

  v6 = a3;
  v7 = a4;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      v11 = (void *)MEMORY[0x1E0C99DA0];
      v12 = *MEMORY[0x1E0C99778];
      v13 = CFSTR("Verdict argument must be a NEFilterDataVerdict or a NEFilterNewFlowVerdict");
LABEL_8:
      objc_msgSend(v11, "exceptionWithName:reason:userInfo:", v12, v13, 0);
      v14 = (id)objc_claimAutoreleasedReturnValue();
      objc_exception_throw(v14);
    }
  }
  if (v7 && (v7[13] & 1) != 0)
  {
    v11 = (void *)MEMORY[0x1E0C99DA0];
    v12 = *MEMORY[0x1E0C99778];
    v13 = CFSTR("Verdict argument cannot be a pause verdict");
    goto LABEL_8;
  }
  -[NEFilterExtensionProviderContext queue](self, "queue");
  v8 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __63__NEFilterDataExtensionProviderContext_resumeFlow_withVerdict___block_invoke;
  block[3] = &unk_1E3CC36A0;
  block[4] = self;
  v16 = v6;
  v17 = v7;
  v9 = v7;
  v10 = v6;
  dispatch_async(v8, block);

}

- (void)updateFlow:(id)a3 withVerdict:(id)a4 forDirection:(int64_t)a5
{
  id v8;
  _BYTE *v9;
  NSObject *v10;
  _BYTE *v11;
  id v12;
  void *v13;
  uint64_t v14;
  const __CFString *v15;
  id v16;
  _QWORD v17[5];
  id v18;
  id v19;
  int64_t v20;

  v8 = a3;
  v9 = a4;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v13 = (void *)MEMORY[0x1E0C99DA0];
    v14 = *MEMORY[0x1E0C99778];
    v15 = CFSTR("Verdict argument must be a NEFilterDataVerdict");
    goto LABEL_10;
  }
  if (!v9)
  {
    if ((objc_msgSend(0, "needRules") & 1) == 0)
      goto LABEL_6;
    goto LABEL_9;
  }
  if ((v9[11] & 1) != 0 || (objc_msgSend(v9, "needRules") & 1) != 0 || (v9[13] & 1) != 0)
  {
LABEL_9:
    v13 = (void *)MEMORY[0x1E0C99DA0];
    v14 = *MEMORY[0x1E0C99778];
    v15 = CFSTR("Verdict argument must be a \"allow\", \"drop\", or \"data\" verdict");
LABEL_10:
    objc_msgSend(v13, "exceptionWithName:reason:userInfo:", v14, v15, 0);
    v16 = (id)objc_claimAutoreleasedReturnValue();
    objc_exception_throw(v16);
  }
LABEL_6:
  -[NEFilterExtensionProviderContext queue](self, "queue");
  v10 = objc_claimAutoreleasedReturnValue();
  v17[0] = MEMORY[0x1E0C809B0];
  v17[1] = 3221225472;
  v17[2] = __76__NEFilterDataExtensionProviderContext_updateFlow_withVerdict_forDirection___block_invoke;
  v17[3] = &unk_1E3CC01D8;
  v17[4] = self;
  v18 = v8;
  v19 = v9;
  v20 = a5;
  v11 = v9;
  v12 = v8;
  dispatch_async(v10, v17);

}

- (void)handleClientMessage:(id)a3 filloutReply:(id)a4 completionHandler:(id)a5
{
  id v8;
  id v9;
  id v10;
  id v11;
  id v12;
  void (**v13)(_QWORD);
  void (**v14)(_QWORD);
  int64_t v15;
  uint64_t v16;
  NSObject *v17;
  uint64_t v18;
  void *v19;
  const void *v20;
  const void *v21;
  id v22;
  void *v23;
  uint64_t v24;
  const void *v25;
  id v26;
  void *v27;
  NSObject *v28;
  uint64_t v29;
  id v30;
  void (**v31)(_QWORD);
  const uint8_t *uuid;
  int64_t int64;
  const char *string;
  void *v35;
  const char *v36;
  int v37;
  void *v38;
  void *v39;
  const uint8_t *v40;
  size_t v41;
  NSObject *v42;
  void *v43;
  int64_t v44;
  const void *v45;
  const void *v46;
  const void *v47;
  void *v48;
  void *v49;
  void *v50;
  const void *v51;
  void *v52;
  void *v53;
  void *v54;
  uint64_t v55;
  void *v56;
  const uint8_t *v57;
  int64_t v58;
  const void *v59;
  const void *v60;
  id v61;
  void *v62;
  NSObject *v63;
  id v64;
  id v65;
  void (**v66)(_QWORD);
  const uint8_t *v67;
  uint64_t v68;
  NSMutableDictionary *v69;
  _BYTE *v70;
  NSObject *v71;
  _BOOL4 v72;
  void *v73;
  size_t v74;
  _BYTE *v75;
  void *v76;
  _BYTE *v77;
  void *v78;
  _QWORD *v79;
  void (**v80)(_QWORD);
  const uint8_t *v81;
  const unsigned __int8 *v82;
  unsigned __int16 v83;
  uint64_t v84;
  uint64_t v85;
  const unsigned __int8 *v86;
  const unsigned __int8 *v87;
  int v88;
  int v89;
  int v90;
  _BYTE *v91;
  const void *v92;
  const char *v93;
  const void *v94;
  id v95;
  void *v96;
  void *v97;
  uint64_t v98;
  void *v99;
  void *v100;
  void *v101;
  SEL v102;
  const char *v103;
  void *v104;
  const char *v105;
  const char *v106;
  id v107;
  void *v108;
  void *v109;
  const char *v110;
  void *v111;
  NSMutableDictionary *channelFlows;
  NSMutableDictionary *v113;
  NSMutableDictionary *v114;
  NSObject *source;
  int handle;
  unint64_t v117;
  ssize_t v118;
  int *v119;
  int v120;
  void *v121;
  NSObject *v122;
  id v123;
  NSObject *v124;
  NSObject *v125;
  const char *v126;
  NSObject *v127;
  NSObject *v128;
  NSObject *v129;
  NSObject *v130;
  const char *v131;
  void *v132;
  int64_t v133;
  NSObject *v134;
  void *v135;
  int64_t v136;
  NSObject *v137;
  NSObject *v138;
  const char *v139;
  NSObject *v140;
  NSObject *v141;
  void *v142;
  NSObject *v143;
  void *v144;
  int64_t v145;
  NSObject *v146;
  NSObject *v147;
  const char *v148;
  NSObject *v149;
  void *v150;
  NEFilterBrowserFlow *v151;
  id *v152;
  id *v153;
  id v154;
  id v155;
  const void *data;
  const void *v157;
  id v158;
  void *v159;
  void *v160;
  SEL v161;
  uint64_t v162;
  void *v163;
  void *v164;
  SEL v165;
  const void *v166;
  void *v167;
  void *v168;
  void *v169;
  const void *v170;
  void *v171;
  void *v172;
  void *v173;
  void *v174;
  void *v175;
  NSMutableDictionary *browserFlows;
  NSMutableDictionary *v177;
  NSMutableDictionary *v178;
  NSMutableDictionary *v179;
  SEL v180;
  id v181;
  NSObject *v182;
  const char *v183;
  NSObject *v184;
  NSObject *v185;
  char *v186;
  const char *v187;
  NSObject *v188;
  int v189;
  uint64_t v190;
  uint64_t uint64;
  id v192;
  id newValue;
  id newValuea;
  int64_t v195;
  const void *v196;
  const void *v197;
  id v198;
  void (**v199)(_QWORD);
  id v200;
  uint64_t v201;
  uint64_t v202;
  id v203;
  void *v204;
  void *v205;
  xpc_object_t xdict;
  xpc_object_t xdicta;
  xpc_object_t xdictb;
  xpc_object_t xdictc;
  int xdictd;
  xpc_object_t xdicte;
  id v212;
  id v213;
  id v214;
  id v215;
  id v216;
  id v217;
  size_t v218;
  sockaddr v219;
  uint64_t v220;
  int v221;
  sockaddr length;
  uint64_t v223;
  int v224;
  size_t v225;
  size_t v226[2];
  __int128 v227;
  size_t applier[4];
  __int128 v229;
  id v230;
  void (**v231)(_QWORD);
  size_t aBlock[2];
  _BYTE v233[24];
  id v234;
  uuid_t dst;
  size_t v236[2];
  uint8_t buf[4];
  char *v238;
  uint64_t v239;

  v239 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  switch(xpc_dictionary_get_int64(v8, "command"))
  {
    case 2:
      if (v9)
      {
        v11 = v8;
        v30 = v9;
        v31 = (void (**)(_QWORD))v10;
        if (self)
        {
          xdicta = v30;
          v213 = v10;
          v226[0] = 0;
          memset(applier, 0, sizeof(applier));
          uuid = xpc_dictionary_get_uuid(v11, "flow-uuid");
          int64 = xpc_dictionary_get_int64(v11, "direction");
          string = xpc_dictionary_get_string(v11, "url");
          v35 = (void *)xpc_dictionary_get_string(v11, "parent-url");
          v36 = xpc_dictionary_get_string(v11, "source-app-bundle-id");
          uint64 = xpc_dictionary_get_uint64(v11, "source-app-pid");
          v190 = xpc_dictionary_get_uint64(v11, "source-pid");
          newValue = (id)xpc_dictionary_get_uint64(v11, "socket-identifier");
          v37 = xpc_dictionary_get_uint64(v11, "connection-direction");
          if (uuid && (unint64_t)(int64 - 3) > 0xFFFFFFFFFFFFFFFDLL)
          {
            v189 = v37;
            if (string)
            {
              objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", string);
              v38 = (void *)objc_claimAutoreleasedReturnValue();
              if (v38)
              {
                objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:", v38);
                v39 = (void *)objc_claimAutoreleasedReturnValue();
              }
              else
              {
                v39 = 0;
              }

            }
            else
            {
              v39 = 0;
            }
            if (v35)
            {
              objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", v35);
              v150 = (void *)objc_claimAutoreleasedReturnValue();
              if (v150)
              {
                objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:", v150);
                v35 = (void *)objc_claimAutoreleasedReturnValue();
              }
              else
              {
                v35 = 0;
              }

            }
            if (v36)
              v205 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR(".%s"), v36);
            else
              v205 = 0;
            v151 = [NEFilterBrowserFlow alloc];
            v200 = v35;
            if (v151
              && (aBlock[0] = (size_t)v151,
                  aBlock[1] = (size_t)NEFilterBrowserFlow,
                  (v152 = -[size_t initWithURL:sourceAppIdentifier:]((objc_super *)aBlock, sel_initWithURL_sourceAppIdentifier_, v39, v205)) != 0))
            {
              v153 = v152;
              objc_storeStrong(v152 + 20, v35);
              v154 = v153[18];
              v153[18] = 0;

              v155 = v153[19];
              v153[19] = 0;

              *((_BYTE *)v153 + 13) = v205 != 0;
              aBlock[0] = 0;
              data = xpc_dictionary_get_data(v11, "crypto-signature", aBlock);
              if (data && aBlock[0])
              {
                v157 = data;
                v158 = objc_alloc(MEMORY[0x1E0C99D50]);
                v159 = (void *)objc_msgSend(v158, "initWithBytes:length:", v157, aBlock[0]);
                objc_msgSend(v153, "setCrypto_signature:", v159);

              }
              v160 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3A28]), "initWithUUIDBytes:", uuid);
              objc_setProperty_atomic_copy(v153, v161, v160, 120);

              objc_msgSend(v153, "setEpid:", uint64);
              objc_msgSend(v153, "setPid:", v190);
              if (v189)
                v162 = 2;
              else
                v162 = 1;
              objc_msgSend(v153, "setDirection:", v162);
              xpc_dictionary_get_audit_token();
              v163 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D50]), "initWithBytes:length:", applier, 32);
              objc_msgSend(v153, "setSourceAppAuditToken:", v163);

              xpc_dictionary_get_remote_connection(v11);
              v164 = (void *)objc_claimAutoreleasedReturnValue();
              objc_setProperty_atomic(v153, v165, v164, 136);

              v166 = xpc_dictionary_get_data(v11, "url-request", v226);
              if (v166)
              {
                objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytes:length:", v166, v226[0]);
                v167 = (void *)objc_claimAutoreleasedReturnValue();
                if (v167)
                {
                  v168 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3710]), "initForReadingFromData:error:", v167, 0);
                  objc_msgSend(v168, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("URL_Request"));
                  v169 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v153, "setRequest:", v169);

                  objc_msgSend(v168, "finishDecoding");
                }

              }
              v170 = xpc_dictionary_get_data(v11, "url-response", v226);
              if (v170)
              {
                objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytes:length:", v170, v226[0]);
                v171 = (void *)objc_claimAutoreleasedReturnValue();
                if (v171)
                {
                  v172 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3710]), "initForReadingFromData:error:", v171, 0);
                  objc_msgSend(v172, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("URL_Response"));
                  v173 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v153, "setResponse:", v173);

                  objc_msgSend(v172, "finishDecoding");
                }

              }
              if (newValue)
              {
                -[NEFilterDataExtensionProviderContext socketExceptions]((uint64_t)self);
                v174 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", newValue);
                v175 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v174, "addObject:", v175);

              }
              browserFlows = self->_browserFlows;
              if (!browserFlows)
              {
                objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
                v177 = (NSMutableDictionary *)objc_claimAutoreleasedReturnValue();
                v178 = self->_browserFlows;
                self->_browserFlows = v177;

                browserFlows = self->_browserFlows;
              }
              v179 = browserFlows;
              v181 = objc_getProperty(v153, v180, 120, 1);
              -[NSMutableDictionary setObject:forKeyedSubscript:](v179, "setObject:forKeyedSubscript:", v153, v181);

              v30 = xdicta;
              -[NEFilterDataExtensionProviderContext handleNewFlow:reply:controlSocket:completionHandler:]((uint64_t)self, v153, xdicta, -1, v31);
            }
            else
            {

              ne_log_obj();
              v182 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v182, OS_LOG_TYPE_ERROR))
              {
                LOWORD(aBlock[0]) = 0;
                _os_log_error_impl(&dword_19BD16000, v182, OS_LOG_TYPE_ERROR, "browserFlow: New flow rejected because flow object creation failed", (uint8_t *)aBlock, 2u);
              }

              v30 = xdicta;
              xpc_dictionary_set_int64(xdicta, "error", 1);
              v31[2](v31);
              v153 = 0;
            }

          }
          else
          {
            ne_log_obj();
            v128 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v128, OS_LOG_TYPE_DEBUG))
            {
              LOWORD(aBlock[0]) = 0;
              _os_log_debug_impl(&dword_19BD16000, v128, OS_LOG_TYPE_DEBUG, "browserFlow: New flow rejected due to invalid parameters", (uint8_t *)aBlock, 2u);
            }

            v30 = xdicta;
            xpc_dictionary_set_int64(xdicta, "error", 4);
            v31[2](v31);
          }
          v10 = v213;
        }

        goto LABEL_247;
      }
      ne_log_obj();
      v125 = objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v125, OS_LOG_TYPE_ERROR))
        goto LABEL_140;
      LOWORD(applier[0]) = 0;
      v126 = "Reply dictionary is NULL when handling a source new flow message";
      goto LABEL_139;
    case 3:
      if (!v9)
      {
        ne_log_obj();
        v125 = objc_claimAutoreleasedReturnValue();
        if (!os_log_type_enabled(v125, OS_LOG_TYPE_ERROR))
          goto LABEL_140;
        LOWORD(applier[0]) = 0;
        v126 = "Reply dictionary is NULL when handling a source add data message";
        goto LABEL_139;
      }
      v11 = v8;
      v12 = v9;
      v14 = (void (**)(_QWORD))v10;
      if (!self)
        goto LABEL_179;
      if (self->_browserFlows)
      {
        v40 = xpc_dictionary_get_uuid(v11, "flow-uuid");
        if (v40)
        {
          v41 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3A28]), "initWithUUIDBytes:", v40);
          ne_log_obj();
          v42 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v42, OS_LOG_TYPE_DEBUG))
          {
            LODWORD(applier[0]) = 138412290;
            *(size_t *)((char *)applier + 4) = v41;
            _os_log_debug_impl(&dword_19BD16000, v42, OS_LOG_TYPE_DEBUG, "browserFlow: add-data message received, %@", (uint8_t *)applier, 0xCu);
          }

          xdictb = (xpc_object_t)v41;
          -[NSMutableDictionary objectForKey:](self->_browserFlows, "objectForKey:", v41);
          v43 = (void *)objc_claimAutoreleasedReturnValue();
          if (v43)
          {
            v44 = xpc_dictionary_get_int64(v11, "direction");
            aBlock[0] = 0;
            v45 = xpc_dictionary_get_data(v11, "data", aBlock);
            if (v45 && aBlock[0])
            {
              v46 = v45;
              v202 = v44;
              applier[0] = 0;
              v47 = xpc_dictionary_get_data(v11, "url-request", applier);
              if (v47)
              {
                objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytes:length:", v47, applier[0]);
                v48 = (void *)objc_claimAutoreleasedReturnValue();
                if (v48)
                {
                  v196 = v46;
                  v49 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3710]), "initForReadingFromData:error:", v48, 0);
                  objc_msgSend(v49, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("URL_Request"));
                  v214 = v10;
                  v50 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v43, "setRequest:", v50);

                  v10 = v214;
                  objc_msgSend(v49, "finishDecoding");

                  v46 = v196;
                }

              }
              v51 = xpc_dictionary_get_data(v11, "url-response", applier);
              if (v51)
              {
                objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytes:length:", v51, applier[0]);
                v52 = (void *)objc_claimAutoreleasedReturnValue();
                if (v52)
                {
                  v197 = v46;
                  v53 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3710]), "initForReadingFromData:error:", v52, 0);
                  objc_msgSend(v53, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("URL_Response"));
                  v215 = v10;
                  v54 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v43, "setResponse:", v54);

                  v10 = v215;
                  objc_msgSend(v53, "finishDecoding");

                  v46 = v197;
                }

              }
              v55 = xpc_dictionary_get_uint64(v11, "data-start-offset");
              objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytes:length:", v46, aBlock[0]);
              v56 = (void *)objc_claimAutoreleasedReturnValue();
              -[NEFilterDataExtensionProviderContext handleData:offset:forFlow:direction:reply:controlSocket:completionHandler:]((uint64_t)self, v56, v55, v43, v202, v12, -1, v14);

              goto LABEL_191;
            }
            ne_log_obj();
            v149 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v149, OS_LOG_TYPE_DEBUG))
            {
              LODWORD(applier[0]) = 138412290;
              *(size_t *)((char *)applier + 4) = (size_t)xdictb;
              _os_log_debug_impl(&dword_19BD16000, v149, OS_LOG_TYPE_DEBUG, "browserFlow: Add data message rejected, invalid data parameter %@", (uint8_t *)applier, 0xCu);
            }

            v144 = v12;
            v145 = 4;
          }
          else
          {
            ne_log_obj();
            v143 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v143, OS_LOG_TYPE_DEBUG))
            {
              LODWORD(applier[0]) = 138412290;
              *(size_t *)((char *)applier + 4) = (size_t)xdictb;
              _os_log_debug_impl(&dword_19BD16000, v143, OS_LOG_TYPE_DEBUG, "browserFlow: Add data message ignored, %@", (uint8_t *)applier, 0xCu);
            }

            v144 = v12;
            v145 = 6;
          }
          xpc_dictionary_set_int64(v144, "error", v145);
          v14[2](v14);
LABEL_191:

          goto LABEL_179;
        }
        ne_log_obj();
        v138 = objc_claimAutoreleasedReturnValue();
        if (!os_log_type_enabled(v138, OS_LOG_TYPE_ERROR))
          goto LABEL_160;
        LOWORD(applier[0]) = 0;
        v139 = "browserFlow: Add data flow rejected due to invalid parameters";
LABEL_250:
        _os_log_error_impl(&dword_19BD16000, v138, OS_LOG_TYPE_ERROR, v139, (uint8_t *)applier, 2u);
LABEL_160:

        v132 = v12;
        v133 = 4;
      }
      else
      {
        ne_log_obj();
        v130 = objc_claimAutoreleasedReturnValue();
        if (!os_log_type_enabled(v130, OS_LOG_TYPE_ERROR))
          goto LABEL_150;
        LOWORD(applier[0]) = 0;
        v131 = "browserFlow: Add data message rejected, no browser flow exist";
LABEL_238:
        _os_log_error_impl(&dword_19BD16000, v130, OS_LOG_TYPE_ERROR, v131, (uint8_t *)applier, 2u);
LABEL_150:

        v132 = v12;
        v133 = 1;
      }
      xpc_dictionary_set_int64(v132, "error", v133);
      v14[2](v14);
LABEL_179:

LABEL_246:
LABEL_247:

      goto LABEL_248;
    case 4:
      if (!v9)
      {
        ne_log_obj();
        v125 = objc_claimAutoreleasedReturnValue();
        if (!os_log_type_enabled(v125, OS_LOG_TYPE_ERROR))
          goto LABEL_140;
        LOWORD(applier[0]) = 0;
        v126 = "Reply dictionary is NULL when handling a source data complete message";
        goto LABEL_139;
      }
      v11 = v8;
      v12 = v9;
      v14 = (void (**)(_QWORD))v10;
      if (!self)
        goto LABEL_179;
      if (!self->_browserFlows)
      {
        ne_log_obj();
        v130 = objc_claimAutoreleasedReturnValue();
        if (!os_log_type_enabled(v130, OS_LOG_TYPE_ERROR))
          goto LABEL_150;
        LOWORD(applier[0]) = 0;
        v131 = "browserFlow data complete message rejected, no browser flows exist.";
        goto LABEL_238;
      }
      v57 = xpc_dictionary_get_uuid(v11, "flow-uuid");
      if (!v57)
      {
        ne_log_obj();
        v138 = objc_claimAutoreleasedReturnValue();
        if (!os_log_type_enabled(v138, OS_LOG_TYPE_ERROR))
          goto LABEL_160;
        LOWORD(applier[0]) = 0;
        v139 = "browserFlow data complete message rejected, invalid Flow UUID parameter";
        goto LABEL_250;
      }
      v17 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3A28]), "initWithUUIDBytes:", v57);
      -[NSMutableDictionary objectForKey:](self->_browserFlows, "objectForKey:", v17);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      if (v19)
      {
        v212 = v10;
        v58 = xpc_dictionary_get_int64(v11, "direction");
        objc_msgSend(v19, "setInBytes:", xpc_dictionary_get_uint64(v11, "byte-count-inbound"));
        objc_msgSend(v19, "setOutBytes:", xpc_dictionary_get_uint64(v11, "byte-count-outbound"));
        aBlock[0] = 0;
        v59 = xpc_dictionary_get_data(v11, "crypto-signature", aBlock);
        if (v59 && aBlock[0])
        {
          v60 = v59;
          v61 = objc_alloc(MEMORY[0x1E0C99D50]);
          v62 = (void *)objc_msgSend(v61, "initWithBytes:length:", v60, aBlock[0]);
          objc_msgSend(v19, "setCrypto_signature:", v62);

        }
        ne_log_obj();
        v63 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v63, OS_LOG_TYPE_DEBUG))
        {
          LODWORD(applier[0]) = 138412290;
          *(size_t *)((char *)applier + 4) = (size_t)v17;
          _os_log_debug_impl(&dword_19BD16000, v63, OS_LOG_TYPE_DEBUG, "browserFlow data complete message received, %@", (uint8_t *)applier, 0xCu);
        }

        -[NEFilterDataExtensionProviderContext handleDataCompleteForFlow:direction:reply:controlSocket:completionHandler:](self, v19, v58, v12, -1, v14);
        goto LABEL_60;
      }
      ne_log_obj();
      v146 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v146, OS_LOG_TYPE_DEBUG))
      {
        LODWORD(applier[0]) = 138412290;
        *(size_t *)((char *)applier + 4) = (size_t)v17;
        _os_log_debug_impl(&dword_19BD16000, v146, OS_LOG_TYPE_DEBUG, "browserFlow data complete message ignored, no open flow for %@", (uint8_t *)applier, 0xCu);
      }

      xpc_dictionary_set_int64(v12, "error", 6);
      goto LABEL_176;
    case 5:
      if (v9)
      {
        v64 = v8;
        v65 = v9;
        v66 = (void (**)(_QWORD))v10;
        if (self)
        {
          if (self->_browserFlows)
          {
            v67 = xpc_dictionary_get_uuid(v64, "flow-uuid");
            if (v67)
            {
              v68 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3A28]), "initWithUUIDBytes:", v67);
              v69 = self->_browserFlows;
              xdictc = (xpc_object_t)v68;
              -[NSMutableDictionary objectForKey:](v69, "objectForKey:", v68);
              v70 = (_BYTE *)objc_claimAutoreleasedReturnValue();

              ne_log_obj();
              v71 = objc_claimAutoreleasedReturnValue();
              v72 = os_log_type_enabled(v71, OS_LOG_TYPE_DEBUG);
              if (v70)
              {
                v203 = v64;
                v216 = v10;
                if (v72)
                {
                  LODWORD(applier[0]) = 138412290;
                  *(size_t *)((char *)applier + 4) = (size_t)xdictc;
                  _os_log_debug_impl(&dword_19BD16000, v71, OS_LOG_TYPE_DEBUG, "browserFlow: Remediation message received, %@", (uint8_t *)applier, 0xCu);
                }

                v70[10] = 1;
                -[NEExtensionProviderContext _principalObject](self, "_principalObject");
                v73 = (void *)objc_claimAutoreleasedReturnValue();
                v74 = MEMORY[0x1E0C809B0];
                aBlock[0] = MEMORY[0x1E0C809B0];
                aBlock[1] = 3221225472;
                *(_QWORD *)v233 = __96__NEFilterDataExtensionProviderContext_handleRemediationMessage_filloutReply_completionHandler___block_invoke;
                *(_QWORD *)&v233[8] = &unk_1E3CC0200;
                *(_QWORD *)&v233[16] = v73;
                v75 = v70;
                v234 = v75;
                v198 = v73;
                v76 = _Block_copy(aBlock);
                applier[0] = v74;
                applier[1] = 3221225472;
                applier[2] = (size_t)__96__NEFilterDataExtensionProviderContext_handleRemediationMessage_filloutReply_completionHandler___block_invoke_2;
                applier[3] = (size_t)&unk_1E3CC0318;
                v77 = v75;
                *(_QWORD *)&v229 = v77;
                *((_QWORD *)&v229 + 1) = self;
                v230 = v65;
                v231 = v66;
                v78 = _Block_copy(applier);
                v79 = -[NEFilterDataSavedMessageHandler initWithGetVerdictBlock:handleVerdictBlock:]([NEFilterDataSavedMessageHandler alloc], v76, v78);
                -[NEFilterDataSavedMessageHandler enqueueWithFlow:context:]((uint64_t)v79, v77, self);

                v10 = v216;
                v64 = v203;
              }
              else
              {
                if (v72)
                {
                  LODWORD(applier[0]) = 138412290;
                  *(size_t *)((char *)applier + 4) = (size_t)xdictc;
                  _os_log_debug_impl(&dword_19BD16000, v71, OS_LOG_TYPE_DEBUG, "Remediation message ignored, no open flow for %@", (uint8_t *)applier, 0xCu);
                }

                xpc_dictionary_set_int64(v65, "error", 6);
                v66[2](v66);
              }

              goto LABEL_184;
            }
            ne_log_obj();
            v140 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v140, OS_LOG_TYPE_ERROR))
            {
              LOWORD(applier[0]) = 0;
              _os_log_error_impl(&dword_19BD16000, v140, OS_LOG_TYPE_ERROR, "Remediation message rejected, invalid flow UUID parameter", (uint8_t *)applier, 2u);
            }

            v135 = v65;
            v136 = 4;
          }
          else
          {
            ne_log_obj();
            v134 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v134, OS_LOG_TYPE_ERROR))
            {
              LOWORD(applier[0]) = 0;
              _os_log_error_impl(&dword_19BD16000, v134, OS_LOG_TYPE_ERROR, "Remediation message rejected, no browser flow exists", (uint8_t *)applier, 2u);
            }

            v135 = v65;
            v136 = 1;
          }
          xpc_dictionary_set_int64(v135, "error", v136);
          v66[2](v66);
        }
LABEL_184:

        goto LABEL_248;
      }
      ne_log_obj();
      v125 = objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v125, OS_LOG_TYPE_ERROR))
        goto LABEL_140;
      LOWORD(applier[0]) = 0;
      v126 = "Reply dictionary is NULL when handling a source remediate message";
      goto LABEL_139;
    case 6:
      if (v9)
      {
        v11 = v8;
        v12 = v9;
        v80 = (void (**)(_QWORD))v10;
        if (!self)
        {
LABEL_245:

          goto LABEL_246;
        }
        v217 = v10;
        *(_OWORD *)v226 = 0u;
        v227 = 0u;
        v81 = xpc_dictionary_get_uuid(v11, "flow-uuid");
        if (!v81)
        {
          ne_log_obj();
          v137 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v137, OS_LOG_TYPE_DEBUG))
          {
            LOWORD(applier[0]) = 0;
            _os_log_debug_impl(&dword_19BD16000, v137, OS_LOG_TYPE_DEBUG, "channelFlow new channelFlow message rejected, invalid Flow UUID parameter", (uint8_t *)applier, 2u);
          }

          xpc_dictionary_set_int64(v12, "error", 4);
          v80[2](v80);
          goto LABEL_245;
        }
        v82 = v81;
        v199 = v80;
        v83 = xpc_dictionary_get_uint64(v11, "ip-protocol");
        v84 = xpc_dictionary_get_uint64(v11, "client-pid");
        v85 = xpc_dictionary_get_uint64(v11, "client-e-pid");
        xdictd = xpc_dictionary_get_uint64(v11, "connection-direction");
        *(_OWORD *)aBlock = 0u;
        memset(v233, 0, 21);
        uuid_unparse(v82, (char *)aBlock);
        v236[0] = 0;
        v236[1] = 0;
        v86 = xpc_dictionary_get_uuid(v11, "client-proc-uuid");
        if (v86)
          uuid_copy((unsigned __int8 *)v236, v86);
        memset(dst, 0, sizeof(dst));
        v87 = xpc_dictionary_get_uuid(v11, "client-e-proc-uuid");
        if (v87)
          uuid_copy(dst, v87);
        v225 = 0;
        *(_QWORD *)&length.sa_len = 0;
        *(_QWORD *)&length.sa_data[6] = 0;
        v224 = 0;
        v223 = 0;
        if (xpc_dictionary_get_data(v11, "local-addr", &v225) && v225 <= 0x1C)
          __memcpy_chk();
        *(_QWORD *)&v219.sa_len = 0;
        *(_QWORD *)&v219.sa_data[6] = 0;
        v221 = 0;
        v220 = 0;
        v88 = 0;
        v204 = v12;
        if (xpc_dictionary_get_data(v11, "remote-addr", &v225) && v225 <= 0x1C)
        {
          __memcpy_chk();
          if (v219.sa_family == 30)
            v89 = 30;
          else
            v89 = 0;
          v88 = v89;
        }
        if (v83 == 17)
          v90 = 2;
        else
          v90 = 1;
        newValuea = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3A28]), "initWithUUIDBytes:", v82);
        v91 = -[NEFilterSocketFlow initWithSocketFamily:socketType:socketProtocol:pid:epid:uuid:euuid:socketID:]([NEFilterSocketFlow alloc], v88, v90, v83, v84, v85, (uint64_t)v236, (uint64_t)dst, -1);
        if (!v91)
        {
          ne_log_obj();
          v141 = objc_claimAutoreleasedReturnValue();
          v80 = v199;
          v12 = v204;
          v97 = newValuea;
          if (os_log_type_enabled(v141, OS_LOG_TYPE_ERROR))
          {
            LODWORD(applier[0]) = 138412290;
            *(size_t *)((char *)applier + 4) = (size_t)newValuea;
            _os_log_error_impl(&dword_19BD16000, v141, OS_LOG_TYPE_ERROR, "New flow %@ rejected because flow creation failed", (uint8_t *)applier, 0xCu);
          }

          xpc_dictionary_set_int64(v204, "error", 1);
          xpc_dictionary_set_uuid(v204, "flow-uuid", v82);
          v199[2](v199);
          v10 = v217;
          v142 = 0;
          goto LABEL_244;
        }
        v218 = 0;
        v92 = xpc_dictionary_get_data(v11, "crypto-signature", &v218);
        v80 = v199;
        if (v92 && v218)
        {
          v94 = v92;
          v95 = objc_alloc(MEMORY[0x1E0C99D50]);
          v96 = (void *)objc_msgSend(v95, "initWithBytes:length:", v94, v218);
          objc_msgSend(v91, "setCrypto_signature:", v96);

        }
        v97 = newValuea;
        objc_setProperty_atomic_copy(v91, v93, newValuea, 120);
        if (xdictd)
          v98 = 2;
        else
          v98 = 1;
        objc_msgSend(v91, "setDirection:", v98);
        xpc_dictionary_get_audit_token();
        v99 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D50]), "initWithBytes:length:", v226, 32);
        objc_msgSend(v91, "setSourceAppAuditToken:", v99);

        objc_msgSend(v91, "sourceAppAuditToken");
        v100 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v91, "setSourceProcessAuditToken:", v100);

        xpc_dictionary_get_remote_connection(v11);
        v101 = (void *)objc_claimAutoreleasedReturnValue();
        objc_setProperty_atomic(v91, v102, v101, 136);

        v103 = xpc_dictionary_get_string(v11, "source-app-bundle-id");
        v10 = v217;
        if (v103)
        {
          v104 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR(".%s"), v103);
          objc_msgSend(v91, "setSourceAppIdentifier:", v104);

          v91[13] = 1;
        }
        xdicte = v91;
        v105 = xpc_dictionary_get_string(v11, "url");
        if (v105)
        {
          v106 = v105;
          v107 = objc_alloc(MEMORY[0x1E0C99E98]);
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", v106);
          v108 = (void *)objc_claimAutoreleasedReturnValue();
          v109 = (void *)objc_msgSend(v107, "initWithString:", v108);
          objc_msgSend(xdicte, "setURL:", v109);

        }
        v110 = xpc_dictionary_get_string(v11, "remote-hostname");
        if (v110)
        {
          v111 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithCString:encoding:", v110, 4);
          objc_msgSend(xdicte, "setRemoteHostname:", v111);

        }
        -[NEFilterSocketFlow setLocalAddress:](xdicte, &length);
        -[NEFilterSocketFlow setRemoteAddress:](xdicte, &v219);
        channelFlows = self->_channelFlows;
        v12 = v204;
        if (!channelFlows)
        {
          objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
          v113 = (NSMutableDictionary *)objc_claimAutoreleasedReturnValue();
          v114 = self->_channelFlows;
          self->_channelFlows = v113;

          channelFlows = self->_channelFlows;
        }
        -[NSMutableDictionary setObject:forKey:](channelFlows, "setObject:forKey:", xdicte, newValuea);
        v192 = newValuea;
        if (!v192)
        {
          ne_log_obj();
          v188 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v188, OS_LOG_TYPE_FAULT))
          {
            LODWORD(applier[0]) = 136315138;
            *(size_t *)((char *)applier + 4) = (size_t)"-[NEFilterDataExtensionProviderContext blessClient:]";
            _os_log_fault_impl(&dword_19BD16000, v188, OS_LOG_TYPE_FAULT, "%s called with null clientUUID", (uint8_t *)applier, 0xCu);
          }

LABEL_242:
          v10 = v217;
          v80 = v199;
          v12 = v204;
          v97 = newValuea;
          goto LABEL_243;
        }
        source = self->_source;
        if (source)
        {
          handle = dispatch_source_get_handle(source);
          if ((handle & 0x80000000) == 0)
          {
            *(_QWORD *)&v229 = 0;
            *(_OWORD *)applier = xmmword_19BED7490;
            *(_OWORD *)&applier[2] = 0uLL;
            objc_msgSend(v192, "getUUIDBytes:", &applier[3]);
            v117 = 0;
            while (1)
            {
              v118 = write(handle, (char *)applier + v117, 40 - v117);
              v119 = __error();
              if (v118 < 1)
              {
                if (v118)
                {
                  v120 = *v119;
                  if (*v119 != 35)
                  {
                    ne_log_obj();
                    v184 = objc_claimAutoreleasedReturnValue();
                    v185 = v184;
                    if (v120 == 2)
                    {
                      if (os_log_type_enabled(v184, OS_LOG_TYPE_DEBUG))
                      {
                        *(_WORD *)buf = 0;
                        _os_log_debug_impl(&dword_19BD16000, v185, OS_LOG_TYPE_DEBUG, "No socket flow to bless, ignore", buf, 2u);
                      }
                    }
                    else if (os_log_type_enabled(v184, OS_LOG_TYPE_ERROR))
                    {
                      v186 = strerror(v120);
                      *(_DWORD *)buf = 136315138;
                      v238 = v186;
                      _os_log_error_impl(&dword_19BD16000, v185, OS_LOG_TYPE_ERROR, "Write operation on the control socket failed while blessing the socket (%s)", buf, 0xCu);
                    }

                    goto LABEL_242;
                  }
                }
              }
              else
              {
                v117 += v118;
              }
              if (v117 >= 0x28)
                goto LABEL_242;
            }
          }
          ne_log_obj();
          v147 = objc_claimAutoreleasedReturnValue();
          if (!os_log_type_enabled(v147, OS_LOG_TYPE_ERROR))
            goto LABEL_230;
          LODWORD(applier[0]) = 138412290;
          *(size_t *)((char *)applier + 4) = (size_t)v192;
          v148 = "Failed to find control socket to bless client %@";
        }
        else
        {
          ne_log_obj();
          v147 = objc_claimAutoreleasedReturnValue();
          if (!os_log_type_enabled(v147, OS_LOG_TYPE_ERROR))
          {
LABEL_230:

LABEL_243:
            v142 = xdicte;
            -[NEFilterDataExtensionProviderContext handleNewFlow:reply:controlSocket:completionHandler:]((uint64_t)self, xdicte, v12, -1, v80);
LABEL_244:

            goto LABEL_245;
          }
          LODWORD(applier[0]) = 138412290;
          *(size_t *)((char *)applier + 4) = (size_t)v192;
          v148 = "Failed to find control socket source to bless client %@";
        }
        _os_log_error_impl(&dword_19BD16000, v147, OS_LOG_TYPE_ERROR, v148, (uint8_t *)applier, 0xCu);
        goto LABEL_230;
      }
      ne_log_obj();
      v125 = objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v125, OS_LOG_TYPE_ERROR))
        goto LABEL_140;
      LOWORD(applier[0]) = 0;
      v126 = "Reply dictionary is NULL when handling a protocol new flow message";
      goto LABEL_139;
    case 7:
    case 8:
      if (v9)
      {
        v11 = v8;
        v12 = v9;
        v13 = (void (**)(_QWORD))v10;
        v14 = v13;
        if (!self)
          goto LABEL_179;
        if (v11)
        {
          if (v13)
          {
            v15 = xpc_dictionary_get_int64(v11, "command");
            v16 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3A28]), "initWithUUIDBytes:", xpc_dictionary_get_uuid(v11, "flow-uuid"));
            if (v16)
            {
              v17 = v16;
              v195 = v15;
              if (v15 == 8)
                v18 = 2;
              else
                v18 = 1;
              -[NSMutableDictionary objectForKey:](self->_channelFlows, "objectForKey:", v16);
              v19 = (void *)objc_claimAutoreleasedReturnValue();
              if (v19)
              {
                *(_QWORD *)&length.sa_len = 0;
                aBlock[0] = 0;
                aBlock[1] = 0;
                *(_DWORD *)&v233[8] = 0;
                *(_QWORD *)v233 = 0;
                if (xpc_dictionary_get_data(v11, "local-addr", (size_t *)&length.sa_len)
                  && *(_QWORD *)&length.sa_len <= 0x1CuLL)
                {
                  __memcpy_chk();
                  -[NEFilterSocketFlow setLocalAddress:](v19, (sockaddr *)aBlock);
                }
                v201 = v18;
                v212 = v10;
                v226[0] = 0;
                v226[1] = 0;
                DWORD2(v227) = 0;
                *(_QWORD *)&v227 = 0;
                if (xpc_dictionary_get_data(v11, "remote-addr", (size_t *)&length.sa_len)
                  && *(_QWORD *)&length.sa_len <= 0x1CuLL)
                {
                  __memcpy_chk();
                  -[NEFilterSocketFlow setRemoteAddress:](v19, (sockaddr *)v226);
                }
                xdict = v12;
                *(_QWORD *)&v219.sa_len = 0;
                v20 = xpc_dictionary_get_data(v11, "crypto-signature", (size_t *)&v219.sa_len);
                if (v20 && *(_QWORD *)&v219.sa_len)
                {
                  v21 = v20;
                  v22 = objc_alloc(MEMORY[0x1E0C99D50]);
                  v23 = (void *)objc_msgSend(v22, "initWithBytes:length:", v21, *(_QWORD *)&v219.sa_len);
                  objc_msgSend(v19, "setCrypto_signature:", v23);

                }
                v24 = xpc_dictionary_get_uint64(v11, "pending-data-start-offset");
                v236[0] = 0;
                v25 = xpc_dictionary_get_data(v11, "data", v236);
                v26 = objc_alloc(MEMORY[0x1E0C99D50]);
                v27 = (void *)objc_msgSend(v26, "initWithBytes:length:", v25, v236[0]);
                ne_log_obj();
                v28 = objc_claimAutoreleasedReturnValue();
                if (os_log_type_enabled(v28, OS_LOG_TYPE_DEBUG))
                {
                  v183 = "out";
                  LODWORD(applier[0]) = 136315906;
                  if (v195 == 8)
                    v183 = "in";
                  *(size_t *)((char *)applier + 4) = (size_t)v183;
                  WORD2(applier[1]) = 2112;
                  *(size_t *)((char *)&applier[1] + 6) = (size_t)v17;
                  HIWORD(applier[2]) = 2048;
                  applier[3] = v24;
                  LOWORD(v229) = 2048;
                  *(_QWORD *)((char *)&v229 + 2) = v236[0];
                  _os_log_debug_impl(&dword_19BD16000, v28, OS_LOG_TYPE_DEBUG, "Received %sbound data for %@ (offset %lld, dataLen %zu)", (uint8_t *)applier, 0x2Au);
                }

                v29 = v24;
                v12 = xdict;
                -[NEFilterDataExtensionProviderContext handleData:offset:forFlow:direction:reply:controlSocket:completionHandler:]((uint64_t)self, v27, v29, v19, v201, xdict, -1, v14);

LABEL_60:
                v10 = v212;
              }
              else
              {
                xpc_dictionary_set_int64(v12, "error", 6);
                ne_log_obj();
                v129 = objc_claimAutoreleasedReturnValue();
                if (os_log_type_enabled(v129, OS_LOG_TYPE_DEBUG))
                {
                  LODWORD(applier[0]) = 138412290;
                  *(size_t *)((char *)applier + 4) = (size_t)v17;
                  _os_log_debug_impl(&dword_19BD16000, v129, OS_LOG_TYPE_DEBUG, "Add data message rejected, no flow for %@", (uint8_t *)applier, 0xCu);
                }

LABEL_176:
                v14[2](v14);
              }

            }
            else
            {
              ne_log_obj();
              v127 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v127, OS_LOG_TYPE_DEBUG))
              {
                LOWORD(applier[0]) = 0;
                _os_log_debug_impl(&dword_19BD16000, v127, OS_LOG_TYPE_DEBUG, "New data message rejected, invalid flow UUID", (uint8_t *)applier, 2u);
              }

              xpc_dictionary_set_int64(v12, "error", 4);
              v14[2](v14);
              v17 = 0;
            }
            goto LABEL_178;
          }
          ne_log_obj();
          v17 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v17, OS_LOG_TYPE_FAULT))
          {
            LODWORD(applier[0]) = 136315138;
            *(size_t *)((char *)applier + 4) = (size_t)"-[NEFilterDataExtensionProviderContext handleChannelMessageMoreDa"
                                                       "ta:filloutReply:completionHandler:]";
            v187 = "%s called with null completionHandler";
            goto LABEL_257;
          }
        }
        else
        {
          ne_log_obj();
          v17 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v17, OS_LOG_TYPE_FAULT))
          {
            LODWORD(applier[0]) = 136315138;
            *(size_t *)((char *)applier + 4) = (size_t)"-[NEFilterDataExtensionProviderContext handleChannelMessageMoreDa"
                                                       "ta:filloutReply:completionHandler:]";
            v187 = "%s called with null message";
LABEL_257:
            _os_log_fault_impl(&dword_19BD16000, v17, OS_LOG_TYPE_FAULT, v187, (uint8_t *)applier, 0xCu);
          }
        }
LABEL_178:

        goto LABEL_179;
      }
      ne_log_obj();
      v125 = objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v125, OS_LOG_TYPE_ERROR))
        goto LABEL_140;
      LOWORD(applier[0]) = 0;
      v126 = "Reply dictionary is NULL when handling a protocol data message";
LABEL_139:
      _os_log_error_impl(&dword_19BD16000, v125, OS_LOG_TYPE_ERROR, v126, (uint8_t *)applier, 2u);
LABEL_140:

LABEL_248:
      return;
    case 9:
    case 10:
      if (v9)
        goto LABEL_23;
      ne_log_obj();
      v125 = objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v125, OS_LOG_TYPE_ERROR))
        goto LABEL_140;
      LOWORD(applier[0]) = 0;
      v126 = "Reply dictionary is NULL when handling a protocol data finished message";
      goto LABEL_139;
    case 11:
LABEL_23:
      -[NEFilterDataExtensionProviderContext handleChannelMessageFlowFinish:filloutReply:completionHandler:]((id *)&self->super.super.super.super.isa, v8, v9, v10);
      goto LABEL_248;
    case 12:
      v11 = v10;
      if (!self)
        goto LABEL_247;
      xpc_dictionary_get_array(v8, "stats-report-statistics");
      v121 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = v121;
      if (v121 && xpc_array_get_count(v121))
      {
        ne_log_obj();
        v122 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v122, OS_LOG_TYPE_DEBUG))
        {
          LODWORD(applier[0]) = 134217984;
          *(size_t *)((char *)applier + 4) = xpc_array_get_count(v12);
          _os_log_debug_impl(&dword_19BD16000, v122, OS_LOG_TYPE_DEBUG, "Channel Stats Report - stats count %zu", (uint8_t *)applier, 0xCu);
        }

        applier[0] = MEMORY[0x1E0C809B0];
        applier[1] = 3221225472;
        applier[2] = (size_t)__103__NEFilterDataExtensionProviderContext_handleChannelMessageStatsReport_filloutReply_completionHandler___block_invoke;
        applier[3] = (size_t)&unk_1E3CC0360;
        v123 = v11;
        *(_QWORD *)&v229 = self;
        *((_QWORD *)&v229 + 1) = v123;
        xpc_array_apply(v12, applier);
        v124 = *((_QWORD *)&v229 + 1);
      }
      else
      {
        ne_log_obj();
        v124 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v124, OS_LOG_TYPE_ERROR))
        {
          LOWORD(applier[0]) = 0;
          _os_log_error_impl(&dword_19BD16000, v124, OS_LOG_TYPE_ERROR, "Channel Stats Report - empty stats", (uint8_t *)applier, 2u);
        }
      }

      goto LABEL_246;
    default:
      goto LABEL_248;
  }
}

- (void)fetchCurrentRulesForFlow:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  const char *v8;
  void *v9;
  id v10;
  _QWORD v11[5];
  id v12;

  v6 = a4;
  v7 = a3;
  -[NEExtensionProviderContext hostContext](self, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __83__NEFilterDataExtensionProviderContext_fetchCurrentRulesForFlow_completionHandler___block_invoke;
  v11[3] = &unk_1E3CC02F0;
  v11[4] = self;
  v12 = v6;
  v10 = v6;
  objc_msgSend(v9, "fetchCurrentRulesForFlow:completionHandler:", v7, v11);

}

- (void)report:(id)a3
{
  const char *v4;
  void *v5;
  id v6;

  v6 = a3;
  if (self && self->_controlProviderExists)
  {
    -[NEExtensionProviderContext hostContext](self, v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "report:", v6);

  }
}

- (void)fetchAppInfoForPID:(int)a3 UUID:(id)a4 bundleID:(id)a5 completionHandler:(id)a6
{
  id v10;
  id v11;
  id v12;
  NSObject *v13;
  id v14;
  id v15;
  id v16;
  _QWORD block[5];
  id v18;
  id v19;
  id v20;
  int v21;

  v10 = a4;
  v11 = a5;
  v12 = a6;
  -[NEFilterExtensionProviderContext queue](self, "queue");
  v13 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __91__NEFilterDataExtensionProviderContext_fetchAppInfoForPID_UUID_bundleID_completionHandler___block_invoke;
  block[3] = &unk_1E3CC1888;
  v21 = a3;
  block[4] = self;
  v18 = v10;
  v19 = v11;
  v20 = v12;
  v14 = v11;
  v15 = v10;
  v16 = v12;
  dispatch_async(v13, block);

}

- (NSDictionary)remediationMap
{
  return self->_remediationMap;
}

- (NSDictionary)URLAppendStringMap
{
  return self->_URLAppendStringMap;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pendingConnections, 0);
  objc_storeStrong((id *)&self->_source, 0);
  objc_storeStrong((id *)&self->_socketExceptions, 0);
  objc_storeStrong((id *)&self->_channelFlows, 0);
  objc_storeStrong((id *)&self->_socketFlows, 0);
  objc_storeStrong((id *)&self->_browserFlows, 0);
  objc_storeStrong((id *)&self->_listenerEndpoint, 0);
  objc_storeStrong((id *)&self->_clientListener, 0);
  objc_storeStrong((id *)&self->_URLAppendStringMap, 0);
  objc_storeStrong((id *)&self->_remediationMap, 0);
}

void __91__NEFilterDataExtensionProviderContext_fetchAppInfoForPID_UUID_bundleID_completionHandler___block_invoke(uint64_t a1, const char *a2)
{
  void *v3;
  const char *v4;
  SEL v5;
  void *v6;
  NEAppInfo *self;

  -[NEExtensionProviderContext hostContext](*(_QWORD **)(a1 + 32), a2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    self = objc_alloc_init(NEAppInfo);
    if (self)
    {
      self->_pid = *(_DWORD *)(a1 + 64);
      objc_setProperty_nonatomic_copy(self, v4, *(id *)(a1 + 40), 16);
      objc_setProperty_nonatomic_copy(self, v5, *(id *)(a1 + 48), 24);
    }
    -[NEExtensionProviderContext hostContext](*(_QWORD **)(a1 + 32), v4);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "getSourceAppInfo:completionHandler:", self, *(_QWORD *)(a1 + 56));

  }
  else
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
  }
}

void __83__NEFilterDataExtensionProviderContext_fetchCurrentRulesForFlow_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  id v5;
  id v6;
  _QWORD v7[4];
  id v8;
  id v9;

  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "queue");
  v4 = objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __83__NEFilterDataExtensionProviderContext_fetchCurrentRulesForFlow_completionHandler___block_invoke_2;
  v7[3] = &unk_1E3CC46A8;
  v5 = *(id *)(a1 + 40);
  v8 = v3;
  v9 = v5;
  v6 = v3;
  dispatch_async(v4, v7);

}

uint64_t __83__NEFilterDataExtensionProviderContext_fetchCurrentRulesForFlow_completionHandler___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

- (void)handleChannelMessageFlowFinish:(void *)a3 filloutReply:(void *)a4 completionHandler:
{
  id v7;
  id v8;
  void (**v9)(_QWORD);
  int64_t int64;
  const unsigned __int8 *uuid;
  void *v12;
  void *v13;
  const void *data;
  const void *v15;
  id v16;
  void *v17;
  NSObject *v18;
  NSObject *v19;
  NSObject *v20;
  uint64_t v21;
  NSObject *v22;
  const char *v23;
  size_t length;
  uint8_t buf[4];
  const char *v26;
  __int16 v27;
  void *v28;
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v7 = a2;
  v8 = a3;
  v9 = a4;
  if (a1)
  {
    int64 = xpc_dictionary_get_int64(v7, "command");
    uuid = xpc_dictionary_get_uuid(v7, "flow-uuid");
    v12 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3A28]), "initWithUUIDBytes:", uuid);
    if (!v12)
    {
      ne_log_obj();
      v19 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG))
      {
        *(_WORD *)buf = 0;
        _os_log_debug_impl(&dword_19BD16000, v19, OS_LOG_TYPE_DEBUG, "Finished data message rejected, invalid flow UUID", buf, 2u);
      }

      if (v8)
        xpc_dictionary_set_int64(v8, "error", 4);
      v9[2](v9);
      goto LABEL_29;
    }
    objc_msgSend(a1[20], "objectForKey:", v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    if (v13)
    {
      if (int64 == 11)
      {
        objc_msgSend(v13, "setInBytes:", xpc_dictionary_get_uint64(v7, "byte-count-inbound"));
        objc_msgSend(v13, "setOutBytes:", xpc_dictionary_get_uint64(v7, "byte-count-outbound"));
      }
      length = 0;
      data = xpc_dictionary_get_data(v7, "crypto-signature", &length);
      if (data && length)
      {
        v15 = data;
        v16 = objc_alloc(MEMORY[0x1E0C99D50]);
        v17 = (void *)objc_msgSend(v16, "initWithBytes:length:", v15, length);
        objc_msgSend(v13, "setCrypto_signature:", v17);

      }
      if (int64 != 11)
      {
        if (int64 == 9)
          v21 = 1;
        else
          v21 = 2;
        ne_log_obj();
        v22 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG))
        {
          v23 = "in";
          if (int64 == 9)
            v23 = "out";
          *(_DWORD *)buf = 136315394;
          v26 = v23;
          v27 = 2112;
          v28 = v12;
          _os_log_debug_impl(&dword_19BD16000, v22, OS_LOG_TYPE_DEBUG, "Received finished %sbound data for %@", buf, 0x16u);
        }

        -[NEFilterDataExtensionProviderContext handleDataCompleteForFlow:direction:reply:controlSocket:completionHandler:](a1, v13, v21, v8, -1, v9);
        goto LABEL_28;
      }
      ne_log_obj();
      v18 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412290;
        v26 = (const char *)v12;
        _os_log_debug_impl(&dword_19BD16000, v18, OS_LOG_TYPE_DEBUG, "Finished flow for %@", buf, 0xCu);
      }

      -[NEFilterDataExtensionProviderContext closeChannelFlow:](a1, v13);
    }
    else
    {
      ne_log_obj();
      v20 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412290;
        v26 = (const char *)v12;
        _os_log_debug_impl(&dword_19BD16000, v20, OS_LOG_TYPE_DEBUG, "Finished data message rejected, no flow found for %@", buf, 0xCu);
      }

      if (v8)
      {
        xpc_dictionary_set_uuid(v8, "flow-uuid", uuid);
        xpc_dictionary_set_int64(v8, "error", 6);
      }
    }
    v9[2](v9);
LABEL_28:

LABEL_29:
  }

}

uint64_t __103__NEFilterDataExtensionProviderContext_handleChannelMessageStatsReport_filloutReply_completionHandler___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v4;
  void *v5;
  const uint8_t *uuid;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  NSObject *v11;
  NSObject *v12;
  size_t length;
  sockaddr buf;
  uint64_t v16;
  int v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = v4;
  if (v4 && MEMORY[0x1A1ACFDA4](v4) == MEMORY[0x1E0C812F8])
  {
    uuid = xpc_dictionary_get_uuid(v5, "flow-uuid");
    if (uuid)
    {
      v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3A28]), "initWithUUIDBytes:", uuid);
      v8 = *(_QWORD *)(a1 + 32);
      if (v8)
        v9 = *(void **)(v8 + 160);
      else
        v9 = 0;
      objc_msgSend(v9, "objectForKey:", v7);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      if (v10)
      {
        objc_msgSend(v10, "setInBytes:", xpc_dictionary_get_uint64(v5, "byte-count-inbound"));
        objc_msgSend(v10, "setOutBytes:", xpc_dictionary_get_uint64(v5, "byte-count-outbound"));
        length = 0;
        *(_QWORD *)&buf.sa_len = 0;
        *(_QWORD *)&buf.sa_data[6] = 0;
        v16 = 0;
        v17 = 0;
        if (xpc_dictionary_get_data(v5, "local-addr", &length) && length <= 0x1C)
        {
          __memcpy_chk();
          -[NEFilterSocketFlow setLocalAddress:](v10, &buf);
        }
        -[NEFilterDataExtensionProviderContext reportFlowStats:](*(void **)(a1 + 32), v10);
      }
      else
      {
        ne_log_obj();
        v12 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)&buf.sa_len = 138412290;
          *(_QWORD *)&buf.sa_data[2] = v7;
          _os_log_debug_impl(&dword_19BD16000, v12, OS_LOG_TYPE_DEBUG, "Channel Stats Report - no flow found for %@", &buf.sa_len, 0xCu);
        }

        (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
      }

    }
    else
    {
      ne_log_obj();
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)&buf.sa_len = 0;
        _os_log_error_impl(&dword_19BD16000, v11, OS_LOG_TYPE_ERROR, "Channel Stats Report - flow stats with no flow UUID", &buf.sa_len, 2u);
      }

      (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
    }
  }

  return 1;
}

- (void)reportFlowStats:(void *)a1
{
  id v3;
  const char *v4;
  void *v5;
  id Property;
  id v7;
  void *v8;
  NSObject *v9;
  uint8_t v10[16];

  v3 = a2;
  v5 = v3;
  if (a1)
  {
    if (v3)
      Property = objc_getProperty(v3, v4, 104, 1);
    else
      Property = 0;
    v7 = Property;
    v8 = (void *)objc_msgSend(v7, "copy");

    if (v8)
    {
      objc_msgSend(v8, "setShouldReport:", 1);
      -[NEFilterDataExtensionProviderContext reportFlow:forVerdict:event:](a1, v5, v8, 4);
    }
    else
    {
      ne_log_obj();
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)v10 = 0;
        _os_log_error_impl(&dword_19BD16000, v9, OS_LOG_TYPE_ERROR, "No current verdict available, cannot report flow stats", v10, 2u);
      }

    }
  }

}

- (void)reportFlow:(void *)a3 forVerdict:(uint64_t)a4 event:
{
  _BYTE *v7;
  id v8;
  void *v9;
  _BOOL4 v10;
  uint64_t v11;
  NSObject *v12;
  _QWORD *v13;
  void *v14;
  int v15;
  void *v16;
  __int16 v17;
  uint64_t v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v7 = a2;
  v8 = a3;
  v9 = v8;
  if (a1 && v8 && objc_msgSend(v8, "shouldReport"))
  {
    if (v7)
      v7[12] = 1;
    objc_opt_class();
    v10 = (objc_opt_isKindOfClass() & 1) == 0
       && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0)
       && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0)
       || objc_msgSend(v9, "statisticsReportFrequency") == 0;
    v11 = objc_msgSend(v9, "filterAction");
    if (!v10 || v11)
    {
      v13 = -[NEFilterReport initWithFlow:action:event:]([NEFilterReport alloc], v7, v11, a4);
      objc_msgSend(a1, "report:", v13);
      if ((unint64_t)(a4 - 3) <= 1 && (objc_msgSend(v9, "drop") & 1) == 0)
      {
        objc_msgSend(a1, "_principalObject");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "handleReport:", v13);

      }
    }
    else
    {
      ne_log_obj();
      v12 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      {
        v15 = 138412546;
        v16 = v9;
        v17 = 2048;
        v18 = a4;
        _os_log_error_impl(&dword_19BD16000, v12, OS_LOG_TYPE_ERROR, "Failed to get an action for verdict (%@), cannot generate flow report with type %ld", (uint8_t *)&v15, 0x16u);
      }

    }
  }

}

- (void)closeChannelFlow:(id *)a1
{
  id v3;
  const char *v4;
  id v5;
  SEL v6;
  id Property;
  id v8;

  v3 = a2;
  -[NEFilterDataExtensionProviderContext reportFlowClosed:](a1, v3);
  if (v3)
  {
    objc_setProperty_atomic(v3, v4, 0, 136);
    v5 = a1[20];
    Property = objc_getProperty(v3, v6, 120, 1);
  }
  else
  {
    v5 = a1[20];
    Property = 0;
  }
  v8 = Property;

  objc_msgSend(v5, "removeObjectForKey:", v8);
}

- (void)handleDataCompleteForFlow:(uint64_t)a3 direction:(void *)a4 reply:(int)a5 controlSocket:(void *)a6 completionHandler:
{
  id v11;
  id v12;
  id v13;
  void *v14;
  uint64_t v15;
  id v16;
  id v17;
  void *v18;
  id v19;
  id v20;
  id v21;
  void *v22;
  _QWORD *v23;
  _QWORD v24[4];
  id v25;
  id v26;
  void *v27;
  id v28;
  uint64_t v29;
  int v30;
  _QWORD aBlock[4];
  id v32;
  void *v33;
  id v34;
  uint64_t v35;

  v11 = a2;
  v12 = a4;
  v13 = a6;
  objc_msgSend(a1, "_principalObject");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = MEMORY[0x1E0C809B0];
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __114__NEFilterDataExtensionProviderContext_handleDataCompleteForFlow_direction_reply_controlSocket_completionHandler___block_invoke;
  aBlock[3] = &unk_1E3CC02C8;
  v35 = a3;
  v16 = v11;
  v32 = v16;
  v33 = a1;
  v34 = v14;
  v17 = v14;
  v18 = _Block_copy(aBlock);
  v24[0] = v15;
  v24[1] = 3221225472;
  v24[2] = __114__NEFilterDataExtensionProviderContext_handleDataCompleteForFlow_direction_reply_controlSocket_completionHandler___block_invoke_128;
  v24[3] = &unk_1E3CC0278;
  v29 = a3;
  v19 = v16;
  v25 = v19;
  v20 = v12;
  v30 = a5;
  v26 = v20;
  v27 = a1;
  v21 = v13;
  v28 = v21;
  v22 = _Block_copy(v24);
  v23 = -[NEFilterDataSavedMessageHandler initWithGetVerdictBlock:handleVerdictBlock:]([NEFilterDataSavedMessageHandler alloc], v18, v22);
  -[NEFilterDataSavedMessageHandler enqueueWithFlow:context:]((uint64_t)v23, v19, a1);

}

id __114__NEFilterDataExtensionProviderContext_handleDataCompleteForFlow_direction_reply_controlSocket_completionHandler___block_invoke(uint64_t a1, const char *a2)
{
  uint64_t v3;
  id Property;
  id v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  NSObject *v9;
  const char *v10;
  uint64_t v11;
  id v12;
  id v13;
  int v14;
  const char *v15;
  void *v16;
  void *v17;
  id v18;
  void *v19;
  uint64_t v20;
  void *v21;
  const __CFString *v23;
  void *v24;
  const char *v25;
  void *v26;
  id v27;
  id v28;
  int v29;
  const __CFString *v30;
  __int16 v31;
  void *v32;
  __int16 v33;
  uint64_t v34;
  __int16 v35;
  int v36;
  uint64_t v37;

  v37 = *MEMORY[0x1E0C80C00];
  v3 = *(_QWORD *)(a1 + 56);
  Property = *(id *)(a1 + 32);
  if (Property)
    Property = objc_getProperty(Property, a2, 104, 1);
  v5 = Property;
  v6 = v5;
  if (v3 == 2)
    v7 = objc_msgSend(v5, "inboundPassOffset");
  else
    v7 = objc_msgSend(v5, "outboundPassOffset");
  v8 = v7;

  ne_log_obj();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
  {
    if (*(_QWORD *)(a1 + 56) == 2)
      v23 = CFSTR("Inbound");
    else
      v23 = CFSTR("Outbound");
    objc_msgSend(*(id *)(a1 + 32), "identifier");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "UUIDString");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v27 = *(id *)(a1 + 32);
    if (v27)
      v27 = objc_getProperty(v27, v25, 104, 1);
    v28 = v27;
    v29 = 138413058;
    v30 = v23;
    v31 = 2112;
    v32 = v26;
    v33 = 2048;
    v34 = v8;
    v35 = 1024;
    v36 = objc_msgSend(v28, "shouldReport");
    _os_log_debug_impl(&dword_19BD16000, v9, OS_LOG_TYPE_DEBUG, "%@ handleDataCompleteForFlow - for flow %@ passOffset %llu shouldReport %d", (uint8_t *)&v29, 0x26u);

  }
  v11 = *(_QWORD *)(a1 + 56);
  if (v11 == 1)
  {
    objc_msgSend(*(id *)(a1 + 32), "setOutputComplete:", 1);
  }
  else if (v11 == 2)
  {
    objc_msgSend(*(id *)(a1 + 32), "setInputComplete:", 1);
  }
  v12 = *(id *)(a1 + 32);
  if (v12)
    v12 = objc_getProperty(v12, v10, 104, 1);
  v13 = v12;
  if (objc_msgSend(v13, "shouldReport") && objc_msgSend(*(id *)(a1 + 32), "inputComplete"))
  {
    v14 = objc_msgSend(*(id *)(a1 + 32), "outputComplete");

    if (!v14)
      goto LABEL_20;
    v17 = *(void **)(a1 + 32);
    v16 = *(void **)(a1 + 40);
    if (v17)
      v18 = objc_getProperty(*(id *)(a1 + 32), v15, 104, 1);
    else
      v18 = 0;
    v13 = v18;
    -[NEFilterDataExtensionProviderContext reportFlow:forVerdict:event:](v16, v17, v13, 3);
  }

LABEL_20:
  if (v8 == -1)
  {
    +[NEFilterDataVerdict allowVerdict](NEFilterDataVerdict, "allowVerdict");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v19 = *(void **)(a1 + 48);
    v20 = *(_QWORD *)(a1 + 32);
    if (*(_QWORD *)(a1 + 56) == 2)
      objc_msgSend(v19, "handleInboundDataCompleteForFlow:", v20);
    else
      objc_msgSend(v19, "handleOutboundDataCompleteForFlow:", v20);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v21;
}

void __114__NEFilterDataExtensionProviderContext_handleDataCompleteForFlow_direction_reply_controlSocket_completionHandler___block_invoke_128(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  const char *v5;
  void *v6;
  void *v7;
  id Property;
  id v9;
  uint64_t v10;
  const __CFString *v11;
  void *v12;
  int v13;
  const __CFString *v14;
  __int16 v15;
  void *v16;
  __int16 v17;
  id v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  if (nelog_is_debug_logging_enabled())
  {
    ne_log_obj();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
    {
      if (*(_QWORD *)(a1 + 64) == 2)
        v11 = CFSTR("Inbound");
      else
        v11 = CFSTR("Outbound");
      objc_msgSend(*(id *)(a1 + 32), "identifierString");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = 138412802;
      v14 = v11;
      v15 = 2112;
      v16 = v12;
      v17 = 2112;
      v18 = v3;
      _os_log_debug_impl(&dword_19BD16000, v4, OS_LOG_TYPE_DEBUG, "%@ data complete verdict for flow %@: %@", (uint8_t *)&v13, 0x20u);

    }
  }
  if (objc_msgSend(*(id *)(a1 + 32), "createDataCompleteReply:controlSocket:direction:verdict:context:", *(_QWORD *)(a1 + 40), *(unsigned int *)(a1 + 72), *(_QWORD *)(a1 + 64), v3, *(_QWORD *)(a1 + 48)))-[NEFilterDataExtensionProviderContext closeFlow:](*(id **)(a1 + 48), *(void **)(a1 + 32));
  if (v3)
  {
    v6 = *(void **)(a1 + 48);
    v7 = *(void **)(a1 + 32);
    if (v7)
      Property = objc_getProperty(*(id *)(a1 + 32), v5, 104, 1);
    else
      Property = 0;
    v9 = Property;
    -[NEFilterDataExtensionProviderContext reportFlow:forVerdict:absoluteVerdict:](v6, v7, v3, v9);

  }
  v10 = *(_QWORD *)(a1 + 56);
  if (v10)
    (*(void (**)(void))(v10 + 16))();

}

- (void)closeFlow:(id *)a1
{
  _QWORD *v3;
  void *v4;
  uint64_t v5;
  id v6;

  v6 = a2;
  if (a1)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      -[NEFilterDataExtensionProviderContext closeBrowserFilterFlow:]((uint64_t)a1, v6);
      goto LABEL_10;
    }
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
      goto LABEL_10;
    v3 = v6;
    v4 = v3;
    if (v3)
    {
      v5 = v3[24];
      if (v5 == -1)
      {
        -[NEFilterDataExtensionProviderContext closeChannelFlow:](a1, v3);
        goto LABEL_9;
      }
    }
    else
    {
      v5 = 0;
    }
    -[NEFilterDataExtensionProviderContext closeSocketFlow:socketID:](a1, v3, v5);
LABEL_9:

  }
LABEL_10:

}

- (void)reportFlow:(void *)a3 forVerdict:(void *)a4 absoluteVerdict:
{
  id v7;
  id v8;
  void *v9;
  id v10;

  v10 = a2;
  v7 = a3;
  v8 = a4;
  if (a1 && v10 && v8 && objc_msgSend(v7, "shouldReport"))
  {
    v9 = (void *)objc_msgSend(v8, "copy");
    if ((objc_msgSend(v9, "drop") & 1) != 0
      || objc_msgSend(v9, "inboundPassOffset") == -1 && objc_msgSend(v9, "outboundPassOffset") == -1)
    {
      objc_msgSend(v9, "setShouldReport:", 1);
      -[NEFilterDataExtensionProviderContext reportFlow:forVerdict:event:](a1, v10, v9, 2);
    }

  }
}

- (void)closeBrowserFilterFlow:(uint64_t)a1
{
  id v3;
  const char *v4;
  void *v5;
  id v6;
  SEL v7;
  id Property;
  id v9;

  if (a1)
  {
    v3 = a2;
    v5 = v3;
    if (v3)
    {
      objc_setProperty_atomic(v3, v4, 0, 136);
      v6 = *(id *)(a1 + 144);
      Property = objc_getProperty(v5, v7, 120, 1);
    }
    else
    {
      v6 = *(id *)(a1 + 144);
      Property = 0;
    }
    v9 = Property;

    objc_msgSend(v6, "removeObjectForKey:", v9);
  }
}

- (void)closeSocketFlow:(uint64_t)a3 socketID:
{
  void *v5;
  void *v6;
  id v7;
  id v8;

  -[NEFilterDataExtensionProviderContext reportFlowClosed:](a1, a2);
  v5 = (void *)a1[19];
  v6 = (void *)MEMORY[0x1E0CB37E8];
  v7 = v5;
  objc_msgSend(v6, "numberWithUnsignedLongLong:", a3);
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "removeObjectForKey:", v8);

}

- (void)reportFlowClosed:(void *)a1
{
  _BYTE *v3;
  const char *v4;
  void *v5;
  id v6;
  void *v7;
  NSObject *v8;
  uint8_t v9[16];

  v3 = a2;
  v5 = v3;
  if (v3 && (v3[12] & 1) != 0)
  {
    v6 = objc_getProperty(v3, v4, 104, 1);
    v7 = (void *)objc_msgSend(v6, "copy");

    if (v7)
    {
      objc_msgSend(v7, "setShouldReport:", 1);
      -[NEFilterDataExtensionProviderContext reportFlow:forVerdict:event:](a1, v5, v7, 3);
    }
    else
    {
      ne_log_obj();
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)v9 = 0;
        _os_log_error_impl(&dword_19BD16000, v8, OS_LOG_TYPE_ERROR, "No current verdict available, cannot report flow closed", v9, 2u);
      }

    }
  }

}

- (void)handleData:(uint64_t)a3 offset:(void *)a4 forFlow:(uint64_t)a5 direction:(void *)a6 reply:(int)a7 controlSocket:(void *)a8 completionHandler:
{
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  id v22;
  _QWORD v23[5];
  id v24;
  id v25;
  id v26;
  id v27;
  uint64_t v28;
  uint64_t v29;
  int v30;

  v15 = a2;
  v16 = a4;
  v17 = a6;
  v18 = a8;
  v23[0] = MEMORY[0x1E0C809B0];
  v23[1] = 3221225472;
  v23[2] = __114__NEFilterDataExtensionProviderContext_handleData_offset_forFlow_direction_reply_controlSocket_completionHandler___block_invoke;
  v23[3] = &unk_1E3CC02A0;
  v23[4] = a1;
  v28 = a3;
  v19 = v15;
  v24 = v19;
  v20 = v16;
  v25 = v20;
  v29 = a5;
  v21 = v17;
  v26 = v21;
  v30 = a7;
  v22 = v18;
  v27 = v22;
  -[NEFilterFlow updateSourceAppInfoWithCompletionHandler:](v20, v23);

}

void __114__NEFilterDataExtensionProviderContext_handleData_offset_forFlow_direction_reply_controlSocket_completionHandler___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  void *v4;
  uint64_t v5;
  id v6;
  id v7;
  void *v8;
  id v9;
  uint64_t v10;
  void *v11;
  _QWORD *v12;
  _QWORD v13[4];
  id v14;
  id v15;
  uint64_t v16;
  id v17;
  uint64_t v18;
  int v19;
  _QWORD aBlock[5];
  id v21;
  id v22;
  id v23;
  uint64_t v24;
  uint64_t v25;

  objc_msgSend(*(id *)(a1 + 32), "_principalObject");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  aBlock[2] = __114__NEFilterDataExtensionProviderContext_handleData_offset_forFlow_direction_reply_controlSocket_completionHandler___block_invoke_2;
  aBlock[3] = &unk_1E3CC0250;
  v3 = *(_QWORD *)(a1 + 32);
  v4 = *(void **)(a1 + 40);
  v24 = *(_QWORD *)(a1 + 72);
  aBlock[4] = v3;
  v5 = MEMORY[0x1E0C809B0];
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  v21 = v4;
  v6 = *(id *)(a1 + 48);
  v25 = *(_QWORD *)(a1 + 80);
  v22 = v6;
  v23 = v2;
  v7 = v2;
  v8 = _Block_copy(aBlock);
  v13[0] = v5;
  v13[1] = 3221225472;
  v13[2] = __114__NEFilterDataExtensionProviderContext_handleData_offset_forFlow_direction_reply_controlSocket_completionHandler___block_invoke_3;
  v13[3] = &unk_1E3CC0278;
  v18 = *(_QWORD *)(a1 + 80);
  v14 = *(id *)(a1 + 48);
  v9 = *(id *)(a1 + 56);
  v19 = *(_DWORD *)(a1 + 88);
  v10 = *(_QWORD *)(a1 + 32);
  v15 = v9;
  v16 = v10;
  v17 = *(id *)(a1 + 64);
  v11 = _Block_copy(v13);
  v12 = -[NEFilterDataSavedMessageHandler initWithGetVerdictBlock:handleVerdictBlock:]([NEFilterDataSavedMessageHandler alloc], v8, v11);
  -[NEFilterDataSavedMessageHandler enqueueWithFlow:context:]((uint64_t)v12, *(void **)(a1 + 48), *(void **)(a1 + 32));

}

id __114__NEFilterDataExtensionProviderContext_handleData_offset_forFlow_direction_reply_controlSocket_completionHandler___block_invoke_2(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  uint64_t v4;
  unint64_t v5;
  id v6;
  id v7;
  const char *v8;
  void *v9;
  id Property;
  id v11;
  void *v12;
  uint64_t v13;
  unint64_t v14;
  unint64_t v15;
  id v16;
  id v17;
  unint64_t v18;
  id v19;
  void *v20;
  void *v21;
  void *v22;
  uint64_t v23;
  void *v24;

  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(void **)(a1 + 48);
  v5 = *(_QWORD *)(a1 + 64);
  v4 = *(_QWORD *)(a1 + 72);
  v6 = *(id *)(a1 + 40);
  v7 = v3;
  v9 = v7;
  if (!v2)
    goto LABEL_14;
  if (v7)
    Property = objc_getProperty(v7, v8, 104, 1);
  else
    Property = 0;
  v11 = Property;
  v12 = v11;
  if (v4 == 2)
    v13 = objc_msgSend(v11, "inboundPassOffset");
  else
    v13 = objc_msgSend(v11, "outboundPassOffset");
  v14 = v13;

  v15 = v14 - v5;
  if (v14 <= v5)
  {
    v17 = v6;
LABEL_15:
    v14 = v5;
    goto LABEL_20;
  }
  if (v14 == -1)
  {
LABEL_14:
    v17 = 0;
    goto LABEL_15;
  }
  v16 = v9;
  if (objc_msgSend(v16, "socketProtocol") != 17 && objc_msgSend(v16, "socketProtocol") != 6)
  {
    v18 = v15 + 4;
    if (v15 + 4 < objc_msgSend(v6, "length"))
    {
      v19 = objc_alloc(MEMORY[0x1E0C99DF0]);
      objc_msgSend(v6, "subdataWithRange:", 0, 4);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = (id)objc_msgSend(v19, "initWithData:", v20);

      objc_msgSend(v6, "subdataWithRange:", v18, objc_msgSend(v6, "length") - v18);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "appendData:", v21);

      goto LABEL_19;
    }
LABEL_18:
    v17 = 0;
    goto LABEL_19;
  }
  if (v15 >= objc_msgSend(v6, "length"))
    goto LABEL_18;
  objc_msgSend(v6, "subdataWithRange:", v14 - v5, objc_msgSend(v6, "length") - v15);
  v17 = (id)objc_claimAutoreleasedReturnValue();
LABEL_19:

LABEL_20:
  if (v17)
  {
    v23 = *(_QWORD *)(a1 + 48);
    v22 = *(void **)(a1 + 56);
    if (*(_QWORD *)(a1 + 72) == 2)
      objc_msgSend(v22, "handleInboundDataFromFlow:readBytesStartOffset:readBytes:", v23, v14, v17);
    else
      objc_msgSend(v22, "handleOutboundDataFromFlow:readBytesStartOffset:readBytes:", v23, v14, v17);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v24 = 0;
  }

  return v24;
}

void __114__NEFilterDataExtensionProviderContext_handleData_offset_forFlow_direction_reply_controlSocket_completionHandler___block_invoke_3(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  const char *v5;
  void *v6;
  void *v7;
  id Property;
  id v9;
  uint64_t v10;
  const __CFString *v11;
  void *v12;
  int v13;
  const __CFString *v14;
  __int16 v15;
  void *v16;
  __int16 v17;
  id v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  if (nelog_is_debug_logging_enabled())
  {
    ne_log_obj();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
    {
      if (*(_QWORD *)(a1 + 64) == 2)
        v11 = CFSTR("Inbound");
      else
        v11 = CFSTR("Outbound");
      objc_msgSend(*(id *)(a1 + 32), "identifierString");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = 138412802;
      v14 = v11;
      v15 = 2112;
      v16 = v12;
      v17 = 2112;
      v18 = v3;
      _os_log_debug_impl(&dword_19BD16000, v4, OS_LOG_TYPE_DEBUG, "%@ data verdict for flow %@: %@", (uint8_t *)&v13, 0x20u);

    }
  }
  if (objc_msgSend(*(id *)(a1 + 32), "createDataReply:controlSocket:direction:verdict:context:", *(_QWORD *)(a1 + 40), *(unsigned int *)(a1 + 72), *(_QWORD *)(a1 + 64), v3, *(_QWORD *)(a1 + 48)))-[NEFilterDataExtensionProviderContext closeFlow:](*(id **)(a1 + 48), *(void **)(a1 + 32));
  if (v3)
  {
    v6 = *(void **)(a1 + 48);
    v7 = *(void **)(a1 + 32);
    if (v7)
      Property = objc_getProperty(*(id *)(a1 + 32), v5, 104, 1);
    else
      Property = 0;
    v9 = Property;
    -[NEFilterDataExtensionProviderContext reportFlow:forVerdict:absoluteVerdict:](v6, v7, v3, v9);

  }
  v10 = *(_QWORD *)(a1 + 56);
  if (v10)
    (*(void (**)(void))(v10 + 16))();

}

- (void)handleNewFlow:(void *)a3 reply:(int)a4 controlSocket:(void *)a5 completionHandler:
{
  id v9;
  id v10;
  id v11;
  id v12;
  id v13;
  id v14;
  _QWORD v15[5];
  id v16;
  id v17;
  id v18;
  int v19;

  v9 = a2;
  v10 = a3;
  v11 = a5;
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __92__NEFilterDataExtensionProviderContext_handleNewFlow_reply_controlSocket_completionHandler___block_invoke;
  v15[3] = &unk_1E3CC1888;
  v15[4] = a1;
  v12 = v9;
  v16 = v12;
  v13 = v10;
  v17 = v13;
  v19 = a4;
  v14 = v11;
  v18 = v14;
  -[NEFilterFlow updateSourceAppInfoWithCompletionHandler:](v12, v15);

}

void __92__NEFilterDataExtensionProviderContext_handleNewFlow_reply_controlSocket_completionHandler___block_invoke(uint64_t a1)
{
  NSObject *v2;
  id v3;
  uint64_t v4;
  _QWORD block[4];
  id v6;
  uint64_t v7;
  id v8;
  id v9;
  int v10;

  objc_msgSend(*(id *)(a1 + 32), "queue");
  v2 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __92__NEFilterDataExtensionProviderContext_handleNewFlow_reply_controlSocket_completionHandler___block_invoke_2;
  block[3] = &unk_1E3CC1888;
  v3 = *(id *)(a1 + 40);
  v4 = *(_QWORD *)(a1 + 32);
  v6 = v3;
  v7 = v4;
  v8 = *(id *)(a1 + 48);
  v10 = *(_DWORD *)(a1 + 64);
  v9 = *(id *)(a1 + 56);
  dispatch_async(v2, block);

}

void __92__NEFilterDataExtensionProviderContext_handleNewFlow_reply_controlSocket_completionHandler___block_invoke_2(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  uint64_t v4;
  id v5;
  void *v6;
  id v7;
  uint64_t v8;
  void *v9;
  _QWORD *v10;
  uint64_t v11;
  _QWORD v12[4];
  id v13;
  id v14;
  uint64_t v15;
  id v16;
  int v17;
  _QWORD aBlock[4];
  id v19;
  id v20;
  uint8_t buf[4];
  uint64_t v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  if (nelog_is_debug_logging_enabled())
  {
    ne_log_obj();
    v2 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
    {
      v11 = *(_QWORD *)(a1 + 32);
      *(_DWORD *)buf = 138412290;
      v22 = v11;
      _os_log_debug_impl(&dword_19BD16000, v2, OS_LOG_TYPE_DEBUG, "Handling new flow: %@", buf, 0xCu);
    }

  }
  objc_msgSend(*(id *)(a1 + 40), "_principalObject");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = MEMORY[0x1E0C809B0];
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __92__NEFilterDataExtensionProviderContext_handleNewFlow_reply_controlSocket_completionHandler___block_invoke_122;
  aBlock[3] = &unk_1E3CC0200;
  v19 = v3;
  v20 = *(id *)(a1 + 32);
  v5 = v3;
  v6 = _Block_copy(aBlock);
  v12[0] = v4;
  v12[1] = 3221225472;
  v12[2] = __92__NEFilterDataExtensionProviderContext_handleNewFlow_reply_controlSocket_completionHandler___block_invoke_2_123;
  v12[3] = &unk_1E3CC0228;
  v13 = *(id *)(a1 + 32);
  v7 = *(id *)(a1 + 48);
  v17 = *(_DWORD *)(a1 + 64);
  v8 = *(_QWORD *)(a1 + 40);
  v14 = v7;
  v15 = v8;
  v16 = *(id *)(a1 + 56);
  v9 = _Block_copy(v12);
  v10 = -[NEFilterDataSavedMessageHandler initWithGetVerdictBlock:handleVerdictBlock:]([NEFilterDataSavedMessageHandler alloc], v6, v9);
  -[NEFilterDataSavedMessageHandler enqueueWithFlow:context:]((uint64_t)v10, *(void **)(a1 + 32), *(void **)(a1 + 40));

}

uint64_t __92__NEFilterDataExtensionProviderContext_handleNewFlow_reply_controlSocket_completionHandler___block_invoke_122(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "handleNewFlow:", *(_QWORD *)(a1 + 40));
}

void __92__NEFilterDataExtensionProviderContext_handleNewFlow_reply_controlSocket_completionHandler___block_invoke_2_123(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  int v8;
  void *v9;
  __int16 v10;
  id v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  if (nelog_is_debug_logging_enabled())
  {
    ne_log_obj();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
    {
      objc_msgSend(*(id *)(a1 + 32), "identifier");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "UUIDString");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = 138412546;
      v9 = v7;
      v10 = 2112;
      v11 = v3;
      _os_log_debug_impl(&dword_19BD16000, v4, OS_LOG_TYPE_DEBUG, "New flow verdict for %@: %@", (uint8_t *)&v8, 0x16u);

    }
  }
  if (objc_msgSend(*(id *)(a1 + 32), "createNewFlowReply:controlSocket:verdict:context:", *(_QWORD *)(a1 + 40), *(unsigned int *)(a1 + 64), v3, *(_QWORD *)(a1 + 48)))-[NEFilterDataExtensionProviderContext closeFlow:](*(id **)(a1 + 48), *(void **)(a1 + 32));
  if (v3)
    -[NEFilterDataExtensionProviderContext reportFlow:forVerdict:event:](*(void **)(a1 + 48), *(void **)(a1 + 32), v3, 1);
  v5 = *(_QWORD *)(a1 + 56);
  if (v5)
    (*(void (**)(void))(v5 + 16))();

}

uint64_t __96__NEFilterDataExtensionProviderContext_handleRemediationMessage_filloutReply_completionHandler___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "handleRemediationForFlow:", *(_QWORD *)(a1 + 40));
}

void __96__NEFilterDataExtensionProviderContext_handleRemediationMessage_filloutReply_completionHandler___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  void *v5;
  int v6;
  void *v7;
  __int16 v8;
  id v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  if (nelog_is_debug_logging_enabled())
  {
    ne_log_obj();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
    {
      objc_msgSend(*(id *)(a1 + 32), "identifierString");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = 138412546;
      v7 = v5;
      v8 = 2112;
      v9 = v3;
      _os_log_debug_impl(&dword_19BD16000, v4, OS_LOG_TYPE_DEBUG, "Remediation verdict for %@: %@", (uint8_t *)&v6, 0x16u);

    }
  }
  -[NEFilterDataExtensionProviderContext reportFlow:forVerdict:event:](*(void **)(a1 + 40), *(void **)(a1 + 32), v3, 1);
  if (v3 && !objc_msgSend(v3, "drop"))
    xpc_dictionary_set_uint64(*(xpc_object_t *)(a1 + 48), "verdict-pass", 0xFFFFFFFFFFFFFFFFLL);
  else
    xpc_dictionary_set_BOOL(*(xpc_object_t *)(a1 + 48), "verdict-drop", 1);
  -[NEFilterDataExtensionProviderContext closeBrowserFilterFlow:](*(_QWORD *)(a1 + 40), *(void **)(a1 + 32));
  (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();

}

- (id)socketExceptions
{
  void *v2;
  uint64_t v3;
  void *v4;

  v2 = *(void **)(a1 + 168);
  if (!v2)
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v3 = objc_claimAutoreleasedReturnValue();
    v4 = *(void **)(a1 + 168);
    *(_QWORD *)(a1 + 168) = v3;

    v2 = *(void **)(a1 + 168);
  }
  return v2;
}

void __76__NEFilterDataExtensionProviderContext_updateFlow_withVerdict_forDirection___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  void *v4;
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  _QWORD *v9;
  NSObject *v10;
  void *v11;
  const char *v12;
  _QWORD v13[4];
  id v14;
  id v15;
  uint64_t v16;
  uint64_t v17;
  _QWORD aBlock[4];
  NSObject *v19;
  uint8_t buf[4];
  void *v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  -[NEFilterDataExtensionProviderContext findFlowWithFlow:](*(_QWORD *)(a1 + 32), *(void **)(a1 + 40));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v2)
  {
    ne_log_obj();
    v10 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      goto LABEL_9;
    objc_msgSend(*(id *)(a1 + 40), "identifierString");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412290;
    v21 = v11;
    v12 = "Cannot update the verdict for flow %@ which does not exist";
LABEL_8:
    _os_log_impl(&dword_19BD16000, v10, OS_LOG_TYPE_DEFAULT, v12, buf, 0xCu);

    goto LABEL_9;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    ne_log_obj();
    v10 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      goto LABEL_9;
    objc_msgSend(v2, "identifierString");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412290;
    v21 = v11;
    v12 = "Cannot update the verdict for flow %@ which is not a socket flow";
    goto LABEL_8;
  }
  v3 = MEMORY[0x1E0C809B0];
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __76__NEFilterDataExtensionProviderContext_updateFlow_withVerdict_forDirection___block_invoke_114;
  aBlock[3] = &unk_1E3CC0188;
  v19 = *(id *)(a1 + 48);
  v4 = _Block_copy(aBlock);
  v13[0] = v3;
  v13[1] = 3221225472;
  v13[2] = __76__NEFilterDataExtensionProviderContext_updateFlow_withVerdict_forDirection___block_invoke_2;
  v13[3] = &unk_1E3CC01B0;
  v5 = v2;
  v14 = v5;
  v6 = *(id *)(a1 + 48);
  v7 = *(_QWORD *)(a1 + 32);
  v15 = v6;
  v16 = v7;
  v17 = *(_QWORD *)(a1 + 56);
  v8 = _Block_copy(v13);
  v9 = -[NEFilterDataSavedMessageHandler initWithGetVerdictBlock:handleVerdictBlock:]([NEFilterDataSavedMessageHandler alloc], v4, v8);
  -[NEFilterDataSavedMessageHandler enqueueWithFlow:context:]((uint64_t)v9, v5, *(void **)(a1 + 32));

  v10 = v19;
LABEL_9:

}

- (id)findFlowWithFlow:(uint64_t)a1
{
  id v3;
  _QWORD *v4;
  _QWORD *v5;
  void *v6;
  void *v7;
  id v8;
  uint64_t v9;
  id v10;
  const char *v11;
  id v12;
  id Property;
  void *v14;
  SEL v15;

  v3 = a2;
  if (a1)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v4 = v3;
      v5 = v4;
      if (v4 && v4[24] == -1)
      {
        v8 = *(id *)(a1 + 160);
        v10 = objc_getProperty(v5, v15, 120, 1);
      }
      else
      {
        v6 = *(void **)(a1 + 152);
        v7 = (void *)MEMORY[0x1E0CB37E8];
        v8 = v6;
        if (v5)
          v9 = v5[24];
        else
          v9 = 0;
        objc_msgSend(v7, "numberWithUnsignedLongLong:", v9);
        v10 = (id)objc_claimAutoreleasedReturnValue();
      }
      v12 = v10;
      objc_msgSend(v8, "objectForKeyedSubscript:", v10);
      v14 = (void *)objc_claimAutoreleasedReturnValue();

      goto LABEL_15;
    }
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v12 = *(id *)(a1 + 144);
      if (v3)
        Property = objc_getProperty(v3, v11, 120, 1);
      else
        Property = 0;
      v5 = Property;
      objc_msgSend(v12, "objectForKeyedSubscript:", v5);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_15:

      goto LABEL_16;
    }
  }
  v14 = 0;
LABEL_16:

  return v14;
}

id __76__NEFilterDataExtensionProviderContext_updateFlow_withVerdict_forDirection___block_invoke_114(uint64_t a1)
{
  return *(id *)(a1 + 32);
}

void __76__NEFilterDataExtensionProviderContext_updateFlow_withVerdict_forDirection___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  _QWORD *v5;
  uint64_t v6;
  NSObject *v7;
  const char *v8;
  uintptr_t handle;
  xpc_object_t v10;
  id Property;
  id v12;
  const char *v13;
  int v14;
  id v15;
  id v16;
  const char *v17;
  id v18;
  _xpc_connection_s *v19;
  void *v20;
  void *v21;
  id v22;
  NSObject *v23;
  void *v24;
  const char *v25;
  void *v26;
  const char *v27;
  void *v28;
  uint64_t v29;
  int v30;
  void *v31;
  __int16 v32;
  uint64_t v33;
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  if (nelog_is_debug_logging_enabled())
  {
    ne_log_obj();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
    {
      objc_msgSend(*(id *)(a1 + 32), "identifierString");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      v29 = *(_QWORD *)(a1 + 40);
      v30 = 138412546;
      v31 = v28;
      v32 = 2112;
      v33 = v29;
      _os_log_debug_impl(&dword_19BD16000, v4, OS_LOG_TYPE_DEBUG, "Provider set data verdict for flow %@: %@", (uint8_t *)&v30, 0x16u);

    }
  }
  v5 = *(_QWORD **)(a1 + 32);
  if (!v5 || v5[24] != -1)
  {
    v6 = *(_QWORD *)(a1 + 48);
    if (v6 && (v7 = *(NSObject **)(v6 + 176)) != 0)
    {
      handle = dispatch_source_get_handle(v7);
      if ((handle & 0x80000000) == 0)
      {
        v10 = 0;
        goto LABEL_12;
      }
      ne_log_obj();
      v23 = objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
      {
LABEL_33:
        v10 = 0;
        goto LABEL_34;
      }
      objc_msgSend(*(id *)(a1 + 32), "identifierString");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      v30 = 138412290;
      v31 = v24;
      v25 = "Failed to find control socket to update verdict for flow %@";
    }
    else
    {
      ne_log_obj();
      v23 = objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
        goto LABEL_33;
      objc_msgSend(*(id *)(a1 + 32), "identifierString");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      v30 = 138412290;
      v31 = v24;
      v25 = "Failed to find control socket source to update verdict for flow %@";
    }
    _os_log_error_impl(&dword_19BD16000, v23, OS_LOG_TYPE_ERROR, v25, (uint8_t *)&v30, 0xCu);

    goto LABEL_33;
  }
  v10 = xpc_dictionary_create(0, 0, 0);
  v5 = *(_QWORD **)(a1 + 32);
  handle = 0xFFFFFFFFLL;
LABEL_12:
  if (v5)
    Property = objc_getProperty(v5, v8, 104, 1);
  else
    Property = 0;
  v12 = Property;

  if (!v12)
  {
    ne_log_obj();
    v23 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(*(id *)(a1 + 32), "identifierString");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      v30 = 138412290;
      v31 = v26;
      v27 = "Cannot update the verdict for flow %@ because a NEFilterNewFlowVerdict has not yet been provided for this flow";
LABEL_38:
      _os_log_error_impl(&dword_19BD16000, v23, OS_LOG_TYPE_ERROR, v27, (uint8_t *)&v30, 0xCu);

    }
LABEL_34:

    goto LABEL_35;
  }
  v14 = objc_msgSend(*(id *)(a1 + 32), "createDataReply:controlSocket:direction:verdict:context:", v10, handle, *(_QWORD *)(a1 + 56), v3, *(_QWORD *)(a1 + 48));
  if (!v10)
    goto LABEL_22;
  v15 = *(id *)(a1 + 32);
  if (v15)
    v15 = objc_getProperty(v15, v13, 136, 1);
  v16 = v15;

  if (!v16)
  {
    ne_log_obj();
    v23 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(*(id *)(a1 + 32), "identifierString");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      v30 = 138412290;
      v31 = v26;
      v27 = "Flow %@ does not have a connection to update its verdict";
      goto LABEL_38;
    }
    goto LABEL_34;
  }
  v18 = *(id *)(a1 + 32);
  if (v18)
    v18 = objc_getProperty(v18, v17, 136, 1);
  v19 = (_xpc_connection_s *)v18;
  xpc_connection_send_message(v19, v10);

LABEL_22:
  if (v14)
    -[NEFilterDataExtensionProviderContext closeFlow:](*(id **)(a1 + 48), *(void **)(a1 + 32));
  if (v3)
  {
    v20 = *(void **)(a1 + 48);
    v21 = *(void **)(a1 + 32);
    if (v21)
      v22 = objc_getProperty(v21, v13, 104, 1);
    else
      v22 = 0;
    v23 = v22;
    -[NEFilterDataExtensionProviderContext reportFlow:forVerdict:absoluteVerdict:](v20, v21, v3, v23);
    goto LABEL_34;
  }
LABEL_35:

}

void __63__NEFilterDataExtensionProviderContext_resumeFlow_withVerdict___block_invoke(uint64_t a1)
{
  _BYTE *v2;
  const char *v3;
  _BYTE *v4;
  id v5;
  uint64_t v6;
  const char *v7;
  id v8;
  NSObject *v9;
  SEL v10;
  id v11;
  const char *v12;
  id v13;
  uint64_t v14;
  id v15;
  uint64_t v16;
  SEL v17;
  id v18;
  NSObject *v19;
  void *v20;
  void *v21;
  id v22;
  uint64_t v23;
  const char *v24;
  int v25;
  void *v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  -[NEFilterDataExtensionProviderContext findFlowWithFlow:](*(_QWORD *)(a1 + 32), *(void **)(a1 + 40));
  v2 = (_BYTE *)objc_claimAutoreleasedReturnValue();
  v4 = v2;
  if (!v2)
  {
    ne_log_obj();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(*(id *)(a1 + 40), "identifierString");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v25 = 138412290;
      v26 = v21;
      _os_log_impl(&dword_19BD16000, v9, OS_LOG_TYPE_DEFAULT, "Ignoring resume command for flow %@ which does not exist", (uint8_t *)&v25, 0xCu);

    }
    goto LABEL_15;
  }
  if ((v2[11] & 1) != 0)
  {
    v5 = objc_getProperty(v2, v3, 128, 1);
    v6 = objc_msgSend(v5, "count");

    if (v6)
    {
      v4[11] = 0;
      v8 = objc_getProperty(v4, v7, 128, 1);
      objc_msgSend(v8, "firstObject");
      v9 = objc_claimAutoreleasedReturnValue();

      v11 = objc_getProperty(v4, v10, 128, 1);
      objc_msgSend(v11, "removeObjectAtIndex:", 0);

      -[NEFilterDataSavedMessageHandler executeVerdictHandlerWithFlow:verdict:context:]((uint64_t)v9, v4, *(void **)(a1 + 48), *(void **)(a1 + 32));
      while ((v4[11] & 1) == 0)
      {
        v13 = objc_getProperty(v4, v12, 128, 1);
        v14 = objc_msgSend(v13, "count");

        if (!v14)
          break;
        v15 = objc_getProperty(v4, v12, 128, 1);
        objc_msgSend(v15, "firstObject");
        v16 = objc_claimAutoreleasedReturnValue();

        v18 = objc_getProperty(v4, v17, 128, 1);
        objc_msgSend(v18, "removeObjectAtIndex:", 0);

        -[NEFilterDataSavedMessageHandler executeWithFlow:context:](v16, v4, *(void **)(a1 + 32));
        v9 = v16;
      }
      v22 = objc_getProperty(v4, v12, 128, 1);
      v23 = objc_msgSend(v22, "count");

      if (!v23)
        objc_setProperty_atomic(v4, v24, 0, 128);
LABEL_15:

      goto LABEL_16;
    }
  }
  ne_log_obj();
  v19 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v4, "identifierString");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = 138412290;
    v26 = v20;
    _os_log_impl(&dword_19BD16000, v19, OS_LOG_TYPE_DEFAULT, "Ignoring resume command for flow %@ which is not paused", (uint8_t *)&v25, 0xCu);

  }
LABEL_16:

}

void __66__NEFilterDataExtensionProviderContext_provideURLAppendStringMap___block_invoke(uint64_t a1)
{
  objc_storeStrong((id *)(*(_QWORD *)(a1 + 32) + 120), *(id *)(a1 + 40));
}

void __62__NEFilterDataExtensionProviderContext_provideRemediationMap___block_invoke(uint64_t a1)
{
  objc_storeStrong((id *)(*(_QWORD *)(a1 + 32) + 112), *(id *)(a1 + 40));
}

void __85__NEFilterDataExtensionProviderContext_fetchProviderConnectionWithCompletionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  BOOL v4;
  id *v5;
  _xpc_connection_s *v6;
  NSObject *v7;
  _xpc_connection_s *v8;
  id v9;
  _QWORD handler[5];
  _xpc_connection_s *v11;

  v3 = a2;
  if (v3)
  {
    v9 = v3;
    v4 = MEMORY[0x1A1ACFDA4]() == MEMORY[0x1E0C812E0];
    v3 = v9;
    if (v4)
    {
      v5 = *(id **)(a1 + 32);
      v6 = (_xpc_connection_s *)v9;
      if (v5)
      {
        if ((objc_msgSend(v5[23], "containsObject:", v6) & 1) == 0)
          objc_msgSend(v5[23], "addObject:", v6);
        objc_msgSend(v5, "queue");
        v7 = objc_claimAutoreleasedReturnValue();
        xpc_connection_set_target_queue(v6, v7);

        handler[0] = MEMORY[0x1E0C809B0];
        handler[1] = 3221225472;
        handler[2] = __66__NEFilterDataExtensionProviderContext_acceptNewClientConnection___block_invoke;
        handler[3] = &unk_1E3CC1B98;
        handler[4] = v5;
        v8 = v6;
        v11 = v8;
        xpc_connection_set_event_handler(v8, handler);
        xpc_connection_resume(v8);

      }
      v3 = v9;
    }
  }

}

void __66__NEFilterDataExtensionProviderContext_acceptNewClientConnection___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id *v5;
  _xpc_connection_s *v6;
  id v7;
  uint64_t v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  id Property;
  _xpc_connection_s *v15;
  uint64_t v16;
  id v17;
  uint64_t v18;
  const char *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  id v24;
  _xpc_connection_s *v25;
  uint64_t v26;
  xpc_object_t reply;
  void *v28;
  _QWORD v29[4];
  id v30;
  id v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  _BYTE v40[128];
  _BYTE v41[128];
  uint64_t v42;

  v42 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = v3;
  if (v3 && MEMORY[0x1A1ACFDA4](v3) == MEMORY[0x1E0C812F8])
  {
    reply = xpc_dictionary_create_reply(v4);
    v29[0] = MEMORY[0x1E0C809B0];
    v29[1] = 3221225472;
    v29[2] = __66__NEFilterDataExtensionProviderContext_acceptNewClientConnection___block_invoke_2;
    v29[3] = &unk_1E3CC2F98;
    v30 = reply;
    v28 = *(void **)(a1 + 32);
    v31 = *(id *)(a1 + 40);
    v6 = reply;
    objc_msgSend(v28, "handleClientMessage:filloutReply:completionHandler:", v4, v6, v29);

  }
  else
  {
    v5 = *(id **)(a1 + 32);
    v6 = (_xpc_connection_s *)*(id *)(a1 + 40);
    if (v5)
    {
      objc_msgSend(v5[18], "allValues");
      v36 = 0u;
      v37 = 0u;
      v38 = 0u;
      v39 = 0u;
      v7 = (id)objc_claimAutoreleasedReturnValue();
      v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v36, v41, 16);
      if (v8)
      {
        v10 = v8;
        v11 = *(_QWORD *)v37;
        do
        {
          v12 = 0;
          do
          {
            if (*(_QWORD *)v37 != v11)
              objc_enumerationMutation(v7);
            v13 = *(void **)(*((_QWORD *)&v36 + 1) + 8 * v12);
            if (v13)
              Property = objc_getProperty(*(id *)(*((_QWORD *)&v36 + 1) + 8 * v12), v9, 136, 1);
            else
              Property = 0;
            v15 = (_xpc_connection_s *)Property;

            if (v15 == v6)
              -[NEFilterDataExtensionProviderContext closeBrowserFilterFlow:]((uint64_t)v5, v13);
            ++v12;
          }
          while (v10 != v12);
          v16 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v36, v41, 16);
          v10 = v16;
        }
        while (v16);
      }

      objc_msgSend(v5[20], "allValues");
      v32 = 0u;
      v33 = 0u;
      v34 = 0u;
      v35 = 0u;
      v17 = (id)objc_claimAutoreleasedReturnValue();
      v18 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v32, v40, 16);
      if (v18)
      {
        v20 = v18;
        v21 = *(_QWORD *)v33;
        do
        {
          v22 = 0;
          do
          {
            if (*(_QWORD *)v33 != v21)
              objc_enumerationMutation(v17);
            v23 = *(void **)(*((_QWORD *)&v32 + 1) + 8 * v22);
            if (v23)
              v24 = objc_getProperty(*(id *)(*((_QWORD *)&v32 + 1) + 8 * v22), v19, 136, 1);
            else
              v24 = 0;
            v25 = (_xpc_connection_s *)v24;

            if (v25 == v6)
              -[NEFilterDataExtensionProviderContext closeChannelFlow:](v5, v23);
            ++v22;
          }
          while (v20 != v22);
          v26 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v32, v40, 16);
          v20 = v26;
        }
        while (v26);
      }

      if (objc_msgSend(v5[23], "containsObject:", v6))
        objc_msgSend(v5[23], "removeObject:", v6);
      xpc_connection_cancel(v6);

    }
  }

}

void __66__NEFilterDataExtensionProviderContext_acceptNewClientConnection___block_invoke_2(uint64_t a1)
{
  void *v1;

  v1 = *(void **)(a1 + 32);
  if (v1)
    xpc_connection_send_message(*(xpc_connection_t *)(a1 + 40), v1);
}

void __75__NEFilterDataExtensionProviderContext_setupSocketSourceWithControlSocket___block_invoke(uint64_t a1)
{
  NSObject *v2;
  int handle;
  uint64_t v4;
  uint8_t v5[16];

  ne_log_obj();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v5 = 0;
    _os_log_impl(&dword_19BD16000, v2, OS_LOG_TYPE_INFO, "socket source cancel handler called", v5, 2u);
  }

  handle = dispatch_source_get_handle(*(dispatch_source_t *)(a1 + 32));
  close(handle);
  v4 = *(_QWORD *)(a1 + 40);
  if (v4)
    objc_storeStrong((id *)(v4 + 176), 0);
}

void __75__NEFilterDataExtensionProviderContext_setupSocketSourceWithControlSocket___block_invoke_119(uint64_t a1)
{
  int handle;
  uint64_t v3;
  int v4;
  NSObject *v5;
  int v6;
  uint8_t *v7;
  size_t v8;
  uint8_t *v9;
  int v10;
  size_t v11;
  ssize_t v12;
  BOOL v13;
  ssize_t v14;
  NSObject *v15;
  int v16;
  const char *v17;
  int *v18;
  char *v19;
  NSObject *v20;
  uint32_t v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  id v25;
  void *v26;
  void *v27;
  void *v28;
  int v29;
  NSObject *v30;
  int v31;
  int *v32;
  char *v33;
  NSObject *v34;
  const char *v35;
  NSObject *v36;
  uint32_t v37;
  NSObject *v38;
  int v39;
  sockaddr *v40;
  uint64_t v41;
  NSObject *v42;
  void *v43;
  void *v44;
  sockaddr *v45;
  void *v46;
  NSObject *v47;
  NSObject *v48;
  const char *v49;
  const char *v50;
  NSObject *v51;
  uint32_t v52;
  void *v53;
  unint64_t v54;
  unint64_t v55;
  uint64_t v56;
  uint8_t *v57;
  id v58;
  uint64_t v59;
  NSObject *v60;
  uint64_t v61;
  NSObject *v62;
  NSObject *v63;
  unsigned int v64;
  int v65;
  const char *v66;
  NSObject *v67;
  uint32_t v68;
  int *v69;
  char *v70;
  void *v71;
  void *v72;
  void *v73;
  void *v74;
  void *v75;
  id v76;
  void *v77;
  void *v78;
  uint64_t v79;
  uint64_t v80;
  id v81;
  void *v82;
  void *v83;
  void *v84;
  NSObject *v85;
  void *v86;
  sockaddr *v87;
  uint64_t v88;
  void *v89;
  id v90;
  void *v91;
  void *v92;
  NSObject *v93;
  NSObject *v94;
  int v95;
  const char *v96;
  int v97;
  void *v98;
  socklen_t v99;
  int v100;
  uint8_t v101[4];
  void *v102;
  __int16 v103;
  int v104;
  _BYTE buf[24];
  void *v106;
  uint8_t *v107;
  uint8_t v108[4];
  char *v109;
  uint64_t v110;

  v110 = *MEMORY[0x1E0C80C00];
  handle = dispatch_source_get_handle(*(dispatch_source_t *)(a1 + 32));
  v3 = *(_QWORD *)(a1 + 40);
  if (!v3)
    return;
  v4 = handle;
  v99 = 4;
  v100 = 0;
  if (getsockopt(handle, 0xFFFF, 4128, &v100, &v99))
  {
    ne_log_obj();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      v32 = __error();
      v33 = strerror(*v32);
      *(_DWORD *)v108 = 136315138;
      v109 = v33;
      _os_log_error_impl(&dword_19BD16000, v5, OS_LOG_TYPE_ERROR, "Could not get packet size. Received error: %s", v108, 0xCu);
    }
LABEL_5:

    return;
  }
  v6 = v100;
  if (v100 >= 2049)
  {
    if (v100 >= 102400)
      v8 = 102400;
    else
      v8 = v100;
    v9 = (uint8_t *)malloc_type_malloc(v8, 0xB4709E02uLL);
    if (!v9)
    {
      ne_log_obj();
      v30 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 67109120;
        *(_DWORD *)&buf[4] = v8;
        _os_log_error_impl(&dword_19BD16000, v30, OS_LOG_TYPE_ERROR, "Failed to alloc large receive buffer of size %d", buf, 8u);
      }

      return;
    }
    v7 = v9;
    v10 = v100;
    if (v100 > 102400)
    {
      while (1)
      {
        if (v10 >= 102400)
          v11 = 102400;
        else
          v11 = v10;
        v12 = recv(v4, v7, v11, 0);
        if (!v12)
        {
          ne_log_obj();
          v34 = objc_claimAutoreleasedReturnValue();
          if (!os_log_type_enabled(v34, OS_LOG_TYPE_ERROR))
            goto LABEL_48;
          *(_WORD *)buf = 0;
          v35 = "data purge: no data to read";
          v36 = v34;
          v37 = 2;
          goto LABEL_101;
        }
        if (v12 == -1)
          break;
        v13 = v12 < v10;
        v10 -= v12;
        v13 = !v13 || v10 <= 0;
        if (v13)
          goto LABEL_49;
      }
      ne_log_obj();
      v34 = objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v34, OS_LOG_TYPE_ERROR))
        goto LABEL_48;
      v69 = __error();
      v70 = strerror(*v69);
      *(_DWORD *)buf = 136315138;
      *(_QWORD *)&buf[4] = v70;
      v35 = "data purge: recv() failed: %s";
      v36 = v34;
      v37 = 12;
LABEL_101:
      _os_log_error_impl(&dword_19BD16000, v36, OS_LOG_TYPE_ERROR, v35, buf, v37);
LABEL_48:

LABEL_49:
      ne_log_obj();
      v38 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v38, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 67109120;
        *(_DWORD *)&buf[4] = v100;
        _os_log_error_impl(&dword_19BD16000, v38, OS_LOG_TYPE_ERROR, "Received data too large, %d bytes from kernel content filter", buf, 8u);
      }

      goto LABEL_52;
    }
  }
  else
  {
    v7 = v108;
    LODWORD(v8) = 2048;
  }
  v14 = recv(v4, v7, v8, 0);
  if (v14 == -1)
  {
    ne_log_obj();
    v15 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      goto LABEL_43;
    v18 = __error();
    v19 = strerror(*v18);
    *(_DWORD *)buf = 136315138;
    *(_QWORD *)&buf[4] = v19;
    v17 = "recv() failed: %s";
    v20 = v15;
    v21 = 12;
    goto LABEL_42;
  }
  if (*(_DWORD *)v7 <= 0x17u)
  {
    ne_log_obj();
    v15 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      goto LABEL_43;
    v16 = *(_DWORD *)v7;
    *(_DWORD *)buf = 67109120;
    *(_DWORD *)&buf[4] = v16;
    v17 = "Received message of invalid length %d from kernel content filter";
    goto LABEL_41;
  }
  if (*((_DWORD *)v7 + 2) == 1)
  {
    v22 = v14;
    v23 = *((_QWORD *)v7 + 2);
    v24 = (void *)MEMORY[0x1E0CB37E8];
    v25 = *(id *)(v3 + 152);
    objc_msgSend(v24, "numberWithUnsignedLongLong:", v23);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "objectForKey:", v26);
    v5 = objc_claimAutoreleasedReturnValue();

    -[NEFilterDataExtensionProviderContext socketExceptions](v3);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", v23);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v29 = objc_msgSend(v27, "containsObject:", v28);

    if (v29)
    {
      +[NEFilterSocketFlow writeMessageWithControlSocket:drop:socketID:inboundPassOffset:inboundPeekOffset:outboundPassOffset:outboundPeekOffset:statsReportFrequency:]((uint64_t)NEFilterSocketFlow, v4, 0, v23, -1, 0, -1, 0, 0);
      -[NEFilterDataExtensionProviderContext closeSocketFlow:socketID:]((_QWORD *)v3, v5, v23);
LABEL_34:
      if (v6 >= 2049)
        free(v7);
    }
    else
    {
      v39 = *((_DWORD *)v7 + 3);
      switch(v39)
      {
        case 1:
          -[NEFilterDataExtensionProviderContext closeSocketFlow:socketID:]((_QWORD *)v3, v5, v23);
          v43 = -[NEFilterSocketFlow initWithSocketFamily:socketType:socketProtocol:pid:epid:uuid:euuid:socketID:]([NEFilterSocketFlow alloc], *((_DWORD *)v7 + 6), *((_DWORD *)v7 + 7), *((_DWORD *)v7 + 8), *((unsigned int *)v7 + 10), *((unsigned int *)v7 + 11), (uint64_t)(v7 + 48), (uint64_t)(v7 + 64), v23);
          v44 = v43;
          if (v43)
          {
            if (*((_DWORD *)v7 + 34) == 1)
            {
              objc_msgSend(v43, "setDirection:", 2);
              -[NEFilterSocketFlow setLocalAddress:](v44, (sockaddr *)v7 + 5);
              v45 = (sockaddr *)(v7 + 108);
            }
            else
            {
              objc_msgSend(v43, "setDirection:", 1);
              -[NEFilterSocketFlow setLocalAddress:](v44, (sockaddr *)(v7 + 108));
              v45 = (sockaddr *)(v7 + 80);
            }
            -[NEFilterSocketFlow setRemoteAddress:](v44, v45);
            v71 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D50]), "initWithBytes:length:", v7 + 140, 32);
            objc_msgSend(v44, "setSourceAppAuditToken:", v71);

            v72 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D50]), "initWithBytes:length:", v7 + 172, 32);
            objc_msgSend(v44, "setSourceProcessAuditToken:", v72);

            if (v7[240])
            {
              v73 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithCString:encoding:", v7 + 240, 4);
              objc_msgSend(v44, "setRemoteHostname:", v73);

            }
            if (*((_DWORD *)v7 + 59))
            {
              v74 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D50]), "initWithBytes:length:", v7 + 204, *((unsigned int *)v7 + 59));
              objc_msgSend(v44, "setCrypto_signature:", v74);

            }
            v75 = (void *)MEMORY[0x1E0CB37E8];
            v76 = *(id *)(v3 + 152);
            objc_msgSend(v75, "numberWithUnsignedLongLong:", v23);
            v77 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v76, "setObject:forKey:", v44, v77);

            -[NEFilterDataExtensionProviderContext handleNewFlow:reply:controlSocket:completionHandler:](v3, v44, 0, v4, 0);
          }

          break;
        case 2:
          if (!v5)
          {
            ne_log_obj();
            v48 = objc_claimAutoreleasedReturnValue();
            if (!os_log_type_enabled(v48, OS_LOG_TYPE_DEBUG))
              goto LABEL_106;
            *(_DWORD *)buf = 134217984;
            *(_QWORD *)&buf[4] = v23;
            v49 = "Closed message rejected, no flow found for sockid %llu";
            goto LABEL_104;
          }
          -[NSObject setInBytes:](v5, "setInBytes:", *((_QWORD *)v7 + 10));
          -[NSObject setOutBytes:](v5, "setOutBytes:", *((_QWORD *)v7 + 11));
          -[NEFilterSocketFlow setLocalAddress:](v5, (sockaddr *)v7 + 6);
          if (*((_DWORD *)v7 + 39))
          {
            v46 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D50]), "initWithBytes:length:", v7 + 124, *((unsigned int *)v7 + 39));
            -[NSObject setCrypto_signature:](v5, "setCrypto_signature:", v46);

          }
          -[NEFilterDataExtensionProviderContext closeSocketFlow:socketID:]((_QWORD *)v3, v5, v23);
          break;
        case 3:
        case 4:
          if (!v5)
          {
            ne_log_obj();
            v48 = objc_claimAutoreleasedReturnValue();
            if (!os_log_type_enabled(v48, OS_LOG_TYPE_DEBUG))
              goto LABEL_106;
            *(_DWORD *)buf = 134217984;
            *(_QWORD *)&buf[4] = v23;
            v49 = "Data message rejected, no flow found for sockid %llu";
LABEL_104:
            v51 = v48;
            v52 = 12;
            goto LABEL_105;
          }
          if (v39 == 3)
          {
            -[NEFilterSocketFlow setLocalAddress:](v5, (sockaddr *)(v7 + 24));
            v40 = (sockaddr *)(v7 + 52);
          }
          else
          {
            -[NEFilterSocketFlow setLocalAddress:](v5, (sockaddr *)(v7 + 52));
            v40 = (sockaddr *)(v7 + 24);
          }
          -[NEFilterSocketFlow setRemoteAddress:](v5, v40);
          if (*((_DWORD *)v7 + 32))
          {
            v53 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D50]), "initWithBytes:length:", v7 + 96, *((unsigned int *)v7 + 32));
            -[NSObject setCrypto_signature:](v5, "setCrypto_signature:", v53);

          }
          v55 = *((_QWORD *)v7 + 10);
          v54 = *((_QWORD *)v7 + 11);
          v56 = v54 - v55;
          if (v54 <= v55)
          {
            ne_log_obj();
            v60 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v60, OS_LOG_TYPE_ERROR))
            {
              if (*((_DWORD *)v7 + 3) == 3)
                v96 = "OUT";
              else
                v96 = "IN";
              *(_DWORD *)buf = 136315138;
              *(_QWORD *)&buf[4] = v96;
              _os_log_error_impl(&dword_19BD16000, v60, OS_LOG_TYPE_ERROR, "Received invalid DATA %s message", buf, 0xCu);
            }

            goto LABEL_34;
          }
          v57 = v7 + 176;
          if (-[NSObject socketProtocol](v5, "socketProtocol") != 17
            && -[NSObject socketProtocol](v5, "socketProtocol") != 6)
          {
            *((_DWORD *)v7 + 43) = *((_DWORD *)v7 + 33) & 1;
            v57 = v7 + 172;
            v56 += 4;
          }
          v58 = objc_alloc(MEMORY[0x1E0C99D50]);
          if (v6 >= 2049)
          {
            *(_QWORD *)buf = MEMORY[0x1E0C809B0];
            *(_QWORD *)&buf[8] = 3221225472;
            *(_QWORD *)&buf[16] = __74__NEFilterDataExtensionProviderContext_handleSocketSourceEventWithSocket___block_invoke;
            v106 = &__block_descriptor_40_e12_v24__0_v8Q16l;
            v107 = v7;
            v59 = objc_msgSend(v58, "initWithBytesNoCopy:length:deallocator:", v57, v56, buf);
          }
          else
          {
            v59 = objc_msgSend(v58, "initWithBytes:length:", v57, v56);
          }
          v78 = (void *)v59;
          if (*((_DWORD *)v7 + 3) == 3)
            v79 = 1;
          else
            v79 = 2;
          v80 = *((_QWORD *)v7 + 10);
          if (-[NSObject epid](v5, "epid") != *((_DWORD *)v7 + 34))
          {
            -[NSObject setEpid:](v5, "setEpid:");
            -[NSObject setPid:](v5, "setPid:", *((unsigned int *)v7 + 34));
            v81 = +[NEProcessInfo copyUUIDsForPID:](NEProcessInfo, "copyUUIDsForPID:", -[NSObject epid](v5, "epid"));
            v82 = v81;
            if (v81 && objc_msgSend(v81, "count"))
            {
              objc_msgSend(v82, "firstObject");
              v83 = (void *)objc_claimAutoreleasedReturnValue();
              -[NSObject setUuid:](v5, "setUuid:", v83);
              -[NSObject setEuuid:](v5, "setEuuid:", v83);

            }
            -[NSObject pid](v5, "pid");
            v84 = (void *)NECopySigningIdentifierForPIDwithAuditToken();
            if (v84)
            {
              -[NSObject setSourceAppIdentifier:](v5, "setSourceAppIdentifier:", v84);
              ne_log_obj();
              v85 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v85, OS_LOG_TYPE_DEBUG))
              {
                -[NSObject sourceAppIdentifier](v5, "sourceAppIdentifier");
                v98 = (void *)objc_claimAutoreleasedReturnValue();
                v97 = -[NSObject pid](v5, "pid");
                *(_DWORD *)v101 = 138412546;
                v102 = v98;
                v103 = 1024;
                v104 = v97;
                _os_log_debug_impl(&dword_19BD16000, v85, OS_LOG_TYPE_DEBUG, "Updating bundleID %@ for pid %d", v101, 0x12u);

              }
            }
            v86 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D50]), "initWithBytes:length:", v7 + 140, 32);
            -[NSObject setSourceAppAuditToken:](v5, "setSourceAppAuditToken:", v86);

          }
          -[NEFilterDataExtensionProviderContext handleData:offset:forFlow:direction:reply:controlSocket:completionHandler:](v3, v78, v80, v5, v79, 0, v4, 0);

          break;
        case 5:
        case 6:
          if (!v5)
          {
            ne_log_obj();
            v48 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v48, OS_LOG_TYPE_DEBUG))
            {
              v50 = "Inbound";
              if (v39 == 5)
                v50 = "Outbound";
              *(_DWORD *)buf = 136315394;
              *(_QWORD *)&buf[4] = v50;
              *(_WORD *)&buf[12] = 2048;
              *(_QWORD *)&buf[14] = v23;
              v49 = "%s disconnect message rejected, no flow found for sockid %llu";
              v51 = v48;
              v52 = 22;
LABEL_105:
              _os_log_debug_impl(&dword_19BD16000, v51, OS_LOG_TYPE_DEBUG, v49, buf, v52);
            }
            goto LABEL_106;
          }
          if (v39 == 5)
            v41 = 1;
          else
            v41 = 2;
          -[NEFilterDataExtensionProviderContext handleDataCompleteForFlow:direction:reply:controlSocket:completionHandler:]((void *)v3, v5, v41, 0, v4, 0);
          break;
        case 7:
          ne_log_obj();
          v47 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v47, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)buf = 134217984;
            *(_QWORD *)&buf[4] = v22;
            _os_log_debug_impl(&dword_19BD16000, v47, OS_LOG_TYPE_DEBUG, "Socket Stats Report - Received stats report size %zd", buf, 0xCu);
          }

          if (v22 > 31)
          {
            v61 = *((unsigned int *)v7 + 6);
            ne_log_obj();
            v62 = objc_claimAutoreleasedReturnValue();
            v63 = v62;
            if ((_DWORD)v61)
            {
              if (os_log_type_enabled(v62, OS_LOG_TYPE_DEBUG))
              {
                *(_DWORD *)buf = 67109120;
                *(_DWORD *)&buf[4] = v61;
                _os_log_debug_impl(&dword_19BD16000, v63, OS_LOG_TYPE_DEBUG, "Socket Stats Report - Received stats report for %d flows", buf, 8u);
              }

              v64 = 56 * v61 + 32;
              if (v64 > v22 || *(_DWORD *)v7 < v64)
              {
                ne_log_obj();
                v42 = objc_claimAutoreleasedReturnValue();
                if (!os_log_type_enabled(v42, OS_LOG_TYPE_ERROR))
                  goto LABEL_63;
                v65 = *(_DWORD *)v7;
                *(_DWORD *)buf = 134218496;
                *(_QWORD *)&buf[4] = v22;
                *(_WORD *)&buf[12] = 1024;
                *(_DWORD *)&buf[14] = v65;
                *(_WORD *)&buf[18] = 1024;
                *(_DWORD *)&buf[20] = 56 * v61 + 32;
                v66 = "Socket Stats Report - Received wrong msg size in stats report: bytesRead %zd msg_len %d - expected size %d";
                v67 = v42;
                v68 = 24;
                goto LABEL_147;
              }
              if ((int)v61 >= 1)
              {
                v87 = (sockaddr *)(v7 + 56);
                do
                {
                  v88 = *(_QWORD *)&v87[-2].sa_data[6];
                  if (v88)
                  {
                    v89 = (void *)MEMORY[0x1E0CB37E8];
                    v90 = *(id *)(v3 + 152);
                    objc_msgSend(v89, "numberWithUnsignedLongLong:", v88);
                    v91 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v90, "objectForKey:", v91);
                    v92 = (void *)objc_claimAutoreleasedReturnValue();

                    if (v92)
                    {
                      objc_msgSend(v92, "setInBytes:", *(_QWORD *)&v87[-1].sa_len);
                      objc_msgSend(v92, "setOutBytes:", *(_QWORD *)&v87[-1].sa_data[6]);
                      -[NEFilterSocketFlow setLocalAddress:](v92, v87);
                      if (nelog_is_debug_logging_enabled())
                      {
                        ne_log_obj();
                        v93 = objc_claimAutoreleasedReturnValue();
                        if (os_log_type_enabled(v93, OS_LOG_TYPE_DEBUG))
                        {
                          *(_DWORD *)buf = 138412290;
                          *(_QWORD *)&buf[4] = v92;
                          _os_log_debug_impl(&dword_19BD16000, v93, OS_LOG_TYPE_DEBUG, "Socket Stats Report - flow stats updated for %@", buf, 0xCu);
                        }

                      }
                      -[NEFilterDataExtensionProviderContext reportFlowStats:]((void *)v3, v92);
                    }
                    else
                    {
                      ne_log_obj();
                      v94 = objc_claimAutoreleasedReturnValue();
                      if (os_log_type_enabled(v94, OS_LOG_TYPE_DEBUG))
                      {
                        *(_DWORD *)buf = 134217984;
                        *(_QWORD *)&buf[4] = v88;
                        _os_log_debug_impl(&dword_19BD16000, v94, OS_LOG_TYPE_DEBUG, "Socket Stats Report - No flow found for sockID %llu", buf, 0xCu);
                      }

                    }
                  }
                  v87 = (sockaddr *)((char *)v87 + 56);
                  --v61;
                }
                while (v61);
              }
            }
            else
            {
              if (os_log_type_enabled(v62, OS_LOG_TYPE_ERROR))
              {
                *(_WORD *)buf = 0;
                _os_log_error_impl(&dword_19BD16000, v63, OS_LOG_TYPE_ERROR, "Socket Stats Report - Received 0 flow stats in stats report", buf, 2u);
              }

            }
          }
          else
          {
            ne_log_obj();
            v48 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v48, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 134217984;
              *(_QWORD *)&buf[4] = v22;
              _os_log_error_impl(&dword_19BD16000, v48, OS_LOG_TYPE_ERROR, "Socket Stats Report - Received msg size is too small (%zd) for stats report", buf, 0xCu);
            }
LABEL_106:

          }
          break;
        default:
          ne_log_obj();
          v42 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v42, OS_LOG_TYPE_ERROR))
          {
            v95 = *((_DWORD *)v7 + 3);
            *(_DWORD *)buf = 67109120;
            *(_DWORD *)&buf[4] = v95;
            v66 = "Received unexpected message operation %d from kernel content filter";
            v67 = v42;
            v68 = 8;
LABEL_147:
            _os_log_error_impl(&dword_19BD16000, v67, OS_LOG_TYPE_ERROR, v66, buf, v68);
          }
LABEL_63:

          break;
      }
    }
    goto LABEL_5;
  }
  ne_log_obj();
  v15 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
  {
    v31 = *((_DWORD *)v7 + 2);
    *(_DWORD *)buf = 67109120;
    *(_DWORD *)&buf[4] = v31;
    v17 = "Received unexpected message of type %d from kernel content filter";
LABEL_41:
    v20 = v15;
    v21 = 8;
LABEL_42:
    _os_log_error_impl(&dword_19BD16000, v20, OS_LOG_TYPE_ERROR, v17, buf, v21);
  }
LABEL_43:

  if (v6 >= 2049)
LABEL_52:
    free(v7);
}

void __74__NEFilterDataExtensionProviderContext_handleSocketSourceEventWithSocket___block_invoke(uint64_t a1)
{
  free(*(void **)(a1 + 32));
}

void __55__NEFilterDataExtensionProviderContext_stopWithReason___block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  id v4;
  uint64_t v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  void *v14;
  id v15;
  uint64_t v16;
  const char *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  uint64_t v22;
  void *v23;
  uint64_t v24;
  void *v25;
  uint64_t v26;
  id v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  _xpc_connection_s *v32;
  void *v33;
  uint64_t v34;
  NSObject *v35;
  uint64_t v36;
  void *v37;
  uint64_t v38;
  objc_super v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  _BYTE v52[128];
  _BYTE v53[128];
  _BYTE v54[128];
  uint64_t v55;

  v55 = *MEMORY[0x1E0C80C00];
  v2 = *(_QWORD *)(a1 + 32);
  if (v2)
    v3 = *(void **)(v2 + 144);
  else
    v3 = 0;
  objc_msgSend(v3, "allValues");
  v44 = 0u;
  v45 = 0u;
  v46 = 0u;
  v47 = 0u;
  v4 = (id)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v44, v53, 16);
  if (v5)
  {
    v7 = v5;
    v8 = *(_QWORD *)v45;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v45 != v8)
          objc_enumerationMutation(v4);
        v10 = *(void **)(*((_QWORD *)&v44 + 1) + 8 * v9);
        if (v10)
          objc_setProperty_atomic(v10, v6, 0, 136);
        ++v9;
      }
      while (v7 != v9);
      v7 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v44, v53, 16);
    }
    while (v7);
  }

  v11 = *(_QWORD *)(a1 + 32);
  if (v11)
    v12 = *(void **)(v11 + 144);
  else
    v12 = 0;
  objc_msgSend(v12, "removeAllObjects");
  v13 = *(_QWORD *)(a1 + 32);
  if (v13)
    v14 = *(void **)(v13 + 160);
  else
    v14 = 0;
  objc_msgSend(v14, "allValues");
  v40 = 0u;
  v41 = 0u;
  v42 = 0u;
  v43 = 0u;
  v15 = (id)objc_claimAutoreleasedReturnValue();
  v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v40, v52, 16);
  if (v16)
  {
    v18 = v16;
    v19 = *(_QWORD *)v41;
    do
    {
      v20 = 0;
      do
      {
        if (*(_QWORD *)v41 != v19)
          objc_enumerationMutation(v15);
        v21 = *(void **)(*((_QWORD *)&v40 + 1) + 8 * v20);
        if (v21)
          objc_setProperty_atomic(v21, v17, 0, 136);
        ++v20;
      }
      while (v18 != v20);
      v18 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v40, v52, 16);
    }
    while (v18);
  }

  v22 = *(_QWORD *)(a1 + 32);
  if (v22)
    v23 = *(void **)(v22 + 160);
  else
    v23 = 0;
  objc_msgSend(v23, "removeAllObjects");
  v24 = *(_QWORD *)(a1 + 32);
  if (v24)
    v25 = *(void **)(v24 + 152);
  else
    v25 = 0;
  objc_msgSend(v25, "removeAllObjects");
  v26 = *(_QWORD *)(a1 + 32);
  if (v26)
  {
    v50 = 0u;
    v51 = 0u;
    v48 = 0u;
    v49 = 0u;
    v27 = *(id *)(v26 + 184);
    v28 = objc_msgSend(v27, "countByEnumeratingWithState:objects:count:", &v48, v54, 16);
    if (v28)
    {
      v29 = v28;
      v30 = *(_QWORD *)v49;
      do
      {
        v31 = 0;
        do
        {
          if (*(_QWORD *)v49 != v30)
            objc_enumerationMutation(v27);
          xpc_connection_cancel(*(xpc_connection_t *)(*((_QWORD *)&v48 + 1) + 8 * v31++));
        }
        while (v29 != v31);
        v29 = objc_msgSend(v27, "countByEnumeratingWithState:objects:count:", &v48, v54, 16);
      }
      while (v29);
    }

    objc_msgSend(*(id *)(v26 + 184), "removeAllObjects");
    v32 = *(_xpc_connection_s **)(v26 + 128);
    if (v32)
    {
      xpc_connection_cancel(v32);
      v33 = *(void **)(v26 + 128);
      *(_QWORD *)(v26 + 128) = 0;

    }
    v34 = *(_QWORD *)(a1 + 32);
    if (v34)
    {
      v35 = *(NSObject **)(v34 + 176);
      if (v35)
        dispatch_source_cancel(v35);
    }
  }
  +[NEAppInfoCache sharedAppInfoCache]();
  v36 = objc_claimAutoreleasedReturnValue();
  v37 = (void *)v36;
  if (v36)
    objc_storeWeak((id *)(v36 + 8), 0);

  v38 = *(unsigned int *)(a1 + 40);
  v39.receiver = *(id *)(a1 + 32);
  v39.super_class = (Class)NEFilterDataExtensionProviderContext;
  objc_msgSendSuper2(&v39, sel_stopWithReason_, v38);

}

void __81__NEFilterDataExtensionProviderContext_startFilterWithOptions_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  _BYTE *WeakRetained;
  void *v5;
  NSObject *v6;
  uint8_t v7[16];

  v3 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v5 = WeakRetained;
  if (WeakRetained)
  {
    if (WeakRetained[41])
    {
      ne_log_obj();
      v6 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v7 = 0;
        _os_log_impl(&dword_19BD16000, v6, OS_LOG_TYPE_DEFAULT, "The completion handler for startFilterWithOptions was executed twice", v7, 2u);
      }

    }
    else
    {
      WeakRetained[41] = 1;
      if (!v3)
      {
        objc_msgSend(WeakRetained, "sendBrowserContentFilterServerRequest");
        objc_msgSend(v5, "sendSocketContentFilterRequest");
      }
      objc_msgSend(v5, "startedWithError:", v3);
    }
  }

}

+ (id)_extensionAuxiliaryVendorProtocol
{
  if (_extensionAuxiliaryVendorProtocol_protocolInit_3988 != -1)
    dispatch_once(&_extensionAuxiliaryVendorProtocol_protocolInit_3988, &__block_literal_global_3989);
  return (id)_extensionAuxiliaryVendorProtocol_protocol_3990;
}

+ (id)_extensionAuxiliaryHostProtocol
{
  if (_extensionAuxiliaryHostProtocol_protocolInit_3984 != -1)
    dispatch_once(&_extensionAuxiliaryHostProtocol_protocolInit_3984, &__block_literal_global_74_3985);
  return (id)_extensionAuxiliaryHostProtocol_protocol_3986;
}

void __71__NEFilterDataExtensionProviderContext__extensionAuxiliaryHostProtocol__block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0CB3B50], "interfaceWithProtocol:", &unk_1EE41A748);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)_extensionAuxiliaryHostProtocol_protocol_3986;
  _extensionAuxiliaryHostProtocol_protocol_3986 = v0;

}

void __73__NEFilterDataExtensionProviderContext__extensionAuxiliaryVendorProtocol__block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0CB3B50], "interfaceWithProtocol:", &unk_1EE41A620);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)_extensionAuxiliaryVendorProtocol_protocol_3990;
  _extensionAuxiliaryVendorProtocol_protocol_3990 = v0;

}

@end
