@implementation BLTPBBulletinIdentifier

- (BOOL)hasPublisherBulletinID
{
  return self->_publisherBulletinID != 0;
}

- (BOOL)hasRecordID
{
  return self->_recordID != 0;
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
  v8.super_class = (Class)BLTPBBulletinIdentifier;
  -[BLTPBBulletinIdentifier description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[BLTPBBulletinIdentifier dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;
  NSString *publisherBulletinID;
  NSString *recordID;

  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  publisherBulletinID = self->_publisherBulletinID;
  if (publisherBulletinID)
    objc_msgSend(v3, "setObject:forKey:", publisherBulletinID, CFSTR("publisherBulletinID"));
  recordID = self->_recordID;
  if (recordID)
    objc_msgSend(v4, "setObject:forKey:", recordID, CFSTR("recordID"));
  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return BLTPBBulletinIdentifierReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = v4;
  if (self->_publisherBulletinID)
  {
    PBDataWriterWriteStringField();
    v4 = v5;
  }
  if (self->_recordID)
  {
    PBDataWriterWriteStringField();
    v4 = v5;
  }

}

- (void)copyTo:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = v4;
  if (self->_publisherBulletinID)
  {
    objc_msgSend(v4, "setPublisherBulletinID:");
    v4 = v5;
  }
  if (self->_recordID)
  {
    objc_msgSend(v5, "setRecordID:");
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
  v6 = -[NSString copyWithZone:](self->_publisherBulletinID, "copyWithZone:", a3);
  v7 = (void *)v5[1];
  v5[1] = v6;

  v8 = -[NSString copyWithZone:](self->_recordID, "copyWithZone:", a3);
  v9 = (void *)v5[2];
  v5[2] = v8;

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  _QWORD *v4;
  NSString *publisherBulletinID;
  NSString *recordID;
  char v7;

  v4 = a3;
  if (objc_msgSend(v4, "isMemberOfClass:", objc_opt_class())
    && ((publisherBulletinID = self->_publisherBulletinID, !((unint64_t)publisherBulletinID | v4[1]))
     || -[NSString isEqual:](publisherBulletinID, "isEqual:")))
  {
    recordID = self->_recordID;
    if ((unint64_t)recordID | v4[2])
      v7 = -[NSString isEqual:](recordID, "isEqual:");
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

  v3 = -[NSString hash](self->_publisherBulletinID, "hash");
  return -[NSString hash](self->_recordID, "hash") ^ v3;
}

- (void)mergeFrom:(id)a3
{
  _QWORD *v4;
  _QWORD *v5;

  v4 = a3;
  v5 = v4;
  if (v4[1])
  {
    -[BLTPBBulletinIdentifier setPublisherBulletinID:](self, "setPublisherBulletinID:");
    v4 = v5;
  }
  if (v4[2])
  {
    -[BLTPBBulletinIdentifier setRecordID:](self, "setRecordID:");
    v4 = v5;
  }

}

- (NSString)publisherBulletinID
{
  return self->_publisherBulletinID;
}

- (void)setPublisherBulletinID:(id)a3
{
  objc_storeStrong((id *)&self->_publisherBulletinID, a3);
}

- (NSString)recordID
{
  return self->_recordID;
}

- (void)setRecordID:(id)a3
{
  objc_storeStrong((id *)&self->_recordID, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_recordID, 0);
  objc_storeStrong((id *)&self->_publisherBulletinID, 0);
}

@end
