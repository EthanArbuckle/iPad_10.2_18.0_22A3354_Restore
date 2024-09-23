@implementation MPSStateRequest

- (BOOL)hasMPSDeviceID
{
  return self->_mPSDeviceID != 0;
}

- (BOOL)hasICPLDeviceID
{
  return self->_iCPLDeviceID != 0;
}

- (BOOL)hasBackupDeviceID
{
  return self->_backupDeviceID != 0;
}

- (BOOL)hasBackupDeviceUUID
{
  return self->_backupDeviceUUID != 0;
}

- (BOOL)hasBackupDeviceUDID
{
  return self->_backupDeviceUDID != 0;
}

- (void)setOriginalLibrarySize:(int64_t)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_originalLibrarySize = a3;
}

- (void)setHasOriginalLibrarySize:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (BOOL)hasOriginalLibrarySize
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

  v3 = (void *)MEMORY[0x1E0CB3940];
  v8.receiver = self;
  v8.super_class = (Class)MPSStateRequest;
  -[MPSStateRequest description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[MPSStateRequest dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;
  NSString *mPSDeviceID;
  NSString *iCPLDeviceID;
  NSString *backupDeviceID;
  NSString *backupDeviceUUID;
  NSString *backupDeviceUDID;
  void *v10;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  mPSDeviceID = self->_mPSDeviceID;
  if (mPSDeviceID)
    objc_msgSend(v3, "setObject:forKey:", mPSDeviceID, CFSTR("MPSDeviceID"));
  iCPLDeviceID = self->_iCPLDeviceID;
  if (iCPLDeviceID)
    objc_msgSend(v4, "setObject:forKey:", iCPLDeviceID, CFSTR("iCPLDeviceID"));
  backupDeviceID = self->_backupDeviceID;
  if (backupDeviceID)
    objc_msgSend(v4, "setObject:forKey:", backupDeviceID, CFSTR("BackupDeviceID"));
  backupDeviceUUID = self->_backupDeviceUUID;
  if (backupDeviceUUID)
    objc_msgSend(v4, "setObject:forKey:", backupDeviceUUID, CFSTR("BackupDeviceUUID"));
  backupDeviceUDID = self->_backupDeviceUDID;
  if (backupDeviceUDID)
    objc_msgSend(v4, "setObject:forKey:", backupDeviceUDID, CFSTR("BackupDeviceUDID"));
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", self->_originalLibrarySize);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v10, CFSTR("OriginalLibrarySize"));

  }
  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return MPSStateRequestReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = v4;
  if (self->_mPSDeviceID)
  {
    PBDataWriterWriteStringField();
    v4 = v5;
  }
  if (self->_iCPLDeviceID)
  {
    PBDataWriterWriteStringField();
    v4 = v5;
  }
  if (self->_backupDeviceID)
  {
    PBDataWriterWriteStringField();
    v4 = v5;
  }
  if (self->_backupDeviceUUID)
  {
    PBDataWriterWriteStringField();
    v4 = v5;
  }
  if (self->_backupDeviceUDID)
  {
    PBDataWriterWriteStringField();
    v4 = v5;
  }
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    PBDataWriterWriteInt64Field();
    v4 = v5;
  }

}

- (void)copyTo:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = v4;
  if (self->_mPSDeviceID)
  {
    objc_msgSend(v4, "setMPSDeviceID:");
    v4 = v5;
  }
  if (self->_iCPLDeviceID)
  {
    objc_msgSend(v5, "setICPLDeviceID:");
    v4 = v5;
  }
  if (self->_backupDeviceID)
  {
    objc_msgSend(v5, "setBackupDeviceID:");
    v4 = v5;
  }
  if (self->_backupDeviceUUID)
  {
    objc_msgSend(v5, "setBackupDeviceUUID:");
    v4 = v5;
  }
  if (self->_backupDeviceUDID)
  {
    objc_msgSend(v5, "setBackupDeviceUDID:");
    v4 = v5;
  }
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    *((_QWORD *)v4 + 1) = self->_originalLibrarySize;
    *((_BYTE *)v4 + 56) |= 1u;
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

  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = -[NSString copyWithZone:](self->_mPSDeviceID, "copyWithZone:", a3);
  v7 = *(void **)(v5 + 48);
  *(_QWORD *)(v5 + 48) = v6;

  v8 = -[NSString copyWithZone:](self->_iCPLDeviceID, "copyWithZone:", a3);
  v9 = *(void **)(v5 + 40);
  *(_QWORD *)(v5 + 40) = v8;

  v10 = -[NSString copyWithZone:](self->_backupDeviceID, "copyWithZone:", a3);
  v11 = *(void **)(v5 + 16);
  *(_QWORD *)(v5 + 16) = v10;

  v12 = -[NSString copyWithZone:](self->_backupDeviceUUID, "copyWithZone:", a3);
  v13 = *(void **)(v5 + 32);
  *(_QWORD *)(v5 + 32) = v12;

  v14 = -[NSString copyWithZone:](self->_backupDeviceUDID, "copyWithZone:", a3);
  v15 = *(void **)(v5 + 24);
  *(_QWORD *)(v5 + 24) = v14;

  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    *(_QWORD *)(v5 + 8) = self->_originalLibrarySize;
    *(_BYTE *)(v5 + 56) |= 1u;
  }
  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  NSString *mPSDeviceID;
  NSString *iCPLDeviceID;
  NSString *backupDeviceID;
  NSString *backupDeviceUUID;
  NSString *backupDeviceUDID;
  BOOL v10;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_16;
  mPSDeviceID = self->_mPSDeviceID;
  if ((unint64_t)mPSDeviceID | *((_QWORD *)v4 + 6))
  {
    if (!-[NSString isEqual:](mPSDeviceID, "isEqual:"))
      goto LABEL_16;
  }
  iCPLDeviceID = self->_iCPLDeviceID;
  if ((unint64_t)iCPLDeviceID | *((_QWORD *)v4 + 5))
  {
    if (!-[NSString isEqual:](iCPLDeviceID, "isEqual:"))
      goto LABEL_16;
  }
  backupDeviceID = self->_backupDeviceID;
  if ((unint64_t)backupDeviceID | *((_QWORD *)v4 + 2))
  {
    if (!-[NSString isEqual:](backupDeviceID, "isEqual:"))
      goto LABEL_16;
  }
  backupDeviceUUID = self->_backupDeviceUUID;
  if ((unint64_t)backupDeviceUUID | *((_QWORD *)v4 + 4))
  {
    if (!-[NSString isEqual:](backupDeviceUUID, "isEqual:"))
      goto LABEL_16;
  }
  backupDeviceUDID = self->_backupDeviceUDID;
  if ((unint64_t)backupDeviceUDID | *((_QWORD *)v4 + 3))
  {
    if (!-[NSString isEqual:](backupDeviceUDID, "isEqual:"))
      goto LABEL_16;
  }
  v10 = (*((_BYTE *)v4 + 56) & 1) == 0;
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 56) & 1) != 0 && self->_originalLibrarySize == *((_QWORD *)v4 + 1))
    {
      v10 = 1;
      goto LABEL_17;
    }
LABEL_16:
    v10 = 0;
  }
LABEL_17:

  return v10;
}

- (unint64_t)hash
{
  NSUInteger v3;
  NSUInteger v4;
  NSUInteger v5;
  NSUInteger v6;
  NSUInteger v7;
  uint64_t v8;

  v3 = -[NSString hash](self->_mPSDeviceID, "hash");
  v4 = -[NSString hash](self->_iCPLDeviceID, "hash");
  v5 = -[NSString hash](self->_backupDeviceID, "hash");
  v6 = -[NSString hash](self->_backupDeviceUUID, "hash");
  v7 = -[NSString hash](self->_backupDeviceUDID, "hash");
  if ((*(_BYTE *)&self->_has & 1) != 0)
    v8 = 2654435761 * self->_originalLibrarySize;
  else
    v8 = 0;
  return v4 ^ v3 ^ v5 ^ v6 ^ v7 ^ v8;
}

- (void)mergeFrom:(id)a3
{
  int64_t *v4;
  int64_t *v5;

  v4 = (int64_t *)a3;
  v5 = v4;
  if (v4[6])
  {
    -[MPSStateRequest setMPSDeviceID:](self, "setMPSDeviceID:");
    v4 = v5;
  }
  if (v4[5])
  {
    -[MPSStateRequest setICPLDeviceID:](self, "setICPLDeviceID:");
    v4 = v5;
  }
  if (v4[2])
  {
    -[MPSStateRequest setBackupDeviceID:](self, "setBackupDeviceID:");
    v4 = v5;
  }
  if (v4[4])
  {
    -[MPSStateRequest setBackupDeviceUUID:](self, "setBackupDeviceUUID:");
    v4 = v5;
  }
  if (v4[3])
  {
    -[MPSStateRequest setBackupDeviceUDID:](self, "setBackupDeviceUDID:");
    v4 = v5;
  }
  if ((v4[7] & 1) != 0)
  {
    self->_originalLibrarySize = v4[1];
    *(_BYTE *)&self->_has |= 1u;
  }

}

- (NSString)mPSDeviceID
{
  return self->_mPSDeviceID;
}

- (void)setMPSDeviceID:(id)a3
{
  objc_storeStrong((id *)&self->_mPSDeviceID, a3);
}

- (NSString)iCPLDeviceID
{
  return self->_iCPLDeviceID;
}

- (void)setICPLDeviceID:(id)a3
{
  objc_storeStrong((id *)&self->_iCPLDeviceID, a3);
}

- (NSString)backupDeviceID
{
  return self->_backupDeviceID;
}

- (void)setBackupDeviceID:(id)a3
{
  objc_storeStrong((id *)&self->_backupDeviceID, a3);
}

- (NSString)backupDeviceUUID
{
  return self->_backupDeviceUUID;
}

- (void)setBackupDeviceUUID:(id)a3
{
  objc_storeStrong((id *)&self->_backupDeviceUUID, a3);
}

- (NSString)backupDeviceUDID
{
  return self->_backupDeviceUDID;
}

- (void)setBackupDeviceUDID:(id)a3
{
  objc_storeStrong((id *)&self->_backupDeviceUDID, a3);
}

- (int64_t)originalLibrarySize
{
  return self->_originalLibrarySize;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_mPSDeviceID, 0);
  objc_storeStrong((id *)&self->_iCPLDeviceID, 0);
  objc_storeStrong((id *)&self->_backupDeviceUUID, 0);
  objc_storeStrong((id *)&self->_backupDeviceUDID, 0);
  objc_storeStrong((id *)&self->_backupDeviceID, 0);
}

@end
