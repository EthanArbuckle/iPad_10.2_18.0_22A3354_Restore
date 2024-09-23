@implementation _DKSyncPeer

- (_DKSyncPeer)init
{
  return -[_DKSyncPeer initWithIDSDeviceIdentifier:zoneName:](self, "initWithIDSDeviceIdentifier:zoneName:", 0, 0);
}

- (_DKSyncPeer)initWithIDSDeviceIdentifier:(id)a3
{
  return -[_DKSyncPeer initWithIDSDeviceIdentifier:zoneName:](self, "initWithIDSDeviceIdentifier:zoneName:", a3, 0);
}

- (_DKSyncPeer)initWithZoneName:(id)a3
{
  return -[_DKSyncPeer initWithIDSDeviceIdentifier:zoneName:](self, "initWithIDSDeviceIdentifier:zoneName:", 0, a3);
}

- (_DKSyncPeer)initWithIDSDeviceIdentifier:(id)a3 zoneName:(id)a4
{
  id v7;
  id v8;
  _DKSyncPeer *v9;
  _DKSyncPeer *v10;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)_DKSyncPeer;
  v9 = -[_DKSyncPeer init](&v12, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_idsDeviceIdentifier, a3);
    objc_storeStrong((id *)&v10->_zoneName, a4);
  }

  return v10;
}

- (NSUUID)sourceDeviceUUID
{
  void *v2;

  if (self->_sourceDeviceID)
    v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3A28]), "initWithUUIDString:", self->_sourceDeviceID);
  else
    v2 = 0;
  return (NSUUID *)v2;
}

- (NSString)identifier
{
  NSString **p_sourceDeviceID;
  const __CFString *v3;
  NSString **p_zoneName;
  NSString *zoneName;
  __CFString *v6;

  p_sourceDeviceID = &self->_sourceDeviceID;
  if (self->_sourceDeviceID)
  {
    v3 = CFSTR("%@");
  }
  else
  {
    p_sourceDeviceID = &self->_idsDeviceIdentifier;
    if (self->_idsDeviceIdentifier)
    {
      v3 = CFSTR("rapport:%@");
    }
    else
    {
      zoneName = self->_zoneName;
      p_zoneName = &self->_zoneName;
      if (!zoneName)
      {
        v6 = CFSTR("UNKNOWN");
        return (NSString *)v6;
      }
      v3 = CFSTR("cloud:%@");
      p_sourceDeviceID = p_zoneName;
    }
  }
  v6 = (__CFString *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", v3, *p_sourceDeviceID);
  return (NSString *)v6;
}

- (id)description
{
  _BOOL4 me;
  id v4;
  objc_class *v5;
  void *v6;
  const __CFString *v7;
  void *v8;
  void *v9;
  NSString *version;
  NSString *sourceDeviceID;
  NSString *idsDeviceIdentifier;
  NSString *zoneName;
  void *v14;
  __int128 v16;

  me = self->_me;
  v4 = objc_alloc(MEMORY[0x1E0CB3940]);
  v5 = (objc_class *)objc_opt_class();
  NSStringFromClass(v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (me)
  {
    if (self->_me)
      v7 = CFSTR("YES");
    else
      v7 = CFSTR("NO");
    -[_DKSyncPeer identifier](self, "identifier");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = (void *)objc_msgSend(v4, "initWithFormat:", CFSTR("<%@ %p: me=%@, identifier=%@, name=%@, model=%@, sourceDeviceID=%@, zoneName=%@>"), v6, self, v7, v8, self->_name, self->_model, self->_sourceDeviceID, self->_zoneName);
  }
  else
  {
    -[_DKSyncPeer identifier](self, "identifier");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = *(_OWORD *)&self->_name;
    version = self->_version;
    sourceDeviceID = self->_sourceDeviceID;
    idsDeviceIdentifier = self->_idsDeviceIdentifier;
    zoneName = self->_zoneName;
    -[NSDate dk_localtimeString](self->_lastSeenDate);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = (void *)objc_msgSend(v4, "initWithFormat:", CFSTR("<%@ %p: identifier=%@, name=%@, model=%@, version=%@, sourceDeviceID=%@, idsDeviceIdentifier=%@, zoneName=%@, lastSeenDate=%@>"), v6, self, v8, v16, version, sourceDeviceID, idsDeviceIdentifier, zoneName, v14);

  }
  return v9;
}

- (NSString)sourceDeviceID
{
  return self->_sourceDeviceID;
}

- (void)setSourceDeviceID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (NSString)idsDeviceIdentifier
{
  return self->_idsDeviceIdentifier;
}

- (void)setIdsDeviceIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (NSString)zoneName
{
  return self->_zoneName;
}

- (void)setZoneName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (NSDate)lastSeenDate
{
  return self->_lastSeenDate;
}

- (void)setLastSeenDate:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (NSString)name
{
  return self->_name;
}

- (void)setName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (NSString)model
{
  return self->_model;
}

- (void)setModel:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 56);
}

- (BOOL)isCompanion
{
  return self->_companion;
}

- (void)setCompanion:(BOOL)a3
{
  self->_companion = a3;
}

- (NSString)version
{
  return self->_version;
}

- (void)setVersion:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 64);
}

- (BOOL)me
{
  return self->_me;
}

- (void)setMe:(BOOL)a3
{
  self->_me = a3;
}

- (NSUUID)uuid
{
  return self->_uuid;
}

- (void)setUuid:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 72);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_uuid, 0);
  objc_storeStrong((id *)&self->_version, 0);
  objc_storeStrong((id *)&self->_model, 0);
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->_lastSeenDate, 0);
  objc_storeStrong((id *)&self->_zoneName, 0);
  objc_storeStrong((id *)&self->_idsDeviceIdentifier, 0);
  objc_storeStrong((id *)&self->_sourceDeviceID, 0);
}

@end
