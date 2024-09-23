@implementation CSVoiceIdXPCConnection

- (CSVoiceIdXPCConnection)initWithConnection:(id)a3
{
  id v5;
  CSVoiceIdXPCConnection *v6;
  CSVoiceIdXPCConnection *v7;
  dispatch_queue_t v8;
  OS_dispatch_queue *queue;
  NSObject *v10;
  NSObject *v11;
  NSObject *v12;
  objc_super v14;
  uint8_t buf[4];
  const char *v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v14.receiver = self;
  v14.super_class = (Class)CSVoiceIdXPCConnection;
  v6 = -[CSVoiceIdXPCConnection init](&v14, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_connection, a3);
    v8 = dispatch_queue_create("corespeechd speaker xpc connection client queue", 0);
    queue = v7->_queue;
    v7->_queue = (OS_dispatch_queue *)v8;

    v10 = v7->_queue;
    dispatch_get_global_queue(33, 0);
    v11 = objc_claimAutoreleasedReturnValue();
    dispatch_set_target_queue(v10, v11);

    xpc_connection_set_target_queue(v7->_connection, (dispatch_queue_t)v7->_queue);
    v12 = *MEMORY[0x1E0D18F60];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F60], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      v16 = "-[CSVoiceIdXPCConnection initWithConnection:]";
      _os_log_impl(&dword_1C2614000, v12, OS_LOG_TYPE_DEFAULT, "%s Created VoiceIdXpc connection", buf, 0xCu);
    }
  }

  return v7;
}

- (void)activateConnection
{
  OS_xpc_object *connection;
  _QWORD v4[4];
  id v5;
  id location;

  objc_initWeak(&location, self);
  connection = self->_connection;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __44__CSVoiceIdXPCConnection_activateConnection__block_invoke;
  v4[3] = &unk_1E7C28B80;
  objc_copyWeak(&v5, &location);
  xpc_connection_set_event_handler(connection, v4);
  xpc_connection_activate(self->_connection);
  objc_destroyWeak(&v5);
  objc_destroyWeak(&location);
}

- (void)_handleClientEvent:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  NSObject *v7;
  const char *v8;
  NSObject *v9;
  uint32_t v10;
  NSObject *v11;
  OS_xpc_object *connection;
  int v13;
  const char *v14;
  __int16 v15;
  void *v16;
  __int16 v17;
  OS_xpc_object *v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = v4;
  if (v4 && self->_connection)
  {
    v6 = MEMORY[0x1C3BC4CBC](v4);
    if (v6 == MEMORY[0x1E0C812F8])
    {
      -[CSVoiceIdXPCConnection _handleClientMessage:client:](self, "_handleClientMessage:client:", v5, self->_connection);
      goto LABEL_12;
    }
    if (v6 == MEMORY[0x1E0C81310])
    {
      -[CSVoiceIdXPCConnection _handleClientError:client:](self, "_handleClientError:client:", v5, self->_connection);
      goto LABEL_12;
    }
    v7 = *MEMORY[0x1E0D18F60];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F60], OS_LOG_TYPE_ERROR))
    {
      v13 = 136315138;
      v14 = "-[CSVoiceIdXPCConnection _handleClientEvent:]";
      v8 = "%s ignore unknown types of message";
      v9 = v7;
      v10 = 12;
LABEL_9:
      _os_log_error_impl(&dword_1C2614000, v9, OS_LOG_TYPE_ERROR, v8, (uint8_t *)&v13, v10);
    }
  }
  else
  {
    v11 = *MEMORY[0x1E0D18F60];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F60], OS_LOG_TYPE_ERROR))
    {
      connection = self->_connection;
      v13 = 136315650;
      v14 = "-[CSVoiceIdXPCConnection _handleClientEvent:]";
      v15 = 2050;
      v16 = v5;
      v17 = 2050;
      v18 = connection;
      v8 = "%s event = %{public}p client = %{public}p cannot handle event";
      v9 = v11;
      v10 = 32;
      goto LABEL_9;
    }
  }
LABEL_12:

}

- (void)_handleClientMessage:(id)a3 client:(id)a4
{
  id v6;
  id v7;
  void *v8;
  int64_t int64;
  os_log_t *v10;
  NSObject *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  void *v17;
  void *v18;
  id v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  NSObject *v23;
  void *v24;
  NSObject *v25;
  NSObject *v26;
  NSObject *v27;
  NSObject *v28;
  NSObject *v29;
  NSObject *v30;
  _BOOL4 v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  _QWORD v38[4];
  id v39;
  id v40;
  id v41;
  id v42;
  id v43;
  CSVoiceIdXPCConnection *v44;
  id v45;
  id v46;
  uint8_t buf[4];
  const char *v48;
  __int16 v49;
  uint64_t v50;
  __int16 v51;
  void *v52;
  uint64_t v53;

  v53 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v8 = v7;
  if (v6 && v7)
  {
    int64 = xpc_dictionary_get_int64(v6, "type");
    v10 = (os_log_t *)MEMORY[0x1E0D18F60];
    v11 = *MEMORY[0x1E0D18F60];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F60], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315394;
      v48 = "-[CSVoiceIdXPCConnection _handleClientMessage:client:]";
      v49 = 2050;
      v50 = int64;
      _os_log_impl(&dword_1C2614000, v11, OS_LOG_TYPE_DEFAULT, "%s MessageType = %{public}lld", buf, 0x16u);
    }
    if (int64 == 2)
    {
      xpc_dictionary_get_dictionary(v6, "body");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = v12;
      if (v12)
      {
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", xpc_dictionary_get_string(v12, "utterancePath"));
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        xpc_dictionary_get_dictionary(v13, "voiceTriggerEventInfo");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        if (v15)
        {
          v37 = v14;
          v16 = objc_alloc(MEMORY[0x1E0C99D80]);
          objc_msgSend(v16, "_cs_initWithXPCObject:", v15);
          v17 = (void *)objc_claimAutoreleasedReturnValue();

          xpc_dictionary_get_dictionary(v13, "otherCtxt");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          if (v18)
          {
            v19 = objc_alloc(MEMORY[0x1E0C99D80]);
            objc_msgSend(v19, "_cs_initWithXPCObject:", v18);
            v20 = (void *)objc_claimAutoreleasedReturnValue();

            xpc_dictionary_get_value(v13, "recordDeviceInfo");
            v21 = objc_claimAutoreleasedReturnValue();
            v36 = (void *)v21;
            if (v21)
            {
              v34 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D190F0]), "initWithXPCObject:", v21);
              xpc_dictionary_get_value(v13, "audioRecordCtx");
              v22 = objc_claimAutoreleasedReturnValue();
              v35 = (void *)v22;
              if (v22)
              {
                v33 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D19008]), "initWithXPCObject:", v22);
                v23 = *v10;
                if (os_log_type_enabled(*v10, OS_LOG_TYPE_DEFAULT))
                {
                  *(_DWORD *)buf = 136315650;
                  v48 = "-[CSVoiceIdXPCConnection _handleClientMessage:client:]";
                  v49 = 2050;
                  v50 = 2;
                  v51 = 2114;
                  v52 = v37;
                  _os_log_impl(&dword_1C2614000, v23, OS_LOG_TYPE_DEFAULT, "%s Received msg of type %{public}lld for utt %{public}@", buf, 0x20u);
                }
                v24 = v34;
                if (objc_msgSend(MEMORY[0x1E0D19260], "platformSupportsImplicitUttAddition"))
                {
                  +[CSVoiceTriggerAssetHandler sharedHandler](CSVoiceTriggerAssetHandler, "sharedHandler");
                  v32 = (void *)objc_claimAutoreleasedReturnValue();
                  v38[0] = MEMORY[0x1E0C809B0];
                  v38[1] = 3221225472;
                  v38[2] = __54__CSVoiceIdXPCConnection__handleClientMessage_client___block_invoke;
                  v38[3] = &unk_1E7C27EC8;
                  v39 = v37;
                  v40 = v34;
                  v41 = v33;
                  v42 = v17;
                  v43 = v20;
                  v44 = self;
                  v45 = v6;
                  v46 = v8;
                  objc_msgSend(v32, "getVoiceTriggerAssetWithEndpointId:completion:", 0, v38);

                }
              }
              else
              {
                v30 = *v10;
                v31 = os_log_type_enabled(*v10, OS_LOG_TYPE_ERROR);
                v24 = v34;
                if (v31)
                {
                  *(_DWORD *)buf = 136315138;
                  v48 = "-[CSVoiceIdXPCConnection _handleClientMessage:client:]";
                  _os_log_error_impl(&dword_1C2614000, v30, OS_LOG_TYPE_ERROR, "%s Null audio context", buf, 0xCu);
                }
              }

            }
            else
            {
              v29 = *v10;
              if (os_log_type_enabled(*v10, OS_LOG_TYPE_ERROR))
              {
                *(_DWORD *)buf = 136315138;
                v48 = "-[CSVoiceIdXPCConnection _handleClientMessage:client:]";
                _os_log_error_impl(&dword_1C2614000, v29, OS_LOG_TYPE_ERROR, "%s Null deviceInfo", buf, 0xCu);
              }
            }

          }
          else
          {
            v28 = *v10;
            if (os_log_type_enabled(*v10, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 136315138;
              v48 = "-[CSVoiceIdXPCConnection _handleClientMessage:client:]";
              _os_log_error_impl(&dword_1C2614000, v28, OS_LOG_TYPE_ERROR, "%s Null Ctx", buf, 0xCu);
            }
          }

          v14 = v37;
        }
        else
        {
          v27 = *v10;
          if (os_log_type_enabled(*v10, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 136315138;
            v48 = "-[CSVoiceIdXPCConnection _handleClientMessage:client:]";
            _os_log_error_impl(&dword_1C2614000, v27, OS_LOG_TYPE_ERROR, "%s Null VTEI", buf, 0xCu);
          }
        }

      }
      else
      {
        v26 = *v10;
        if (os_log_type_enabled(*v10, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 136315138;
          v48 = "-[CSVoiceIdXPCConnection _handleClientMessage:client:]";
          _os_log_error_impl(&dword_1C2614000, v26, OS_LOG_TYPE_ERROR, "%s Null msg body", buf, 0xCu);
        }
      }

    }
  }
  else
  {
    v25 = *MEMORY[0x1E0D18F60];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F60], OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315650;
      v48 = "-[CSVoiceIdXPCConnection _handleClientMessage:client:]";
      v49 = 2050;
      v50 = (uint64_t)v6;
      v51 = 2050;
      v52 = v8;
      _os_log_error_impl(&dword_1C2614000, v25, OS_LOG_TYPE_ERROR, "%s message = %{public}p, client = %{public}p, cannot handle message", buf, 0x20u);
    }
  }

}

- (void)_handleClientError:(id)a3 client:(id)a4
{
  char *v5;
  id v6;
  void *v7;
  const char *v9;
  NSObject *v10;
  NSObject *v11;
  uint32_t v12;
  const char *string;
  NSObject *v14;
  int v16;
  const char *v17;
  __int16 v18;
  const char *v19;
  __int16 v20;
  void *v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v5 = (char *)a3;
  v6 = a4;
  v7 = v6;
  if (!v5 || !v6)
  {
    v10 = *MEMORY[0x1E0D18F60];
    if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F60], OS_LOG_TYPE_ERROR))
      goto LABEL_13;
    v16 = 136315650;
    v17 = "-[CSVoiceIdXPCConnection _handleClientError:client:]";
    v18 = 2114;
    v19 = v5;
    v20 = 2114;
    v21 = v7;
    v9 = "%s Received error %{public}@ from client %{public}@";
    v11 = v10;
    v12 = 32;
LABEL_16:
    _os_log_error_impl(&dword_1C2614000, v11, OS_LOG_TYPE_ERROR, v9, (uint8_t *)&v16, v12);
    goto LABEL_13;
  }
  if (v5 == (char *)MEMORY[0x1E0C81260] || v5 == (char *)MEMORY[0x1E0C81258])
  {
    v14 = *MEMORY[0x1E0D18F60];
    if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F60], OS_LOG_TYPE_ERROR))
      goto LABEL_13;
    v16 = 136315394;
    v17 = "-[CSVoiceIdXPCConnection _handleClientError:client:]";
    v18 = 2050;
    v19 = (const char *)v7;
    v9 = "%s Client %{public}p connection disconnected, noticing xpc listener";
    goto LABEL_15;
  }
  string = xpc_dictionary_get_string(v5, (const char *)*MEMORY[0x1E0C81270]);
  v14 = *MEMORY[0x1E0D18F60];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F60], OS_LOG_TYPE_ERROR))
  {
    v16 = 136315394;
    v17 = "-[CSVoiceIdXPCConnection _handleClientError:client:]";
    v18 = 2082;
    v19 = string;
    v9 = "%s connection error: %{public}s";
LABEL_15:
    v11 = v14;
    v12 = 22;
    goto LABEL_16;
  }
LABEL_13:

}

- (void)_sendReplyMessageWithResult:(BOOL)a3 error:(id)a4 event:(id)a5 client:(id)a6
{
  _xpc_connection_s *v9;
  xpc_object_t reply;
  id v11;
  id v12;

  v12 = a4;
  v9 = (_xpc_connection_s *)a6;
  reply = xpc_dictionary_create_reply(a5);
  xpc_dictionary_set_BOOL(reply, "result", a3);
  if (v12)
  {
    objc_msgSend(v12, "domain");
    v11 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    xpc_dictionary_set_string(reply, "resultErrorDomain", (const char *)objc_msgSend(v11, "UTF8String"));

    xpc_dictionary_set_int64(reply, "resultErrorCode", objc_msgSend(v12, "code"));
  }
  xpc_connection_send_message(v9, reply);

}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)setQueue:(id)a3
{
  objc_storeStrong((id *)&self->_queue, a3);
}

- (OS_xpc_object)connection
{
  return self->_connection;
}

- (void)setConnection:(id)a3
{
  objc_storeStrong((id *)&self->_connection, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_connection, 0);
  objc_storeStrong((id *)&self->_queue, 0);
}

void __54__CSVoiceIdXPCConnection__handleClientMessage_client___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  NSObject *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  NSObject *v16;
  void *v17;
  _QWORD v18[5];
  id v19;
  id v20;
  uint8_t buf[4];
  const char *v22;
  __int16 v23;
  id v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  v7 = *MEMORY[0x1E0D18F60];
  v8 = *MEMORY[0x1E0D18F60];
  if (v5)
  {
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315394;
      v22 = "-[CSVoiceIdXPCConnection _handleClientMessage:client:]_block_invoke";
      v23 = 2112;
      v24 = v5;
      _os_log_impl(&dword_1C2614000, v7, OS_LOG_TYPE_DEFAULT, "%s Fetched latest VT asset %@ for retraining", buf, 0x16u);
    }
    objc_msgSend(MEMORY[0x1E0DA8C28], "sharedInstance");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:", *(_QWORD *)(a1 + 32));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = *(_QWORD *)(a1 + 40);
    v12 = *(_QWORD *)(a1 + 48);
    v18[0] = MEMORY[0x1E0C809B0];
    v18[2] = __54__CSVoiceIdXPCConnection__handleClientMessage_client___block_invoke_16;
    v18[3] = &unk_1E7C27EA0;
    v13 = *(void **)(a1 + 80);
    v18[4] = *(_QWORD *)(a1 + 72);
    v14 = *(_QWORD *)(a1 + 56);
    v15 = *(_QWORD *)(a1 + 64);
    v18[1] = 3221225472;
    v19 = v13;
    v20 = *(id *)(a1 + 88);
    objc_msgSend(v9, "notifyImplicitTrainingUtteranceAvailable:forVoiceProfileId:withRecordDeviceInfo:withRecordCtxt:withVoiceTriggerCtxt:withOtherCtxt:assetToUse:withCompletion:", v10, 0, v11, v12, v14, v15, v5, v18);

  }
  else if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
  {
    v16 = v7;
    objc_msgSend(v6, "localizedDescription");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 136315394;
    v22 = "-[CSVoiceIdXPCConnection _handleClientMessage:client:]_block_invoke";
    v23 = 2112;
    v24 = v17;
    _os_log_error_impl(&dword_1C2614000, v16, OS_LOG_TYPE_ERROR, "%s Cannot retrain since we cannot look-up SSR asset with error %@", buf, 0x16u);

  }
}

void __54__CSVoiceIdXPCConnection__handleClientMessage_client___block_invoke_16(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  void *v5;
  NSObject *v6;
  id v7;
  _QWORD v8[4];
  id v9;
  uint64_t v10;
  id v11;
  id v12;

  v3 = a2;
  v8[0] = MEMORY[0x1E0C809B0];
  v4 = *(_QWORD *)(a1 + 32);
  v5 = *(void **)(a1 + 40);
  v6 = *(NSObject **)(v4 + 8);
  v8[2] = __54__CSVoiceIdXPCConnection__handleClientMessage_client___block_invoke_2;
  v8[3] = &unk_1E7C27E78;
  v8[1] = 3221225472;
  v9 = v3;
  v10 = v4;
  v11 = v5;
  v12 = *(id *)(a1 + 48);
  v7 = v3;
  dispatch_async(v6, v8);

}

uint64_t __54__CSVoiceIdXPCConnection__handleClientMessage_client___block_invoke_2(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  int v5;
  const char *v6;
  __int16 v7;
  uint64_t v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v2 = *MEMORY[0x1E0D18F60];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F60], OS_LOG_TYPE_DEFAULT))
  {
    v3 = *(_QWORD *)(a1 + 32);
    v5 = 136315394;
    v6 = "-[CSVoiceIdXPCConnection _handleClientMessage:client:]_block_invoke_2";
    v7 = 2114;
    v8 = v3;
    _os_log_impl(&dword_1C2614000, v2, OS_LOG_TYPE_DEFAULT, "%s Implicit utterance processing done with error %{public}@", (uint8_t *)&v5, 0x16u);
  }
  return objc_msgSend(*(id *)(a1 + 40), "_sendReplyMessageWithResult:error:event:client:", *(_QWORD *)(a1 + 32) != 0);
}

void __44__CSVoiceIdXPCConnection_activateConnection__block_invoke(uint64_t a1, void *a2)
{
  id *v2;
  id v3;
  id WeakRetained;

  v2 = (id *)(a1 + 32);
  v3 = a2;
  WeakRetained = objc_loadWeakRetained(v2);
  objc_msgSend(WeakRetained, "_handleClientEvent:", v3);

}

@end
