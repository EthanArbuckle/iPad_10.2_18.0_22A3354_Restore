@implementation MRPlayerClientParticipantsUpdateMessage

- (MRPlayerClientParticipantsUpdateMessage)initWithPlayerPath:(id)a3 participants:(id)a4
{
  id v6;
  id v7;
  MRPlayerClientParticipantsUpdateMessage *v8;
  _MRPlayerClientParticipantsUpdateMessageProtobuf *v9;
  void *v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  objc_super v22;
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v22.receiver = self;
  v22.super_class = (Class)MRPlayerClientParticipantsUpdateMessage;
  v8 = -[MRProtocolMessage init](&v22, sel_init);
  if (v8)
  {
    v9 = objc_alloc_init(_MRPlayerClientParticipantsUpdateMessageProtobuf);
    objc_msgSend(v6, "protobuf");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[_MRPlayerClientParticipantsUpdateMessageProtobuf setPlayerPath:](v9, "setPlayerPath:", v10);

    v20 = 0u;
    v21 = 0u;
    v18 = 0u;
    v19 = 0u;
    v11 = v7;
    v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v18, v23, 16);
    if (v12)
    {
      v13 = v12;
      v14 = *(_QWORD *)v19;
      do
      {
        v15 = 0;
        do
        {
          if (*(_QWORD *)v19 != v14)
            objc_enumerationMutation(v11);
          objc_msgSend(*(id *)(*((_QWORD *)&v18 + 1) + 8 * v15), "protobufWithEncoding:", 0, (_QWORD)v18);
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          -[_MRPlayerClientParticipantsUpdateMessageProtobuf addParticipants:](v9, "addParticipants:", v16);

          ++v15;
        }
        while (v13 != v15);
        v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v18, v23, 16);
      }
      while (v13);
    }

    -[MRProtocolMessage setUnderlyingCodableMessage:](v8, "setUnderlyingCodableMessage:", v9);
  }

  return v8;
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

- (NSArray)participants
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  MRPlaybackQueueParticipant *v13;
  void *v14;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v3 = objc_alloc(MEMORY[0x1E0C99DE8]);
  -[MRProtocolMessage underlyingCodableMessage](self, "underlyingCodableMessage");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "participants");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v3, "initWithCapacity:", objc_msgSend(v5, "count"));

  v18 = 0u;
  v19 = 0u;
  v16 = 0u;
  v17 = 0u;
  -[MRProtocolMessage underlyingCodableMessage](self, "underlyingCodableMessage", 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "participants");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v17;
    do
    {
      v12 = 0;
      do
      {
        if (*(_QWORD *)v17 != v11)
          objc_enumerationMutation(v8);
        v13 = -[MRPlaybackQueueParticipant initWithProtobuf:]([MRPlaybackQueueParticipant alloc], "initWithProtobuf:", *(_QWORD *)(*((_QWORD *)&v16 + 1) + 8 * v12));
        objc_msgSend(v6, "addObject:", v13);

        ++v12;
      }
      while (v10 != v12);
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    }
    while (v10);
  }

  v14 = (void *)objc_msgSend(v6, "copy");
  return (NSArray *)v14;
}

- (unint64_t)type
{
  return 131;
}

@end
