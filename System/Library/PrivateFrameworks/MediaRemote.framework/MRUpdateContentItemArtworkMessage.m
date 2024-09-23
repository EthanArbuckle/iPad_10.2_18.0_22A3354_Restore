@implementation MRUpdateContentItemArtworkMessage

- (MRUpdateContentItemArtworkMessage)initWithContentItems:(id)a3 forPlayerPath:(id)a4 encoding:(int64_t)a5
{
  id v8;
  id v9;
  MRUpdateContentItemArtworkMessage *v10;
  _MRUpdateContentItemArtworkMessageProtobuf *v11;
  void *v12;
  void *v13;
  id v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  objc_super v25;
  _BYTE v26[128];
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v25.receiver = self;
  v25.super_class = (Class)MRUpdateContentItemArtworkMessage;
  v10 = -[MRProtocolMessage init](&v25, sel_init);
  if (v10)
  {
    v11 = objc_alloc_init(_MRUpdateContentItemArtworkMessageProtobuf);
    objc_msgSend(v9, "skeleton");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "protobuf");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[_MRUpdateContentItemArtworkMessageProtobuf setPlayerPath:](v11, "setPlayerPath:", v13);

    v23 = 0u;
    v24 = 0u;
    v21 = 0u;
    v22 = 0u;
    v14 = v8;
    v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v21, v26, 16);
    if (v15)
    {
      v16 = v15;
      v17 = *(_QWORD *)v22;
      do
      {
        v18 = 0;
        do
        {
          if (*(_QWORD *)v22 != v17)
            objc_enumerationMutation(v14);
          objc_msgSend(*(id *)(*((_QWORD *)&v21 + 1) + 8 * v18), "protobufWithEncoding:", a5, (_QWORD)v21);
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          -[_MRUpdateContentItemArtworkMessageProtobuf addContentItems:](v11, "addContentItems:", v19);

          ++v18;
        }
        while (v16 != v18);
        v16 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v21, v26, 16);
      }
      while (v16);
    }

    -[MRProtocolMessage setUnderlyingCodableMessage:](v10, "setUnderlyingCodableMessage:", v11);
  }

  return v10;
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

- (NSArray)contentItems
{
  void *v2;
  void *v3;
  void *v4;

  -[MRProtocolMessage underlyingCodableMessage](self, "underlyingCodableMessage");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "contentItems");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "mr_map:", &__block_literal_global_79);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSArray *)v4;
}

MRContentItem *__49__MRUpdateContentItemArtworkMessage_contentItems__block_invoke(uint64_t a1, void *a2)
{
  id v2;
  MRContentItem *v3;

  v2 = a2;
  v3 = -[MRContentItem initWithProtobuf:]([MRContentItem alloc], "initWithProtobuf:", v2);

  return v3;
}

- (unint64_t)type
{
  return 57;
}

@end
