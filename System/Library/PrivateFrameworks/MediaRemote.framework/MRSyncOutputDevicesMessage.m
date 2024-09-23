@implementation MRSyncOutputDevicesMessage

- (MRSyncOutputDevicesMessage)initWithOutputDevices:(id)a3
{
  id v5;
  MRSyncOutputDevicesMessage *v6;
  MRSyncOutputDevicesMessage *v7;
  _MRUpdateOutputDevicesMessageProtobuf *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t j;
  void *v20;
  MRSyncOutputDevicesMessage *v22;
  id v23;
  id obj;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  objc_super v33;
  _BYTE v34[128];
  _BYTE v35[128];
  uint64_t v36;

  v36 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v33.receiver = self;
  v33.super_class = (Class)MRSyncOutputDevicesMessage;
  v6 = -[MRProtocolMessage init](&v33, sel_init);
  v7 = v6;
  if (v6)
  {
    v22 = v6;
    objc_storeStrong((id *)&v6->_outputDevices, a3);
    v8 = objc_alloc_init(_MRUpdateOutputDevicesMessageProtobuf);
    v29 = 0u;
    v30 = 0u;
    v31 = 0u;
    v32 = 0u;
    v23 = v5;
    obj = v5;
    v9 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v29, v35, 16);
    if (v9)
    {
      v10 = v9;
      v11 = *(_QWORD *)v30;
      do
      {
        for (i = 0; i != v10; ++i)
        {
          if (*(_QWORD *)v30 != v11)
            objc_enumerationMutation(obj);
          v13 = *(void **)(*((_QWORD *)&v29 + 1) + 8 * i);
          objc_msgSend(v13, "descriptor");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          if (v14)
          {
            -[_MRUpdateOutputDevicesMessageProtobuf addClusterAwareOutputDevices:](v8, "addClusterAwareOutputDevices:", v14);
            if (objc_msgSend(v13, "deviceSubtype") == 15)
            {
              v27 = 0u;
              v28 = 0u;
              v25 = 0u;
              v26 = 0u;
              objc_msgSend(v13, "clusterComposition");
              v15 = (void *)objc_claimAutoreleasedReturnValue();
              v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v25, v34, 16);
              if (v16)
              {
                v17 = v16;
                v18 = *(_QWORD *)v26;
                do
                {
                  for (j = 0; j != v17; ++j)
                  {
                    if (*(_QWORD *)v26 != v18)
                      objc_enumerationMutation(v15);
                    objc_msgSend(*(id *)(*((_QWORD *)&v25 + 1) + 8 * j), "descriptor");
                    v20 = (void *)objc_claimAutoreleasedReturnValue();
                    -[_MRUpdateOutputDevicesMessageProtobuf addOutputDevices:](v8, "addOutputDevices:", v20);

                  }
                  v17 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v25, v34, 16);
                }
                while (v17);
              }

            }
            else
            {
              -[_MRUpdateOutputDevicesMessageProtobuf addOutputDevices:](v8, "addOutputDevices:", v14);
            }
          }

        }
        v10 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v29, v35, 16);
      }
      while (v10);
    }

    v7 = v22;
    -[MRProtocolMessage setUnderlyingCodableMessage:](v22, "setUnderlyingCodableMessage:", v8);

    v5 = v23;
  }

  return v7;
}

- (NSArray)outputDevices
{
  NSArray *outputDevices;
  void *v4;
  int v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  NSArray *v12;
  NSArray *v13;

  outputDevices = self->_outputDevices;
  if (!outputDevices)
  {
    +[MRUserSettings currentSettings](MRUserSettings, "currentSettings");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "useClusterDevices");

    -[MRProtocolMessage underlyingCodableMessage](self, "underlyingCodableMessage");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v6;
    if (v5)
    {
      objc_msgSend(v6, "clusterAwareOutputDevices");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = v8;
      if (v8)
      {
        v10 = v8;
      }
      else
      {
        -[MRProtocolMessage underlyingCodableMessage](self, "underlyingCodableMessage");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "outputDevices");
        v10 = (id)objc_claimAutoreleasedReturnValue();

      }
    }
    else
    {
      objc_msgSend(v6, "outputDevices");
      v10 = (id)objc_claimAutoreleasedReturnValue();
    }

    objc_msgSend(v10, "mr_map:", &__block_literal_global_3);
    v12 = (NSArray *)objc_claimAutoreleasedReturnValue();
    v13 = self->_outputDevices;
    self->_outputDevices = v12;

    outputDevices = self->_outputDevices;
  }
  return outputDevices;
}

MRAVDistantOutputDevice *__43__MRSyncOutputDevicesMessage_outputDevices__block_invoke(uint64_t a1, void *a2)
{
  id v2;
  MRAVDistantOutputDevice *v3;

  v2 = a2;
  v3 = -[MRAVDistantOutputDevice initWithDescriptor:]([MRAVDistantOutputDevice alloc], "initWithDescriptor:", v2);

  return v3;
}

- (unint64_t)type
{
  return 65;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_outputDevices, 0);
}

@end
