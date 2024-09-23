@implementation BLTPBHandleSupplementaryActionRequest

- (BOOL)hasIdentifier
{
  return self->_identifier != 0;
}

- (BOOL)hasPublisherBulletinID
{
  return self->_publisherBulletinID != 0;
}

- (BOOL)hasRecordID
{
  return self->_recordID != 0;
}

- (BOOL)hasSectionID
{
  return self->_sectionID != 0;
}

- (BOOL)hasActionInfo
{
  return self->_actionInfo != 0;
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
  v8.super_class = (Class)BLTPBHandleSupplementaryActionRequest;
  -[BLTPBHandleSupplementaryActionRequest description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[BLTPBHandleSupplementaryActionRequest dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;
  NSString *identifier;
  NSString *publisherBulletinID;
  NSString *recordID;
  NSString *sectionID;
  BLTPBActionInformation *actionInfo;
  void *v10;

  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  identifier = self->_identifier;
  if (identifier)
    objc_msgSend(v3, "setObject:forKey:", identifier, CFSTR("identifier"));
  publisherBulletinID = self->_publisherBulletinID;
  if (publisherBulletinID)
    objc_msgSend(v4, "setObject:forKey:", publisherBulletinID, CFSTR("publisherBulletinID"));
  recordID = self->_recordID;
  if (recordID)
    objc_msgSend(v4, "setObject:forKey:", recordID, CFSTR("recordID"));
  sectionID = self->_sectionID;
  if (sectionID)
    objc_msgSend(v4, "setObject:forKey:", sectionID, CFSTR("sectionID"));
  actionInfo = self->_actionInfo;
  if (actionInfo)
  {
    -[BLTPBActionInformation dictionaryRepresentation](actionInfo, "dictionaryRepresentation");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v10, CFSTR("actionInfo"));

  }
  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return BLTPBHandleSupplementaryActionRequestReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = v4;
  if (self->_identifier)
  {
    PBDataWriterWriteStringField();
    v4 = v5;
  }
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
  if (self->_sectionID)
  {
    PBDataWriterWriteStringField();
    v4 = v5;
  }
  if (self->_actionInfo)
  {
    PBDataWriterWriteSubmessage();
    v4 = v5;
  }

}

- (void)copyTo:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = v4;
  if (self->_identifier)
  {
    objc_msgSend(v4, "setIdentifier:");
    v4 = v5;
  }
  if (self->_publisherBulletinID)
  {
    objc_msgSend(v5, "setPublisherBulletinID:");
    v4 = v5;
  }
  if (self->_recordID)
  {
    objc_msgSend(v5, "setRecordID:");
    v4 = v5;
  }
  if (self->_sectionID)
  {
    objc_msgSend(v5, "setSectionID:");
    v4 = v5;
  }
  if (self->_actionInfo)
  {
    objc_msgSend(v5, "setActionInfo:");
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
  uint64_t v10;
  void *v11;
  uint64_t v12;
  void *v13;
  id v14;
  void *v15;

  v5 = (_QWORD *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = -[NSString copyWithZone:](self->_identifier, "copyWithZone:", a3);
  v7 = (void *)v5[2];
  v5[2] = v6;

  v8 = -[NSString copyWithZone:](self->_publisherBulletinID, "copyWithZone:", a3);
  v9 = (void *)v5[3];
  v5[3] = v8;

  v10 = -[NSString copyWithZone:](self->_recordID, "copyWithZone:", a3);
  v11 = (void *)v5[4];
  v5[4] = v10;

  v12 = -[NSString copyWithZone:](self->_sectionID, "copyWithZone:", a3);
  v13 = (void *)v5[5];
  v5[5] = v12;

  v14 = -[BLTPBActionInformation copyWithZone:](self->_actionInfo, "copyWithZone:", a3);
  v15 = (void *)v5[1];
  v5[1] = v14;

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  _QWORD *v4;
  NSString *identifier;
  NSString *publisherBulletinID;
  NSString *recordID;
  NSString *sectionID;
  BLTPBActionInformation *actionInfo;
  char v10;

  v4 = a3;
  if (objc_msgSend(v4, "isMemberOfClass:", objc_opt_class())
    && ((identifier = self->_identifier, !((unint64_t)identifier | v4[2]))
     || -[NSString isEqual:](identifier, "isEqual:"))
    && ((publisherBulletinID = self->_publisherBulletinID, !((unint64_t)publisherBulletinID | v4[3]))
     || -[NSString isEqual:](publisherBulletinID, "isEqual:"))
    && ((recordID = self->_recordID, !((unint64_t)recordID | v4[4]))
     || -[NSString isEqual:](recordID, "isEqual:"))
    && ((sectionID = self->_sectionID, !((unint64_t)sectionID | v4[5]))
     || -[NSString isEqual:](sectionID, "isEqual:")))
  {
    actionInfo = self->_actionInfo;
    if ((unint64_t)actionInfo | v4[1])
      v10 = -[BLTPBActionInformation isEqual:](actionInfo, "isEqual:");
    else
      v10 = 1;
  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (unint64_t)hash
{
  NSUInteger v3;
  NSUInteger v4;
  NSUInteger v5;
  NSUInteger v6;

  v3 = -[NSString hash](self->_identifier, "hash");
  v4 = -[NSString hash](self->_publisherBulletinID, "hash") ^ v3;
  v5 = -[NSString hash](self->_recordID, "hash");
  v6 = v4 ^ v5 ^ -[NSString hash](self->_sectionID, "hash");
  return v6 ^ -[BLTPBActionInformation hash](self->_actionInfo, "hash");
}

- (void)mergeFrom:(id)a3
{
  BLTPBActionInformation *actionInfo;
  uint64_t v5;
  _QWORD *v6;

  v6 = a3;
  if (v6[2])
    -[BLTPBHandleSupplementaryActionRequest setIdentifier:](self, "setIdentifier:");
  if (v6[3])
    -[BLTPBHandleSupplementaryActionRequest setPublisherBulletinID:](self, "setPublisherBulletinID:");
  if (v6[4])
    -[BLTPBHandleSupplementaryActionRequest setRecordID:](self, "setRecordID:");
  if (v6[5])
    -[BLTPBHandleSupplementaryActionRequest setSectionID:](self, "setSectionID:");
  actionInfo = self->_actionInfo;
  v5 = v6[1];
  if (actionInfo)
  {
    if (v5)
      -[BLTPBActionInformation mergeFrom:](actionInfo, "mergeFrom:");
  }
  else if (v5)
  {
    -[BLTPBHandleSupplementaryActionRequest setActionInfo:](self, "setActionInfo:");
  }

}

- (NSString)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_identifier, a3);
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

- (NSString)sectionID
{
  return self->_sectionID;
}

- (void)setSectionID:(id)a3
{
  objc_storeStrong((id *)&self->_sectionID, a3);
}

- (BLTPBActionInformation)actionInfo
{
  return self->_actionInfo;
}

- (void)setActionInfo:(id)a3
{
  objc_storeStrong((id *)&self->_actionInfo, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sectionID, 0);
  objc_storeStrong((id *)&self->_recordID, 0);
  objc_storeStrong((id *)&self->_publisherBulletinID, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_actionInfo, 0);
}

@end
