@implementation NTPBPrivateZoneSyncState

- (void)dealloc
{
  objc_super v3;

  -[NTPBPrivateZoneSyncState setZoneName:](self, "setZoneName:", 0);
  -[NTPBPrivateZoneSyncState setChangeToken:](self, "setChangeToken:", 0);
  -[NTPBPrivateZoneSyncState setLastCleanDate:](self, "setLastCleanDate:", 0);
  -[NTPBPrivateZoneSyncState setLastDirtyDate:](self, "setLastDirtyDate:", 0);
  v3.receiver = self;
  v3.super_class = (Class)NTPBPrivateZoneSyncState;
  -[NTPBPrivateZoneSyncState dealloc](&v3, sel_dealloc);
}

- (BOOL)hasZoneName
{
  return self->_zoneName != 0;
}

- (BOOL)hasChangeToken
{
  return self->_changeToken != 0;
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
  v3.super_class = (Class)NTPBPrivateZoneSyncState;
  return (id)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@ %@"), -[NTPBPrivateZoneSyncState description](&v3, sel_description), -[NTPBPrivateZoneSyncState dictionaryRepresentation](self, "dictionaryRepresentation"));
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;
  NSString *zoneName;
  NSData *changeToken;
  NTPBDate *lastCleanDate;
  NTPBDate *lastDirtyDate;

  v3 = (void *)objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v4 = v3;
  zoneName = self->_zoneName;
  if (zoneName)
    objc_msgSend(v3, "setObject:forKey:", zoneName, CFSTR("zone_name"));
  changeToken = self->_changeToken;
  if (changeToken)
    objc_msgSend(v4, "setObject:forKey:", changeToken, CFSTR("change_token"));
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
  return NTPBPrivateZoneSyncStateReadFrom((id *)&self->super.super.isa, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  if (self->_zoneName)
    PBDataWriterWriteStringField();
  if (self->_changeToken)
    PBDataWriterWriteDataField();
  if (self->_lastCleanDate)
    PBDataWriterWriteSubmessage();
  if (self->_lastDirtyDate)
    PBDataWriterWriteSubmessage();
}

- (id)copyWithZone:(_NSZone *)a3
{
  id *v5;

  v5 = (id *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");

  v5[4] = (id)-[NSString copyWithZone:](self->_zoneName, "copyWithZone:", a3);
  v5[1] = (id)-[NSData copyWithZone:](self->_changeToken, "copyWithZone:", a3);

  v5[2] = -[NTPBDate copyWithZone:](self->_lastCleanDate, "copyWithZone:", a3);
  v5[3] = -[NTPBDate copyWithZone:](self->_lastDirtyDate, "copyWithZone:", a3);
  return v5;
}

- (BOOL)isEqual:(id)a3
{
  int v5;
  NSString *zoneName;
  NSData *changeToken;
  NTPBDate *lastCleanDate;
  NTPBDate *lastDirtyDate;

  v5 = objc_msgSend(a3, "isMemberOfClass:", objc_opt_class());
  if (v5)
  {
    zoneName = self->_zoneName;
    if (!((unint64_t)zoneName | *((_QWORD *)a3 + 4)) || (v5 = -[NSString isEqual:](zoneName, "isEqual:")) != 0)
    {
      changeToken = self->_changeToken;
      if (!((unint64_t)changeToken | *((_QWORD *)a3 + 1))
        || (v5 = -[NSData isEqual:](changeToken, "isEqual:")) != 0)
      {
        lastCleanDate = self->_lastCleanDate;
        if (!((unint64_t)lastCleanDate | *((_QWORD *)a3 + 2))
          || (v5 = -[NTPBDate isEqual:](lastCleanDate, "isEqual:")) != 0)
        {
          lastDirtyDate = self->_lastDirtyDate;
          if ((unint64_t)lastDirtyDate | *((_QWORD *)a3 + 3))
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
  uint64_t v4;
  unint64_t v5;

  v3 = -[NSString hash](self->_zoneName, "hash");
  v4 = -[NSData hash](self->_changeToken, "hash") ^ v3;
  v5 = -[NTPBDate hash](self->_lastCleanDate, "hash");
  return v4 ^ v5 ^ -[NTPBDate hash](self->_lastDirtyDate, "hash");
}

- (void)mergeFrom:(id)a3
{
  NTPBDate *lastCleanDate;
  uint64_t v6;
  NTPBDate *lastDirtyDate;
  uint64_t v8;

  if (*((_QWORD *)a3 + 4))
    -[NTPBPrivateZoneSyncState setZoneName:](self, "setZoneName:");
  if (*((_QWORD *)a3 + 1))
    -[NTPBPrivateZoneSyncState setChangeToken:](self, "setChangeToken:");
  lastCleanDate = self->_lastCleanDate;
  v6 = *((_QWORD *)a3 + 2);
  if (lastCleanDate)
  {
    if (v6)
      -[NTPBDate mergeFrom:](lastCleanDate, "mergeFrom:");
  }
  else if (v6)
  {
    -[NTPBPrivateZoneSyncState setLastCleanDate:](self, "setLastCleanDate:");
  }
  lastDirtyDate = self->_lastDirtyDate;
  v8 = *((_QWORD *)a3 + 3);
  if (lastDirtyDate)
  {
    if (v8)
      -[NTPBDate mergeFrom:](lastDirtyDate, "mergeFrom:");
  }
  else if (v8)
  {
    -[NTPBPrivateZoneSyncState setLastDirtyDate:](self, "setLastDirtyDate:");
  }
}

- (NSString)zoneName
{
  return self->_zoneName;
}

- (void)setZoneName:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 32);
}

- (NSData)changeToken
{
  return self->_changeToken;
}

- (void)setChangeToken:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 8);
}

- (NTPBDate)lastCleanDate
{
  return self->_lastCleanDate;
}

- (void)setLastCleanDate:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 16);
}

- (NTPBDate)lastDirtyDate
{
  return self->_lastDirtyDate;
}

- (void)setLastDirtyDate:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 24);
}

@end
