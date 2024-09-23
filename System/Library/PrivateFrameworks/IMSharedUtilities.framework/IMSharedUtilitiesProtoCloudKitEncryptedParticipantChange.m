@implementation IMSharedUtilitiesProtoCloudKitEncryptedParticipantChange

- (void)dealloc
{
  objc_super v3;

  -[IMSharedUtilitiesProtoCloudKitEncryptedParticipantChange setOtherHandle:](self, "setOtherHandle:", 0);
  -[IMSharedUtilitiesProtoCloudKitEncryptedParticipantChange setPadding:](self, "setPadding:", 0);
  v3.receiver = self;
  v3.super_class = (Class)IMSharedUtilitiesProtoCloudKitEncryptedParticipantChange;
  -[IMSharedUtilitiesProtoCloudKitEncryptedParticipantChange dealloc](&v3, sel_dealloc);
}

- (void)setVersion:(unsigned int)a3
{
  *(_BYTE *)&self->_has |= 2u;
  self->_version = a3;
}

- (void)setHasVersion:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFD | v3;
}

- (BOOL)hasVersion
{
  return (*(_BYTE *)&self->_has >> 1) & 1;
}

- (void)setParticipantChangeType:(int64_t)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_participantChangeType = a3;
}

- (void)setHasParticipantChangeType:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (BOOL)hasParticipantChangeType
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
  v3.super_class = (Class)IMSharedUtilitiesProtoCloudKitEncryptedParticipantChange;
  return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@ %@"), -[IMSharedUtilitiesProtoCloudKitEncryptedParticipantChange description](&v3, sel_description), -[IMSharedUtilitiesProtoCloudKitEncryptedParticipantChange dictionaryRepresentation](self, "dictionaryRepresentation"));
}

- (id)dictionaryRepresentation
{
  void *v3;
  char has;
  NSString *otherHandle;
  NSData *padding;

  v3 = (void *)objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  has = (char)self->_has;
  if ((has & 2) != 0)
  {
    objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", self->_version), CFSTR("version"));
    has = (char)self->_has;
  }
  if ((has & 1) != 0)
    objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", self->_participantChangeType), CFSTR("participant_change_type"));
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
  return IMSharedUtilitiesProtoCloudKitEncryptedParticipantChangeReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  char has;

  has = (char)self->_has;
  if ((has & 2) != 0)
  {
    PBDataWriterWriteUint32Field();
    has = (char)self->_has;
  }
  if ((has & 1) != 0)
    PBDataWriterWriteInt64Field();
  if (self->_otherHandle)
    PBDataWriterWriteStringField();
  if (self->_padding)
    PBDataWriterWriteDataField();
}

- (void)copyTo:(id)a3
{
  char has;

  has = (char)self->_has;
  if ((has & 2) != 0)
  {
    *((_DWORD *)a3 + 8) = self->_version;
    *((_BYTE *)a3 + 36) |= 2u;
    has = (char)self->_has;
  }
  if ((has & 1) != 0)
  {
    *((_QWORD *)a3 + 1) = self->_participantChangeType;
    *((_BYTE *)a3 + 36) |= 1u;
  }
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
  if ((has & 2) != 0)
  {
    *(_DWORD *)(v5 + 32) = self->_version;
    *(_BYTE *)(v5 + 36) |= 2u;
    has = (char)self->_has;
  }
  if ((has & 1) != 0)
  {
    *(_QWORD *)(v5 + 8) = self->_participantChangeType;
    *(_BYTE *)(v5 + 36) |= 1u;
  }

  *(_QWORD *)(v6 + 16) = -[NSString copyWithZone:](self->_otherHandle, "copyWithZone:", a3);
  *(_QWORD *)(v6 + 24) = -[NSData copyWithZone:](self->_padding, "copyWithZone:", a3);
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
    if ((*(_BYTE *)&self->_has & 2) != 0)
    {
      if ((*((_BYTE *)a3 + 36) & 2) == 0 || self->_version != *((_DWORD *)a3 + 8))
        goto LABEL_16;
    }
    else if ((*((_BYTE *)a3 + 36) & 2) != 0)
    {
LABEL_16:
      LOBYTE(v5) = 0;
      return v5;
    }
    if ((*(_BYTE *)&self->_has & 1) != 0)
    {
      if ((*((_BYTE *)a3 + 36) & 1) == 0 || self->_participantChangeType != *((_QWORD *)a3 + 1))
        goto LABEL_16;
    }
    else if ((*((_BYTE *)a3 + 36) & 1) != 0)
    {
      goto LABEL_16;
    }
    otherHandle = self->_otherHandle;
    if (!((unint64_t)otherHandle | *((_QWORD *)a3 + 2))
      || (v5 = -[NSString isEqual:](otherHandle, "isEqual:")) != 0)
    {
      padding = self->_padding;
      if ((unint64_t)padding | *((_QWORD *)a3 + 3))
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
  NSUInteger v5;

  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    v3 = 2654435761 * self->_version;
    if ((*(_BYTE *)&self->_has & 1) != 0)
      goto LABEL_3;
LABEL_5:
    v4 = 0;
    goto LABEL_6;
  }
  v3 = 0;
  if ((*(_BYTE *)&self->_has & 1) == 0)
    goto LABEL_5;
LABEL_3:
  v4 = 2654435761 * self->_participantChangeType;
LABEL_6:
  v5 = v4 ^ v3 ^ -[NSString hash](self->_otherHandle, "hash");
  return v5 ^ -[NSData hash](self->_padding, "hash");
}

- (void)mergeFrom:(id)a3
{
  char v5;

  v5 = *((_BYTE *)a3 + 36);
  if ((v5 & 2) != 0)
  {
    self->_version = *((_DWORD *)a3 + 8);
    *(_BYTE *)&self->_has |= 2u;
    v5 = *((_BYTE *)a3 + 36);
  }
  if ((v5 & 1) != 0)
  {
    self->_participantChangeType = *((_QWORD *)a3 + 1);
    *(_BYTE *)&self->_has |= 1u;
  }
  if (*((_QWORD *)a3 + 2))
    -[IMSharedUtilitiesProtoCloudKitEncryptedParticipantChange setOtherHandle:](self, "setOtherHandle:");
  if (*((_QWORD *)a3 + 3))
    -[IMSharedUtilitiesProtoCloudKitEncryptedParticipantChange setPadding:](self, "setPadding:");
}

- (unsigned)version
{
  return self->_version;
}

- (int64_t)participantChangeType
{
  return self->_participantChangeType;
}

- (NSString)otherHandle
{
  return self->_otherHandle;
}

- (void)setOtherHandle:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 16);
}

- (NSData)padding
{
  return self->_padding;
}

- (void)setPadding:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 24);
}

@end
