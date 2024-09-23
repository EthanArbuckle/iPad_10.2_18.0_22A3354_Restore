@implementation IMSharedUtilitiesProtoCloudKitEncryptedMessageP4

- (void)dealloc
{
  objc_super v3;

  -[IMSharedUtilitiesProtoCloudKitEncryptedMessageP4 setAssociatedMessageEmoji:](self, "setAssociatedMessageEmoji:", 0);
  -[IMSharedUtilitiesProtoCloudKitEncryptedMessageP4 setPadding:](self, "setPadding:", 0);
  -[IMSharedUtilitiesProtoCloudKitEncryptedMessageP4 setActualService:](self, "setActualService:", 0);
  -[IMSharedUtilitiesProtoCloudKitEncryptedMessageP4 setActualParentChatId:](self, "setActualParentChatId:", 0);
  v3.receiver = self;
  v3.super_class = (Class)IMSharedUtilitiesProtoCloudKitEncryptedMessageP4;
  -[IMSharedUtilitiesProtoCloudKitEncryptedMessageP4 dealloc](&v3, sel_dealloc);
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

- (BOOL)hasAssociatedMessageEmoji
{
  return self->_associatedMessageEmoji != 0;
}

- (BOOL)hasPadding
{
  return self->_padding != 0;
}

- (BOOL)hasActualService
{
  return self->_actualService != 0;
}

- (void)setScheduleType:(unsigned int)a3
{
  *(_BYTE *)&self->_has |= 2u;
  self->_scheduleType = a3;
}

- (void)setHasScheduleType:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFD | v3;
}

- (BOOL)hasScheduleType
{
  return (*(_BYTE *)&self->_has >> 1) & 1;
}

- (void)setScheduleState:(unsigned int)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_scheduleState = a3;
}

- (void)setHasScheduleState:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (BOOL)hasScheduleState
{
  return *(_BYTE *)&self->_has & 1;
}

- (BOOL)hasActualParentChatId
{
  return self->_actualParentChatId != 0;
}

- (id)description
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)IMSharedUtilitiesProtoCloudKitEncryptedMessageP4;
  return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@ %@"), -[IMSharedUtilitiesProtoCloudKitEncryptedMessageP4 description](&v3, sel_description), -[IMSharedUtilitiesProtoCloudKitEncryptedMessageP4 dictionaryRepresentation](self, "dictionaryRepresentation"));
}

- (id)dictionaryRepresentation
{
  void *v3;
  NSString *associatedMessageEmoji;
  NSData *padding;
  NSString *actualService;
  char has;
  NSString *actualParentChatId;

  v3 = (void *)objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  if ((*(_BYTE *)&self->_has & 4) != 0)
    objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", self->_version), CFSTR("version"));
  associatedMessageEmoji = self->_associatedMessageEmoji;
  if (associatedMessageEmoji)
    objc_msgSend(v3, "setObject:forKey:", associatedMessageEmoji, CFSTR("associated_message_emoji"));
  padding = self->_padding;
  if (padding)
    objc_msgSend(v3, "setObject:forKey:", padding, CFSTR("padding"));
  actualService = self->_actualService;
  if (actualService)
    objc_msgSend(v3, "setObject:forKey:", actualService, CFSTR("actual_service"));
  has = (char)self->_has;
  if ((has & 2) != 0)
  {
    objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", self->_scheduleType), CFSTR("schedule_type"));
    has = (char)self->_has;
  }
  if ((has & 1) != 0)
    objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", self->_scheduleState), CFSTR("schedule_state"));
  actualParentChatId = self->_actualParentChatId;
  if (actualParentChatId)
    objc_msgSend(v3, "setObject:forKey:", actualParentChatId, CFSTR("actual_parent_chat_id"));
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return IMSharedUtilitiesProtoCloudKitEncryptedMessageP4ReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  char has;

  if ((*(_BYTE *)&self->_has & 4) != 0)
    PBDataWriterWriteUint32Field();
  if (self->_associatedMessageEmoji)
    PBDataWriterWriteStringField();
  if (self->_padding)
    PBDataWriterWriteDataField();
  if (self->_actualService)
    PBDataWriterWriteStringField();
  has = (char)self->_has;
  if ((has & 2) != 0)
  {
    PBDataWriterWriteUint32Field();
    has = (char)self->_has;
  }
  if ((has & 1) != 0)
    PBDataWriterWriteUint32Field();
  if (self->_actualParentChatId)
    PBDataWriterWriteStringField();
}

- (void)copyTo:(id)a3
{
  char has;

  if ((*(_BYTE *)&self->_has & 4) != 0)
  {
    *((_DWORD *)a3 + 12) = self->_version;
    *((_BYTE *)a3 + 52) |= 4u;
  }
  if (self->_associatedMessageEmoji)
    objc_msgSend(a3, "setAssociatedMessageEmoji:");
  if (self->_padding)
    objc_msgSend(a3, "setPadding:");
  if (self->_actualService)
    objc_msgSend(a3, "setActualService:");
  has = (char)self->_has;
  if ((has & 2) != 0)
  {
    *((_DWORD *)a3 + 11) = self->_scheduleType;
    *((_BYTE *)a3 + 52) |= 2u;
    has = (char)self->_has;
  }
  if ((has & 1) != 0)
  {
    *((_DWORD *)a3 + 10) = self->_scheduleState;
    *((_BYTE *)a3 + 52) |= 1u;
  }
  if (self->_actualParentChatId)
    objc_msgSend(a3, "setActualParentChatId:");
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5;
  uint64_t v6;
  char has;

  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = v5;
  if ((*(_BYTE *)&self->_has & 4) != 0)
  {
    *(_DWORD *)(v5 + 48) = self->_version;
    *(_BYTE *)(v5 + 52) |= 4u;
  }

  *(_QWORD *)(v6 + 24) = -[NSString copyWithZone:](self->_associatedMessageEmoji, "copyWithZone:", a3);
  *(_QWORD *)(v6 + 32) = -[NSData copyWithZone:](self->_padding, "copyWithZone:", a3);

  *(_QWORD *)(v6 + 16) = -[NSString copyWithZone:](self->_actualService, "copyWithZone:", a3);
  has = (char)self->_has;
  if ((has & 2) != 0)
  {
    *(_DWORD *)(v6 + 44) = self->_scheduleType;
    *(_BYTE *)(v6 + 52) |= 2u;
    has = (char)self->_has;
  }
  if ((has & 1) != 0)
  {
    *(_DWORD *)(v6 + 40) = self->_scheduleState;
    *(_BYTE *)(v6 + 52) |= 1u;
  }

  *(_QWORD *)(v6 + 8) = -[NSString copyWithZone:](self->_actualParentChatId, "copyWithZone:", a3);
  return (id)v6;
}

- (BOOL)isEqual:(id)a3
{
  int v5;
  NSString *associatedMessageEmoji;
  NSData *padding;
  NSString *actualService;
  NSString *actualParentChatId;

  v5 = objc_msgSend(a3, "isMemberOfClass:", objc_opt_class());
  if (v5)
  {
    if ((*(_BYTE *)&self->_has & 4) != 0)
    {
      if ((*((_BYTE *)a3 + 52) & 4) == 0 || self->_version != *((_DWORD *)a3 + 12))
        goto LABEL_25;
    }
    else if ((*((_BYTE *)a3 + 52) & 4) != 0)
    {
LABEL_25:
      LOBYTE(v5) = 0;
      return v5;
    }
    associatedMessageEmoji = self->_associatedMessageEmoji;
    if (!((unint64_t)associatedMessageEmoji | *((_QWORD *)a3 + 3))
      || (v5 = -[NSString isEqual:](associatedMessageEmoji, "isEqual:")) != 0)
    {
      padding = self->_padding;
      if (!((unint64_t)padding | *((_QWORD *)a3 + 4)) || (v5 = -[NSData isEqual:](padding, "isEqual:")) != 0)
      {
        actualService = self->_actualService;
        if (!((unint64_t)actualService | *((_QWORD *)a3 + 2))
          || (v5 = -[NSString isEqual:](actualService, "isEqual:")) != 0)
        {
          if ((*(_BYTE *)&self->_has & 2) != 0)
          {
            if ((*((_BYTE *)a3 + 52) & 2) == 0 || self->_scheduleType != *((_DWORD *)a3 + 11))
              goto LABEL_25;
          }
          else if ((*((_BYTE *)a3 + 52) & 2) != 0)
          {
            goto LABEL_25;
          }
          if ((*(_BYTE *)&self->_has & 1) != 0)
          {
            if ((*((_BYTE *)a3 + 52) & 1) == 0 || self->_scheduleState != *((_DWORD *)a3 + 10))
              goto LABEL_25;
          }
          else if ((*((_BYTE *)a3 + 52) & 1) != 0)
          {
            goto LABEL_25;
          }
          actualParentChatId = self->_actualParentChatId;
          if ((unint64_t)actualParentChatId | *((_QWORD *)a3 + 1))
            LOBYTE(v5) = -[NSString isEqual:](actualParentChatId, "isEqual:");
          else
            LOBYTE(v5) = 1;
        }
      }
    }
  }
  return v5;
}

- (unint64_t)hash
{
  uint64_t v3;
  NSUInteger v4;
  uint64_t v5;
  NSUInteger v6;
  uint64_t v7;
  uint64_t v8;

  if ((*(_BYTE *)&self->_has & 4) != 0)
    v3 = 2654435761 * self->_version;
  else
    v3 = 0;
  v4 = -[NSString hash](self->_associatedMessageEmoji, "hash");
  v5 = -[NSData hash](self->_padding, "hash");
  v6 = -[NSString hash](self->_actualService, "hash");
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    v7 = 2654435761 * self->_scheduleType;
    if ((*(_BYTE *)&self->_has & 1) != 0)
      goto LABEL_6;
LABEL_8:
    v8 = 0;
    return v4 ^ v3 ^ v5 ^ v6 ^ v7 ^ v8 ^ -[NSString hash](self->_actualParentChatId, "hash");
  }
  v7 = 0;
  if ((*(_BYTE *)&self->_has & 1) == 0)
    goto LABEL_8;
LABEL_6:
  v8 = 2654435761 * self->_scheduleState;
  return v4 ^ v3 ^ v5 ^ v6 ^ v7 ^ v8 ^ -[NSString hash](self->_actualParentChatId, "hash");
}

- (void)mergeFrom:(id)a3
{
  char v5;

  if ((*((_BYTE *)a3 + 52) & 4) != 0)
  {
    self->_version = *((_DWORD *)a3 + 12);
    *(_BYTE *)&self->_has |= 4u;
  }
  if (*((_QWORD *)a3 + 3))
    -[IMSharedUtilitiesProtoCloudKitEncryptedMessageP4 setAssociatedMessageEmoji:](self, "setAssociatedMessageEmoji:");
  if (*((_QWORD *)a3 + 4))
    -[IMSharedUtilitiesProtoCloudKitEncryptedMessageP4 setPadding:](self, "setPadding:");
  if (*((_QWORD *)a3 + 2))
    -[IMSharedUtilitiesProtoCloudKitEncryptedMessageP4 setActualService:](self, "setActualService:");
  v5 = *((_BYTE *)a3 + 52);
  if ((v5 & 2) != 0)
  {
    self->_scheduleType = *((_DWORD *)a3 + 11);
    *(_BYTE *)&self->_has |= 2u;
    v5 = *((_BYTE *)a3 + 52);
  }
  if ((v5 & 1) != 0)
  {
    self->_scheduleState = *((_DWORD *)a3 + 10);
    *(_BYTE *)&self->_has |= 1u;
  }
  if (*((_QWORD *)a3 + 1))
    -[IMSharedUtilitiesProtoCloudKitEncryptedMessageP4 setActualParentChatId:](self, "setActualParentChatId:");
}

- (unsigned)version
{
  return self->_version;
}

- (NSString)associatedMessageEmoji
{
  return self->_associatedMessageEmoji;
}

- (void)setAssociatedMessageEmoji:(id)a3
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

- (NSString)actualService
{
  return self->_actualService;
}

- (void)setActualService:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 16);
}

- (unsigned)scheduleType
{
  return self->_scheduleType;
}

- (unsigned)scheduleState
{
  return self->_scheduleState;
}

- (NSString)actualParentChatId
{
  return self->_actualParentChatId;
}

- (void)setActualParentChatId:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 8);
}

@end
