@implementation _GCIPCRemoteIncomingConnection

- (_GCIPCRemoteIncomingConnection)initWithConnection:(id)a3 fromProcess:(id)a4
{
  id v7;
  id v8;
  void *v9;
  _GCIPCRemoteIncomingConnection *v13;
  _GCIPCRemoteIncomingConnection *v14;
  void *v16;
  objc_super v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;

  v7 = a3;
  v8 = a4;
  v9 = v8;
  if (v7)
  {
    objc_msgSend(v7, "auditToken");
    if (v9)
    {
LABEL_3:
      objc_msgSend(v9, "auditToken");
      goto LABEL_6;
    }
  }
  else
  {
    v20 = 0u;
    v21 = 0u;
    if (v8)
      goto LABEL_3;
  }
  v18 = 0u;
  v19 = 0u;
LABEL_6:
  if ((_QWORD)v20 != (_QWORD)v18
    || *((_QWORD *)&v20 + 1) != *((_QWORD *)&v18 + 1)
    || (_QWORD)v21 != (_QWORD)v19
    || *((_QWORD *)&v21 + 1) != *((_QWORD *)&v19 + 1))
  {
    unk_254DEC4F8(&off_254DEC660, "currentHandler");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("GCIPCIncomingConnection+GameController.m"), 23, CFSTR("Connection %@ is not from process %@."), v7, v9);

  }
  v17.receiver = self;
  v17.super_class = (Class)_GCIPCRemoteIncomingConnection;
  v13 = -[GCIPCRemoteIncomingConnection initWithConnection:](&v17, sel_initWithConnection_, v7);
  v14 = v13;
  if (v13)
    objc_storeWeak((id *)&v13->_process, v9);

  return v14;
}

- (_GCIPCRemoteIncomingConnection)initWithConnection:(id)a3
{
  -[_GCIPCRemoteIncomingConnection doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2);

  return 0;
}

- (_GCIPCProcess)process
{
  return (_GCIPCProcess *)objc_loadWeakRetained((id *)&self->_process);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_process);
}

@end
