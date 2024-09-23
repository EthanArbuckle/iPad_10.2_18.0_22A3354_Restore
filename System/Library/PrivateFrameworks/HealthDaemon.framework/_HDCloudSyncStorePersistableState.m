@implementation _HDCloudSyncStorePersistableState

- (_HDCloudSyncStorePersistableState)initWithServerChangeToken:(id)a3 baselineEpoch:(unint64_t)a4 rebaseDeadline:(id)a5 lastSyncDate:(id)a6 emptyZones:(id)a7 lastCheckDate:(id)a8 ownerIdentifier:(id)a9 containerIdentifier:(id)a10 syncIdentity:(id)a11 syncProtocolVersion:(int)a12
{
  id v19;
  id v20;
  id v21;
  _HDCloudSyncStorePersistableState *v22;
  _HDCloudSyncStorePersistableState *v23;
  uint64_t v24;
  NSString *ownerIdentifier;
  uint64_t v26;
  NSString *containerIdentifier;
  uint64_t v28;
  HDSyncIdentity *syncIdentity;
  id v31;
  id v32;
  id v33;
  id v34;
  id v35;
  objc_super v36;

  v35 = a3;
  v34 = a5;
  v33 = a6;
  v32 = a7;
  v31 = a8;
  v19 = a9;
  v20 = a10;
  v21 = a11;
  v36.receiver = self;
  v36.super_class = (Class)_HDCloudSyncStorePersistableState;
  v22 = -[_HDCloudSyncStorePersistableState init](&v36, sel_init);
  v23 = v22;
  if (v22)
  {
    objc_storeStrong((id *)&v22->_serverChangeToken, a3);
    v23->_baselineEpoch = a4;
    objc_storeStrong((id *)&v23->_rebaseDeadline, a5);
    objc_storeStrong((id *)&v23->_lastSyncDate, a6);
    objc_storeStrong((id *)&v23->_emptyZoneDateByZoneID, a7);
    objc_storeStrong((id *)&v23->_lastCheckDate, a8);
    v24 = objc_msgSend(v19, "copy");
    ownerIdentifier = v23->_ownerIdentifier;
    v23->_ownerIdentifier = (NSString *)v24;

    v26 = objc_msgSend(v20, "copy");
    containerIdentifier = v23->_containerIdentifier;
    v23->_containerIdentifier = (NSString *)v26;

    v28 = objc_msgSend(v21, "copy");
    syncIdentity = v23->_syncIdentity;
    v23->_syncIdentity = (HDSyncIdentity *)v28;

    v23->_hasEncounteredGapInCurrentEpoch = 0;
    v23->_syncProtocolVersion = a12;
  }

  return v23;
}

- (id)copyWithZone:(_NSZone *)a3
{
  void *v4;
  id result;
  uint64_t v6;

  v4 = (void *)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3);
  LODWORD(v6) = self->_syncProtocolVersion;
  result = (id)objc_msgSend(v4, "initWithServerChangeToken:baselineEpoch:rebaseDeadline:lastSyncDate:emptyZones:lastCheckDate:ownerIdentifier:containerIdentifier:syncIdentity:syncProtocolVersion:", self->_serverChangeToken, self->_baselineEpoch, self->_rebaseDeadline, self->_lastSyncDate, self->_emptyZoneDateByZoneID, self->_lastCheckDate, self->_ownerIdentifier, self->_containerIdentifier, self->_syncIdentity, v6);
  *((_BYTE *)result + 8) = self->_hasEncounteredGapInCurrentEpoch;
  return result;
}

- (_HDCloudSyncStorePersistableState)stateWithServerChangeToken:(id)a3
{
  id v4;
  _QWORD *v5;
  void *v6;

  v4 = a3;
  v5 = (_QWORD *)-[_HDCloudSyncStorePersistableState copy](self, "copy");
  v6 = (void *)v5[5];
  v5[5] = v4;

  return (_HDCloudSyncStorePersistableState *)v5;
}

- (id)stateByResettingRebaselineDeadline
{
  _QWORD *v2;
  void *v3;

  v2 = (_QWORD *)-[_HDCloudSyncStorePersistableState copy](self, "copy");
  v3 = (void *)v2[7];
  v2[7] = 0;

  return v2;
}

- (id)stateByRequiringUrgentRebase
{
  _QWORD *v2;
  uint64_t v3;
  void *v4;

  v2 = (_QWORD *)-[_HDCloudSyncStorePersistableState copy](self, "copy");
  objc_msgSend(MEMORY[0x1E0C99D68], "distantPast");
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = (void *)v2[7];
  v2[7] = v3;

  return v2;
}

- (id)stateByRecordingLastSyncDate:(id)a3
{
  id v4;
  _QWORD *v5;
  uint64_t v6;
  void *v7;

  v4 = a3;
  v5 = (_QWORD *)-[_HDCloudSyncStorePersistableState copy](self, "copy");
  v6 = objc_msgSend(v4, "copy");

  v7 = (void *)v5[8];
  v5[8] = v6;

  return v5;
}

- (_HDCloudSyncStorePersistableState)stateWithEmptyZones:(id)a3
{
  id v4;
  _QWORD *v5;
  uint64_t v6;
  void *v7;

  v4 = a3;
  v5 = (_QWORD *)-[_HDCloudSyncStorePersistableState copy](self, "copy");
  v6 = objc_msgSend(v4, "copy");

  v7 = (void *)v5[9];
  v5[9] = v6;

  return (_HDCloudSyncStorePersistableState *)v5;
}

- (id)stateByRecordingLastCheckDate:(id)a3
{
  id v4;
  _QWORD *v5;
  uint64_t v6;
  void *v7;

  v4 = a3;
  v5 = (_QWORD *)-[_HDCloudSyncStorePersistableState copy](self, "copy");
  v6 = objc_msgSend(v4, "copy");

  v7 = (void *)v5[10];
  v5[10] = v6;

  return v5;
}

- (_HDCloudSyncStorePersistableState)stateWithGapEncountered:(BOOL)a3
{
  _BYTE *v4;

  v4 = (_BYTE *)-[_HDCloudSyncStorePersistableState copy](self, "copy");
  v4[8] = a3;
  return (_HDCloudSyncStorePersistableState *)v4;
}

- (_HDCloudSyncStorePersistableState)stateWithBaselineEpoch:(unint64_t)a3
{
  _QWORD *v4;

  v4 = (_QWORD *)-[_HDCloudSyncStorePersistableState copy](self, "copy");
  v4[6] = a3;
  return (_HDCloudSyncStorePersistableState *)v4;
}

- (_HDCloudSyncStorePersistableState)stateWithSyncProtocolVersion:(int)a3
{
  _DWORD *v4;

  v4 = (_DWORD *)-[_HDCloudSyncStorePersistableState copy](self, "copy");
  v4[3] = a3;
  return (_HDCloudSyncStorePersistableState *)v4;
}

- (NSString)ownerIdentifier
{
  return self->_ownerIdentifier;
}

- (NSString)containerIdentifier
{
  return self->_containerIdentifier;
}

- (HDSyncIdentity)syncIdentity
{
  return self->_syncIdentity;
}

- (CKServerChangeToken)serverChangeToken
{
  return self->_serverChangeToken;
}

- (unint64_t)baselineEpoch
{
  return self->_baselineEpoch;
}

- (NSDate)rebaseDeadline
{
  return self->_rebaseDeadline;
}

- (NSDate)lastSyncDate
{
  return self->_lastSyncDate;
}

- (NSDictionary)emptyZoneDateByZoneID
{
  return self->_emptyZoneDateByZoneID;
}

- (NSDate)lastCheckDate
{
  return self->_lastCheckDate;
}

- (BOOL)hasEncounteredGapInCurrentEpoch
{
  return self->_hasEncounteredGapInCurrentEpoch;
}

- (int)syncProtocolVersion
{
  return self->_syncProtocolVersion;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lastCheckDate, 0);
  objc_storeStrong((id *)&self->_emptyZoneDateByZoneID, 0);
  objc_storeStrong((id *)&self->_lastSyncDate, 0);
  objc_storeStrong((id *)&self->_rebaseDeadline, 0);
  objc_storeStrong((id *)&self->_serverChangeToken, 0);
  objc_storeStrong((id *)&self->_syncIdentity, 0);
  objc_storeStrong((id *)&self->_containerIdentifier, 0);
  objc_storeStrong((id *)&self->_ownerIdentifier, 0);
}

@end
