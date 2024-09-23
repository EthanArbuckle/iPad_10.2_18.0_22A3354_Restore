@implementation NPKProtoCommutePlanReminderForCommutePlanAndPassRequest

- (BOOL)hasUniqueID
{
  return self->_uniqueID != 0;
}

- (BOOL)hasCommutePlanBytes
{
  return self->_commutePlanBytes != 0;
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
  v8.super_class = (Class)NPKProtoCommutePlanReminderForCommutePlanAndPassRequest;
  -[NPKProtoCommutePlanReminderForCommutePlanAndPassRequest description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[NPKProtoCommutePlanReminderForCommutePlanAndPassRequest dictionaryRepresentation](self, "dictionaryRepresentation");
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

  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  uniqueID = self->_uniqueID;
  if (uniqueID)
    objc_msgSend(v3, "setObject:forKey:", uniqueID, CFSTR("uniqueID"));
  commutePlanBytes = self->_commutePlanBytes;
  if (commutePlanBytes)
    objc_msgSend(v4, "setObject:forKey:", commutePlanBytes, CFSTR("commutePlanBytes"));
  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return NPKProtoCommutePlanReminderForCommutePlanAndPassRequestReadFrom((uint64_t)self, (uint64_t)a3);
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

}

- (id)copyWithZone:(_NSZone *)a3
{
  _QWORD *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;

  v5 = (_QWORD *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = -[NSString copyWithZone:](self->_uniqueID, "copyWithZone:", a3);
  v7 = (void *)v5[2];
  v5[2] = v6;

  v8 = -[NSData copyWithZone:](self->_commutePlanBytes, "copyWithZone:", a3);
  v9 = (void *)v5[1];
  v5[1] = v8;

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  _QWORD *v4;
  NSString *uniqueID;
  NSData *commutePlanBytes;
  char v7;

  v4 = a3;
  if (objc_msgSend(v4, "isMemberOfClass:", objc_opt_class())
    && ((uniqueID = self->_uniqueID, !((unint64_t)uniqueID | v4[2]))
     || -[NSString isEqual:](uniqueID, "isEqual:")))
  {
    commutePlanBytes = self->_commutePlanBytes;
    if ((unint64_t)commutePlanBytes | v4[1])
      v7 = -[NSData isEqual:](commutePlanBytes, "isEqual:");
    else
      v7 = 1;
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (unint64_t)hash
{
  NSUInteger v3;

  v3 = -[NSString hash](self->_uniqueID, "hash");
  return -[NSData hash](self->_commutePlanBytes, "hash") ^ v3;
}

- (void)mergeFrom:(id)a3
{
  _QWORD *v4;
  _QWORD *v5;

  v4 = a3;
  v5 = v4;
  if (v4[2])
  {
    -[NPKProtoCommutePlanReminderForCommutePlanAndPassRequest setUniqueID:](self, "setUniqueID:");
    v4 = v5;
  }
  if (v4[1])
  {
    -[NPKProtoCommutePlanReminderForCommutePlanAndPassRequest setCommutePlanBytes:](self, "setCommutePlanBytes:");
    v4 = v5;
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

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_uniqueID, 0);
  objc_storeStrong((id *)&self->_commutePlanBytes, 0);
}

@end
