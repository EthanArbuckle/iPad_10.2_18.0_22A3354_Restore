@implementation MRTransactionMessage

- (MRTransactionMessage)initWithName:(unint64_t)a3 packets:(id)a4 playerPath:(id)a5
{
  id v8;
  id v9;
  MRTransactionMessage *v10;
  _MRTransactionMessageProtobuf *v11;
  _MRTransactionPacketsProtobuf *v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *context;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  objc_super v26;
  _BYTE v27[128];
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v8 = a4;
  v9 = a5;
  v26.receiver = self;
  v26.super_class = (Class)MRTransactionMessage;
  v10 = -[MRProtocolMessage init](&v26, sel_init);
  if (v10)
  {
    v11 = objc_alloc_init(_MRTransactionMessageProtobuf);
    context = (void *)MEMORY[0x194036A64](-[_MRTransactionMessageProtobuf setName:](v11, "setName:", a3));
    v12 = objc_alloc_init(_MRTransactionPacketsProtobuf);
    v22 = 0u;
    v23 = 0u;
    v24 = 0u;
    v25 = 0u;
    v13 = v8;
    v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v22, v27, 16);
    if (v14)
    {
      v15 = v14;
      v16 = *(_QWORD *)v23;
      do
      {
        v17 = 0;
        do
        {
          if (*(_QWORD *)v23 != v16)
            objc_enumerationMutation(v13);
          objc_msgSend(*(id *)(*((_QWORD *)&v22 + 1) + 8 * v17), "protobuf");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          -[_MRTransactionPacketsProtobuf addPackets:](v12, "addPackets:", v18);

          ++v17;
        }
        while (v15 != v17);
        v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v22, v27, 16);
      }
      while (v15);
    }

    -[_MRTransactionMessageProtobuf setPackets:](v11, "setPackets:", v12);
    objc_autoreleasePoolPop(context);
    objc_msgSend(v9, "protobuf");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    -[_MRTransactionMessageProtobuf setPlayerPath:](v11, "setPlayerPath:", v19);

    -[MRProtocolMessage setUnderlyingCodableMessage:](v10, "setUnderlyingCodableMessage:", v11);
  }

  return v10;
}

- (MRTransactionMessage)initWithPlaybackQueue:(id)a3 forPlayerPath:(id)a4
{
  id v6;
  void *v7;
  MRTransactionMessage *v8;

  v6 = a4;
  objc_msgSend(a3, "contentItems");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = -[MRTransactionMessage initWithContentItems:forPlayerPath:](self, "initWithContentItems:forPlayerPath:", v7, v6);

  return v8;
}

- (MRTransactionMessage)initWithContentItems:(id)a3 forPlayerPath:(id)a4
{
  id v6;
  id v7;
  MRTransactionMessage *v8;
  MRTransactionMessage *v9;
  _MRTransactionMessageProtobuf *v10;
  _MRTransactionPacketsProtobuf *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t i;
  void *v17;
  void *ExternalRepresentation;
  _MRTransactionKeyProtobuf *v19;
  MRTransactionPacket *v20;
  void *v21;
  void *v22;
  void *v23;
  MRTransactionMessage *v25;
  void *v26;
  id v27;
  id obj;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  objc_super v33;
  _BYTE v34[128];
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v33.receiver = self;
  v33.super_class = (Class)MRTransactionMessage;
  v8 = -[MRProtocolMessage init](&v33, sel_init);
  v9 = v8;
  if (v8)
  {
    v25 = v8;
    v26 = v7;
    v10 = objc_alloc_init(_MRTransactionMessageProtobuf);
    v11 = objc_alloc_init(_MRTransactionPacketsProtobuf);
    -[_MRTransactionMessageProtobuf setPackets:](v10, "setPackets:", v11);

    v31 = 0u;
    v32 = 0u;
    v29 = 0u;
    v30 = 0u;
    v27 = v6;
    obj = v6;
    v12 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v29, v34, 16);
    if (v12)
    {
      v13 = v12;
      v14 = *(_QWORD *)v30;
      v15 = *MEMORY[0x1E0C9AE00];
      do
      {
        for (i = 0; i != v13; ++i)
        {
          if (*(_QWORD *)v30 != v14)
            objc_enumerationMutation(obj);
          v17 = *(void **)(*((_QWORD *)&v29 + 1) + 8 * i);
          ExternalRepresentation = (void *)MRContentItemCreateExternalRepresentation(v15, v17);
          v19 = objc_alloc_init(_MRTransactionKeyProtobuf);
          -[_MRTransactionKeyProtobuf setIdentifier:](v19, "setIdentifier:", MRContentItemGetAncestorIdentifier(v17));
          v20 = -[MRTransactionPacket initWithData:forKey:]([MRTransactionPacket alloc], "initWithData:forKey:", ExternalRepresentation, v19);
          -[_MRTransactionMessageProtobuf packets](v10, "packets");
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          -[MRTransactionPacket protobuf](v20, "protobuf");
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v21, "addPackets:", v22);

        }
        v13 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v29, v34, 16);
      }
      while (v13);
    }

    -[_MRTransactionMessageProtobuf setName:](v10, "setName:", 2);
    v7 = v26;
    objc_msgSend(v26, "protobuf");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    -[_MRTransactionMessageProtobuf setPlayerPath:](v10, "setPlayerPath:", v23);

    v9 = v25;
    -[MRProtocolMessage setUnderlyingCodableMessage:](v25, "setUnderlyingCodableMessage:", v10);

    v6 = v27;
  }

  return v9;
}

- (NSArray)packets
{
  NSMutableArray *packets;
  NSMutableArray *v4;
  NSMutableArray *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  MRTransactionPacket *v15;
  MRTransactionPacket *v16;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  packets = self->_packets;
  if (!packets)
  {
    v4 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v5 = self->_packets;
    self->_packets = v4;

    -[MRProtocolMessage underlyingCodableMessage](self, "underlyingCodableMessage");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "packets");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "packets");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    v20 = 0u;
    v21 = 0u;
    v18 = 0u;
    v19 = 0u;
    v9 = v8;
    v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
    if (v10)
    {
      v11 = v10;
      v12 = *(_QWORD *)v19;
      do
      {
        v13 = 0;
        do
        {
          if (*(_QWORD *)v19 != v12)
            objc_enumerationMutation(v9);
          v14 = *(_QWORD *)(*((_QWORD *)&v18 + 1) + 8 * v13);
          v15 = [MRTransactionPacket alloc];
          v16 = -[MRTransactionPacket initWithProtobuf:](v15, "initWithProtobuf:", v14, (_QWORD)v18);
          -[NSMutableArray addObject:](self->_packets, "addObject:", v16);

          ++v13;
        }
        while (v11 != v13);
        v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
      }
      while (v11);
    }

    packets = self->_packets;
  }
  return (NSArray *)packets;
}

- (MRPlayerPath)playerPath
{
  MRPlayerPath *v3;
  void *v4;
  void *v5;
  MRPlayerPath *v6;

  v3 = [MRPlayerPath alloc];
  -[MRProtocolMessage underlyingCodableMessage](self, "underlyingCodableMessage");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "playerPath");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[MRPlayerPath initWithProtobuf:](v3, "initWithProtobuf:", v5);

  return v6;
}

- (unint64_t)name
{
  void *v2;
  unint64_t v3;

  -[MRProtocolMessage underlyingCodableMessage](self, "underlyingCodableMessage");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "name");

  return v3;
}

- (unint64_t)type
{
  return 33;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_packets, 0);
}

@end
