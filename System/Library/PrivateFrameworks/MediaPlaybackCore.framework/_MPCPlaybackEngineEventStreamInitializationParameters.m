@implementation _MPCPlaybackEngineEventStreamInitializationParameters

- (_MPCPlaybackEngineEventStreamInitializationParameters)initWithPlaybackEngineParameters:(id)a3 engineID:(id)a4
{
  id v6;
  id v7;
  _MPCPlaybackEngineEventStreamInitializationParameters *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t quot;
  int v13;
  char *v14;
  unint64_t v15;
  const UInt8 *v16;
  CFStringRef v17;
  NSString *originID;
  void *v19;
  uint64_t v20;
  NSString *playerID;
  uint64_t v22;
  NSString *engineID;
  objc_super v25;
  uint64_t v26;

  v26 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  v25.receiver = self;
  v25.super_class = (Class)_MPCPlaybackEngineEventStreamInitializationParameters;
  v8 = -[_MPCPlaybackEngineEventStreamInitializationParameters init](&v25, sel_init);
  if (v8)
  {
    objc_msgSend(v6, "remoteCommandCenter");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "playerPath");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "origin");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    quot = objc_msgSend(v11, "identifier");
    v13 = quot;
    v14 = (char *)&v26 + 1;
    do
    {
      quot = div(quot, 10).quot;
      v15 = HIDWORD(quot);
      if (quot < 0)
        LODWORD(v15) = -HIDWORD(quot);
      *(v14 - 2) = v15 + 48;
      v16 = (const UInt8 *)(v14 - 2);
      --v14;
    }
    while ((_DWORD)quot);
    if (v13 < 0)
    {
      *(v14 - 2) = 45;
      v16 = (const UInt8 *)(v14 - 2);
    }
    v17 = CFStringCreateWithBytes(0, v16, (char *)&v26 - (char *)v16, 0x8000100u, 0);
    originID = v8->_originID;
    v8->_originID = &v17->isa;

    objc_msgSend(v6, "playerID");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = objc_msgSend(v19, "copy");
    playerID = v8->_playerID;
    v8->_playerID = (NSString *)v20;

    v22 = objc_msgSend(v7, "copy");
    engineID = v8->_engineID;
    v8->_engineID = (NSString *)v22;

  }
  return v8;
}

- (NSString)engineID
{
  return self->_engineID;
}

- (NSString)playerID
{
  return self->_playerID;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_engineID, 0);
  objc_storeStrong((id *)&self->_playerID, 0);
  objc_storeStrong((id *)&self->_originID, 0);
}

- (NSString)originID
{
  return self->_originID;
}

@end
