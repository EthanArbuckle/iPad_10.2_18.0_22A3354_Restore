@implementation HKHealthWrapCodableMessageHeader

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

- (BOOL)hasEncryptedMessageKey
{
  return self->_encryptedMessageKey != 0;
}

- (BOOL)hasEncryptionIdentity
{
  return self->_encryptionIdentity != 0;
}

- (BOOL)hasUploadUUID
{
  return self->_uploadUUID != 0;
}

- (BOOL)hasStudyIdentifier
{
  return self->_studyIdentifier != 0;
}

- (BOOL)hasEncryptedHMACKey
{
  return self->_encryptedHMACKey != 0;
}

- (void)setTrailingHMACLength:(int)a3
{
  *(_BYTE *)&self->_has |= 2u;
  self->_trailingHMACLength = a3;
}

- (void)setHasTrailingHMACLength:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFD | v3;
}

- (BOOL)hasTrailingHMACLength
{
  return (*(_BYTE *)&self->_has >> 1) & 1;
}

- (void)setTrailingSHALength:(int)a3
{
  *(_BYTE *)&self->_has |= 4u;
  self->_trailingSHALength = a3;
}

- (void)setHasTrailingSHALength:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 4;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFB | v3;
}

- (BOOL)hasTrailingSHALength
{
  return (*(_BYTE *)&self->_has >> 2) & 1;
}

- (void)setCompressed:(BOOL)a3
{
  *(_BYTE *)&self->_has |= 8u;
  self->_compressed = a3;
}

- (void)setHasCompressed:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 8;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xF7 | v3;
}

- (BOOL)hasCompressed
{
  return (*(_BYTE *)&self->_has >> 3) & 1;
}

- (BOOL)hasStudyUUID
{
  return self->_studyUUID != 0;
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
  v8.super_class = (Class)HKHealthWrapCodableMessageHeader;
  -[HKHealthWrapCodableMessageHeader description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKHealthWrapCodableMessageHeader dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;
  NSData *encryptedMessageKey;
  NSData *encryptionIdentity;
  NSData *uploadUUID;
  NSString *studyIdentifier;
  NSData *encryptedHMACKey;
  char has;
  void *v11;
  NSData *studyUUID;
  void *v14;
  void *v15;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", self->_version);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v4, CFSTR("version"));

  }
  encryptedMessageKey = self->_encryptedMessageKey;
  if (encryptedMessageKey)
    objc_msgSend(v3, "setObject:forKey:", encryptedMessageKey, CFSTR("encryptedMessageKey"));
  encryptionIdentity = self->_encryptionIdentity;
  if (encryptionIdentity)
    objc_msgSend(v3, "setObject:forKey:", encryptionIdentity, CFSTR("encryptionIdentity"));
  uploadUUID = self->_uploadUUID;
  if (uploadUUID)
    objc_msgSend(v3, "setObject:forKey:", uploadUUID, CFSTR("uploadUUID"));
  studyIdentifier = self->_studyIdentifier;
  if (studyIdentifier)
    objc_msgSend(v3, "setObject:forKey:", studyIdentifier, CFSTR("studyIdentifier"));
  encryptedHMACKey = self->_encryptedHMACKey;
  if (encryptedHMACKey)
    objc_msgSend(v3, "setObject:forKey:", encryptedHMACKey, CFSTR("encryptedHMACKey"));
  has = (char)self->_has;
  if ((has & 2) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", self->_trailingHMACLength);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v14, CFSTR("trailingHMACLength"));

    has = (char)self->_has;
    if ((has & 4) == 0)
    {
LABEL_15:
      if ((has & 8) == 0)
        goto LABEL_17;
      goto LABEL_16;
    }
  }
  else if ((*(_BYTE *)&self->_has & 4) == 0)
  {
    goto LABEL_15;
  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", self->_trailingSHALength);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v15, CFSTR("trailingSHALength"));

  if ((*(_BYTE *)&self->_has & 8) != 0)
  {
LABEL_16:
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_compressed);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v11, CFSTR("compressed"));

  }
LABEL_17:
  studyUUID = self->_studyUUID;
  if (studyUUID)
    objc_msgSend(v3, "setObject:forKey:", studyUUID, CFSTR("studyUUID"));
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return HKHealthWrapCodableMessageHeaderReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4;
  char has;
  id v6;

  v4 = a3;
  v6 = v4;
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    PBDataWriterWriteInt64Field();
    v4 = v6;
  }
  if (self->_encryptedMessageKey)
  {
    PBDataWriterWriteDataField();
    v4 = v6;
  }
  if (self->_encryptionIdentity)
  {
    PBDataWriterWriteDataField();
    v4 = v6;
  }
  if (self->_uploadUUID)
  {
    PBDataWriterWriteDataField();
    v4 = v6;
  }
  if (self->_studyIdentifier)
  {
    PBDataWriterWriteStringField();
    v4 = v6;
  }
  if (self->_encryptedHMACKey)
  {
    PBDataWriterWriteDataField();
    v4 = v6;
  }
  has = (char)self->_has;
  if ((has & 2) != 0)
  {
    PBDataWriterWriteInt32Field();
    v4 = v6;
    has = (char)self->_has;
    if ((has & 4) == 0)
    {
LABEL_15:
      if ((has & 8) == 0)
        goto LABEL_17;
      goto LABEL_16;
    }
  }
  else if ((*(_BYTE *)&self->_has & 4) == 0)
  {
    goto LABEL_15;
  }
  PBDataWriterWriteInt32Field();
  v4 = v6;
  if ((*(_BYTE *)&self->_has & 8) != 0)
  {
LABEL_16:
    PBDataWriterWriteBOOLField();
    v4 = v6;
  }
LABEL_17:
  if (self->_studyUUID)
  {
    PBDataWriterWriteDataField();
    v4 = v6;
  }

}

- (void)copyTo:(id)a3
{
  _QWORD *v4;
  char has;
  _QWORD *v6;

  v4 = a3;
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    v4[1] = self->_version;
    *((_BYTE *)v4 + 76) |= 1u;
  }
  v6 = v4;
  if (self->_encryptedMessageKey)
  {
    objc_msgSend(v4, "setEncryptedMessageKey:");
    v4 = v6;
  }
  if (self->_encryptionIdentity)
  {
    objc_msgSend(v6, "setEncryptionIdentity:");
    v4 = v6;
  }
  if (self->_uploadUUID)
  {
    objc_msgSend(v6, "setUploadUUID:");
    v4 = v6;
  }
  if (self->_studyIdentifier)
  {
    objc_msgSend(v6, "setStudyIdentifier:");
    v4 = v6;
  }
  if (self->_encryptedHMACKey)
  {
    objc_msgSend(v6, "setEncryptedHMACKey:");
    v4 = v6;
  }
  has = (char)self->_has;
  if ((has & 2) != 0)
  {
    *((_DWORD *)v4 + 14) = self->_trailingHMACLength;
    *((_BYTE *)v4 + 76) |= 2u;
    has = (char)self->_has;
    if ((has & 4) == 0)
    {
LABEL_15:
      if ((has & 8) == 0)
        goto LABEL_17;
      goto LABEL_16;
    }
  }
  else if ((*(_BYTE *)&self->_has & 4) == 0)
  {
    goto LABEL_15;
  }
  *((_DWORD *)v4 + 15) = self->_trailingSHALength;
  *((_BYTE *)v4 + 76) |= 4u;
  if ((*(_BYTE *)&self->_has & 8) != 0)
  {
LABEL_16:
    *((_BYTE *)v4 + 72) = self->_compressed;
    *((_BYTE *)v4 + 76) |= 8u;
  }
LABEL_17:
  if (self->_studyUUID)
  {
    objc_msgSend(v6, "setStudyUUID:");
    v4 = v6;
  }

}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  void *v16;
  char has;
  uint64_t v18;
  void *v19;

  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = v5;
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    *(_QWORD *)(v5 + 8) = self->_version;
    *(_BYTE *)(v5 + 76) |= 1u;
  }
  v7 = -[NSData copyWithZone:](self->_encryptedMessageKey, "copyWithZone:", a3);
  v8 = *(void **)(v6 + 24);
  *(_QWORD *)(v6 + 24) = v7;

  v9 = -[NSData copyWithZone:](self->_encryptionIdentity, "copyWithZone:", a3);
  v10 = *(void **)(v6 + 32);
  *(_QWORD *)(v6 + 32) = v9;

  v11 = -[NSData copyWithZone:](self->_uploadUUID, "copyWithZone:", a3);
  v12 = *(void **)(v6 + 64);
  *(_QWORD *)(v6 + 64) = v11;

  v13 = -[NSString copyWithZone:](self->_studyIdentifier, "copyWithZone:", a3);
  v14 = *(void **)(v6 + 40);
  *(_QWORD *)(v6 + 40) = v13;

  v15 = -[NSData copyWithZone:](self->_encryptedHMACKey, "copyWithZone:", a3);
  v16 = *(void **)(v6 + 16);
  *(_QWORD *)(v6 + 16) = v15;

  has = (char)self->_has;
  if ((has & 2) == 0)
  {
    if ((*(_BYTE *)&self->_has & 4) == 0)
      goto LABEL_5;
LABEL_9:
    *(_DWORD *)(v6 + 60) = self->_trailingSHALength;
    *(_BYTE *)(v6 + 76) |= 4u;
    if ((*(_BYTE *)&self->_has & 8) == 0)
      goto LABEL_7;
    goto LABEL_6;
  }
  *(_DWORD *)(v6 + 56) = self->_trailingHMACLength;
  *(_BYTE *)(v6 + 76) |= 2u;
  has = (char)self->_has;
  if ((has & 4) != 0)
    goto LABEL_9;
LABEL_5:
  if ((has & 8) != 0)
  {
LABEL_6:
    *(_BYTE *)(v6 + 72) = self->_compressed;
    *(_BYTE *)(v6 + 76) |= 8u;
  }
LABEL_7:
  v18 = -[NSData copyWithZone:](self->_studyUUID, "copyWithZone:", a3);
  v19 = *(void **)(v6 + 48);
  *(_QWORD *)(v6 + 48) = v18;

  return (id)v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  NSData *encryptedMessageKey;
  NSData *encryptionIdentity;
  NSData *uploadUUID;
  NSString *studyIdentifier;
  NSData *encryptedHMACKey;
  char v10;
  NSData *studyUUID;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_31;
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 76) & 1) == 0 || self->_version != *((_QWORD *)v4 + 1))
      goto LABEL_31;
  }
  else if ((*((_BYTE *)v4 + 76) & 1) != 0)
  {
    goto LABEL_31;
  }
  encryptedMessageKey = self->_encryptedMessageKey;
  if ((unint64_t)encryptedMessageKey | *((_QWORD *)v4 + 3)
    && !-[NSData isEqual:](encryptedMessageKey, "isEqual:"))
  {
    goto LABEL_31;
  }
  encryptionIdentity = self->_encryptionIdentity;
  if ((unint64_t)encryptionIdentity | *((_QWORD *)v4 + 4))
  {
    if (!-[NSData isEqual:](encryptionIdentity, "isEqual:"))
      goto LABEL_31;
  }
  uploadUUID = self->_uploadUUID;
  if ((unint64_t)uploadUUID | *((_QWORD *)v4 + 8))
  {
    if (!-[NSData isEqual:](uploadUUID, "isEqual:"))
      goto LABEL_31;
  }
  studyIdentifier = self->_studyIdentifier;
  if ((unint64_t)studyIdentifier | *((_QWORD *)v4 + 5))
  {
    if (!-[NSString isEqual:](studyIdentifier, "isEqual:"))
      goto LABEL_31;
  }
  encryptedHMACKey = self->_encryptedHMACKey;
  if ((unint64_t)encryptedHMACKey | *((_QWORD *)v4 + 2))
  {
    if (!-[NSData isEqual:](encryptedHMACKey, "isEqual:"))
      goto LABEL_31;
  }
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    if ((*((_BYTE *)v4 + 76) & 2) == 0 || self->_trailingHMACLength != *((_DWORD *)v4 + 14))
      goto LABEL_31;
  }
  else if ((*((_BYTE *)v4 + 76) & 2) != 0)
  {
    goto LABEL_31;
  }
  if ((*(_BYTE *)&self->_has & 4) != 0)
  {
    if ((*((_BYTE *)v4 + 76) & 4) == 0 || self->_trailingSHALength != *((_DWORD *)v4 + 15))
      goto LABEL_31;
  }
  else if ((*((_BYTE *)v4 + 76) & 4) != 0)
  {
    goto LABEL_31;
  }
  if ((*(_BYTE *)&self->_has & 8) == 0)
  {
    if ((*((_BYTE *)v4 + 76) & 8) == 0)
      goto LABEL_37;
LABEL_31:
    v10 = 0;
    goto LABEL_32;
  }
  if ((*((_BYTE *)v4 + 76) & 8) == 0)
    goto LABEL_31;
  if (!self->_compressed)
  {
    if (!*((_BYTE *)v4 + 72))
      goto LABEL_37;
    goto LABEL_31;
  }
  if (!*((_BYTE *)v4 + 72))
    goto LABEL_31;
LABEL_37:
  studyUUID = self->_studyUUID;
  if ((unint64_t)studyUUID | *((_QWORD *)v4 + 6))
    v10 = -[NSData isEqual:](studyUUID, "isEqual:");
  else
    v10 = 1;
LABEL_32:

  return v10;
}

- (unint64_t)hash
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  NSUInteger v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;

  if ((*(_BYTE *)&self->_has & 1) != 0)
    v3 = 2654435761 * self->_version;
  else
    v3 = 0;
  v4 = -[NSData hash](self->_encryptedMessageKey, "hash");
  v5 = -[NSData hash](self->_encryptionIdentity, "hash");
  v6 = -[NSData hash](self->_uploadUUID, "hash");
  v7 = -[NSString hash](self->_studyIdentifier, "hash");
  v8 = -[NSData hash](self->_encryptedHMACKey, "hash");
  if ((*(_BYTE *)&self->_has & 2) == 0)
  {
    v9 = 0;
    if ((*(_BYTE *)&self->_has & 4) != 0)
      goto LABEL_6;
LABEL_9:
    v10 = 0;
    if ((*(_BYTE *)&self->_has & 8) != 0)
      goto LABEL_7;
LABEL_10:
    v11 = 0;
    return v4 ^ v3 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9 ^ v10 ^ v11 ^ -[NSData hash](self->_studyUUID, "hash");
  }
  v9 = 2654435761 * self->_trailingHMACLength;
  if ((*(_BYTE *)&self->_has & 4) == 0)
    goto LABEL_9;
LABEL_6:
  v10 = 2654435761 * self->_trailingSHALength;
  if ((*(_BYTE *)&self->_has & 8) == 0)
    goto LABEL_10;
LABEL_7:
  v11 = 2654435761 * self->_compressed;
  return v4 ^ v3 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9 ^ v10 ^ v11 ^ -[NSData hash](self->_studyUUID, "hash");
}

- (void)mergeFrom:(id)a3
{
  id v4;
  char v5;
  id v6;

  v4 = a3;
  if ((*((_BYTE *)v4 + 76) & 1) != 0)
  {
    self->_version = *((_QWORD *)v4 + 1);
    *(_BYTE *)&self->_has |= 1u;
  }
  v6 = v4;
  if (*((_QWORD *)v4 + 3))
  {
    -[HKHealthWrapCodableMessageHeader setEncryptedMessageKey:](self, "setEncryptedMessageKey:");
    v4 = v6;
  }
  if (*((_QWORD *)v4 + 4))
  {
    -[HKHealthWrapCodableMessageHeader setEncryptionIdentity:](self, "setEncryptionIdentity:");
    v4 = v6;
  }
  if (*((_QWORD *)v4 + 8))
  {
    -[HKHealthWrapCodableMessageHeader setUploadUUID:](self, "setUploadUUID:");
    v4 = v6;
  }
  if (*((_QWORD *)v4 + 5))
  {
    -[HKHealthWrapCodableMessageHeader setStudyIdentifier:](self, "setStudyIdentifier:");
    v4 = v6;
  }
  if (*((_QWORD *)v4 + 2))
  {
    -[HKHealthWrapCodableMessageHeader setEncryptedHMACKey:](self, "setEncryptedHMACKey:");
    v4 = v6;
  }
  v5 = *((_BYTE *)v4 + 76);
  if ((v5 & 2) != 0)
  {
    self->_trailingHMACLength = *((_DWORD *)v4 + 14);
    *(_BYTE *)&self->_has |= 2u;
    v5 = *((_BYTE *)v4 + 76);
    if ((v5 & 4) == 0)
    {
LABEL_15:
      if ((v5 & 8) == 0)
        goto LABEL_17;
      goto LABEL_16;
    }
  }
  else if ((*((_BYTE *)v4 + 76) & 4) == 0)
  {
    goto LABEL_15;
  }
  self->_trailingSHALength = *((_DWORD *)v4 + 15);
  *(_BYTE *)&self->_has |= 4u;
  if ((*((_BYTE *)v4 + 76) & 8) != 0)
  {
LABEL_16:
    self->_compressed = *((_BYTE *)v4 + 72);
    *(_BYTE *)&self->_has |= 8u;
  }
LABEL_17:
  if (*((_QWORD *)v4 + 6))
  {
    -[HKHealthWrapCodableMessageHeader setStudyUUID:](self, "setStudyUUID:");
    v4 = v6;
  }

}

- (int64_t)version
{
  return self->_version;
}

- (NSData)encryptedMessageKey
{
  return self->_encryptedMessageKey;
}

- (void)setEncryptedMessageKey:(id)a3
{
  objc_storeStrong((id *)&self->_encryptedMessageKey, a3);
}

- (NSData)encryptionIdentity
{
  return self->_encryptionIdentity;
}

- (void)setEncryptionIdentity:(id)a3
{
  objc_storeStrong((id *)&self->_encryptionIdentity, a3);
}

- (NSData)uploadUUID
{
  return self->_uploadUUID;
}

- (void)setUploadUUID:(id)a3
{
  objc_storeStrong((id *)&self->_uploadUUID, a3);
}

- (NSString)studyIdentifier
{
  return self->_studyIdentifier;
}

- (void)setStudyIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_studyIdentifier, a3);
}

- (NSData)encryptedHMACKey
{
  return self->_encryptedHMACKey;
}

- (void)setEncryptedHMACKey:(id)a3
{
  objc_storeStrong((id *)&self->_encryptedHMACKey, a3);
}

- (int)trailingHMACLength
{
  return self->_trailingHMACLength;
}

- (int)trailingSHALength
{
  return self->_trailingSHALength;
}

- (BOOL)compressed
{
  return self->_compressed;
}

- (NSData)studyUUID
{
  return self->_studyUUID;
}

- (void)setStudyUUID:(id)a3
{
  objc_storeStrong((id *)&self->_studyUUID, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_uploadUUID, 0);
  objc_storeStrong((id *)&self->_studyUUID, 0);
  objc_storeStrong((id *)&self->_studyIdentifier, 0);
  objc_storeStrong((id *)&self->_encryptionIdentity, 0);
  objc_storeStrong((id *)&self->_encryptedMessageKey, 0);
  objc_storeStrong((id *)&self->_encryptedHMACKey, 0);
}

@end
