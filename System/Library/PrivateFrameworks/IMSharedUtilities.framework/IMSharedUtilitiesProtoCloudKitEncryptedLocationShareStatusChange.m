@implementation IMSharedUtilitiesProtoCloudKitEncryptedLocationShareStatusChange

- (void)dealloc
{
  objc_super v3;

  -[IMSharedUtilitiesProtoCloudKitEncryptedLocationShareStatusChange setOtherHandle:](self, "setOtherHandle:", 0);
  -[IMSharedUtilitiesProtoCloudKitEncryptedLocationShareStatusChange setPadding:](self, "setPadding:", 0);
  v3.receiver = self;
  v3.super_class = (Class)IMSharedUtilitiesProtoCloudKitEncryptedLocationShareStatusChange;
  -[IMSharedUtilitiesProtoCloudKitEncryptedLocationShareStatusChange dealloc](&v3, sel_dealloc);
}

- (void)setVersion:(unsigned int)a3
{
  *(_BYTE *)&self->_has |= 4u;
  self->_version = a3;
}

- (void)setHasVersion:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 4;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFB | v3;
}

- (BOOL)hasVersion
{
  return (*(_BYTE *)&self->_has >> 2) & 1;
}

- (void)setShareStatus:(int64_t)a3
{
  *(_BYTE *)&self->_has |= 2u;
  self->_shareStatus = a3;
}

- (void)setHasShareStatus:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFD | v3;
}

- (BOOL)hasShareStatus
{
  return (*(_BYTE *)&self->_has >> 1) & 1;
}

- (void)setShareDirection:(int64_t)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_shareDirection = a3;
}

- (void)setHasShareDirection:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (BOOL)hasShareDirection
{
  return *(_BYTE *)&self->_has & 1;
}

- (BOOL)hasOtherHandle
{
  return self->_otherHandle != 0;
}

- (BOOL)hasPadding
{
  return self->_padding != 0;
}

- (id)description
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)IMSharedUtilitiesProtoCloudKitEncryptedLocationShareStatusChange;
  return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@ %@"), -[IMSharedUtilitiesProtoCloudKitEncryptedLocationShareStatusChange description](&v3, sel_description), -[IMSharedUtilitiesProtoCloudKitEncryptedLocationShareStatusChange dictionaryRepresentation](self, "dictionaryRepresentation"));
}

- (id)dictionaryRepresentation
{
  void *v3;
  char has;
  NSString *otherHandle;
  NSData *padding;

  v3 = (void *)objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  has = (char)self->_has;
  if ((has & 4) != 0)
  {
    objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", self->_version), CFSTR("version"));
    has = (char)self->_has;
    if ((has & 2) == 0)
    {
LABEL_3:
      if ((has & 1) == 0)
        goto LABEL_5;
      goto LABEL_4;
    }
  }
  else if ((*(_BYTE *)&self->_has & 2) == 0)
  {
    goto LABEL_3;
  }
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", self->_shareStatus), CFSTR("share_status"));
  if ((*(_BYTE *)&self->_has & 1) != 0)
LABEL_4:
    objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", self->_shareDirection), CFSTR("share_direction"));
LABEL_5:
  otherHandle = self->_otherHandle;
  if (otherHandle)
    objc_msgSend(v3, "setObject:forKey:", otherHandle, CFSTR("other_handle"));
  padding = self->_padding;
  if (padding)
    objc_msgSend(v3, "setObject:forKey:", padding, CFSTR("padding"));
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return IMSharedUtilitiesProtoCloudKitEncryptedLocationShareStatusChangeReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  char has;

  has = (char)self->_has;
  if ((has & 4) != 0)
  {
    PBDataWriterWriteUint32Field();
    has = (char)self->_has;
    if ((has & 2) == 0)
    {
LABEL_3:
      if ((has & 1) == 0)
        goto LABEL_5;
      goto LABEL_4;
    }
  }
  else if ((*(_BYTE *)&self->_has & 2) == 0)
  {
    goto LABEL_3;
  }
  PBDataWriterWriteInt64Field();
  if ((*(_BYTE *)&self->_has & 1) != 0)
LABEL_4:
    PBDataWriterWriteInt64Field();
LABEL_5:
  if (self->_otherHandle)
    PBDataWriterWriteStringField();
  if (self->_padding)
    PBDataWriterWriteDataField();
}

- (void)copyTo:(id)a3
{
  char has;

  has = (char)self->_has;
  if ((has & 4) != 0)
  {
    *((_DWORD *)a3 + 10) = self->_version;
    *((_BYTE *)a3 + 44) |= 4u;
    has = (char)self->_has;
    if ((has & 2) == 0)
    {
LABEL_3:
      if ((has & 1) == 0)
        goto LABEL_5;
      goto LABEL_4;
    }
  }
  else if ((*(_BYTE *)&self->_has & 2) == 0)
  {
    goto LABEL_3;
  }
  *((_QWORD *)a3 + 2) = self->_shareStatus;
  *((_BYTE *)a3 + 44) |= 2u;
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
LABEL_4:
    *((_QWORD *)a3 + 1) = self->_shareDirection;
    *((_BYTE *)a3 + 44) |= 1u;
  }
LABEL_5:
  if (self->_otherHandle)
    objc_msgSend(a3, "setOtherHandle:");
  if (self->_padding)
    objc_msgSend(a3, "setPadding:");
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5;
  uint64_t v6;
  char has;

  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = v5;
  has = (char)self->_has;
  if ((has & 4) == 0)
  {
    if ((*(_BYTE *)&self->_has & 2) == 0)
      goto LABEL_3;
LABEL_7:
    *(_QWORD *)(v5 + 16) = self->_shareStatus;
    *(_BYTE *)(v5 + 44) |= 2u;
    if ((*(_BYTE *)&self->_has & 1) == 0)
      goto LABEL_5;
    goto LABEL_4;
  }
  *(_DWORD *)(v5 + 40) = self->_version;
  *(_BYTE *)(v5 + 44) |= 4u;
  has = (char)self->_has;
  if ((has & 2) != 0)
    goto LABEL_7;
LABEL_3:
  if ((has & 1) != 0)
  {
LABEL_4:
    *(_QWORD *)(v5 + 8) = self->_shareDirection;
    *(_BYTE *)(v5 + 44) |= 1u;
  }
LABEL_5:

  *(_QWORD *)(v6 + 24) = -[NSString copyWithZone:](self->_otherHandle, "copyWithZone:", a3);
  *(_QWORD *)(v6 + 32) = -[NSData copyWithZone:](self->_padding, "copyWithZone:", a3);
  return (id)v6;
}

- (BOOL)isEqual:(id)a3
{
  int v5;
  NSString *otherHandle;
  NSData *padding;

  v5 = objc_msgSend(a3, "isMemberOfClass:", objc_opt_class());
  if (v5)
  {
    if ((*(_BYTE *)&self->_has & 4) != 0)
    {
      if ((*((_BYTE *)a3 + 44) & 4) == 0 || self->_version != *((_DWORD *)a3 + 10))
        goto LABEL_21;
    }
    else if ((*((_BYTE *)a3 + 44) & 4) != 0)
    {
LABEL_21:
      LOBYTE(v5) = 0;
      return v5;
    }
    if ((*(_BYTE *)&self->_has & 2) != 0)
    {
      if ((*((_BYTE *)a3 + 44) & 2) == 0 || self->_shareStatus != *((_QWORD *)a3 + 2))
        goto LABEL_21;
    }
    else if ((*((_BYTE *)a3 + 44) & 2) != 0)
    {
      goto LABEL_21;
    }
    if ((*(_BYTE *)&self->_has & 1) != 0)
    {
      if ((*((_BYTE *)a3 + 44) & 1) == 0 || self->_shareDirection != *((_QWORD *)a3 + 1))
        goto LABEL_21;
    }
    else if ((*((_BYTE *)a3 + 44) & 1) != 0)
    {
      goto LABEL_21;
    }
    otherHandle = self->_otherHandle;
    if (!((unint64_t)otherHandle | *((_QWORD *)a3 + 3))
      || (v5 = -[NSString isEqual:](otherHandle, "isEqual:")) != 0)
    {
      padding = self->_padding;
      if ((unint64_t)padding | *((_QWORD *)a3 + 4))
        LOBYTE(v5) = -[NSData isEqual:](padding, "isEqual:");
      else
        LOBYTE(v5) = 1;
    }
  }
  return v5;
}

- (unint64_t)hash
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  NSUInteger v6;

  if ((*(_BYTE *)&self->_has & 4) == 0)
  {
    v3 = 0;
    if ((*(_BYTE *)&self->_has & 2) != 0)
      goto LABEL_3;
LABEL_6:
    v4 = 0;
    if ((*(_BYTE *)&self->_has & 1) != 0)
      goto LABEL_4;
LABEL_7:
    v5 = 0;
    goto LABEL_8;
  }
  v3 = 2654435761 * self->_version;
  if ((*(_BYTE *)&self->_has & 2) == 0)
    goto LABEL_6;
LABEL_3:
  v4 = 2654435761 * self->_shareStatus;
  if ((*(_BYTE *)&self->_has & 1) == 0)
    goto LABEL_7;
LABEL_4:
  v5 = 2654435761 * self->_shareDirection;
LABEL_8:
  v6 = v4 ^ v3 ^ v5 ^ -[NSString hash](self->_otherHandle, "hash");
  return v6 ^ -[NSData hash](self->_padding, "hash");
}

- (void)mergeFrom:(id)a3
{
  char v5;

  v5 = *((_BYTE *)a3 + 44);
  if ((v5 & 4) != 0)
  {
    self->_version = *((_DWORD *)a3 + 10);
    *(_BYTE *)&self->_has |= 4u;
    v5 = *((_BYTE *)a3 + 44);
    if ((v5 & 2) == 0)
    {
LABEL_3:
      if ((v5 & 1) == 0)
        goto LABEL_5;
      goto LABEL_4;
    }
  }
  else if ((*((_BYTE *)a3 + 44) & 2) == 0)
  {
    goto LABEL_3;
  }
  self->_shareStatus = *((_QWORD *)a3 + 2);
  *(_BYTE *)&self->_has |= 2u;
  if ((*((_BYTE *)a3 + 44) & 1) != 0)
  {
LABEL_4:
    self->_shareDirection = *((_QWORD *)a3 + 1);
    *(_BYTE *)&self->_has |= 1u;
  }
LABEL_5:
  if (*((_QWORD *)a3 + 3))
    -[IMSharedUtilitiesProtoCloudKitEncryptedLocationShareStatusChange setOtherHandle:](self, "setOtherHandle:");
  if (*((_QWORD *)a3 + 4))
    -[IMSharedUtilitiesProtoCloudKitEncryptedLocationShareStatusChange setPadding:](self, "setPadding:");
}

- (unsigned)version
{
  return self->_version;
}

- (int64_t)shareStatus
{
  return self->_shareStatus;
}

- (int64_t)shareDirection
{
  return self->_shareDirection;
}

- (NSString)otherHandle
{
  return self->_otherHandle;
}

- (void)setOtherHandle:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 24);
}

- (NSData)padding
{
  return self->_padding;
}

- (void)setPadding:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 32);
}

@end
