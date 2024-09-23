@implementation NWStatsConnSnapshot

- (BOOL)isSilent
{
  void *v3;
  void *v4;
  char v5;
  void *v6;

  -[NWStatsConnSnapshot ancestralProperties](self, "ancestralProperties");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    -[NWStatsConnSnapshot ancestralProperties](self, "ancestralProperties");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "isSilent");
  }
  else
  {
    -[NWStatsConnSnapshot currentProperties](self, "currentProperties");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (v4)
    {
      -[NWStatsConnSnapshot currentProperties](self, "currentProperties");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v5 = objc_msgSend(v6, "isSilent");

    }
    else
    {
      v5 = 0;
    }
  }

  return v5;
}

- (NWStatsConnProperties)ancestralProperties
{
  return self->_ancestralProperties;
}

- (void)setCurrentProperties:(id)a3
{
  objc_storeStrong((id *)&self->_currentProperties, a3);
}

- (void)setAncestralProperties:(id)a3
{
  objc_storeStrong((id *)&self->_ancestralProperties, a3);
}

- (NWStatsConnSnapshot)initWithConnUpdate:(const nstat_msg_src_update_conn *)a3 startTime:(double)a4 flowFlags:(unsigned int)a5
{
  NWStatsConnSnapshot *v8;
  NWStatsConnSnapshot *v9;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)NWStatsConnSnapshot;
  v8 = -[NWStatsConnSnapshot init](&v11, sel_init);
  v9 = v8;
  if (v8)
  {
    v8->_flags = a5;
    memcpy(&v8->_nstat_update, a3, sizeof(v8->_nstat_update));
    v9->_descriptor = &v9->_nstat_update.conn_desc;
    v9->_startTimeInterval = a4;
  }
  return v9;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_ancestralProperties, 0);
  objc_storeStrong((id *)&self->_currentProperties, 0);
  objc_storeStrong((id *)&self->_flowuuid, 0);
  objc_storeStrong((id *)&self->_puuid, 0);
  objc_storeStrong((id *)&self->_cuuid, 0);
  objc_storeStrong((id *)&self->_euuid, 0);
  objc_storeStrong((id *)&self->_uuid, 0);
  objc_storeStrong((id *)&self->_snapshotTimestamp, 0);
  objc_storeStrong((id *)&self->_startTimestamp, 0);
  objc_storeStrong((id *)&self->_processName, 0);
}

- (id)description
{
  __int16 v3;
  __CFString *v4;
  objc_class *v5;
  void *v6;
  void *v7;
  void *v8;
  _BOOL4 v9;
  void *v10;
  void *v11;
  void *v12;
  void *v14;
  void *v15;
  void *v16;
  _BOOL4 v17;
  void *v18;
  unint64_t v19;
  void *v20;
  __CFString *v21;
  id v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;

  if (-[NWStatsSnapshot snapshotReason](self, "snapshotReason") == 4)
  {
    if ((-[NWStatsConnSnapshot eventFlags](self, "eventFlags") & 0x4000) != 0)
    {
      v4 = CFSTR("(flowUUID-assigned)");
    }
    else
    {
      v3 = -[NWStatsConnSnapshot eventFlags](self, "eventFlags");
      v4 = CFSTR("(flowUUID-changed)");
      if ((v3 & 0x8000) == 0)
        v4 = CFSTR("?");
    }
  }
  else
  {
    v4 = &stru_24CBD3FC0;
  }
  v5 = (objc_class *)MEMORY[0x24BDD17C8];
  v21 = v4;
  v22 = [v5 alloc];
  -[NWStatsConnSnapshot processName](self, "processName");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = -[NWStatsConnSnapshot sourceIdentifier](self, "sourceIdentifier");
  -[NWStatsSnapshot snapshotReasonString](self, "snapshotReasonString");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = -[NWStatsConnSnapshot hasNetAccess](self, "hasNetAccess");
  -[NWStatsConnSnapshot uuid](self, "uuid");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  -[NWStatsConnSnapshot euuid](self, "euuid");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  -[NWStatsConnSnapshot cuuid](self, "cuuid");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  -[NWStatsConnSnapshot puuid](self, "puuid");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  -[NWStatsConnSnapshot flowuuid](self, "flowuuid");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[NWStatsConnSnapshot domainName](self, "domainName");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[NWStatsConnSnapshot domainOwner](self, "domainOwner");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[NWStatsConnSnapshot domainTrackerContext](self, "domainTrackerContext");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[NWStatsConnSnapshot domainAttributedBundleId](self, "domainAttributedBundleId");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = -[NWStatsConnSnapshot isSilent](self, "isSilent");
  -[NWStatsConnSnapshot currentProperties](self, "currentProperties");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[NWStatsConnSnapshot ancestralProperties](self, "ancestralProperties");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[NWStatsSnapshot extensions](self, "extensions");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = (void *)objc_msgSend(v22, "initWithFormat:", CFSTR("%@ conn id %lld (%@) %@ net-access %d uuid %@ euuid %@ cuuid %@ puuid %@ fuuid %@ domain name %@ owner %@ context %@ attributed %@ silent %d current %@ ancestral %@ extensions %@"), v20, v19, v18, v21, v17, v26, v16, v25, v24, v15, v6, v7, v14, v8, v9, v10,
                  v11,
                  v12);

  return v23;
}

- (NWStatsConnProperties)currentProperties
{
  return self->_currentProperties;
}

- (unint64_t)sourceIdentifier
{
  return self->_nstat_update.srcref;
}

- (id)snapshotType
{
  return CFSTR("Conn");
}

- (id)snapshotTypeLowerCase
{
  return CFSTR("conn");
}

- (id)provider
{
  return CFSTR("Conn");
}

- (unint64_t)eventFlags
{
  return self->_nstat_update.event_flags;
}

- (unint64_t)uniqueProcessID
{
  return self->_descriptor->upid;
}

- (int)processID
{
  return self->_descriptor->pid;
}

- (unsigned)personaID
{
  return self->_descriptor->persona_id;
}

- (unsigned)uid
{
  return self->_descriptor->uid;
}

- (unint64_t)eupid
{
  return self->_descriptor->eupid;
}

- (int)epid
{
  return self->_descriptor->epid;
}

- (id)processName
{
  NSString *processName;
  NSString *v4;
  NSString *v5;

  processName = self->_processName;
  if (!processName)
  {
    v4 = (NSString *)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithFormat:", CFSTR("%.64s"), self->_descriptor->pname);
    v5 = self->_processName;
    self->_processName = v4;

    processName = self->_processName;
  }
  return processName;
}

- (id)uuid
{
  NSUUID *uuid;
  NSUUID *v4;
  NSUUID *v5;

  uuid = self->_uuid;
  if (!uuid)
  {
    -[NWStatsSnapshot _createNSUUIDForBytes:](self, "_createNSUUIDForBytes:", self->_descriptor->uuid);
    v4 = (NSUUID *)objc_claimAutoreleasedReturnValue();
    v5 = self->_uuid;
    self->_uuid = v4;

    uuid = self->_uuid;
  }
  return uuid;
}

- (id)euuid
{
  NSUUID *euuid;
  NSUUID *v4;
  NSUUID *v5;

  euuid = self->_euuid;
  if (!euuid)
  {
    -[NWStatsSnapshot _createNSUUIDForBytes:](self, "_createNSUUIDForBytes:", self->_descriptor->euuid);
    v4 = (NSUUID *)objc_claimAutoreleasedReturnValue();
    v5 = self->_euuid;
    self->_euuid = v4;

    euuid = self->_euuid;
  }
  return euuid;
}

- (NSUUID)puuid
{
  NSUUID *puuid;
  NSUUID *v4;
  NSUUID *v5;

  puuid = self->_puuid;
  if (!puuid)
  {
    -[NWStatsSnapshot _createNSUUIDForBytes:](self, "_createNSUUIDForBytes:", self->_descriptor->puuid);
    v4 = (NSUUID *)objc_claimAutoreleasedReturnValue();
    v5 = self->_puuid;
    self->_puuid = v4;

    puuid = self->_puuid;
  }
  return puuid;
}

- (NSUUID)cuuid
{
  NSUUID *cuuid;
  NSUUID *v4;
  NSUUID *v5;

  cuuid = self->_cuuid;
  if (!cuuid)
  {
    -[NWStatsSnapshot _createNSUUIDForBytes:](self, "_createNSUUIDForBytes:", self->_descriptor->cuuid);
    v4 = (NSUUID *)objc_claimAutoreleasedReturnValue();
    v5 = self->_cuuid;
    self->_cuuid = v4;

    cuuid = self->_cuuid;
  }
  return cuuid;
}

- (NSUUID)flowuuid
{
  NSUUID *flowuuid;
  NSUUID *v4;
  NSUUID *v5;

  flowuuid = self->_flowuuid;
  if (!flowuuid)
  {
    -[NWStatsSnapshot _createNSUUIDForBytes:](self, "_createNSUUIDForBytes:", self->_descriptor->fuuid);
    v4 = (NSUUID *)objc_claimAutoreleasedReturnValue();
    v5 = self->_flowuuid;
    self->_flowuuid = v4;

    flowuuid = self->_flowuuid;
  }
  return flowuuid;
}

- (id)domainName
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  -[NWStatsConnSnapshot ancestralProperties](self, "ancestralProperties");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    -[NWStatsConnSnapshot ancestralProperties](self, "ancestralProperties");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "domainName");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    -[NWStatsConnSnapshot currentProperties](self, "currentProperties");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (v4)
    {
      -[NWStatsConnSnapshot currentProperties](self, "currentProperties");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "domainName");
      v5 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v5 = 0;
    }
  }

  return v5;
}

- (id)domainOwner
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  -[NWStatsConnSnapshot currentProperties](self, "currentProperties");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    -[NWStatsConnSnapshot currentProperties](self, "currentProperties");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "domainOwner");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    -[NWStatsConnSnapshot ancestralProperties](self, "ancestralProperties");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (v4)
    {
      -[NWStatsConnSnapshot ancestralProperties](self, "ancestralProperties");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "domainOwner");
      v5 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v5 = 0;
    }
  }

  return v5;
}

- (id)domainTrackerContext
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  -[NWStatsConnSnapshot ancestralProperties](self, "ancestralProperties");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    -[NWStatsConnSnapshot ancestralProperties](self, "ancestralProperties");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "domainTrackerContext");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    -[NWStatsConnSnapshot currentProperties](self, "currentProperties");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (v4)
    {
      -[NWStatsConnSnapshot currentProperties](self, "currentProperties");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "domainTrackerContext");
      v5 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v5 = 0;
    }
  }

  return v5;
}

- (id)domainAttributedBundleId
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  -[NWStatsConnSnapshot ancestralProperties](self, "ancestralProperties");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    -[NWStatsConnSnapshot ancestralProperties](self, "ancestralProperties");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "domainAttributedBundleId");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    -[NWStatsConnSnapshot currentProperties](self, "currentProperties");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (v4)
    {
      -[NWStatsConnSnapshot currentProperties](self, "currentProperties");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "domainAttributedBundleId");
      v5 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v5 = 0;
    }
  }

  return v5;
}

- (BOOL)isTracker
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  char v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;

  -[NWStatsConnSnapshot ancestralProperties](self, "ancestralProperties");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3
    && (-[NWStatsConnSnapshot currentProperties](self, "currentProperties"),
        (v4 = objc_claimAutoreleasedReturnValue()) != 0))
  {
    v5 = (void *)v4;
    -[NWStatsConnSnapshot ancestralProperties](self, "ancestralProperties");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v6, "isTracker") & 1) != 0)
    {
      v7 = 1;
    }
    else
    {
      -[NWStatsConnSnapshot currentProperties](self, "currentProperties");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = objc_msgSend(v11, "isTracker");

    }
  }
  else
  {
    -[NWStatsConnSnapshot currentProperties](self, "currentProperties");
    v8 = objc_claimAutoreleasedReturnValue();
    if (v8)
    {
      v5 = (void *)v8;
      -[NWStatsConnSnapshot currentProperties](self, "currentProperties");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      -[NWStatsConnSnapshot ancestralProperties](self, "ancestralProperties");
      v10 = objc_claimAutoreleasedReturnValue();
      if (!v10)
      {
        v7 = 0;
        goto LABEL_12;
      }
      v5 = (void *)v10;
      -[NWStatsConnSnapshot ancestralProperties](self, "ancestralProperties");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
    }
    v6 = v9;
    v7 = objc_msgSend(v9, "isTracker");
  }

LABEL_12:
  return v7;
}

- (BOOL)isNonAppInitiated
{
  void *v3;
  void *v4;
  char v5;
  void *v6;

  -[NWStatsConnSnapshot ancestralProperties](self, "ancestralProperties");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    -[NWStatsConnSnapshot ancestralProperties](self, "ancestralProperties");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "isNonAppInitiated");
  }
  else
  {
    -[NWStatsConnSnapshot currentProperties](self, "currentProperties");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (v4)
    {
      -[NWStatsConnSnapshot currentProperties](self, "currentProperties");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v5 = objc_msgSend(v6, "isNonAppInitiated");

    }
    else
    {
      v5 = 0;
    }
  }

  return v5;
}

- (NSData)remoteAddress
{
  void *v2;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  -[NWStatsConnSnapshot ancestralProperties](self, "ancestralProperties");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    -[NWStatsConnSnapshot ancestralProperties](self, "ancestralProperties");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "remoteAddress");
    v5 = objc_claimAutoreleasedReturnValue();
    if (v5)
    {
      v6 = (void *)v5;
      -[NWStatsConnSnapshot ancestralProperties](self, "ancestralProperties");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "remoteAddress");
      v8 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_8:
      goto LABEL_9;
    }
  }
  -[NWStatsConnSnapshot currentProperties](self, "currentProperties");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (v9)
  {
    -[NWStatsConnSnapshot currentProperties](self, "currentProperties");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "remoteAddress");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v8 = 0;
  }

  if (v4)
    goto LABEL_8;
LABEL_9:

  return (NSData *)v8;
}

- (unsigned)remotePort
{
  void *v2;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  unsigned __int16 v8;
  void *v9;
  void *v10;

  -[NWStatsConnSnapshot ancestralProperties](self, "ancestralProperties");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    -[NWStatsConnSnapshot ancestralProperties](self, "ancestralProperties");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "remoteAddress");
    v5 = objc_claimAutoreleasedReturnValue();
    if (v5)
    {
      v6 = (void *)v5;
      -[NWStatsConnSnapshot ancestralProperties](self, "ancestralProperties");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = objc_msgSend(v7, "remotePort");

LABEL_8:
      goto LABEL_9;
    }
  }
  -[NWStatsConnSnapshot currentProperties](self, "currentProperties");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (v9)
  {
    -[NWStatsConnSnapshot currentProperties](self, "currentProperties");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v10, "remotePort");

  }
  else
  {
    v8 = 0;
  }

  if (v4)
    goto LABEL_8;
LABEL_9:

  return v8;
}

- (BOOL)hasNetAccess
{
  return HIBYTE(self->_descriptor->ifnet_properties) & 1;
}

- (unint64_t)connStartContinuousTime
{
  return self->_descriptor->start_timestamp;
}

- (double)connDuration
{
  double result;

  +[NWStatsProtocolSnapshot _intervalWithContinuousTime:](NWStatsProtocolSnapshot, "_intervalWithContinuousTime:", self->_descriptor->timestamp - self->_descriptor->start_timestamp);
  return result;
}

- (NSDate)connStartTimestamp
{
  NSDate *startTimestamp;
  void *v4;
  NSDate *v5;
  NSDate *v6;

  startTimestamp = self->_startTimestamp;
  if (!startTimestamp)
  {
    v4 = (void *)MEMORY[0x24BDBCE60];
    -[NWStatsConnSnapshot connStartTimeIntervalSinceReferenceDate](self, "connStartTimeIntervalSinceReferenceDate");
    objc_msgSend(v4, "dateWithTimeIntervalSinceReferenceDate:");
    v5 = (NSDate *)objc_claimAutoreleasedReturnValue();
    v6 = self->_startTimestamp;
    self->_startTimestamp = v5;

    startTimestamp = self->_startTimestamp;
  }
  return startTimestamp;
}

- (NSDate)connSnapshotTimestamp
{
  NSDate *snapshotTimestamp;
  void *v4;
  NSDate *v5;
  NSDate *v6;

  snapshotTimestamp = self->_snapshotTimestamp;
  if (!snapshotTimestamp)
  {
    v4 = (void *)MEMORY[0x24BDBCE60];
    -[NWStatsConnSnapshot connSnapshotTimeIntervalSinceReferenceDate](self, "connSnapshotTimeIntervalSinceReferenceDate");
    objc_msgSend(v4, "dateWithTimeIntervalSinceReferenceDate:");
    v5 = (NSDate *)objc_claimAutoreleasedReturnValue();
    v6 = self->_snapshotTimestamp;
    self->_snapshotTimestamp = v5;

    snapshotTimestamp = self->_snapshotTimestamp;
  }
  return snapshotTimestamp;
}

- (double)connStartTimeIntervalSinceReferenceDate
{
  double result;

  result = self->_startTimeInterval;
  if (result == 0.0)
  {
    +[NWStatsProtocolSnapshot _referenceIntervalWithContinuousTime:](NWStatsProtocolSnapshot, "_referenceIntervalWithContinuousTime:", self->_descriptor->start_timestamp);
    self->_startTimeInterval = result;
  }
  return result;
}

- (void)setFlowSnapshotTimeIntervalSinceReferenceDate:(double)a3
{
  self->_snapshotTimeInterval = a3;
}

- (double)connSnapshotTimeIntervalSinceReferenceDate
{
  double result;

  result = self->_snapshotTimeInterval;
  if (result == 0.0)
  {
    +[NWStatsProtocolSnapshot _referenceIntervalWithContinuousTime:](NWStatsProtocolSnapshot, "_referenceIntervalWithContinuousTime:", self->_descriptor->timestamp);
    self->_snapshotTimeInterval = result;
  }
  return result;
}

- (double)connStartTimeIntervalSince1970
{
  double v2;

  -[NWStatsConnSnapshot connStartTimeIntervalSinceReferenceDate](self, "connStartTimeIntervalSinceReferenceDate");
  return v2 + 978307200.0;
}

- (double)connSnapshotTimeIntervalSince1970
{
  double v2;

  -[NWStatsConnSnapshot connSnapshotTimeIntervalSinceReferenceDate](self, "connSnapshotTimeIntervalSinceReferenceDate");
  return v2 + 978307200.0;
}

- (NSData)parametersTLV
{
  void *v2;
  void *v3;
  void *v4;

  -[NWStatsSnapshot extensions](self, "extensions");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", 2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSData *)v4;
}

- (NSData)ancestralParametersTLV
{
  void *v2;
  void *v3;
  void *v4;

  -[NWStatsSnapshot extensions](self, "extensions");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", 3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSData *)v4;
}

- (id)_connDescriptorDictionaryForm:(nstat_connection_descriptor *)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;

  v4 = objc_alloc_init(MEMORY[0x24BDBCED8]);
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", a3->upid);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v5, CFSTR("upid"));

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", a3->start_timestamp);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v6, CFSTR("start_timestamp"));

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", a3->timestamp);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v7, CFSTR("timestamp"));

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", a3->pid);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v8, CFSTR("pid"));

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", a3->eupid);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v9, CFSTR("eupid"));

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", a3->epid);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v10, CFSTR("epid"));

  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", a3->pname);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v11, CFSTR("pname"));

  v12 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD1880]), "initWithUUIDBytes:", a3->cuuid);
  objc_msgSend(v12, "UUIDString");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v13, CFSTR("cuuid"));

  v14 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD1880]), "initWithUUIDBytes:", a3->fuuid);
  objc_msgSend(v14, "UUIDString");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v15, CFSTR("fuuid"));

  v16 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD1880]), "initWithUUIDBytes:", a3->uuid);
  objc_msgSend(v16, "UUIDString");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v17, CFSTR("uuid"));

  v18 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD1880]), "initWithUUIDBytes:", a3->euuid);
  objc_msgSend(v18, "UUIDString");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v19, CFSTR("euuid"));

  v20 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD1880]), "initWithUUIDBytes:", a3->puuid);
  objc_msgSend(v20, "UUIDString");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v21, CFSTR("puuid"));

  return v4;
}

- (id)dictionaryForm
{
  id v3;
  void *v4;
  double v5;
  void *v6;
  void *v7;
  double v8;
  void *v9;
  void *v10;
  double v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  id v25;
  void *v26;
  void *v27;
  void *v28;
  id v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;

  v3 = objc_alloc_init(MEMORY[0x24BDBCED8]);
  v4 = (void *)MEMORY[0x24BDD16E0];
  -[NWStatsConnSnapshot connStartTimeIntervalSinceReferenceDate](self, "connStartTimeIntervalSinceReferenceDate");
  *(float *)&v5 = v5;
  objc_msgSend(v4, "numberWithFloat:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v6, CFSTR("_startStamp"));

  v7 = (void *)MEMORY[0x24BDD16E0];
  -[NWStatsConnSnapshot connStartTimeIntervalSinceReferenceDate](self, "connStartTimeIntervalSinceReferenceDate");
  objc_msgSend(v7, "numberWithUnsignedLongLong:", (unint64_t)(v8 * 1000000.0));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v9, CFSTR("_startStampUsecs"));

  v10 = (void *)MEMORY[0x24BDD16E0];
  -[NWStatsConnSnapshot connSnapshotTimeIntervalSinceReferenceDate](self, "connSnapshotTimeIntervalSinceReferenceDate");
  objc_msgSend(v10, "numberWithUnsignedLongLong:", (unint64_t)(v11 * 1000000.0));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v12, CFSTR("_snapStampUsecs"));

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", self->_flags);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v13, CFSTR("_flags"));

  -[NWStatsSnapshot attributedEntity](self, "attributedEntity");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  if (v14)
  {
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v14, CFSTR("attributedEntity"));
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDBCEF8], "null");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v15, CFSTR("attributedEntity"));

  }
  -[NWStatsSnapshot delegateName](self, "delegateName");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  if (v16)
  {
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v16, CFSTR("delegateName"));
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDBCEF8], "null");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v17, CFSTR("delegateName"));

  }
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", -[NWStatsSnapshot attributionReason](self, "attributionReason"));
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v18, CFSTR("attributionReason"));

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", -[NWStatsSnapshot snapshotReason](self, "snapshotReason"));
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v19, CFSTR("snapshotReason"));

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", -[NWStatsSnapshot startAppStateIsForeground](self, "startAppStateIsForeground"));
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v20, CFSTR("startAppStateIsForeground"));

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", -[NWStatsSnapshot snapshotAppStateIsForeground](self, "snapshotAppStateIsForeground"));
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v21, CFSTR("snapshotAppStateIsForeground"));

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", -[NWStatsSnapshot startScreenStateOn](self, "startScreenStateOn"));
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v22, CFSTR("startScreenStateOn"));

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", -[NWStatsSnapshot snapshotScreenStateOn](self, "snapshotScreenStateOn"));
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v23, CFSTR("snapshotScreenStateOn"));

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", -[NWStatsSnapshot delegateAttributionReason](self, "delegateAttributionReason"));
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v24, CFSTR("delegateAttributionReason"));

  v25 = objc_alloc_init(MEMORY[0x24BDBCED8]);
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", self->_nstat_update.srcref);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "setObject:forKeyedSubscript:", v26, CFSTR("srcref"));

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", self->_nstat_update.event_flags);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "setObject:forKeyedSubscript:", v27, CFSTR("event_flags"));

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", self->_nstat_update.provider);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "setObject:forKeyedSubscript:", v28, CFSTR("provider"));

  v29 = objc_alloc_init(MEMORY[0x24BDBCED8]);
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", self->_nstat_update.hdr.context);
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "setObject:forKeyedSubscript:", v30, CFSTR("context"));

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", self->_nstat_update.hdr.type);
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "setObject:forKeyedSubscript:", v31, CFSTR("type"));

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedShort:", self->_nstat_update.hdr.length);
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "setObject:forKeyedSubscript:", v32, CFSTR("length"));

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedShort:", self->_nstat_update.hdr.flags);
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "setObject:forKeyedSubscript:", v33, CFSTR("flags"));

  objc_msgSend(v25, "setObject:forKeyedSubscript:", v29, CFSTR("hdr"));
  -[NWStatsConnSnapshot _connDescriptorDictionaryForm:](self, "_connDescriptorDictionaryForm:", self->_descriptor);
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "setObject:forKeyedSubscript:", v34, CFSTR("conn_descriptor"));

  objc_msgSend(v3, "setObject:forKeyedSubscript:", v25, CFSTR("update"));
  return v3;
}

@end
