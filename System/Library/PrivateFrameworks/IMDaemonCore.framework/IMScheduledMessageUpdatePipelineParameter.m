@implementation IMScheduledMessageUpdatePipelineParameter

- (IMScheduledMessageUpdatePipelineParameter)initWithDefusedMessage:(id)a3 idsTrustedData:(id)a4
{
  id v6;
  id v7;
  IMScheduledMessageUpdatePipelineParameter *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  NSString *GUID;
  uint64_t v13;
  NSString *fromIdentifier;
  uint64_t v15;
  NSString *toIdentifier;
  uint64_t v17;
  NSNumber *scheduleState;
  objc_super v20;

  v6 = a3;
  v7 = a4;
  v20.receiver = self;
  v20.super_class = (Class)IMScheduledMessageUpdatePipelineParameter;
  v8 = -[IMScheduledMessageUpdatePipelineParameter init](&v20, sel_init);
  if (v8)
  {
    objc_msgSend(v6, "metadata");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "messageGUID");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "UUIDString");
    v11 = objc_claimAutoreleasedReturnValue();
    GUID = v8->_GUID;
    v8->_GUID = (NSString *)v11;

    v8->_isFromMe = objc_msgSend(v7, "isFromMe");
    objc_msgSend(v7, "fromIdentifier");
    v13 = objc_claimAutoreleasedReturnValue();
    fromIdentifier = v8->_fromIdentifier;
    v8->_fromIdentifier = (NSString *)v13;

    objc_msgSend(v7, "toIdentifier");
    v15 = objc_claimAutoreleasedReturnValue();
    toIdentifier = v8->_toIdentifier;
    v8->_toIdentifier = (NSString *)v15;

    +[IMScheduledMessageUpdatePipelineParameter scheduleStateWithBlastDoorMessage:](IMScheduledMessageUpdatePipelineParameter, "scheduleStateWithBlastDoorMessage:", v6);
    v17 = objc_claimAutoreleasedReturnValue();
    scheduleState = v8->_scheduleState;
    v8->_scheduleState = (NSNumber *)v17;

  }
  return v8;
}

+ (id)scheduleStateWithBlastDoorMessage:(id)a3
{
  id v3;
  void *v4;

  v3 = a3;
  if (objc_msgSend(v3, "scheduleState") == -1)
  {
    v4 = 0;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(v3, "scheduleState"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v4;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = (void *)MEMORY[0x1E0CB3940];
  -[IMScheduledMessageUpdatePipelineParameter GUID](self, "GUID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[IMScheduledMessageUpdatePipelineParameter scheduleState](self, "scheduleState");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<IMScheduledMessageUpdatePipelineParameter %p> { guid: %@, scheduleState: %@ }"), self, v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (NSString)GUID
{
  return self->_GUID;
}

- (NSNumber)scheduleState
{
  return self->_scheduleState;
}

- (BOOL)isFromMe
{
  return self->_isFromMe;
}

- (NSString)fromIdentifier
{
  return self->_fromIdentifier;
}

- (NSString)toIdentifier
{
  return self->_toIdentifier;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_toIdentifier, 0);
  objc_storeStrong((id *)&self->_fromIdentifier, 0);
  objc_storeStrong((id *)&self->_scheduleState, 0);
  objc_storeStrong((id *)&self->_GUID, 0);
}

@end
