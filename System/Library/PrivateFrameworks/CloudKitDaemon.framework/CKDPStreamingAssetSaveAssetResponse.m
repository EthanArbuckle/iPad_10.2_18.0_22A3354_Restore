@implementation CKDPStreamingAssetSaveAssetResponse

- (void)setReservedSize:(int64_t)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_reservedSize = a3;
}

- (void)setHasReservedSize:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (BOOL)hasReservedSize
{
  return *(_BYTE *)&self->_has & 1;
}

- (BOOL)hasUploadURL
{
  return self->_uploadURL != 0;
}

- (void)setUploadURLExpirationTimeSeconds:(int64_t)a3
{
  *(_BYTE *)&self->_has |= 2u;
  self->_uploadURLExpirationTimeSeconds = a3;
}

- (void)setHasUploadURLExpirationTimeSeconds:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFD | v3;
}

- (BOOL)hasUploadURLExpirationTimeSeconds
{
  return (*(_BYTE *)&self->_has >> 1) & 1;
}

- (id)description
{
  void *v3;
  void *v4;
  const char *v5;
  uint64_t v6;
  void *v7;
  const char *v8;
  void *v9;
  objc_super v11;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v11.receiver = self;
  v11.super_class = (Class)CKDPStreamingAssetSaveAssetResponse;
  -[CKDPStreamingAssetSaveAssetResponse description](&v11, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_dictionaryRepresentation(self, v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_stringWithFormat_(v3, v8, (uint64_t)CFSTR("%@ %@"), v4, v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (id)dictionaryRepresentation
{
  uint64_t v2;
  const char *v4;
  void *v5;
  void *v6;
  const char *v7;
  NSString *uploadURL;
  void *v9;
  const char *v10;

  objc_msgSend_dictionary(MEMORY[0x1E0C99E08], a2, v2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    objc_msgSend_numberWithLongLong_(MEMORY[0x1E0CB37E8], v4, self->_reservedSize);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setObject_forKey_(v5, v7, (uint64_t)v6, CFSTR("reservedSize"));

  }
  uploadURL = self->_uploadURL;
  if (uploadURL)
    objc_msgSend_setObject_forKey_(v5, v4, (uint64_t)uploadURL, CFSTR("uploadURL"));
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    objc_msgSend_numberWithLongLong_(MEMORY[0x1E0CB37E8], v4, self->_uploadURLExpirationTimeSeconds);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setObject_forKey_(v5, v10, (uint64_t)v9, CFSTR("uploadURLExpirationTimeSeconds"));

  }
  return v5;
}

- (BOOL)readFrom:(id)a3
{
  return sub_1BEAAA3E8((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = v4;
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    PBDataWriterWriteInt64Field();
    v4 = v5;
  }
  if (self->_uploadURL)
  {
    PBDataWriterWriteStringField();
    v4 = v5;
  }
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    PBDataWriterWriteInt64Field();
    v4 = v5;
  }

}

- (void)copyTo:(id)a3
{
  _QWORD *v4;
  const char *v5;
  NSString *uploadURL;
  _QWORD *v7;

  v4 = a3;
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    v4[1] = self->_reservedSize;
    *((_BYTE *)v4 + 32) |= 1u;
  }
  uploadURL = self->_uploadURL;
  if (uploadURL)
  {
    v7 = v4;
    objc_msgSend_setUploadURL_(v4, v5, (uint64_t)uploadURL);
    v4 = v7;
  }
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    v4[2] = self->_uploadURLExpirationTimeSeconds;
    *((_BYTE *)v4 + 32) |= 2u;
  }

}

- (id)copyWithZone:(_NSZone *)a3
{
  void *v5;
  const char *v6;
  void *v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;

  v5 = (void *)objc_opt_class();
  v7 = (void *)objc_msgSend_allocWithZone_(v5, v6, (uint64_t)a3);
  v10 = objc_msgSend_init(v7, v8, v9);
  v12 = v10;
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    *(_QWORD *)(v10 + 8) = self->_reservedSize;
    *(_BYTE *)(v10 + 32) |= 1u;
  }
  v13 = objc_msgSend_copyWithZone_(self->_uploadURL, v11, (uint64_t)a3);
  v14 = *(void **)(v12 + 24);
  *(_QWORD *)(v12 + 24) = v13;

  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    *(_QWORD *)(v12 + 16) = self->_uploadURLExpirationTimeSeconds;
    *(_BYTE *)(v12 + 32) |= 2u;
  }
  return (id)v12;
}

- (BOOL)isEqual:(id)a3
{
  uint64_t *v4;
  uint64_t v5;
  const char *v6;
  const char *v7;
  char has;
  char v9;
  NSString *uploadURL;
  uint64_t v11;
  BOOL v12;

  v4 = (uint64_t *)a3;
  v5 = objc_opt_class();
  if (!objc_msgSend_isMemberOfClass_(v4, v6, v5))
    goto LABEL_14;
  has = (char)self->_has;
  v9 = *((_BYTE *)v4 + 32);
  if ((has & 1) != 0)
  {
    if ((v4[4] & 1) == 0 || self->_reservedSize != v4[1])
      goto LABEL_14;
  }
  else if ((v4[4] & 1) != 0)
  {
    goto LABEL_14;
  }
  uploadURL = self->_uploadURL;
  v11 = v4[3];
  if ((unint64_t)uploadURL | v11)
  {
    if (!objc_msgSend_isEqual_(uploadURL, v7, v11))
    {
LABEL_14:
      v12 = 0;
      goto LABEL_15;
    }
    has = (char)self->_has;
    v9 = *((_BYTE *)v4 + 32);
  }
  v12 = (v9 & 2) == 0;
  if ((has & 2) != 0)
  {
    if ((v9 & 2) == 0 || self->_uploadURLExpirationTimeSeconds != v4[2])
      goto LABEL_14;
    v12 = 1;
  }
LABEL_15:

  return v12;
}

- (unint64_t)hash
{
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  if ((*(_BYTE *)&self->_has & 1) != 0)
    v4 = 2654435761 * self->_reservedSize;
  else
    v4 = 0;
  v5 = objc_msgSend_hash(self->_uploadURL, a2, v2);
  if ((*(_BYTE *)&self->_has & 2) != 0)
    v6 = 2654435761 * self->_uploadURLExpirationTimeSeconds;
  else
    v6 = 0;
  return v5 ^ v4 ^ v6;
}

- (void)mergeFrom:(id)a3
{
  _QWORD *v4;
  const char *v5;
  uint64_t v6;
  _QWORD *v7;

  v4 = a3;
  if ((v4[4] & 1) != 0)
  {
    self->_reservedSize = v4[1];
    *(_BYTE *)&self->_has |= 1u;
  }
  v6 = v4[3];
  if (v6)
  {
    v7 = v4;
    objc_msgSend_setUploadURL_(self, v5, v6);
    v4 = v7;
  }
  if ((v4[4] & 2) != 0)
  {
    self->_uploadURLExpirationTimeSeconds = v4[2];
    *(_BYTE *)&self->_has |= 2u;
  }

}

- (int64_t)reservedSize
{
  return self->_reservedSize;
}

- (NSString)uploadURL
{
  return self->_uploadURL;
}

- (void)setUploadURL:(id)a3
{
  objc_storeStrong((id *)&self->_uploadURL, a3);
}

- (int64_t)uploadURLExpirationTimeSeconds
{
  return self->_uploadURLExpirationTimeSeconds;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_uploadURL, 0);
}

@end
