@implementation ENXPCServiceConnection

+ (id)connectionWithXPCConnection:(id)a3 serviceListener:(id)a4 dispatchQueue:(id)a5
{
  _xpc_connection_s *v7;
  ENXPCServiceListener *v8;
  OS_dispatch_queue *v9;
  ENXPCServiceConnection *v10;
  OS_dispatch_queue *dispatchQueue;
  OS_dispatch_queue *v12;
  ENXPCServiceListener *serviceListener;
  ENXPCServiceListener *v14;
  OS_xpc_object *xpcConnection;

  v7 = (_xpc_connection_s *)a3;
  v8 = (ENXPCServiceListener *)a4;
  v9 = (OS_dispatch_queue *)a5;
  v10 = objc_alloc_init(ENXPCServiceConnection);
  dispatchQueue = v10->_dispatchQueue;
  v10->_dispatchQueue = v9;
  v12 = v9;

  serviceListener = v10->_serviceListener;
  v10->_serviceListener = v8;
  v14 = v8;

  v10->_pid = xpc_connection_get_pid(v7);
  xpcConnection = v10->_xpcConnection;
  v10->_xpcConnection = v7;

  return v10;
}

- (void)activate
{
  OS_xpc_object *xpcConnection;
  _QWORD handler[5];

  xpcConnection = self->_xpcConnection;
  handler[0] = MEMORY[0x1E0C809B0];
  handler[1] = 3221225472;
  handler[2] = __34__ENXPCServiceConnection_activate__block_invoke;
  handler[3] = &unk_1E87D9D60;
  handler[4] = self;
  xpc_connection_set_event_handler(xpcConnection, handler);
  xpc_connection_set_target_queue(self->_xpcConnection, (dispatch_queue_t)self->_dispatchQueue);
  xpc_connection_activate(self->_xpcConnection);
}

uint64_t __34__ENXPCServiceConnection_activate__block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "xpcConnectionEvent:", a2);
}

- (void)invalidate
{
  ENFileSessionDaemon *fileSession;
  OS_xpc_object *xpcConnection;

  -[ENFileSessionDaemon invalidate](self->_fileSession, "invalidate");
  fileSession = self->_fileSession;
  self->_fileSession = 0;

  -[ENXPCServiceListener connectionInvalidated:](self->_serviceListener, "connectionInvalidated:", self);
  xpcConnection = self->_xpcConnection;
  self->_xpcConnection = 0;

}

- (void)xpcConnectionEvent:(id)a3
{
  void *v4;
  int v5;
  uint64_t v6;
  void *v7;
  void *v8;
  id v9;

  v9 = a3;
  if (MEMORY[0x1D17A8408]() == MEMORY[0x1E0C812F8])
  {
    -[ENXPCServiceConnection xpcConnectionRequest:](self, "xpcConnectionRequest:", v9);
    goto LABEL_14;
  }
  v4 = v9;
  if (v9 == (id)MEMORY[0x1E0C81260])
  {
    if (gLogCategory_ENXPCServiceConnection <= 20
      && (gLogCategory_ENXPCServiceConnection != -1 || _LogCategory_Initialize()))
    {
      CUPrintPID();
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      LogPrintF_safe();

      -[ENXPCServiceConnection invalidate](self, "invalidate", v8);
    }
    else
    {
      -[ENXPCServiceConnection invalidate](self, "invalidate", v6);
    }
    goto LABEL_14;
  }
  if (gLogCategory__ENXPCServiceConnection <= 90)
  {
    if (gLogCategory__ENXPCServiceConnection != -1 || (v5 = _LogCategory_Initialize(), v4 = v9, v5))
    {
      CUPrintXPC();
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      LogPrintF_safe();

LABEL_14:
      v4 = v9;
    }
  }

}

- (void)xpcConnectionRequest:(id)a3
{
  int64_t int64;
  ENXPCServiceConnection *v5;
  id v6;
  uint64_t v7;
  int64_t v8;
  void *v9;
  int64_t v10;
  id v11;

  v11 = a3;
  int64 = xpc_dictionary_get_int64(v11, "smTyp");
  switch(int64)
  {
    case 10:
      v5 = self;
      v6 = v11;
      v7 = 1;
      goto LABEL_7;
    case 11:
      v5 = self;
      v6 = v11;
      v7 = 0;
LABEL_7:
      -[ENXPCServiceConnection xpcFileSessionActivate:archive:](v5, "xpcFileSessionActivate:archive:", v6, v7);
      break;
    case 12:
      -[ENXPCServiceConnection xpcFileSessionInvalidate:](self, "xpcFileSessionInvalidate:", v11);
      break;
    case 13:
      -[ENXPCServiceConnection xpcFileSessionReadTEKBatch:](self, "xpcFileSessionReadTEKBatch:", v11);
      break;
    default:
      v8 = int64;
      if (gLogCategory__ENXPCServiceConnection <= 90
        && (gLogCategory__ENXPCServiceConnection != -1 || _LogCategory_Initialize()))
      {
        LogPrintF_safe();
      }
      if (xpc_dictionary_expects_reply())
      {
        v10 = v8;
        ENErrorF();
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        -[ENXPCServiceConnection xpcSendReplyError:request:](self, "xpcSendReplyError:request:", v9, v11, v10);

      }
      break;
  }

}

- (void)xpcSendMessage:(id)a3
{
  OS_xpc_object *v4;
  OS_xpc_object *v5;
  xpc_object_t message;

  message = a3;
  v4 = self->_xpcConnection;
  v5 = v4;
  if (v4)
  {
    xpc_connection_send_message(v4, message);
  }
  else if (gLogCategory__ENXPCServiceConnection <= 90
         && (gLogCategory__ENXPCServiceConnection != -1 || _LogCategory_Initialize()))
  {
    LogPrintF_safe();
  }

}

- (void)xpcSendReplyError:(id)a3 request:(id)a4
{
  id v6;
  OS_xpc_object *v7;
  xpc_object_t reply;
  id v9;

  v9 = a3;
  v6 = a4;
  v7 = self->_xpcConnection;
  if (v7)
  {
    reply = xpc_dictionary_create_reply(v6);
    if (reply)
    {
      CUXPCEncodeNSError();
      xpc_connection_send_message(v7, reply);
    }
    else if (gLogCategory__ENXPCServiceConnection <= 90
           && (gLogCategory__ENXPCServiceConnection != -1 || _LogCategory_Initialize()))
    {
      LogPrintF_safe();
    }

  }
  else if (gLogCategory__ENXPCServiceConnection <= 90
         && (gLogCategory__ENXPCServiceConnection != -1 || _LogCategory_Initialize()))
  {
    LogPrintF_safe();
  }

}

- (void)xpcFileSessionActivate:(id)a3 archive:(BOOL)a4
{
  _BOOL4 v4;
  id v6;
  uint64_t v7;
  id v8;
  void (**v9)(_QWORD);
  ENFileSessionDaemon **p_fileSession;
  void (**v11)(_QWORD);
  id *v12;
  int v13;
  uint64_t v14;
  id *v15;
  int v16;
  uint64_t v17;
  id *v18;
  int v19;
  ENFileSessionDaemon *v20;
  uint64_t v21;
  id *v22;
  BOOL v23;
  id *v24;
  _BOOL4 v25;
  void *v26;
  uint64_t v27;
  void *v28;
  void *v29;
  id v30;
  void *v31;
  void *v32;
  void *v33;
  id v34;
  void *v35;
  void *v36;
  xpc_object_t reply;
  id v38;
  id v39;
  const char *v40;
  size_t v41;
  uint64_t v42;
  id v43;
  uint64_t v44;
  void *v45;
  void *v46;
  ENXPCServiceConnection *v47;
  void (**v48)(_QWORD);
  void (**v49)(_QWORD);
  id v50;
  id v51;
  id v52;
  id v53;
  id v54;
  id v55;
  id obj;
  id v57;
  _QWORD v58[5];
  uint64_t v59;
  uint64_t *v60;
  uint64_t v61;
  int v62;
  _QWORD v63[5];
  id v64;
  uint64_t *v65;
  uint64_t v66;
  id *v67;
  uint64_t v68;
  uint64_t (*v69)(uint64_t, uint64_t);
  void (*v70)(uint64_t);
  id v71;
  uint64_t v72;

  v4 = a4;
  v6 = a3;
  v66 = 0;
  v67 = (id *)&v66;
  v68 = 0x3032000000;
  v69 = __Block_byref_object_copy__0;
  v70 = __Block_byref_object_dispose__0;
  v71 = 0;
  v7 = MEMORY[0x1E0C809B0];
  v63[0] = MEMORY[0x1E0C809B0];
  v63[1] = 3221225472;
  v63[2] = __57__ENXPCServiceConnection_xpcFileSessionActivate_archive___block_invoke;
  v63[3] = &unk_1E87D9D88;
  v65 = &v66;
  v63[4] = self;
  v8 = v6;
  v64 = v8;
  v9 = (void (**)(_QWORD))MEMORY[0x1D17A7E5C](v63);
  p_fileSession = &self->_fileSession;
  v49 = v9;
  if (self->_fileSession)
  {
    ENErrorF();
    v42 = objc_claimAutoreleasedReturnValue();
    v43 = v67[5];
    v67[5] = (id)v42;

    goto LABEL_38;
  }
  v59 = 0;
  v60 = &v59;
  v61 = 0x2020000000;
  v62 = 0;
  v62 = xpc_dictionary_dup_fd(v8, "fd");
  if ((v60[3] & 0x80000000) != 0)
  {
    ENErrorF();
    v44 = objc_claimAutoreleasedReturnValue();
    v11 = (void (**)(_QWORD))v67[5];
    v67[5] = (id)v44;
    goto LABEL_37;
  }
  v58[0] = v7;
  v58[1] = 3221225472;
  v58[2] = __57__ENXPCServiceConnection_xpcFileSessionActivate_archive___block_invoke_2;
  v58[3] = &unk_1E87D9DB0;
  v58[4] = &v59;
  v11 = (void (**)(_QWORD))MEMORY[0x1D17A7E5C](v58);
  v12 = v67 + 5;
  obj = v67[5];
  v57 = 0;
  v72 = 0;
  v48 = v11;
  v13 = CUXPCDecodeUInt64RangedEx();
  if (v13 == 6)
    v14 = v72;
  else
    v14 = 0;
  objc_storeStrong(v12, obj);
  if (v13 != 5)
  {
    v15 = v67 + 5;
    v55 = v67[5];
    v72 = 0;
    v16 = CUXPCDecodeUInt64RangedEx();
    v17 = v16 == 6 ? v72 : 0;
    objc_storeStrong(v15, v55);
    if (v16 != 5)
    {
      v18 = v67;
      v54 = v67[5];
      v19 = CUXPCDecodeNSData();
      objc_storeStrong(v18 + 5, v54);
      if (v19)
      {
        v47 = self;
        v20 = objc_alloc_init(ENFileSessionDaemon);
        -[ENFileSessionDaemon setBatchSize:](v20, "setBatchSize:", v14);
        -[ENFileSessionDaemon setFlags:](v20, "setFlags:", v17);
        v21 = *((unsigned int *)v60 + 6);
        if (v4)
        {
          v22 = v67;
          v53 = v67[5];
          v23 = -[ENFileSessionDaemon activateWithArchiveFD:error:](v20, "activateWithArchiveFD:error:", v21, &v53);
          objc_storeStrong(v22 + 5, v53);
          if (!v23)
            goto LABEL_35;
        }
        else
        {
          v24 = v67;
          v52 = v67[5];
          v25 = -[ENFileSessionDaemon activateWithFileFD:signatureData:error:](v20, "activateWithFileFD:signatureData:error:", v21, v57, &v52);
          objc_storeStrong(v24 + 5, v52);
          if (!v25)
          {
LABEL_35:

            v11 = v48;
            goto LABEL_36;
          }
        }
        -[ENFileSessionDaemon file](v20, "file");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v26, "metadata");
        v27 = objc_claimAutoreleasedReturnValue();
        v28 = (void *)v27;
        v29 = (void *)MEMORY[0x1E0C9AA68];
        if (v27)
          v29 = (void *)v27;
        v30 = v29;

        -[ENFileSessionDaemon file](v20, "file");
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v31, "sha256Data");
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        v33 = v32;
        if (v32)
        {
          v34 = v32;
        }
        else
        {
          objc_msgSend(MEMORY[0x1E0C99D58], "data");
          v34 = (id)objc_claimAutoreleasedReturnValue();
        }
        v35 = v34;

        v51 = 0;
        -[ENFileSessionDaemon readSignaturesAndReturnError:](v20, "readSignaturesAndReturnError:", &v51);
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        v50 = v51;
        if (!v36
          && gLogCategory__ENXPCServiceConnection <= 90
          && (gLogCategory__ENXPCServiceConnection != -1 || _LogCategory_Initialize()))
        {
          CUPrintNSError();
          v45 = v35;
          v46 = (void *)objc_claimAutoreleasedReturnValue();
          LogPrintF_safe();

        }
        objc_storeStrong((id *)p_fileSession, v20);
        *((_DWORD *)v60 + 6) = -1;
        reply = xpc_dictionary_create_reply(v8);
        if (reply)
        {
          xpc_dictionary_set_cf_object();
          if (v35)
          {
            v38 = objc_retainAutorelease(v35);
            v39 = reply;
            v40 = (const char *)objc_msgSend(v38, "bytes");
            v41 = objc_msgSend(v38, "length");
            if (!v40)
              v40 = "";

            xpc_dictionary_set_data(v39, "fileHash", v40, v41);
          }
          if (v36)
            xpc_dictionary_set_value(reply, "sigA", v36);
          -[ENXPCServiceConnection xpcSendMessage:](v47, "xpcSendMessage:", reply, v45, v46);
        }
        else if (gLogCategory__ENXPCServiceConnection <= 90
               && (gLogCategory__ENXPCServiceConnection != -1 || _LogCategory_Initialize()))
        {
          LogPrintF_safe();
        }

        goto LABEL_35;
      }
    }
  }
LABEL_36:

  v9 = v49;
  v11[2](v11);
LABEL_37:

  _Block_object_dispose(&v59, 8);
LABEL_38:
  v9[2](v9);

  _Block_object_dispose(&v66, 8);
}

uint64_t __57__ENXPCServiceConnection_xpcFileSessionActivate_archive___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t result;
  int v4;
  void *v5;

  v2 = *(_QWORD *)(a1 + 48);
  result = *(_QWORD *)(*(_QWORD *)(v2 + 8) + 40);
  if (result)
  {
    if (gLogCategory__ENXPCServiceConnection <= 90)
    {
      if (gLogCategory__ENXPCServiceConnection != -1 || (v4 = _LogCategory_Initialize(), v2 = *(_QWORD *)(a1 + 48), v4))
      {
        CUPrintNSError();
        v5 = (void *)objc_claimAutoreleasedReturnValue();
        LogPrintF_safe();

        v2 = *(_QWORD *)(a1 + 48);
      }
    }
    return objc_msgSend(*(id *)(a1 + 32), "xpcSendReplyError:request:", *(_QWORD *)(*(_QWORD *)(v2 + 8) + 40), *(_QWORD *)(a1 + 40));
  }
  return result;
}

uint64_t __57__ENXPCServiceConnection_xpcFileSessionActivate_archive___block_invoke_2(uint64_t a1)
{
  uint64_t result;

  result = *(unsigned int *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  if ((result & 0x80000000) == 0)
    return close(result);
  return result;
}

- (void)xpcFileSessionInvalidate:(id)a3
{
  id v4;
  id v5;
  void (**v6)(_QWORD);
  ENFileSessionDaemon *v7;
  ENFileSessionDaemon *v8;
  ENFileSessionDaemon *fileSession;
  xpc_object_t reply;
  uint64_t v11;
  _QWORD v12[5];
  id v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t (*v18)(uint64_t, uint64_t);
  void (*v19)(uint64_t);
  id v20;

  v4 = a3;
  v15 = 0;
  v16 = &v15;
  v17 = 0x3032000000;
  v18 = __Block_byref_object_copy__0;
  v19 = __Block_byref_object_dispose__0;
  v20 = 0;
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __51__ENXPCServiceConnection_xpcFileSessionInvalidate___block_invoke;
  v12[3] = &unk_1E87D9D88;
  v14 = &v15;
  v12[4] = self;
  v5 = v4;
  v13 = v5;
  v6 = (void (**)(_QWORD))MEMORY[0x1D17A7E5C](v12);
  v7 = self->_fileSession;
  v8 = v7;
  if (v7)
  {
    -[ENFileSessionDaemon invalidate](v7, "invalidate");
    fileSession = self->_fileSession;
    self->_fileSession = 0;

    reply = xpc_dictionary_create_reply(v5);
    if (reply)
    {
      -[ENXPCServiceConnection xpcSendMessage:](self, "xpcSendMessage:", reply);
    }
    else if (gLogCategory__ENXPCServiceConnection <= 90
           && (gLogCategory__ENXPCServiceConnection != -1 || _LogCategory_Initialize()))
    {
      LogPrintF_safe();
    }
  }
  else
  {
    ENErrorF();
    v11 = objc_claimAutoreleasedReturnValue();
    reply = (xpc_object_t)v16[5];
    v16[5] = v11;
  }

  v6[2](v6);
  _Block_object_dispose(&v15, 8);

}

uint64_t __51__ENXPCServiceConnection_xpcFileSessionInvalidate___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t result;
  int v4;
  void *v5;

  v2 = *(_QWORD *)(a1 + 48);
  result = *(_QWORD *)(*(_QWORD *)(v2 + 8) + 40);
  if (result)
  {
    if (gLogCategory__ENXPCServiceConnection <= 90)
    {
      if (gLogCategory__ENXPCServiceConnection != -1 || (v4 = _LogCategory_Initialize(), v2 = *(_QWORD *)(a1 + 48), v4))
      {
        CUPrintNSError();
        v5 = (void *)objc_claimAutoreleasedReturnValue();
        LogPrintF_safe();

        v2 = *(_QWORD *)(a1 + 48);
      }
    }
    return objc_msgSend(*(id *)(a1 + 32), "xpcSendReplyError:request:", *(_QWORD *)(*(_QWORD *)(v2 + 8) + 40), *(_QWORD *)(a1 + 40));
  }
  return result;
}

- (void)xpcFileSessionReadTEKBatch:(id)a3
{
  id v4;
  uint64_t v5;
  id v6;
  void (**v7)(_QWORD);
  ENFileSessionDaemon *v8;
  ENFileSessionDaemon *v9;
  id *v10;
  void *v11;
  xpc_object_t reply;
  void *v13;
  NSObject *dispatchQueue;
  uint64_t v15;
  uint64_t *v16;
  void *v17;
  id v18;
  uint64_t v19;
  _QWORD block[5];
  id obj;
  _QWORD v22[5];
  id v23;
  uint64_t *v24;
  uint64_t v25;
  uint64_t *v26;
  uint64_t v27;
  uint64_t (*v28)(uint64_t, uint64_t);
  void (*v29)(uint64_t);
  id v30;

  v4 = a3;
  v25 = 0;
  v26 = &v25;
  v27 = 0x3032000000;
  v28 = __Block_byref_object_copy__0;
  v29 = __Block_byref_object_dispose__0;
  v30 = 0;
  v5 = MEMORY[0x1E0C809B0];
  v22[0] = MEMORY[0x1E0C809B0];
  v22[1] = 3221225472;
  v22[2] = __53__ENXPCServiceConnection_xpcFileSessionReadTEKBatch___block_invoke;
  v22[3] = &unk_1E87D9D88;
  v24 = &v25;
  v22[4] = self;
  v6 = v4;
  v23 = v6;
  v7 = (void (**)(_QWORD))MEMORY[0x1D17A7E5C](v22);
  v8 = self->_fileSession;
  v9 = v8;
  if (v8)
  {
    v10 = (id *)(v26 + 5);
    obj = (id)v26[5];
    -[ENFileSessionDaemon readTEKBatchAndReturnError:](v8, "readTEKBatchAndReturnError:", &obj);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_storeStrong(v10, obj);
    if (v11)
    {
      reply = xpc_dictionary_create_reply(v6);
      v13 = reply;
      if (reply)
      {
        xpc_dictionary_set_value(reply, "tekA", v11);
        xpc_dictionary_set_uint64(v13, "invKC", -[ENFileSessionDaemon invalidKeyCount](v9, "invalidKeyCount"));
        -[ENXPCServiceConnection xpcSendMessage:](self, "xpcSendMessage:", v13);
        dispatchQueue = self->_dispatchQueue;
        block[0] = v5;
        block[1] = 3221225472;
        block[2] = __53__ENXPCServiceConnection_xpcFileSessionReadTEKBatch___block_invoke_2;
        block[3] = &unk_1E87D9C28;
        block[4] = v9;
        dispatch_async(dispatchQueue, block);
      }
      else if (gLogCategory__ENXPCServiceConnection <= 90
             && (gLogCategory__ENXPCServiceConnection != -1 || _LogCategory_Initialize()))
      {
        LogPrintF_safe();
      }
    }
    else
    {
      v16 = v26;
      v17 = (void *)v26[5];
      if (v17)
      {
        v18 = v17;
        v13 = (void *)v16[5];
        v16[5] = (uint64_t)v18;
      }
      else
      {
        ENErrorF();
        v19 = objc_claimAutoreleasedReturnValue();
        v13 = (void *)v26[5];
        v26[5] = v19;
      }
    }

  }
  else
  {
    ENErrorF();
    v15 = objc_claimAutoreleasedReturnValue();
    v11 = (void *)v26[5];
    v26[5] = v15;
  }

  v7[2](v7);
  _Block_object_dispose(&v25, 8);

}

uint64_t __53__ENXPCServiceConnection_xpcFileSessionReadTEKBatch___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t result;
  int v4;
  void *v5;

  v2 = *(_QWORD *)(a1 + 48);
  result = *(_QWORD *)(*(_QWORD *)(v2 + 8) + 40);
  if (result)
  {
    if (gLogCategory__ENXPCServiceConnection <= 90)
    {
      if (gLogCategory__ENXPCServiceConnection != -1 || (v4 = _LogCategory_Initialize(), v2 = *(_QWORD *)(a1 + 48), v4))
      {
        CUPrintNSError();
        v5 = (void *)objc_claimAutoreleasedReturnValue();
        LogPrintF_safe();

        v2 = *(_QWORD *)(a1 + 48);
      }
    }
    return objc_msgSend(*(id *)(a1 + 32), "xpcSendReplyError:request:", *(_QWORD *)(*(_QWORD *)(v2 + 8) + 40), *(_QWORD *)(a1 + 40));
  }
  return result;
}

uint64_t __53__ENXPCServiceConnection_xpcFileSessionReadTEKBatch___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "prepareNextTEKBatchIfNecessary");
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_xpcConnection, 0);
  objc_storeStrong((id *)&self->_serviceListener, 0);
  objc_storeStrong((id *)&self->_fileSession, 0);
  objc_storeStrong((id *)&self->_dispatchQueue, 0);
}

@end
