@implementation MRPlayerClientPropertiesMessage

- (MRPlayerClientPropertiesMessage)initWithPlayerPath:(id)a3 lastPlayingDate:(id)a4
{
  id v6;
  id v7;
  MRPlayerClientPropertiesMessage *v8;
  void *v9;
  void *v10;
  objc_super v12;

  v6 = a3;
  v7 = a4;
  v12.receiver = self;
  v12.super_class = (Class)MRPlayerClientPropertiesMessage;
  v8 = -[MRProtocolMessage init](&v12, sel_init);
  if (v8)
  {
    v9 = (void *)objc_opt_new();
    objc_msgSend(v7, "timeIntervalSinceReferenceDate");
    objc_msgSend(v9, "setLastPlayingTimestamp:");
    objc_msgSend(v6, "protobuf");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setPlayerPath:", v10);

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

- (unint64_t)type
{
  return 104;
}

@end
