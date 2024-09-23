@implementation MROriginClientPropertiesMessage

- (MROriginClientPropertiesMessage)initWithLastPlayingDate:(id)a3 devicePlaybackSessionID:(id)a4
{
  id v6;
  id v7;
  MROriginClientPropertiesMessage *v8;
  void *v9;
  objc_super v11;

  v6 = a3;
  v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)MROriginClientPropertiesMessage;
  v8 = -[MRProtocolMessage init](&v11, sel_init);
  if (v8)
  {
    v9 = (void *)objc_opt_new();
    objc_msgSend(v6, "timeIntervalSinceReferenceDate");
    objc_msgSend(v9, "setLastPlayingTimestamp:");
    objc_msgSend(v9, "setDevicePlaybackSessionID:", v7);
    -[MRProtocolMessage setUnderlyingCodableMessage:](v8, "setUnderlyingCodableMessage:", v9);

  }
  return v8;
}

- (NSDate)lastPlayingDate
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)MEMORY[0x1E0C99D68];
  -[MRProtocolMessage underlyingCodableMessage](self, "underlyingCodableMessage");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "lastPlayingTimestamp");
  objc_msgSend(v2, "dateWithTimeIntervalSinceReferenceDate:");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSDate *)v4;
}

- (NSString)devicePlaybackSessionID
{
  void *v2;
  void *v3;

  -[MRProtocolMessage underlyingCodableMessage](self, "underlyingCodableMessage");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "devicePlaybackSessionID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (unint64_t)type
{
  return 105;
}

@end
