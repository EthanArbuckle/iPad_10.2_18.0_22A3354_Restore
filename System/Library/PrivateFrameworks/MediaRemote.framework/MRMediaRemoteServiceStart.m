@implementation MRMediaRemoteServiceStart

void __MRMediaRemoteServiceStart_block_invoke_2(uint64_t a1)
{
  uint64_t uint64;
  void *v3;
  NSObject *v4;
  _QWORD *v5;
  uint64_t v6;
  uint64_t v7;
  NSObject *v8;
  uint64_t v9;
  void *v10;
  _QWORD *v11;
  _QWORD *v12;
  void (*v13)(uint64_t);
  void *v14;
  _QWORD *v15;
  void *v16;
  _QWORD *v17;
  _QWORD *v18;
  qos_class_t v19;
  dispatch_block_t v20;
  void *v21;
  _QWORD *v22;
  void *v23;
  _QWORD *v24;
  uint64_t v25;
  NSObject *v26;
  uint64_t v27;
  __CFString *v28;
  NSObject *v29;
  const char *v30;
  NSObject *v31;
  NSObject *v32;
  uint64_t v33;
  __int128 buf;
  void (*v35)(uint64_t);
  void *v36;
  NSObject *v37;
  _QWORD *v38;
  uint64_t v39;
  _QWORD *v40;
  uint64_t v41;

  v41 = *MEMORY[0x1E0C80C00];
  uint64 = xpc_dictionary_get_uint64(*(xpc_object_t *)(a1 + 32), "MRXPC_MESSAGE_ID_KEY");
  switch(HIBYTE(uint64))
  {
    case 5u:
      v3 = *(void **)(a1 + 40);
      v4 = *(id *)(a1 + 32);
      v5 = v3;
      v6 = v5[2];
      v7 = xpc_dictionary_get_uint64(v4, "MRXPC_MESSAGE_ID_KEY");
      if (v6)
      {
        objc_msgSend(v5, "browsableContentQueue");
        v8 = objc_claimAutoreleasedReturnValue();
        *(_QWORD *)&buf = MEMORY[0x1E0C809B0];
        *((_QWORD *)&buf + 1) = 3221225472;
        v35 = ___MRServiceHandleBrowsableContentMessage_block_invoke;
        v36 = &unk_1E30C8018;
        v38 = (_QWORD *)v7;
        v39 = v6;
        v37 = v4;
        v40 = v5;
        goto LABEL_17;
      }
      _MRLogForCategory(0);
      v26 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
      {
        v27 = v7 - 0x500000000000001;
        if (v7 - 0x500000000000001 < 0xA && ((0x23Fu >> v27) & 1) != 0)
          v28 = off_1E30C8088[v27];
        else
          v28 = (__CFString *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("%ld"), v7);
        LODWORD(buf) = 138412290;
        *(_QWORD *)((char *)&buf + 4) = v28;
        _os_log_impl(&dword_193827000, v26, OS_LOG_TYPE_DEFAULT, "No browsableContent endpoint registered to handle API: %@", (uint8_t *)&buf, 0xCu);

      }
      v32 = v4;
      v33 = 11;
      goto LABEL_41;
    case 6u:
      v10 = *(void **)(a1 + 40);
      v4 = *(id *)(a1 + 32);
      v11 = v10;
      v5 = v11;
      v12 = (_QWORD *)v11[4];
      if (v12)
      {
        objc_msgSend(v11, "televisionQueue");
        v8 = objc_claimAutoreleasedReturnValue();
        *(_QWORD *)&buf = MEMORY[0x1E0C809B0];
        *((_QWORD *)&buf + 1) = 3221225472;
        v13 = ___MRSerivceHandleTelevisionMessage_block_invoke;
        goto LABEL_14;
      }
      _MRLogForCategory(0);
      v29 = objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
        goto LABEL_37;
      LODWORD(buf) = 138412290;
      *(_QWORD *)((char *)&buf + 4) = v4;
      v30 = "No television endpoint registered to receive message: %@";
      goto LABEL_36;
    case 7u:
      v14 = *(void **)(a1 + 40);
      v4 = *(id *)(a1 + 32);
      v15 = v14;
      v5 = v15;
      v12 = (_QWORD *)v15[1];
      if (v12)
      {
        objc_msgSend(v15, "clientCallbackQueue");
        v8 = objc_claimAutoreleasedReturnValue();
        *(_QWORD *)&buf = MEMORY[0x1E0C809B0];
        *((_QWORD *)&buf + 1) = 3221225472;
        v13 = (void (*)(uint64_t))___MRServiceHandleClientMessage_block_invoke;
        goto LABEL_14;
      }
      _MRLogForCategory(0);
      v8 = objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
        goto LABEL_19;
      LODWORD(buf) = 138412290;
      *(_QWORD *)((char *)&buf + 4) = v4;
      goto LABEL_30;
    case 8u:
      v16 = *(void **)(a1 + 40);
      v4 = *(id *)(a1 + 32);
      v17 = v16;
      v5 = v17;
      v18 = (_QWORD *)v17[1];
      if (v18)
      {
        objc_msgSend(v17, "clientCallbackPriorityQueue");
        v8 = objc_claimAutoreleasedReturnValue();
        v19 = qos_class_self();
        *(_QWORD *)&buf = MEMORY[0x1E0C809B0];
        *((_QWORD *)&buf + 1) = 3221225472;
        v35 = ___MRServiceHandleClientPriorityMessage_block_invoke;
        v36 = &unk_1E30C78E0;
        v37 = v4;
        v38 = v18;
        v20 = dispatch_block_create_with_qos_class(DISPATCH_BLOCK_ENFORCE_QOS_CLASS|DISPATCH_BLOCK_ASSIGN_CURRENT, v19, 0, &buf);
        dispatch_async(v8, v20);

        goto LABEL_18;
      }
      _MRLogForCategory(0);
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        LODWORD(buf) = 138412290;
        *(_QWORD *)((char *)&buf + 4) = v4;
LABEL_30:
        _os_log_impl(&dword_193827000, v8, OS_LOG_TYPE_DEFAULT, "No client module registered to receive message: %@", (uint8_t *)&buf, 0xCu);
      }
      goto LABEL_19;
    case 9u:
      v21 = *(void **)(a1 + 40);
      v4 = *(id *)(a1 + 32);
      v22 = v21;
      v5 = v22;
      v12 = (_QWORD *)v22[3];
      if (!v12)
      {
        _MRLogForCategory(0);
        v31 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
        {
          LODWORD(buf) = 138412290;
          *(_QWORD *)((char *)&buf + 4) = v4;
          _os_log_impl(&dword_193827000, v31, OS_LOG_TYPE_DEFAULT, "No voice recording endpoint registered to receive message: %@", (uint8_t *)&buf, 0xCu);
        }

        v32 = v4;
        v33 = 21;
        goto LABEL_41;
      }
      objc_msgSend(v22, "voiceInputQueue");
      v8 = objc_claimAutoreleasedReturnValue();
      *(_QWORD *)&buf = MEMORY[0x1E0C809B0];
      *((_QWORD *)&buf + 1) = 3221225472;
      v13 = ___MRServiceHandleVoiceInputMessage_block_invoke;
LABEL_14:
      v35 = v13;
      v36 = &unk_1E30C78E0;
      v37 = v4;
      v38 = v12;
      goto LABEL_17;
    case 0xAu:
      v23 = *(void **)(a1 + 40);
      v4 = *(id *)(a1 + 32);
      v24 = v23;
      v5 = v24;
      v25 = v24[5];
      if (v25)
      {
        objc_msgSend(v24, "agentQueue");
        v8 = objc_claimAutoreleasedReturnValue();
        *(_QWORD *)&buf = MEMORY[0x1E0C809B0];
        *((_QWORD *)&buf + 1) = 3221225472;
        v35 = ___MRServiceHandleAgentMessage_block_invoke;
        v36 = &unk_1E30C8068;
        v37 = v4;
        v38 = v5;
        v39 = v25;
LABEL_17:
        dispatch_async(v8, &buf);
LABEL_18:

LABEL_19:
      }
      else
      {
        _MRLogForCategory(0);
        v29 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
        {
          LODWORD(buf) = 138412290;
          *(_QWORD *)((char *)&buf + 4) = v4;
          v30 = "No agent endpoint registered to receive message: %@";
LABEL_36:
          _os_log_impl(&dword_193827000, v29, OS_LOG_TYPE_DEFAULT, v30, (uint8_t *)&buf, 0xCu);
        }
LABEL_37:

        v32 = v4;
        v33 = 24;
LABEL_41:
        _MRServiceSendReply(v32, v33);
      }

LABEL_43:
      return;
    default:
      v9 = uint64;
      _MRLogForCategory(0);
      v4 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
      {
        LODWORD(buf) = 134217984;
        *(_QWORD *)((char *)&buf + 4) = v9;
        _os_log_impl(&dword_193827000, v4, OS_LOG_TYPE_DEFAULT, "No client-side XPC message destination routed for message with ID %lu.", (uint8_t *)&buf, 0xCu);
      }
      goto LABEL_43;
  }
}

void __MRMediaRemoteServiceStart_block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id WeakRetained;
  NSObject *v5;
  uint64_t v6;
  id v7;
  _QWORD v8[4];
  id v9;
  uint64_t v10;

  v3 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "connectionQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __MRMediaRemoteServiceStart_block_invoke_2;
  v8[3] = &unk_1E30C78E0;
  v6 = *(_QWORD *)(a1 + 40);
  v9 = v3;
  v10 = v6;
  v7 = v3;
  dispatch_async(v5, v8);

}

@end
