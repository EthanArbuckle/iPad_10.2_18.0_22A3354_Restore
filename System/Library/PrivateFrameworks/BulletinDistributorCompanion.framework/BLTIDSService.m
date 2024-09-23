@implementation BLTIDSService

- (BLTIDSService)initWithService:(id)a3
{
  id v4;
  BLTIDSService *v5;
  uint64_t v6;
  IDSService *service;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)BLTIDSService;
  v5 = -[BLTIDSService init](&v9, sel_init);
  if (v5)
  {
    v6 = objc_msgSend(objc_alloc(MEMORY[0x24BE4FCB8]), "initWithService:", v4);
    service = v5->_service;
    v5->_service = (IDSService *)v6;

  }
  return v5;
}

- (BLTAbstractIDSDevice)defaultPairedDevice
{
  id v2;
  BLTIDSDevice *v3;
  uint64_t v4;
  BLTIDSDevice *i;
  void *v6;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  _BYTE v12[128];
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  -[IDSService devices](self->_service, "devices");
  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v2 = (id)objc_claimAutoreleasedReturnValue();
  v3 = (BLTIDSDevice *)objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
  if (v3)
  {
    v4 = *(_QWORD *)v9;
    while (2)
    {
      for (i = 0; i != v3; i = (BLTIDSDevice *)((char *)i + 1))
      {
        if (*(_QWORD *)v9 != v4)
          objc_enumerationMutation(v2);
        v6 = *(void **)(*((_QWORD *)&v8 + 1) + 8 * (_QWORD)i);
        if (objc_msgSend(v6, "isDefaultPairedDevice", (_QWORD)v8))
        {
          v3 = -[BLTIDSDevice initWithIDSDevice:]([BLTIDSDevice alloc], "initWithIDSDevice:", v6);
          goto LABEL_11;
        }
      }
      v3 = (BLTIDSDevice *)objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
      if (v3)
        continue;
      break;
    }
  }
LABEL_11:

  return (BLTAbstractIDSDevice *)v3;
}

- (void)addDelegate:(id)a3 queue:(id)a4
{
  -[IDSService addDelegate:queue:](self->_service, "addDelegate:queue:", a3, a4);
}

- (void)removeDelegate:(id)a3
{
  -[IDSService removeDelegate:](self->_service, "removeDelegate:", a3);
}

- (void)setProtobufAction:(SEL)a3 forIncomingRequestsOfType:(unsigned __int16)a4
{
  -[IDSService setProtobufAction:forIncomingRequestsOfType:](self->_service, "setProtobufAction:forIncomingRequestsOfType:", a3, a4);
}

- (void)setProtobufAction:(SEL)a3 forIncomingResponsesOfType:(unsigned __int16)a4
{
  -[IDSService setProtobufAction:forIncomingResponsesOfType:](self->_service, "setProtobufAction:forIncomingResponsesOfType:", a3, a4);
}

- (BOOL)sendProtobuf:(id)a3 toDestinations:(id)a4 priority:(int64_t)a5 options:(id)a6 identifier:(id *)a7 error:(id *)a8
{
  return -[IDSService sendProtobuf:toDestinations:priority:options:identifier:error:](self->_service, "sendProtobuf:toDestinations:priority:options:identifier:error:", a3, a4, a5, a6, a7, a8);
}

- (BOOL)sendResourceAtURL:(id)a3 metadata:(id)a4 toDestinations:(id)a5 priority:(int64_t)a6 options:(id)a7 identifier:(id *)a8 error:(id *)a9
{
  return -[IDSService sendResourceAtURL:metadata:toDestinations:priority:options:identifier:error:](self->_service, "sendResourceAtURL:metadata:toDestinations:priority:options:identifier:error:", a3, a4, a5, a6, a7, a8);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_service, 0);
}

@end
