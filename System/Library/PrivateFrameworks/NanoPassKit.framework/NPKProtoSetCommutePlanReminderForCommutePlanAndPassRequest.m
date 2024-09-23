@implementation NPKProtoSetCommutePlanReminderForCommutePlanAndPassRequest

- (BOOL)hasUniqueID
{
  return self->_uniqueID != 0;
}

- (BOOL)hasCommutePlanBytes
{
  return self->_commutePlanBytes != 0;
}

- (void)setReminderInterval:(double)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_reminderInterval = a3;
}

- (void)setHasReminderInterval:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (BOOL)hasReminderInterval
{
  return *(_BYTE *)&self->_has & 1;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v8;

  v3 = (void *)MEMORY[0x24BDD17C8];
  v8.receiver = self;
  v8.super_class = (Class)NPKProtoSetCommutePlanReminderForCommutePlanAndPassRequest;
  -[NPKProtoSetCommutePlanReminderForCommutePlanAndPassRequest description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[NPKProtoSetCommutePlanReminderForCommutePlanAndPassRequest dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;
  NSString *uniqueID;
  NSData *commutePlanBytes;
  void *v7;

  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  uniqueID = self->_uniqueID;
  if (uniqueID)
    objc_msgSend(v3, "setObject:forKey:", uniqueID, CFSTR("uniqueID"));
  commutePlanBytes = self->_commutePlanBytes;
  if (commutePlanBytes)
    objc_msgSend(v4, "setObject:forKey:", commutePlanBytes, CFSTR("commutePlanBytes"));
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", self->_reminderInterval);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v7, CFSTR("reminderInterval"));

  }
  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return NPKProtoSetCommutePlanReminderForCommutePlanAndPassRequestReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = v4;
  if (self->_uniqueID)
  {
    PBDataWriterWriteStringField();
    v4 = v5;
  }
  if (self->_commutePlanBytes)
  {
    PBDataWriterWriteDataField();
    v4 = v5;
  }
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    PBDataWriterWriteDoubleField();
    v4 = v5;
  }

}

- (void)copyTo:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = v4;
  if (self->_uniqueID)
  {
    objc_msgSend(v4, "setUniqueID:");
    v4 = v5;
  }
  if (self->_commutePlanBytes)
  {
    objc_msgSend(v5, "setCommutePlanBytes:");
    v4 = v5;
  }
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    *((_QWORD *)v4 + 1) = *(_QWORD *)&self->_reminderInterval;
    *((_BYTE *)v4 + 32) |= 1u;
  }

}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;

  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = -[NSString copyWithZone:](self->_uniqueID, "copyWithZone:", a3);
  v7 = *(void **)(v5 + 24);
  *(_QWORD *)(v5 + 24) = v6;

  v8 = -[NSData copyWithZone:](self->_commutePlanBytes, "copyWithZone:", a3);
  v9 = *(void **)(v5 + 16);
  *(_QWORD *)(v5 + 16) = v8;

  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    *(double *)(v5 + 8) = self->_reminderInterval;
    *(_BYTE *)(v5 + 32) |= 1u;
  }
  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  NSString *uniqueID;
  NSData *commutePlanBytes;
  BOOL v7;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_10;
  uniqueID = self->_uniqueID;
  if ((unint64_t)uniqueID | *((_QWORD *)v4 + 3))
  {
    if (!-[NSString isEqual:](uniqueID, "isEqual:"))
      goto LABEL_10;
  }
  commutePlanBytes = self->_commutePlanBytes;
  if ((unint64_t)commutePlanBytes | *((_QWORD *)v4 + 2))
  {
    if (!-[NSData isEqual:](commutePlanBytes, "isEqual:"))
      goto LABEL_10;
  }
  v7 = (*((_BYTE *)v4 + 32) & 1) == 0;
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 32) & 1) != 0 && self->_reminderInterval == *((double *)v4 + 1))
    {
      v7 = 1;
      goto LABEL_11;
    }
LABEL_10:
    v7 = 0;
  }
LABEL_11:

  return v7;
}

- (unint64_t)hash
{
  NSUInteger v3;
  uint64_t v4;
  unint64_t v5;
  double reminderInterval;
  double v7;
  long double v8;
  double v9;

  v3 = -[NSString hash](self->_uniqueID, "hash");
  v4 = -[NSData hash](self->_commutePlanBytes, "hash");
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    reminderInterval = self->_reminderInterval;
    v7 = -reminderInterval;
    if (reminderInterval >= 0.0)
      v7 = self->_reminderInterval;
    v8 = floor(v7 + 0.5);
    v9 = (v7 - v8) * 1.84467441e19;
    v5 = 2654435761u * (unint64_t)fmod(v8, 1.84467441e19);
    if (v9 >= 0.0)
    {
      if (v9 > 0.0)
        v5 += (unint64_t)v9;
    }
    else
    {
      v5 -= (unint64_t)fabs(v9);
    }
  }
  else
  {
    v5 = 0;
  }
  return v4 ^ v3 ^ v5;
}

- (void)mergeFrom:(id)a3
{
  double *v4;
  double *v5;

  v4 = (double *)a3;
  v5 = v4;
  if (*((_QWORD *)v4 + 3))
  {
    -[NPKProtoSetCommutePlanReminderForCommutePlanAndPassRequest setUniqueID:](self, "setUniqueID:");
    v4 = v5;
  }
  if (*((_QWORD *)v4 + 2))
  {
    -[NPKProtoSetCommutePlanReminderForCommutePlanAndPassRequest setCommutePlanBytes:](self, "setCommutePlanBytes:");
    v4 = v5;
  }
  if (((_BYTE)v4[4] & 1) != 0)
  {
    self->_reminderInterval = v4[1];
    *(_BYTE *)&self->_has |= 1u;
  }

}

- (NSString)uniqueID
{
  return self->_uniqueID;
}

- (void)setUniqueID:(id)a3
{
  objc_storeStrong((id *)&self->_uniqueID, a3);
}

- (NSData)commutePlanBytes
{
  return self->_commutePlanBytes;
}

- (void)setCommutePlanBytes:(id)a3
{
  objc_storeStrong((id *)&self->_commutePlanBytes, a3);
}

- (double)reminderInterval
{
  return self->_reminderInterval;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_uniqueID, 0);
  objc_storeStrong((id *)&self->_commutePlanBytes, 0);
}

@end
