@implementation BRCFSEventsPersistedState

+ (id)loadFromClientStateInSession:(id)a3 options:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  __CFString *v8;
  void *v9;
  void *v10;
  uint64_t v12;

  v5 = a3;
  objc_msgSend(a4, "objectForKeyedSubscript:", CFSTR("name"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "clientState");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    objc_msgSend(CFSTR("fsevents"), "stringByAppendingPathComponent:", v6);
    v8 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v8 = CFSTR("fsevents");
  }
  objc_msgSend(v7, "objectForKeyedSubscript:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v12 = objc_opt_new();

    objc_msgSend(v7, "setObject:forKeyedSubscript:", v12, v8);
    v9 = (void *)v12;
  }
  objc_msgSend(v5, "clientTruthWorkloop");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setAssertionQueue:", v10);

  return v9;
}

- (BRCFSEventsPersistedState)initWithLatestEventID:(unint64_t)a3 streamUUID:(id)a4 rootID:(unint64_t)a5
{
  id v9;
  BRCFSEventsPersistedState *v10;
  BRCFSEventsPersistedState *v11;
  objc_super v13;

  v9 = a4;
  v13.receiver = self;
  v13.super_class = (Class)BRCFSEventsPersistedState;
  v10 = -[BRCFSEventsPersistedState init](&v13, sel_init);
  v11 = v10;
  if (v10)
  {
    v10->_latestEventID = a3;
    objc_storeStrong((id *)&v10->_streamUUID, a4);
    v11->_rootID = a5;
  }

  return v11;
}

- (void)setLatestEventID:(unint64_t)a3
{
  if (self->_latestEventID < a3)
    self->_latestEventID = a3;
}

- (void)setStreamUUID:(id)a3
{
  id v5;

  v5 = a3;
  if ((-[NSUUID isEqual:](self->_streamUUID, "isEqual:") & 1) == 0)
  {
    objc_storeStrong((id *)&self->_streamUUID, a3);
    self->_latestEventID = 0;
  }

}

- (void)setRootID:(unint64_t)a3
{
  NSUUID *streamUUID;

  if (self->_rootID != a3)
  {
    streamUUID = self->_streamUUID;
    self->_streamUUID = 0;

    self->_latestEventID = 0;
    self->_rootID = a3;
  }
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;

  v3 = (void *)MEMORY[0x1E0CB3940];
  -[NSUUID UUIDString](self->_streamUUID, "UUIDString");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("streamUUID:%@ event:%llu root:%llu"), v4, self->_latestEventID, self->_rootID);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)copyWithZone:(_NSZone *)a3
{
  BRCFSEventsPersistedState *v4;
  unint64_t v5;
  void *v6;
  BRCFSEventsPersistedState *v7;
  void *v8;

  v4 = [BRCFSEventsPersistedState alloc];
  v5 = -[BRCFSEventsPersistedState latestEventID](self, "latestEventID");
  -[BRCFSEventsPersistedState streamUUID](self, "streamUUID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[BRCFSEventsPersistedState initWithLatestEventID:streamUUID:rootID:](v4, "initWithLatestEventID:streamUUID:rootID:", v5, v6, -[BRCFSEventsPersistedState rootID](self, "rootID"));

  -[BRCPersistedState assertionQueue](self, "assertionQueue");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[BRCPersistedState setAssertionQueue:](v7, "setAssertionQueue:", v8);

  return v7;
}

- (BRCFSEventsPersistedState)initWithCoder:(id)a3
{
  id v4;
  BRCFSEventsPersistedState *v5;
  uint64_t v6;
  NSUUID *streamUUID;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)BRCFSEventsPersistedState;
  v5 = -[BRCFSEventsPersistedState init](&v9, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("streamUUID"));
    v6 = objc_claimAutoreleasedReturnValue();
    streamUUID = v5->_streamUUID;
    v5->_streamUUID = (NSUUID *)v6;

    v5->_latestEventID = objc_msgSend(v4, "decodeInt64ForKey:", CFSTR("event"));
    v5->_rootID = objc_msgSend(v4, "decodeInt64ForKey:", CFSTR("root"));
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  NSUUID *streamUUID;
  objc_super v6;

  v4 = a3;
  v6.receiver = self;
  v6.super_class = (Class)BRCFSEventsPersistedState;
  -[BRCPersistedState encodeWithCoder:](&v6, sel_encodeWithCoder_, v4);
  streamUUID = self->_streamUUID;
  if (streamUUID)
    objc_msgSend(v4, "encodeObject:forKey:", streamUUID, CFSTR("streamUUID"));
  objc_msgSend(v4, "encodeInt64:forKey:", self->_latestEventID, CFSTR("event"));
  objc_msgSend(v4, "encodeInt64:forKey:", self->_rootID, CFSTR("root"));

}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (NSUUID)streamUUID
{
  return self->_streamUUID;
}

- (unint64_t)latestEventID
{
  return self->_latestEventID;
}

- (unint64_t)rootID
{
  return self->_rootID;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_streamUUID, 0);
}

@end
