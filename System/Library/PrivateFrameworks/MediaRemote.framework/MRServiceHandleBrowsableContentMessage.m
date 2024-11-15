@implementation MRServiceHandleBrowsableContentMessage

void ___MRServiceHandleBrowsableContentMessage_block_invoke(uint64_t a1)
{
  _QWORD *v2;
  id v3;
  id v4;
  const void *data;
  unint64_t v6;
  uint64_t v7;
  void (*v8)(const void *, unint64_t, uint64_t, __int128 *);
  _QWORD *v9;
  _QWORD *v10;
  uint64_t (*v11)(_QWORD);
  _xpc_connection_s *Error;
  NSObject *v13;
  _xpc_connection_s *v14;
  xpc_object_t reply;
  id v16;
  uint64_t v17;
  id v18;
  NSObject *v19;
  uint64_t v20;
  uint64_t v21;
  id v22;
  char v23;
  xpc_object_t v24;
  void *v25;
  uint64_t v26;
  id v27;
  uint64_t v28;
  xpc_object_t v29;
  _QWORD *v30;
  id v31;
  const void *v32;
  unint64_t v33;
  int64_t int64;
  int64_t v35;
  xpc_object_t v36;
  uint64_t *v37;
  id v38;
  void (*v39)(_xpc_connection_s *, uint64_t, __int128 *);
  uint64_t v40;
  __int128 v41;
  void *v42;
  void *v43;
  id v44;
  uint64_t v45;

  v45 = *MEMORY[0x1E0C80C00];
  switch(*(_QWORD *)(a1 + 40))
  {
    case 0x500000000000001:
      v2 = *(_QWORD **)(a1 + 48);
      v3 = *(id *)(a1 + 32);
      v4 = v3;
      if (!v2 || !v2[1])
      {
        Error = (_xpc_connection_s *)MRMediaRemoteCreateError(6);
        _MRServiceSendReplyWithClientError(v4, (uint64_t)Error);
        goto LABEL_52;
      }
      *(_QWORD *)&v41 = 0;
      data = xpc_dictionary_get_data(v3, "MRXPC_INDEXPATH_DATA_KEY", (size_t *)&v41);
      if (data)
        v6 = (unint64_t)v41 >> 3;
      else
        v6 = 0;
      v9 = v2;
      v7 = *v2;
      v8 = (void (*)(const void *, unint64_t, uint64_t, __int128 *))v9[1];
      *(_QWORD *)&v41 = MEMORY[0x1E0C809B0];
      *((_QWORD *)&v41 + 1) = 3221225472;
      v42 = ___MRServiceHandleBeginLoadingContentMessage_block_invoke;
      v43 = &unk_1E30C8040;
      v44 = v4;
      v8(data, v6, v7, &v41);

      goto LABEL_53;
    case 0x500000000000002:
      v10 = *(_QWORD **)(a1 + 48);
      v4 = *(id *)(a1 + 32);
      if (!v10)
        goto LABEL_53;
      v11 = (uint64_t (*)(_QWORD))v10[2];
      if (!v11)
        goto LABEL_53;
      Error = (_xpc_connection_s *)v11(*v10);
      if (!Error)
      {
        _MRLogForCategory(0);
        v13 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
        {
          LOWORD(v41) = 0;
          _os_log_impl(&dword_193827000, v13, OS_LOG_TYPE_DEFAULT, "WARNING: Client endpoint returned nil when requesting now playing identifiers", (uint8_t *)&v41, 2u);
        }

      }
      xpc_dictionary_get_remote_connection(v4);
      v14 = (_xpc_connection_s *)objc_claimAutoreleasedReturnValue();
      if (!v14)
        goto LABEL_47;
      reply = xpc_dictionary_create_reply(v4);
      if (!reply)
        goto LABEL_46;
      if (Error)
      {
        objc_msgSend(MEMORY[0x1E0CB38B0], "dataWithPropertyList:format:options:error:", Error, 200, 0, 0);
        v16 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
        xpc_dictionary_set_data(reply, "MRXPC_CONTENT_NOW_PLAYING_IDENTIFIERS_KEY", (const void *)objc_msgSend(v16, "bytes"), objc_msgSend(v16, "length"));

      }
      goto LABEL_45;
    case 0x500000000000003:
      v21 = *(_QWORD *)(a1 + 48);
      v22 = *(id *)(a1 + 32);
      v4 = v22;
      if (!v21 || !*(_QWORD *)(v21 + 24))
        goto LABEL_53;
      *(_QWORD *)&v41 = 0;
      xpc_dictionary_get_data(v22, "MRXPC_INDEXPATH_DATA_KEY", (size_t *)&v41);
      v23 = (*(uint64_t (**)(void))(v21 + 24))();
      xpc_dictionary_get_remote_connection(v4);
      Error = (_xpc_connection_s *)objc_claimAutoreleasedReturnValue();
      if (!Error)
        goto LABEL_52;
      v24 = xpc_dictionary_create_reply(v4);
      v25 = v24;
      if (!v24)
        goto LABEL_35;
      xpc_dictionary_set_BOOL(v24, "MRXPC_CONTENT_SUPPORTS_PLAYBACK_PROGRESS_KEY", v23);
      goto LABEL_34;
    case 0x500000000000004:
      v26 = *(_QWORD *)(a1 + 48);
      v27 = *(id *)(a1 + 32);
      v4 = v27;
      if (!v26 || !*(_QWORD *)(v26 + 32))
        goto LABEL_53;
      *(_QWORD *)&v41 = 0;
      xpc_dictionary_get_data(v27, "MRXPC_INDEXPATH_DATA_KEY", (size_t *)&v41);
      v28 = (*(uint64_t (**)(void))(v26 + 32))();
      xpc_dictionary_get_remote_connection(v4);
      Error = (_xpc_connection_s *)objc_claimAutoreleasedReturnValue();
      if (!Error)
        goto LABEL_52;
      v29 = xpc_dictionary_create_reply(v4);
      v25 = v29;
      if (!v29)
        goto LABEL_35;
      xpc_dictionary_set_uint64(v29, "MRXPC_CONTENT_CHILD_ITEMS_COUNT_KEY", v28);
LABEL_34:
      xpc_connection_send_message(Error, v25);
LABEL_35:

      goto LABEL_52;
    case 0x500000000000005:
      v30 = *(_QWORD **)(a1 + 48);
      v31 = *(id *)(a1 + 32);
      v4 = v31;
      if (!v30 || !v30[5])
        goto LABEL_53;
      *(_QWORD *)&v41 = 0;
      v32 = xpc_dictionary_get_data(v31, "MRXPC_INDEXPATH_DATA_KEY", (size_t *)&v41);
      if (v32)
        v33 = (unint64_t)v41 >> 3;
      else
        v33 = 0;
      int64 = xpc_dictionary_get_int64(v4, "MRXPC_RANGE_BEGIN_KEY");
      v35 = xpc_dictionary_get_int64(v4, "MRXPC_RANGE_LENGTH_KEY");
      Error = (_xpc_connection_s *)((uint64_t (*)(const void *, unint64_t, int64_t, int64_t, _QWORD))v30[5])(v32, v33, int64, v35, *v30);
      if (Error)
      {
        xpc_dictionary_get_remote_connection(v4);
        v14 = (_xpc_connection_s *)objc_claimAutoreleasedReturnValue();
        if (v14)
        {
          v36 = xpc_dictionary_create_reply(v4);
          reply = v36;
          if (v36)
          {
            MRAddContentItemsToXPCMessage(v36, Error);
LABEL_45:
            xpc_connection_send_message(v14, reply);
          }
LABEL_46:

        }
      }
      else
      {
        _MRLogForCategory(0);
        v14 = (_xpc_connection_s *)objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled((os_log_t)v14, OS_LOG_TYPE_DEFAULT))
        {
          LOWORD(v41) = 0;
          _os_log_impl(&dword_193827000, (os_log_t)v14, OS_LOG_TYPE_DEFAULT, "Client endpoint returned nil when requesting child content items.", (uint8_t *)&v41, 2u);
        }
      }
LABEL_47:

      goto LABEL_52;
    case 0x500000000000006:
      v17 = *(_QWORD *)(a1 + 48);
      v18 = *(id *)(a1 + 32);
      v4 = v18;
      if (v17 && *(_QWORD *)(v17 + 48))
      {
        *(_QWORD *)&v41 = 0;
        xpc_dictionary_get_data(v18, "MRXPC_INDEXPATH_DATA_KEY", (size_t *)&v41);
        (*(void (**)(void))(v17 + 48))();
      }
      goto LABEL_53;
    case 0x50000000000000ALL:
      v37 = *(uint64_t **)(a1 + 48);
      v38 = *(id *)(a1 + 32);
      v4 = v38;
      if (v37 && v37[7])
      {
        Error = (_xpc_connection_s *)MRCreatePropertyListFromXPCMessage(v38, "MRXPC_CONTENT_IDENTIFIERS");
        v39 = (void (*)(_xpc_connection_s *, uint64_t, __int128 *))v37[7];
        v40 = *v37;
        *(_QWORD *)&v41 = MEMORY[0x1E0C809B0];
        *((_QWORD *)&v41 + 1) = 3221225472;
        v42 = ___MRServiceHandleGetContentItemsForIdentifiers_block_invoke;
        v43 = &unk_1E30C7F78;
        v44 = v4;
        v39(Error, v40, &v41);

LABEL_52:
      }
      else
      {
        _MRServiceSendReply(v38, 6uLL);
      }
LABEL_53:

      return;
    default:
      _MRLogForCategory(0);
      v19 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
      {
        v20 = *(_QWORD *)(a1 + 40);
        LODWORD(v41) = 134217984;
        *(_QWORD *)((char *)&v41 + 4) = v20;
        _os_log_impl(&dword_193827000, v19, OS_LOG_TYPE_DEFAULT, "Client-side browsable content message with ID %lu not handled.", (uint8_t *)&v41, 0xCu);
      }

      return;
  }
}

@end
