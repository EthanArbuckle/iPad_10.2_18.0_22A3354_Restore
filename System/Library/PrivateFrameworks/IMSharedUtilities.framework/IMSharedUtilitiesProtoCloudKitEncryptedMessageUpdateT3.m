@implementation IMSharedUtilitiesProtoCloudKitEncryptedMessageUpdateT3

- (void)dealloc
{
  objc_super v3;

  -[IMSharedUtilitiesProtoCloudKitEncryptedMessageUpdateT3 setMsgid:](self, "setMsgid:", 0);
  -[IMSharedUtilitiesProtoCloudKitEncryptedMessageUpdateT3 setChatid:](self, "setChatid:", 0);
  -[IMSharedUtilitiesProtoCloudKitEncryptedMessageUpdateT3 setPadding:](self, "setPadding:", 0);
  v3.receiver = self;
  v3.super_class = (Class)IMSharedUtilitiesProtoCloudKitEncryptedMessageUpdateT3;
  -[IMSharedUtilitiesProtoCloudKitEncryptedMessageUpdateT3 dealloc](&v3, sel_dealloc);
}

- (void)setVersion:(unsigned int)a3
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

- (BOOL)hasMsgid
{
  return self->_msgid != 0;
}

- (BOOL)hasChatid
{
  return self->_chatid != 0;
}

- (BOOL)hasPadding
{
  return self->_padding != 0;
}

- (id)description
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)IMSharedUtilitiesProtoCloudKitEncryptedMessageUpdateT3;
  return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@ %@"), -[IMSharedUtilitiesProtoCloudKitEncryptedMessageUpdateT3 description](&v3, sel_description), -[IMSharedUtilitiesProtoCloudKitEncryptedMessageUpdateT3 dictionaryRepresentation](self, "dictionaryRepresentation"));
}

- (id)dictionaryRepresentation
{
  void *v3;
  NSString *msgid;
  NSString *chatid;
  NSData *padding;

  v3 = (void *)objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  if ((*(_BYTE *)&self->_has & 1) != 0)
    objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", self->_version), CFSTR("version"));
  msgid = self->_msgid;
  if (msgid)
    objc_msgSend(v3, "setObject:forKey:", msgid, CFSTR("msgid"));
  chatid = self->_chatid;
  if (chatid)
    objc_msgSend(v3, "setObject:forKey:", chatid, CFSTR("chatid"));
  padding = self->_padding;
  if (padding)
    objc_msgSend(v3, "setObject:forKey:", padding, CFSTR("padding"));
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return IMSharedUtilitiesProtoCloudKitEncryptedMessageUpdateT3ReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  if ((*(_BYTE *)&self->_has & 1) != 0)
    PBDataWriterWriteUint32Field();
  if (self->_msgid)
    PBDataWriterWriteStringField();
  if (self->_chatid)
    PBDataWriterWriteStringField();
  if (self->_padding)
    PBDataWriterWriteDataField();
}

- (void)copyTo:(id)a3
{
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    *((_DWORD *)a3 + 8) = self->_version;
    *((_BYTE *)a3 + 36) |= 1u;
  }
  if (self->_msgid)
    objc_msgSend(a3, "setMsgid:");
  if (self->_chatid)
    objc_msgSend(a3, "setChatid:");
  if (self->_padding)
    objc_msgSend(a3, "setPadding:");
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5;
  uint64_t v6;

  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = v5;
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    *(_DWORD *)(v5 + 32) = self->_version;
    *(_BYTE *)(v5 + 36) |= 1u;
  }

  *(_QWORD *)(v6 + 16) = -[NSString copyWithZone:](self->_msgid, "copyWithZone:", a3);
  *(_QWORD *)(v6 + 8) = -[NSString copyWithZone:](self->_chatid, "copyWithZone:", a3);

  *(_QWORD *)(v6 + 24) = -[NSData copyWithZone:](self->_padding, "copyWithZone:", a3);
  return (id)v6;
}

- (BOOL)isEqual:(id)a3
{
  int v5;
  NSString *msgid;
  NSString *chatid;
  NSData *padding;

  v5 = objc_msgSend(a3, "isMemberOfClass:", objc_opt_class());
  if (v5)
  {
    if ((*(_BYTE *)&self->_has & 1) != 0)
    {
      if ((*((_BYTE *)a3 + 36) & 1) == 0 || self->_version != *((_DWORD *)a3 + 8))
        goto LABEL_13;
    }
    else if ((*((_BYTE *)a3 + 36) & 1) != 0)
    {
LABEL_13:
      LOBYTE(v5) = 0;
      return v5;
    }
    msgid = self->_msgid;
    if (!((unint64_t)msgid | *((_QWORD *)a3 + 2)) || (v5 = -[NSString isEqual:](msgid, "isEqual:")) != 0)
    {
      chatid = self->_chatid;
      if (!((unint64_t)chatid | *((_QWORD *)a3 + 1)) || (v5 = -[NSString isEqual:](chatid, "isEqual:")) != 0)
      {
        padding = self->_padding;
        if ((unint64_t)padding | *((_QWORD *)a3 + 3))
          LOBYTE(v5) = -[NSData isEqual:](padding, "isEqual:");
        else
          LOBYTE(v5) = 1;
      }
    }
  }
  return v5;
}

- (unint64_t)hash
{
  uint64_t v3;
  NSUInteger v4;
  NSUInteger v5;

  if ((*(_BYTE *)&self->_has & 1) != 0)
    v3 = 2654435761 * self->_version;
  else
    v3 = 0;
  v4 = -[NSString hash](self->_msgid, "hash") ^ v3;
  v5 = -[NSString hash](self->_chatid, "hash");
  return v4 ^ v5 ^ -[NSData hash](self->_padding, "hash");
}

- (void)mergeFrom:(id)a3
{
  if ((*((_BYTE *)a3 + 36) & 1) != 0)
  {
    self->_version = *((_DWORD *)a3 + 8);
    *(_BYTE *)&self->_has |= 1u;
  }
  if (*((_QWORD *)a3 + 2))
    -[IMSharedUtilitiesProtoCloudKitEncryptedMessageUpdateT3 setMsgid:](self, "setMsgid:");
  if (*((_QWORD *)a3 + 1))
    -[IMSharedUtilitiesProtoCloudKitEncryptedMessageUpdateT3 setChatid:](self, "setChatid:");
  if (*((_QWORD *)a3 + 3))
    -[IMSharedUtilitiesProtoCloudKitEncryptedMessageUpdateT3 setPadding:](self, "setPadding:");
}

- (unsigned)version
{
  return self->_version;
}

- (NSString)msgid
{
  return self->_msgid;
}

- (void)setMsgid:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 16);
}

- (NSString)chatid
{
  return self->_chatid;
}

- (void)setChatid:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 8);
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
