@implementation HDCloudSyncCodableAttachment

- (BOOL)hasFileName
{
  return self->_fileName != 0;
}

- (void)setFileSize:(int64_t)a3
{
  *(_BYTE *)&self->_has |= 2u;
  self->_fileSize = a3;
}

- (void)setHasFileSize:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFD | v3;
}

- (BOOL)hasFileSize
{
  return (*(_BYTE *)&self->_has >> 1) & 1;
}

- (BOOL)hasMimeType
{
  return self->_mimeType != 0;
}

- (BOOL)hasFileHash
{
  return self->_fileHash != 0;
}

- (void)setCreationDate:(double)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_creationDate = a3;
}

- (void)setHasCreationDate:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (BOOL)hasCreationDate
{
  return *(_BYTE *)&self->_has & 1;
}

- (BOOL)hasMetadata
{
  return self->_metadata != 0;
}

- (BOOL)hasAssetData
{
  return self->_assetData != 0;
}

- (BOOL)hasEncryptionKey
{
  return self->_encryptionKey != 0;
}

- (BOOL)hasSystemBuildVersion
{
  return self->_systemBuildVersion != 0;
}

- (BOOL)hasProductType
{
  return self->_productType != 0;
}

- (BOOL)hasDeviceName
{
  return self->_deviceName != 0;
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
  v8.super_class = (Class)HDCloudSyncCodableAttachment;
  -[HDCloudSyncCodableAttachment description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[HDCloudSyncCodableAttachment dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;
  NSString *fileName;
  void *v6;
  NSString *mimeType;
  NSString *fileHash;
  void *v9;
  NSData *metadata;
  NSData *assetData;
  NSData *encryptionKey;
  NSString *systemBuildVersion;
  NSString *productType;
  NSString *deviceName;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  fileName = self->_fileName;
  if (fileName)
    objc_msgSend(v3, "setObject:forKey:", fileName, CFSTR("fileName"));
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", self->_fileSize);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v6, CFSTR("fileSize"));

  }
  mimeType = self->_mimeType;
  if (mimeType)
    objc_msgSend(v4, "setObject:forKey:", mimeType, CFSTR("mimeType"));
  fileHash = self->_fileHash;
  if (fileHash)
    objc_msgSend(v4, "setObject:forKey:", fileHash, CFSTR("fileHash"));
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_creationDate);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v9, CFSTR("creationDate"));

  }
  metadata = self->_metadata;
  if (metadata)
    objc_msgSend(v4, "setObject:forKey:", metadata, CFSTR("metadata"));
  assetData = self->_assetData;
  if (assetData)
    objc_msgSend(v4, "setObject:forKey:", assetData, CFSTR("assetData"));
  encryptionKey = self->_encryptionKey;
  if (encryptionKey)
    objc_msgSend(v4, "setObject:forKey:", encryptionKey, CFSTR("encryptionKey"));
  systemBuildVersion = self->_systemBuildVersion;
  if (systemBuildVersion)
    objc_msgSend(v4, "setObject:forKey:", systemBuildVersion, CFSTR("systemBuildVersion"));
  productType = self->_productType;
  if (productType)
    objc_msgSend(v4, "setObject:forKey:", productType, CFSTR("productType"));
  deviceName = self->_deviceName;
  if (deviceName)
    objc_msgSend(v4, "setObject:forKey:", deviceName, CFSTR("deviceName"));
  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return HDCloudSyncCodableAttachmentReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = v4;
  if (self->_fileName)
  {
    PBDataWriterWriteStringField();
    v4 = v5;
  }
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    PBDataWriterWriteInt64Field();
    v4 = v5;
  }
  if (self->_mimeType)
  {
    PBDataWriterWriteStringField();
    v4 = v5;
  }
  if (self->_fileHash)
  {
    PBDataWriterWriteStringField();
    v4 = v5;
  }
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    PBDataWriterWriteDoubleField();
    v4 = v5;
  }
  if (self->_metadata)
  {
    PBDataWriterWriteDataField();
    v4 = v5;
  }
  if (self->_assetData)
  {
    PBDataWriterWriteDataField();
    v4 = v5;
  }
  if (self->_encryptionKey)
  {
    PBDataWriterWriteDataField();
    v4 = v5;
  }
  if (self->_systemBuildVersion)
  {
    PBDataWriterWriteStringField();
    v4 = v5;
  }
  if (self->_productType)
  {
    PBDataWriterWriteStringField();
    v4 = v5;
  }
  if (self->_deviceName)
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
  if (self->_fileName)
  {
    objc_msgSend(v4, "setFileName:");
    v4 = v5;
  }
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    *((_QWORD *)v4 + 2) = self->_fileSize;
    *((_BYTE *)v4 + 96) |= 2u;
  }
  if (self->_mimeType)
  {
    objc_msgSend(v5, "setMimeType:");
    v4 = v5;
  }
  if (self->_fileHash)
  {
    objc_msgSend(v5, "setFileHash:");
    v4 = v5;
  }
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    *((_QWORD *)v4 + 1) = *(_QWORD *)&self->_creationDate;
    *((_BYTE *)v4 + 96) |= 1u;
  }
  if (self->_metadata)
  {
    objc_msgSend(v5, "setMetadata:");
    v4 = v5;
  }
  if (self->_assetData)
  {
    objc_msgSend(v5, "setAssetData:");
    v4 = v5;
  }
  if (self->_encryptionKey)
  {
    objc_msgSend(v5, "setEncryptionKey:");
    v4 = v5;
  }
  if (self->_systemBuildVersion)
  {
    objc_msgSend(v5, "setSystemBuildVersion:");
    v4 = v5;
  }
  if (self->_productType)
  {
    objc_msgSend(v5, "setProductType:");
    v4 = v5;
  }
  if (self->_deviceName)
  {
    objc_msgSend(v5, "setDeviceName:");
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
  uint64_t v20;
  void *v21;
  uint64_t v22;
  void *v23;

  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = -[NSString copyWithZone:](self->_fileName, "copyWithZone:", a3);
  v7 = *(void **)(v5 + 56);
  *(_QWORD *)(v5 + 56) = v6;

  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    *(_QWORD *)(v5 + 16) = self->_fileSize;
    *(_BYTE *)(v5 + 96) |= 2u;
  }
  v8 = -[NSString copyWithZone:](self->_mimeType, "copyWithZone:", a3);
  v9 = *(void **)(v5 + 72);
  *(_QWORD *)(v5 + 72) = v8;

  v10 = -[NSString copyWithZone:](self->_fileHash, "copyWithZone:", a3);
  v11 = *(void **)(v5 + 48);
  *(_QWORD *)(v5 + 48) = v10;

  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    *(double *)(v5 + 8) = self->_creationDate;
    *(_BYTE *)(v5 + 96) |= 1u;
  }
  v12 = -[NSData copyWithZone:](self->_metadata, "copyWithZone:", a3);
  v13 = *(void **)(v5 + 64);
  *(_QWORD *)(v5 + 64) = v12;

  v14 = -[NSData copyWithZone:](self->_assetData, "copyWithZone:", a3);
  v15 = *(void **)(v5 + 24);
  *(_QWORD *)(v5 + 24) = v14;

  v16 = -[NSData copyWithZone:](self->_encryptionKey, "copyWithZone:", a3);
  v17 = *(void **)(v5 + 40);
  *(_QWORD *)(v5 + 40) = v16;

  v18 = -[NSString copyWithZone:](self->_systemBuildVersion, "copyWithZone:", a3);
  v19 = *(void **)(v5 + 88);
  *(_QWORD *)(v5 + 88) = v18;

  v20 = -[NSString copyWithZone:](self->_productType, "copyWithZone:", a3);
  v21 = *(void **)(v5 + 80);
  *(_QWORD *)(v5 + 80) = v20;

  v22 = -[NSString copyWithZone:](self->_deviceName, "copyWithZone:", a3);
  v23 = *(void **)(v5 + 32);
  *(_QWORD *)(v5 + 32) = v22;

  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  NSString *fileName;
  NSString *mimeType;
  NSString *fileHash;
  NSData *metadata;
  NSData *assetData;
  NSData *encryptionKey;
  NSString *systemBuildVersion;
  NSString *productType;
  NSString *deviceName;
  char v14;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_30;
  fileName = self->_fileName;
  if ((unint64_t)fileName | *((_QWORD *)v4 + 7))
  {
    if (!-[NSString isEqual:](fileName, "isEqual:"))
      goto LABEL_30;
  }
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    if ((*((_BYTE *)v4 + 96) & 2) == 0 || self->_fileSize != *((_QWORD *)v4 + 2))
      goto LABEL_30;
  }
  else if ((*((_BYTE *)v4 + 96) & 2) != 0)
  {
LABEL_30:
    v14 = 0;
    goto LABEL_31;
  }
  mimeType = self->_mimeType;
  if ((unint64_t)mimeType | *((_QWORD *)v4 + 9) && !-[NSString isEqual:](mimeType, "isEqual:"))
    goto LABEL_30;
  fileHash = self->_fileHash;
  if ((unint64_t)fileHash | *((_QWORD *)v4 + 6))
  {
    if (!-[NSString isEqual:](fileHash, "isEqual:"))
      goto LABEL_30;
  }
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 96) & 1) == 0 || self->_creationDate != *((double *)v4 + 1))
      goto LABEL_30;
  }
  else if ((*((_BYTE *)v4 + 96) & 1) != 0)
  {
    goto LABEL_30;
  }
  metadata = self->_metadata;
  if ((unint64_t)metadata | *((_QWORD *)v4 + 8) && !-[NSData isEqual:](metadata, "isEqual:"))
    goto LABEL_30;
  assetData = self->_assetData;
  if ((unint64_t)assetData | *((_QWORD *)v4 + 3))
  {
    if (!-[NSData isEqual:](assetData, "isEqual:"))
      goto LABEL_30;
  }
  encryptionKey = self->_encryptionKey;
  if ((unint64_t)encryptionKey | *((_QWORD *)v4 + 5))
  {
    if (!-[NSData isEqual:](encryptionKey, "isEqual:"))
      goto LABEL_30;
  }
  systemBuildVersion = self->_systemBuildVersion;
  if ((unint64_t)systemBuildVersion | *((_QWORD *)v4 + 11))
  {
    if (!-[NSString isEqual:](systemBuildVersion, "isEqual:"))
      goto LABEL_30;
  }
  productType = self->_productType;
  if ((unint64_t)productType | *((_QWORD *)v4 + 10))
  {
    if (!-[NSString isEqual:](productType, "isEqual:"))
      goto LABEL_30;
  }
  deviceName = self->_deviceName;
  if ((unint64_t)deviceName | *((_QWORD *)v4 + 4))
    v14 = -[NSString isEqual:](deviceName, "isEqual:");
  else
    v14 = 1;
LABEL_31:

  return v14;
}

- (unint64_t)hash
{
  NSUInteger v3;
  uint64_t v4;
  NSUInteger v5;
  NSUInteger v6;
  unint64_t v7;
  double creationDate;
  double v9;
  long double v10;
  double v11;
  NSUInteger v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  NSUInteger v16;
  NSUInteger v17;

  v3 = -[NSString hash](self->_fileName, "hash");
  if ((*(_BYTE *)&self->_has & 2) != 0)
    v4 = 2654435761 * self->_fileSize;
  else
    v4 = 0;
  v5 = -[NSString hash](self->_mimeType, "hash");
  v6 = -[NSString hash](self->_fileHash, "hash");
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    creationDate = self->_creationDate;
    v9 = -creationDate;
    if (creationDate >= 0.0)
      v9 = self->_creationDate;
    v10 = floor(v9 + 0.5);
    v11 = (v9 - v10) * 1.84467441e19;
    v7 = 2654435761u * (unint64_t)fmod(v10, 1.84467441e19);
    if (v11 >= 0.0)
    {
      if (v11 > 0.0)
        v7 += (unint64_t)v11;
    }
    else
    {
      v7 -= (unint64_t)fabs(v11);
    }
  }
  else
  {
    v7 = 0;
  }
  v12 = v4 ^ v3 ^ v5 ^ v6;
  v13 = v7 ^ -[NSData hash](self->_metadata, "hash");
  v14 = v12 ^ v13 ^ -[NSData hash](self->_assetData, "hash");
  v15 = -[NSData hash](self->_encryptionKey, "hash");
  v16 = v15 ^ -[NSString hash](self->_systemBuildVersion, "hash");
  v17 = v16 ^ -[NSString hash](self->_productType, "hash");
  return v14 ^ v17 ^ -[NSString hash](self->_deviceName, "hash");
}

- (void)mergeFrom:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = v4;
  if (*((_QWORD *)v4 + 7))
  {
    -[HDCloudSyncCodableAttachment setFileName:](self, "setFileName:");
    v4 = v5;
  }
  if ((*((_BYTE *)v4 + 96) & 2) != 0)
  {
    self->_fileSize = *((_QWORD *)v4 + 2);
    *(_BYTE *)&self->_has |= 2u;
  }
  if (*((_QWORD *)v4 + 9))
  {
    -[HDCloudSyncCodableAttachment setMimeType:](self, "setMimeType:");
    v4 = v5;
  }
  if (*((_QWORD *)v4 + 6))
  {
    -[HDCloudSyncCodableAttachment setFileHash:](self, "setFileHash:");
    v4 = v5;
  }
  if ((*((_BYTE *)v4 + 96) & 1) != 0)
  {
    self->_creationDate = *((double *)v4 + 1);
    *(_BYTE *)&self->_has |= 1u;
  }
  if (*((_QWORD *)v4 + 8))
  {
    -[HDCloudSyncCodableAttachment setMetadata:](self, "setMetadata:");
    v4 = v5;
  }
  if (*((_QWORD *)v4 + 3))
  {
    -[HDCloudSyncCodableAttachment setAssetData:](self, "setAssetData:");
    v4 = v5;
  }
  if (*((_QWORD *)v4 + 5))
  {
    -[HDCloudSyncCodableAttachment setEncryptionKey:](self, "setEncryptionKey:");
    v4 = v5;
  }
  if (*((_QWORD *)v4 + 11))
  {
    -[HDCloudSyncCodableAttachment setSystemBuildVersion:](self, "setSystemBuildVersion:");
    v4 = v5;
  }
  if (*((_QWORD *)v4 + 10))
  {
    -[HDCloudSyncCodableAttachment setProductType:](self, "setProductType:");
    v4 = v5;
  }
  if (*((_QWORD *)v4 + 4))
  {
    -[HDCloudSyncCodableAttachment setDeviceName:](self, "setDeviceName:");
    v4 = v5;
  }

}

- (NSString)fileName
{
  return self->_fileName;
}

- (void)setFileName:(id)a3
{
  objc_storeStrong((id *)&self->_fileName, a3);
}

- (int64_t)fileSize
{
  return self->_fileSize;
}

- (NSString)mimeType
{
  return self->_mimeType;
}

- (void)setMimeType:(id)a3
{
  objc_storeStrong((id *)&self->_mimeType, a3);
}

- (NSString)fileHash
{
  return self->_fileHash;
}

- (void)setFileHash:(id)a3
{
  objc_storeStrong((id *)&self->_fileHash, a3);
}

- (double)creationDate
{
  return self->_creationDate;
}

- (NSData)metadata
{
  return self->_metadata;
}

- (void)setMetadata:(id)a3
{
  objc_storeStrong((id *)&self->_metadata, a3);
}

- (NSData)assetData
{
  return self->_assetData;
}

- (void)setAssetData:(id)a3
{
  objc_storeStrong((id *)&self->_assetData, a3);
}

- (NSData)encryptionKey
{
  return self->_encryptionKey;
}

- (void)setEncryptionKey:(id)a3
{
  objc_storeStrong((id *)&self->_encryptionKey, a3);
}

- (NSString)systemBuildVersion
{
  return self->_systemBuildVersion;
}

- (void)setSystemBuildVersion:(id)a3
{
  objc_storeStrong((id *)&self->_systemBuildVersion, a3);
}

- (NSString)productType
{
  return self->_productType;
}

- (void)setProductType:(id)a3
{
  objc_storeStrong((id *)&self->_productType, a3);
}

- (NSString)deviceName
{
  return self->_deviceName;
}

- (void)setDeviceName:(id)a3
{
  objc_storeStrong((id *)&self->_deviceName, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_systemBuildVersion, 0);
  objc_storeStrong((id *)&self->_productType, 0);
  objc_storeStrong((id *)&self->_mimeType, 0);
  objc_storeStrong((id *)&self->_metadata, 0);
  objc_storeStrong((id *)&self->_fileName, 0);
  objc_storeStrong((id *)&self->_fileHash, 0);
  objc_storeStrong((id *)&self->_encryptionKey, 0);
  objc_storeStrong((id *)&self->_deviceName, 0);
  objc_storeStrong((id *)&self->_assetData, 0);
}

@end
