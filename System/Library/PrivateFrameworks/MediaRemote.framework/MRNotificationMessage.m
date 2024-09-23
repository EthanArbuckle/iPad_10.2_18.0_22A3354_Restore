@implementation MRNotificationMessage

- (MRNotificationMessage)initWithNotification:(id)a3
{
  id v4;
  MRNotificationMessage *v5;
  _MRNotificationMessageProtobuf *v6;
  void *v7;
  void *v8;
  void *v9;
  const char *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  objc_super v16;

  v4 = a3;
  v16.receiver = self;
  v16.super_class = (Class)MRNotificationMessage;
  v5 = -[MRProtocolMessage init](&v16, sel_init);
  if (v5)
  {
    v6 = objc_alloc_init(_MRNotificationMessageProtobuf);
    objc_msgSend(v4, "name");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[_MRNotificationMessageProtobuf addNotification:](v6, "addNotification:", v7);

    objc_msgSend(v4, "userInfo");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = (void *)objc_msgSend(v8, "mutableCopy");

    MRGetPlayerPathFromUserInfo(v9, v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (v11)
    {
      objc_msgSend(v9, "removeObjectForKey:", CFSTR("kMRNowPlayingPlayerPathUserInfoKey"));
      objc_msgSend(v9, "removeObjectForKey:", CFSTR("kMRNowPlayingPlayerUserInfoKey"));
      objc_msgSend(v9, "removeObjectForKey:", CFSTR("kMRNowPlayingClientUserInfoKey"));
      objc_msgSend(v9, "removeObjectForKey:", CFSTR("kMRMediaRemoteOriginUserInfoKey"));
      objc_msgSend(v11, "protobuf");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      -[_MRNotificationMessageProtobuf addPlayerPath:](v6, "addPlayerPath:", v12);

    }
    if (objc_msgSend(v9, "count"))
    {
      MRCreateEncodedUserInfo(v9);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      MSVArchivedDataWithRootObject();
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      -[_MRNotificationMessageProtobuf addUserInfo:](v6, "addUserInfo:", v14);

    }
    -[MRProtocolMessage setUnderlyingCodableMessage:](v5, "setUnderlyingCodableMessage:", v6);

  }
  return v5;
}

- (NSString)notification
{
  void *v2;
  void *v3;
  void *v4;

  -[MRProtocolMessage underlyingCodableMessage](self, "underlyingCodableMessage");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "notifications");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "firstObject");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v4;
}

- (NSDictionary)userInfo
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  const __CFString *v13;
  _QWORD v14[2];

  v14[1] = *MEMORY[0x1E0C80C00];
  -[MRProtocolMessage underlyingCodableMessage](self, "underlyingCodableMessage");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "userInfos");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "firstObject");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    MSVPropertyListDataClasses();
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    MSVUnarchivedObjectOfClasses();
    v7 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v7 = 0;
  }
  -[MRNotificationMessage playerPath](self, "playerPath");
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = (void *)v8;
  if (v8)
  {
    if (v7)
    {
      v10 = (void *)objc_msgSend(v7, "mutableCopy");
      objc_msgSend(v10, "setObject:forKey:", v9, CFSTR("kMRNowPlayingPlayerPathUserInfoKey"));

      v7 = v10;
    }
    else
    {
      v13 = CFSTR("kMRNowPlayingPlayerPathUserInfoKey");
      v14[0] = v8;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v14, &v13, 1);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
    }
  }
  MRCreateDecodedUserInfo(v7);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSDictionary *)v11;
}

- (MRPlayerPath)playerPath
{
  MRPlayerPath *v3;
  void *v4;
  void *v5;
  void *v6;
  MRPlayerPath *v7;

  v3 = [MRPlayerPath alloc];
  -[MRProtocolMessage underlyingCodableMessage](self, "underlyingCodableMessage");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "playerPaths");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "firstObject");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[MRPlayerPath initWithProtobuf:](v3, "initWithProtobuf:", v6);

  return v7;
}

- (unint64_t)type
{
  return 11;
}

@end
