@implementation BRServerInfoRecordInfo

- (BOOL)hasRecordID
{
  return self->_recordID != 0;
}

- (BOOL)hasEtag
{
  return self->_etag != 0;
}

- (BOOL)hasEncryptedBasename
{
  return self->_encryptedBasename != 0;
}

- (void)setBounceNo:(unint64_t)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_bounceNo = a3;
}

- (void)setHasBounceNo:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (BOOL)hasBounceNo
{
  return *(_BYTE *)&self->_has & 1;
}

- (BOOL)hasExtension
{
  return self->_extension != 0;
}

- (BOOL)hasRecordProtectionInfo
{
  return self->_recordProtectionInfo != 0;
}

- (BOOL)hasZoneName
{
  return self->_zoneName != 0;
}

- (BOOL)hasZoneProtectionInfo
{
  return self->_zoneProtectionInfo != 0;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v8;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v8.receiver = self;
  v8.super_class = (Class)BRServerInfoRecordInfo;
  -[BRServerInfoRecordInfo description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[BRServerInfoRecordInfo dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;
  NSString *recordID;
  NSString *etag;
  NSData *encryptedBasename;
  void *v8;
  NSString *extension;
  NSData *recordProtectionInfo;
  NSString *zoneName;
  NSData *zoneProtectionInfo;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  recordID = self->_recordID;
  if (recordID)
    objc_msgSend(v3, "setObject:forKey:", recordID, CFSTR("recordID"));
  etag = self->_etag;
  if (etag)
    objc_msgSend(v4, "setObject:forKey:", etag, CFSTR("etag"));
  encryptedBasename = self->_encryptedBasename;
  if (encryptedBasename)
    objc_msgSend(v4, "setObject:forKey:", encryptedBasename, CFSTR("encryptedBasename"));
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", self->_bounceNo);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v8, CFSTR("bounceNo"));

  }
  extension = self->_extension;
  if (extension)
    objc_msgSend(v4, "setObject:forKey:", extension, CFSTR("extension"));
  recordProtectionInfo = self->_recordProtectionInfo;
  if (recordProtectionInfo)
    objc_msgSend(v4, "setObject:forKey:", recordProtectionInfo, CFSTR("recordProtectionInfo"));
  zoneName = self->_zoneName;
  if (zoneName)
    objc_msgSend(v4, "setObject:forKey:", zoneName, CFSTR("zoneName"));
  zoneProtectionInfo = self->_zoneProtectionInfo;
  if (zoneProtectionInfo)
    objc_msgSend(v4, "setObject:forKey:", zoneProtectionInfo, CFSTR("zoneProtectionInfo"));
  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return BRServerInfoRecordInfoReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = v4;
  if (self->_recordID)
  {
    PBDataWriterWriteStringField();
    v4 = v5;
  }
  if (self->_etag)
  {
    PBDataWriterWriteStringField();
    v4 = v5;
  }
  if (self->_encryptedBasename)
  {
    PBDataWriterWriteDataField();
    v4 = v5;
  }
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    PBDataWriterWriteUint64Field();
    v4 = v5;
  }
  if (self->_extension)
  {
    PBDataWriterWriteStringField();
    v4 = v5;
  }
  if (self->_recordProtectionInfo)
  {
    PBDataWriterWriteDataField();
    v4 = v5;
  }
  if (self->_zoneName)
  {
    PBDataWriterWriteStringField();
    v4 = v5;
  }
  if (self->_zoneProtectionInfo)
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
  if (self->_recordID)
  {
    objc_msgSend(v4, "setRecordID:");
    v4 = v5;
  }
  if (self->_etag)
  {
    objc_msgSend(v5, "setEtag:");
    v4 = v5;
  }
  if (self->_encryptedBasename)
  {
    objc_msgSend(v5, "setEncryptedBasename:");
    v4 = v5;
  }
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    *((_QWORD *)v4 + 1) = self->_bounceNo;
    *((_BYTE *)v4 + 72) |= 1u;
  }
  if (self->_extension)
  {
    objc_msgSend(v5, "setExtension:");
    v4 = v5;
  }
  if (self->_recordProtectionInfo)
  {
    objc_msgSend(v5, "setRecordProtectionInfo:");
    v4 = v5;
  }
  if (self->_zoneName)
  {
    objc_msgSend(v5, "setZoneName:");
    v4 = v5;
  }
  if (self->_zoneProtectionInfo)
  {
    objc_msgSend(v5, "setZoneProtectionInfo:");
    v4 = v5;
  }

}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5;
  uint64_t v6;
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
  v6 = -[NSString copyWithZone:](self->_recordID, "copyWithZone:", a3);
  v7 = *(void **)(v5 + 40);
  *(_QWORD *)(v5 + 40) = v6;

  v8 = -[NSString copyWithZone:](self->_etag, "copyWithZone:", a3);
  v9 = *(void **)(v5 + 24);
  *(_QWORD *)(v5 + 24) = v8;

  v10 = -[NSData copyWithZone:](self->_encryptedBasename, "copyWithZone:", a3);
  v11 = *(void **)(v5 + 16);
  *(_QWORD *)(v5 + 16) = v10;

  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    *(_QWORD *)(v5 + 8) = self->_bounceNo;
    *(_BYTE *)(v5 + 72) |= 1u;
  }
  v12 = -[NSString copyWithZone:](self->_extension, "copyWithZone:", a3);
  v13 = *(void **)(v5 + 32);
  *(_QWORD *)(v5 + 32) = v12;

  v14 = -[NSData copyWithZone:](self->_recordProtectionInfo, "copyWithZone:", a3);
  v15 = *(void **)(v5 + 48);
  *(_QWORD *)(v5 + 48) = v14;

  v16 = -[NSString copyWithZone:](self->_zoneName, "copyWithZone:", a3);
  v17 = *(void **)(v5 + 56);
  *(_QWORD *)(v5 + 56) = v16;

  v18 = -[NSData copyWithZone:](self->_zoneProtectionInfo, "copyWithZone:", a3);
  v19 = *(void **)(v5 + 64);
  *(_QWORD *)(v5 + 64) = v18;

  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  NSString *recordID;
  NSString *etag;
  NSData *encryptedBasename;
  NSString *extension;
  NSData *recordProtectionInfo;
  NSString *zoneName;
  NSData *zoneProtectionInfo;
  char v12;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_21;
  recordID = self->_recordID;
  if ((unint64_t)recordID | *((_QWORD *)v4 + 5))
  {
    if (!-[NSString isEqual:](recordID, "isEqual:"))
      goto LABEL_21;
  }
  etag = self->_etag;
  if ((unint64_t)etag | *((_QWORD *)v4 + 3))
  {
    if (!-[NSString isEqual:](etag, "isEqual:"))
      goto LABEL_21;
  }
  encryptedBasename = self->_encryptedBasename;
  if ((unint64_t)encryptedBasename | *((_QWORD *)v4 + 2))
  {
    if (!-[NSData isEqual:](encryptedBasename, "isEqual:"))
      goto LABEL_21;
  }
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 72) & 1) == 0 || self->_bounceNo != *((_QWORD *)v4 + 1))
      goto LABEL_21;
  }
  else if ((*((_BYTE *)v4 + 72) & 1) != 0)
  {
LABEL_21:
    v12 = 0;
    goto LABEL_22;
  }
  extension = self->_extension;
  if ((unint64_t)extension | *((_QWORD *)v4 + 4) && !-[NSString isEqual:](extension, "isEqual:"))
    goto LABEL_21;
  recordProtectionInfo = self->_recordProtectionInfo;
  if ((unint64_t)recordProtectionInfo | *((_QWORD *)v4 + 6))
  {
    if (!-[NSData isEqual:](recordProtectionInfo, "isEqual:"))
      goto LABEL_21;
  }
  zoneName = self->_zoneName;
  if ((unint64_t)zoneName | *((_QWORD *)v4 + 7))
  {
    if (!-[NSString isEqual:](zoneName, "isEqual:"))
      goto LABEL_21;
  }
  zoneProtectionInfo = self->_zoneProtectionInfo;
  if ((unint64_t)zoneProtectionInfo | *((_QWORD *)v4 + 8))
    v12 = -[NSData isEqual:](zoneProtectionInfo, "isEqual:");
  else
    v12 = 1;
LABEL_22:

  return v12;
}

- (unint64_t)hash
{
  NSUInteger v3;
  NSUInteger v4;
  uint64_t v5;
  unint64_t v6;
  NSUInteger v7;
  NSUInteger v8;
  uint64_t v9;
  NSUInteger v10;

  v3 = -[NSString hash](self->_recordID, "hash");
  v4 = -[NSString hash](self->_etag, "hash");
  v5 = -[NSData hash](self->_encryptedBasename, "hash");
  if ((*(_BYTE *)&self->_has & 1) != 0)
    v6 = 2654435761u * self->_bounceNo;
  else
    v6 = 0;
  v7 = v4 ^ v3 ^ v5 ^ v6;
  v8 = -[NSString hash](self->_extension, "hash");
  v9 = v8 ^ -[NSData hash](self->_recordProtectionInfo, "hash");
  v10 = v7 ^ v9 ^ -[NSString hash](self->_zoneName, "hash");
  return v10 ^ -[NSData hash](self->_zoneProtectionInfo, "hash");
}

- (void)mergeFrom:(id)a3
{
  unint64_t *v4;
  unint64_t *v5;

  v4 = (unint64_t *)a3;
  v5 = v4;
  if (v4[5])
  {
    -[BRServerInfoRecordInfo setRecordID:](self, "setRecordID:");
    v4 = v5;
  }
  if (v4[3])
  {
    -[BRServerInfoRecordInfo setEtag:](self, "setEtag:");
    v4 = v5;
  }
  if (v4[2])
  {
    -[BRServerInfoRecordInfo setEncryptedBasename:](self, "setEncryptedBasename:");
    v4 = v5;
  }
  if ((v4[9] & 1) != 0)
  {
    self->_bounceNo = v4[1];
    *(_BYTE *)&self->_has |= 1u;
  }
  if (v4[4])
  {
    -[BRServerInfoRecordInfo setExtension:](self, "setExtension:");
    v4 = v5;
  }
  if (v4[6])
  {
    -[BRServerInfoRecordInfo setRecordProtectionInfo:](self, "setRecordProtectionInfo:");
    v4 = v5;
  }
  if (v4[7])
  {
    -[BRServerInfoRecordInfo setZoneName:](self, "setZoneName:");
    v4 = v5;
  }
  if (v4[8])
  {
    -[BRServerInfoRecordInfo setZoneProtectionInfo:](self, "setZoneProtectionInfo:");
    v4 = v5;
  }

}

- (NSString)recordID
{
  return self->_recordID;
}

- (void)setRecordID:(id)a3
{
  objc_storeStrong((id *)&self->_recordID, a3);
}

- (NSString)etag
{
  return self->_etag;
}

- (void)setEtag:(id)a3
{
  objc_storeStrong((id *)&self->_etag, a3);
}

- (NSData)encryptedBasename
{
  return self->_encryptedBasename;
}

- (void)setEncryptedBasename:(id)a3
{
  objc_storeStrong((id *)&self->_encryptedBasename, a3);
}

- (unint64_t)bounceNo
{
  return self->_bounceNo;
}

- (NSString)extension
{
  return self->_extension;
}

- (void)setExtension:(id)a3
{
  objc_storeStrong((id *)&self->_extension, a3);
}

- (NSData)recordProtectionInfo
{
  return self->_recordProtectionInfo;
}

- (void)setRecordProtectionInfo:(id)a3
{
  objc_storeStrong((id *)&self->_recordProtectionInfo, a3);
}

- (NSString)zoneName
{
  return self->_zoneName;
}

- (void)setZoneName:(id)a3
{
  objc_storeStrong((id *)&self->_zoneName, a3);
}

- (NSData)zoneProtectionInfo
{
  return self->_zoneProtectionInfo;
}

- (void)setZoneProtectionInfo:(id)a3
{
  objc_storeStrong((id *)&self->_zoneProtectionInfo, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_zoneProtectionInfo, 0);
  objc_storeStrong((id *)&self->_zoneName, 0);
  objc_storeStrong((id *)&self->_recordProtectionInfo, 0);
  objc_storeStrong((id *)&self->_recordID, 0);
  objc_storeStrong((id *)&self->_extension, 0);
  objc_storeStrong((id *)&self->_etag, 0);
  objc_storeStrong((id *)&self->_encryptedBasename, 0);
}

@end
