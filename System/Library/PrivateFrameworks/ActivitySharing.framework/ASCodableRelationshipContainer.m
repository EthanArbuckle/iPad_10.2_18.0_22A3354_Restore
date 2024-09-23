@implementation ASCodableRelationshipContainer

- (BOOL)hasRelationship
{
  return self->_relationship != 0;
}

- (void)setVersion:(int64_t)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_version = a3;
}

- (void)setHasVersion:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (BOOL)hasVersion
{
  return *(_BYTE *)&self->_has & 1;
}

- (BOOL)hasSystemFieldsOnlyRecord
{
  return self->_systemFieldsOnlyRecord != 0;
}

- (BOOL)hasRelationshipShareID
{
  return self->_relationshipShareID != 0;
}

- (BOOL)hasRemoteRelationshipShareID
{
  return self->_remoteRelationshipShareID != 0;
}

- (BOOL)hasRemoteActivityShareID
{
  return self->_remoteActivityShareID != 0;
}

- (BOOL)hasRelationshipZoneShareID
{
  return self->_relationshipZoneShareID != 0;
}

- (BOOL)hasRemoteRelationshipZoneShareID
{
  return self->_remoteRelationshipZoneShareID != 0;
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
  v8.super_class = (Class)ASCodableRelationshipContainer;
  -[ASCodableRelationshipContainer description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[ASCodableRelationshipContainer dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  ASCodableCloudKitRelationship *relationship;
  void *v5;
  void *v6;
  NSData *systemFieldsOnlyRecord;
  NSData *relationshipShareID;
  NSData *remoteRelationshipShareID;
  NSData *remoteActivityShareID;
  NSData *relationshipZoneShareID;
  NSData *remoteRelationshipZoneShareID;

  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  relationship = self->_relationship;
  if (relationship)
  {
    -[ASCodableCloudKitRelationship dictionaryRepresentation](relationship, "dictionaryRepresentation");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v5, CFSTR("relationship"));

  }
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithLongLong:", self->_version);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v6, CFSTR("version"));

  }
  systemFieldsOnlyRecord = self->_systemFieldsOnlyRecord;
  if (systemFieldsOnlyRecord)
    objc_msgSend(v3, "setObject:forKey:", systemFieldsOnlyRecord, CFSTR("systemFieldsOnlyRecord"));
  relationshipShareID = self->_relationshipShareID;
  if (relationshipShareID)
    objc_msgSend(v3, "setObject:forKey:", relationshipShareID, CFSTR("relationshipShareID"));
  remoteRelationshipShareID = self->_remoteRelationshipShareID;
  if (remoteRelationshipShareID)
    objc_msgSend(v3, "setObject:forKey:", remoteRelationshipShareID, CFSTR("remoteRelationshipShareID"));
  remoteActivityShareID = self->_remoteActivityShareID;
  if (remoteActivityShareID)
    objc_msgSend(v3, "setObject:forKey:", remoteActivityShareID, CFSTR("remoteActivityShareID"));
  relationshipZoneShareID = self->_relationshipZoneShareID;
  if (relationshipZoneShareID)
    objc_msgSend(v3, "setObject:forKey:", relationshipZoneShareID, CFSTR("relationshipZoneShareID"));
  remoteRelationshipZoneShareID = self->_remoteRelationshipZoneShareID;
  if (remoteRelationshipZoneShareID)
    objc_msgSend(v3, "setObject:forKey:", remoteRelationshipZoneShareID, CFSTR("remoteRelationshipZoneShareID"));
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return ASCodableRelationshipContainerReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = v4;
  if (self->_relationship)
  {
    PBDataWriterWriteSubmessage();
    v4 = v5;
  }
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    PBDataWriterWriteInt64Field();
    v4 = v5;
  }
  if (self->_systemFieldsOnlyRecord)
  {
    PBDataWriterWriteDataField();
    v4 = v5;
  }
  if (self->_relationshipShareID)
  {
    PBDataWriterWriteDataField();
    v4 = v5;
  }
  if (self->_remoteRelationshipShareID)
  {
    PBDataWriterWriteDataField();
    v4 = v5;
  }
  if (self->_remoteActivityShareID)
  {
    PBDataWriterWriteDataField();
    v4 = v5;
  }
  if (self->_relationshipZoneShareID)
  {
    PBDataWriterWriteDataField();
    v4 = v5;
  }
  if (self->_remoteRelationshipZoneShareID)
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
  if (self->_relationship)
  {
    objc_msgSend(v4, "setRelationship:");
    v4 = v5;
  }
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    *((_QWORD *)v4 + 1) = self->_version;
    *((_BYTE *)v4 + 72) |= 1u;
  }
  if (self->_systemFieldsOnlyRecord)
  {
    objc_msgSend(v5, "setSystemFieldsOnlyRecord:");
    v4 = v5;
  }
  if (self->_relationshipShareID)
  {
    objc_msgSend(v5, "setRelationshipShareID:");
    v4 = v5;
  }
  if (self->_remoteRelationshipShareID)
  {
    objc_msgSend(v5, "setRemoteRelationshipShareID:");
    v4 = v5;
  }
  if (self->_remoteActivityShareID)
  {
    objc_msgSend(v5, "setRemoteActivityShareID:");
    v4 = v5;
  }
  if (self->_relationshipZoneShareID)
  {
    objc_msgSend(v5, "setRelationshipZoneShareID:");
    v4 = v5;
  }
  if (self->_remoteRelationshipZoneShareID)
  {
    objc_msgSend(v5, "setRemoteRelationshipZoneShareID:");
    v4 = v5;
  }

}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5;
  id v6;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  void *v19;

  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = -[ASCodableCloudKitRelationship copyWithZone:](self->_relationship, "copyWithZone:", a3);
  v7 = *(void **)(v5 + 16);
  *(_QWORD *)(v5 + 16) = v6;

  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    *(_QWORD *)(v5 + 8) = self->_version;
    *(_BYTE *)(v5 + 72) |= 1u;
  }
  v8 = -[NSData copyWithZone:](self->_systemFieldsOnlyRecord, "copyWithZone:", a3);
  v9 = *(void **)(v5 + 64);
  *(_QWORD *)(v5 + 64) = v8;

  v10 = -[NSData copyWithZone:](self->_relationshipShareID, "copyWithZone:", a3);
  v11 = *(void **)(v5 + 24);
  *(_QWORD *)(v5 + 24) = v10;

  v12 = -[NSData copyWithZone:](self->_remoteRelationshipShareID, "copyWithZone:", a3);
  v13 = *(void **)(v5 + 48);
  *(_QWORD *)(v5 + 48) = v12;

  v14 = -[NSData copyWithZone:](self->_remoteActivityShareID, "copyWithZone:", a3);
  v15 = *(void **)(v5 + 40);
  *(_QWORD *)(v5 + 40) = v14;

  v16 = -[NSData copyWithZone:](self->_relationshipZoneShareID, "copyWithZone:", a3);
  v17 = *(void **)(v5 + 32);
  *(_QWORD *)(v5 + 32) = v16;

  v18 = -[NSData copyWithZone:](self->_remoteRelationshipZoneShareID, "copyWithZone:", a3);
  v19 = *(void **)(v5 + 56);
  *(_QWORD *)(v5 + 56) = v18;

  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  ASCodableCloudKitRelationship *relationship;
  NSData *systemFieldsOnlyRecord;
  NSData *relationshipShareID;
  NSData *remoteRelationshipShareID;
  NSData *remoteActivityShareID;
  NSData *relationshipZoneShareID;
  NSData *remoteRelationshipZoneShareID;
  char v12;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_21;
  relationship = self->_relationship;
  if ((unint64_t)relationship | *((_QWORD *)v4 + 2))
  {
    if (!-[ASCodableCloudKitRelationship isEqual:](relationship, "isEqual:"))
      goto LABEL_21;
  }
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 72) & 1) == 0 || self->_version != *((_QWORD *)v4 + 1))
      goto LABEL_21;
  }
  else if ((*((_BYTE *)v4 + 72) & 1) != 0)
  {
LABEL_21:
    v12 = 0;
    goto LABEL_22;
  }
  systemFieldsOnlyRecord = self->_systemFieldsOnlyRecord;
  if ((unint64_t)systemFieldsOnlyRecord | *((_QWORD *)v4 + 8)
    && !-[NSData isEqual:](systemFieldsOnlyRecord, "isEqual:"))
  {
    goto LABEL_21;
  }
  relationshipShareID = self->_relationshipShareID;
  if ((unint64_t)relationshipShareID | *((_QWORD *)v4 + 3))
  {
    if (!-[NSData isEqual:](relationshipShareID, "isEqual:"))
      goto LABEL_21;
  }
  remoteRelationshipShareID = self->_remoteRelationshipShareID;
  if ((unint64_t)remoteRelationshipShareID | *((_QWORD *)v4 + 6))
  {
    if (!-[NSData isEqual:](remoteRelationshipShareID, "isEqual:"))
      goto LABEL_21;
  }
  remoteActivityShareID = self->_remoteActivityShareID;
  if ((unint64_t)remoteActivityShareID | *((_QWORD *)v4 + 5))
  {
    if (!-[NSData isEqual:](remoteActivityShareID, "isEqual:"))
      goto LABEL_21;
  }
  relationshipZoneShareID = self->_relationshipZoneShareID;
  if ((unint64_t)relationshipZoneShareID | *((_QWORD *)v4 + 4))
  {
    if (!-[NSData isEqual:](relationshipZoneShareID, "isEqual:"))
      goto LABEL_21;
  }
  remoteRelationshipZoneShareID = self->_remoteRelationshipZoneShareID;
  if ((unint64_t)remoteRelationshipZoneShareID | *((_QWORD *)v4 + 7))
    v12 = -[NSData isEqual:](remoteRelationshipZoneShareID, "isEqual:");
  else
    v12 = 1;
LABEL_22:

  return v12;
}

- (unint64_t)hash
{
  unint64_t v3;
  uint64_t v4;
  unint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  v3 = -[ASCodableCloudKitRelationship hash](self->_relationship, "hash");
  if ((*(_BYTE *)&self->_has & 1) != 0)
    v4 = 2654435761 * self->_version;
  else
    v4 = 0;
  v5 = v4 ^ v3;
  v6 = -[NSData hash](self->_systemFieldsOnlyRecord, "hash");
  v7 = v5 ^ v6 ^ -[NSData hash](self->_relationshipShareID, "hash");
  v8 = -[NSData hash](self->_remoteRelationshipShareID, "hash");
  v9 = v8 ^ -[NSData hash](self->_remoteActivityShareID, "hash");
  v10 = v7 ^ v9 ^ -[NSData hash](self->_relationshipZoneShareID, "hash");
  return v10 ^ -[NSData hash](self->_remoteRelationshipZoneShareID, "hash");
}

- (void)mergeFrom:(id)a3
{
  _QWORD *v4;
  ASCodableCloudKitRelationship *relationship;
  uint64_t v6;
  _QWORD *v7;

  v4 = a3;
  relationship = self->_relationship;
  v6 = v4[2];
  v7 = v4;
  if (relationship)
  {
    if (!v6)
      goto LABEL_7;
    -[ASCodableCloudKitRelationship mergeFrom:](relationship, "mergeFrom:");
  }
  else
  {
    if (!v6)
      goto LABEL_7;
    -[ASCodableRelationshipContainer setRelationship:](self, "setRelationship:");
  }
  v4 = v7;
LABEL_7:
  if ((v4[9] & 1) != 0)
  {
    self->_version = v4[1];
    *(_BYTE *)&self->_has |= 1u;
  }
  if (v4[8])
  {
    -[ASCodableRelationshipContainer setSystemFieldsOnlyRecord:](self, "setSystemFieldsOnlyRecord:");
    v4 = v7;
  }
  if (v4[3])
  {
    -[ASCodableRelationshipContainer setRelationshipShareID:](self, "setRelationshipShareID:");
    v4 = v7;
  }
  if (v4[6])
  {
    -[ASCodableRelationshipContainer setRemoteRelationshipShareID:](self, "setRemoteRelationshipShareID:");
    v4 = v7;
  }
  if (v4[5])
  {
    -[ASCodableRelationshipContainer setRemoteActivityShareID:](self, "setRemoteActivityShareID:");
    v4 = v7;
  }
  if (v4[4])
  {
    -[ASCodableRelationshipContainer setRelationshipZoneShareID:](self, "setRelationshipZoneShareID:");
    v4 = v7;
  }
  if (v4[7])
  {
    -[ASCodableRelationshipContainer setRemoteRelationshipZoneShareID:](self, "setRemoteRelationshipZoneShareID:");
    v4 = v7;
  }

}

- (ASCodableCloudKitRelationship)relationship
{
  return self->_relationship;
}

- (void)setRelationship:(id)a3
{
  objc_storeStrong((id *)&self->_relationship, a3);
}

- (int64_t)version
{
  return self->_version;
}

- (NSData)systemFieldsOnlyRecord
{
  return self->_systemFieldsOnlyRecord;
}

- (void)setSystemFieldsOnlyRecord:(id)a3
{
  objc_storeStrong((id *)&self->_systemFieldsOnlyRecord, a3);
}

- (NSData)relationshipShareID
{
  return self->_relationshipShareID;
}

- (void)setRelationshipShareID:(id)a3
{
  objc_storeStrong((id *)&self->_relationshipShareID, a3);
}

- (NSData)remoteRelationshipShareID
{
  return self->_remoteRelationshipShareID;
}

- (void)setRemoteRelationshipShareID:(id)a3
{
  objc_storeStrong((id *)&self->_remoteRelationshipShareID, a3);
}

- (NSData)remoteActivityShareID
{
  return self->_remoteActivityShareID;
}

- (void)setRemoteActivityShareID:(id)a3
{
  objc_storeStrong((id *)&self->_remoteActivityShareID, a3);
}

- (NSData)relationshipZoneShareID
{
  return self->_relationshipZoneShareID;
}

- (void)setRelationshipZoneShareID:(id)a3
{
  objc_storeStrong((id *)&self->_relationshipZoneShareID, a3);
}

- (NSData)remoteRelationshipZoneShareID
{
  return self->_remoteRelationshipZoneShareID;
}

- (void)setRemoteRelationshipZoneShareID:(id)a3
{
  objc_storeStrong((id *)&self->_remoteRelationshipZoneShareID, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_systemFieldsOnlyRecord, 0);
  objc_storeStrong((id *)&self->_remoteRelationshipZoneShareID, 0);
  objc_storeStrong((id *)&self->_remoteRelationshipShareID, 0);
  objc_storeStrong((id *)&self->_remoteActivityShareID, 0);
  objc_storeStrong((id *)&self->_relationshipZoneShareID, 0);
  objc_storeStrong((id *)&self->_relationshipShareID, 0);
  objc_storeStrong((id *)&self->_relationship, 0);
}

@end
