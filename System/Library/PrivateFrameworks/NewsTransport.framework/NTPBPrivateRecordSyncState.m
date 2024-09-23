@implementation NTPBPrivateRecordSyncState

- (void)dealloc
{
  objc_super v3;

  -[NTPBPrivateRecordSyncState setRecordName:](self, "setRecordName:", 0);
  -[NTPBPrivateRecordSyncState setRecordZoneName:](self, "setRecordZoneName:", 0);
  -[NTPBPrivateRecordSyncState setLastCleanDate:](self, "setLastCleanDate:", 0);
  -[NTPBPrivateRecordSyncState setLastDirtyDate:](self, "setLastDirtyDate:", 0);
  v3.receiver = self;
  v3.super_class = (Class)NTPBPrivateRecordSyncState;
  -[NTPBPrivateRecordSyncState dealloc](&v3, sel_dealloc);
}

- (BOOL)hasRecordName
{
  return self->_recordName != 0;
}

- (BOOL)hasRecordZoneName
{
  return self->_recordZoneName != 0;
}

- (BOOL)hasLastCleanDate
{
  return self->_lastCleanDate != 0;
}

- (BOOL)hasLastDirtyDate
{
  return self->_lastDirtyDate != 0;
}

- (id)description
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)NTPBPrivateRecordSyncState;
  return (id)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@ %@"), -[NTPBPrivateRecordSyncState description](&v3, sel_description), -[NTPBPrivateRecordSyncState dictionaryRepresentation](self, "dictionaryRepresentation"));
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;
  NSString *recordName;
  NSString *recordZoneName;
  NTPBDate *lastCleanDate;
  NTPBDate *lastDirtyDate;

  v3 = (void *)objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v4 = v3;
  recordName = self->_recordName;
  if (recordName)
    objc_msgSend(v3, "setObject:forKey:", recordName, CFSTR("record_name"));
  recordZoneName = self->_recordZoneName;
  if (recordZoneName)
    objc_msgSend(v4, "setObject:forKey:", recordZoneName, CFSTR("record_zone_name"));
  lastCleanDate = self->_lastCleanDate;
  if (lastCleanDate)
    objc_msgSend(v4, "setObject:forKey:", -[NTPBDate dictionaryRepresentation](lastCleanDate, "dictionaryRepresentation"), CFSTR("last_clean_date"));
  lastDirtyDate = self->_lastDirtyDate;
  if (lastDirtyDate)
    objc_msgSend(v4, "setObject:forKey:", -[NTPBDate dictionaryRepresentation](lastDirtyDate, "dictionaryRepresentation"), CFSTR("last_dirty_date"));
  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return NTPBPrivateRecordSyncStateReadFrom((id *)&self->super.super.isa, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  if (self->_recordName)
    PBDataWriterWriteStringField();
  if (self->_recordZoneName)
    PBDataWriterWriteStringField();
  if (self->_lastCleanDate)
    PBDataWriterWriteSubmessage();
  if (self->_lastDirtyDate)
    PBDataWriterWriteSubmessage();
}

- (id)copyWithZone:(_NSZone *)a3
{
  id *v5;

  v5 = (id *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");

  v5[3] = (id)-[NSString copyWithZone:](self->_recordName, "copyWithZone:", a3);
  v5[4] = (id)-[NSString copyWithZone:](self->_recordZoneName, "copyWithZone:", a3);

  v5[1] = -[NTPBDate copyWithZone:](self->_lastCleanDate, "copyWithZone:", a3);
  v5[2] = -[NTPBDate copyWithZone:](self->_lastDirtyDate, "copyWithZone:", a3);
  return v5;
}

- (BOOL)isEqual:(id)a3
{
  int v5;
  NSString *recordName;
  NSString *recordZoneName;
  NTPBDate *lastCleanDate;
  NTPBDate *lastDirtyDate;

  v5 = objc_msgSend(a3, "isMemberOfClass:", objc_opt_class());
  if (v5)
  {
    recordName = self->_recordName;
    if (!((unint64_t)recordName | *((_QWORD *)a3 + 3))
      || (v5 = -[NSString isEqual:](recordName, "isEqual:")) != 0)
    {
      recordZoneName = self->_recordZoneName;
      if (!((unint64_t)recordZoneName | *((_QWORD *)a3 + 4))
        || (v5 = -[NSString isEqual:](recordZoneName, "isEqual:")) != 0)
      {
        lastCleanDate = self->_lastCleanDate;
        if (!((unint64_t)lastCleanDate | *((_QWORD *)a3 + 1))
          || (v5 = -[NTPBDate isEqual:](lastCleanDate, "isEqual:")) != 0)
        {
          lastDirtyDate = self->_lastDirtyDate;
          if ((unint64_t)lastDirtyDate | *((_QWORD *)a3 + 2))
            LOBYTE(v5) = -[NTPBDate isEqual:](lastDirtyDate, "isEqual:");
          else
            LOBYTE(v5) = 1;
        }
      }
    }
  }
  return v5;
}

- (unint64_t)hash
{
  NSUInteger v3;
  NSUInteger v4;
  unint64_t v5;

  v3 = -[NSString hash](self->_recordName, "hash");
  v4 = -[NSString hash](self->_recordZoneName, "hash") ^ v3;
  v5 = -[NTPBDate hash](self->_lastCleanDate, "hash");
  return v4 ^ v5 ^ -[NTPBDate hash](self->_lastDirtyDate, "hash");
}

- (void)mergeFrom:(id)a3
{
  NTPBDate *lastCleanDate;
  uint64_t v6;
  NTPBDate *lastDirtyDate;
  uint64_t v8;

  if (*((_QWORD *)a3 + 3))
    -[NTPBPrivateRecordSyncState setRecordName:](self, "setRecordName:");
  if (*((_QWORD *)a3 + 4))
    -[NTPBPrivateRecordSyncState setRecordZoneName:](self, "setRecordZoneName:");
  lastCleanDate = self->_lastCleanDate;
  v6 = *((_QWORD *)a3 + 1);
  if (lastCleanDate)
  {
    if (v6)
      -[NTPBDate mergeFrom:](lastCleanDate, "mergeFrom:");
  }
  else if (v6)
  {
    -[NTPBPrivateRecordSyncState setLastCleanDate:](self, "setLastCleanDate:");
  }
  lastDirtyDate = self->_lastDirtyDate;
  v8 = *((_QWORD *)a3 + 2);
  if (lastDirtyDate)
  {
    if (v8)
      -[NTPBDate mergeFrom:](lastDirtyDate, "mergeFrom:");
  }
  else if (v8)
  {
    -[NTPBPrivateRecordSyncState setLastDirtyDate:](self, "setLastDirtyDate:");
  }
}

- (NSString)recordName
{
  return self->_recordName;
}

- (void)setRecordName:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 24);
}

- (NSString)recordZoneName
{
  return self->_recordZoneName;
}

- (void)setRecordZoneName:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 32);
}

- (NTPBDate)lastCleanDate
{
  return self->_lastCleanDate;
}

- (void)setLastCleanDate:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 8);
}

- (NTPBDate)lastDirtyDate
{
  return self->_lastDirtyDate;
}

- (void)setLastDirtyDate:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 16);
}

@end
