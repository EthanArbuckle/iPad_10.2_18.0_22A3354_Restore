@implementation MRGetVoiceInputDevicesResponseMessage

- (MRGetVoiceInputDevicesResponseMessage)initWithDeviceIDs:(id)a3 errorCode:(int64_t)a4
{
  id v6;
  MRGetVoiceInputDevicesResponseMessage *v7;
  _MRGetVoiceInputDevicesResponseMessageProtobuf *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  objc_super v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v19.receiver = self;
  v19.super_class = (Class)MRGetVoiceInputDevicesResponseMessage;
  v7 = -[MRProtocolMessage init](&v19, sel_init);
  if (v7)
  {
    v8 = objc_alloc_init(_MRGetVoiceInputDevicesResponseMessageProtobuf);
    v15 = 0u;
    v16 = 0u;
    v17 = 0u;
    v18 = 0u;
    v9 = v6;
    v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v15, v20, 16);
    if (v10)
    {
      v11 = v10;
      v12 = *(_QWORD *)v16;
      do
      {
        v13 = 0;
        do
        {
          if (*(_QWORD *)v16 != v12)
            objc_enumerationMutation(v9);
          -[_MRGetVoiceInputDevicesResponseMessageProtobuf addDeviceIDs:](v8, "addDeviceIDs:", objc_msgSend(*(id *)(*((_QWORD *)&v15 + 1) + 8 * v13++), "unsignedIntValue", (_QWORD)v15));
        }
        while (v11 != v13);
        v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v15, v20, 16);
      }
      while (v11);
    }

    -[_MRGetVoiceInputDevicesResponseMessageProtobuf setErrorCode:](v8, "setErrorCode:", a4);
    -[MRProtocolMessage setUnderlyingCodableMessage:](v7, "setUnderlyingCodableMessage:", v8);

  }
  return v7;
}

- (unint64_t)type
{
  return 27;
}

- (NSArray)deviceIDs
{
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  unsigned int v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  unint64_t v12;

  v3 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  -[MRProtocolMessage underlyingCodableMessage](self, "underlyingCodableMessage");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "deviceIDsCount");

  if (v5)
  {
    v6 = 0;
    v7 = 1;
    do
    {
      v8 = (void *)MEMORY[0x1E0CB37E8];
      -[MRProtocolMessage underlyingCodableMessage](self, "underlyingCodableMessage");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "numberWithUnsignedInt:", objc_msgSend(v9, "deviceIDsAtIndex:", v6));
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "addObject:", v10);

      v6 = v7;
      -[MRProtocolMessage underlyingCodableMessage](self, "underlyingCodableMessage");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = objc_msgSend(v11, "deviceIDsCount");

    }
    while (v12 > v7++);
  }
  return (NSArray *)v3;
}

- (int64_t)errorCode
{
  void *v2;
  int64_t v3;

  -[MRProtocolMessage underlyingCodableMessage](self, "underlyingCodableMessage");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "errorCode");

  return v3;
}

@end
