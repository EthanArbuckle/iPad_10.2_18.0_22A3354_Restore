@implementation IMSharedUtilitiesProtoCloudKitEncryptedGroupTitleChange

- (void)dealloc
{
  objc_super v3;

  -[IMSharedUtilitiesProtoCloudKitEncryptedGroupTitleChange setGroupTitle:](self, "setGroupTitle:", 0);
  -[IMSharedUtilitiesProtoCloudKitEncryptedGroupTitleChange setOtherHandle:](self, "setOtherHandle:", 0);
  -[IMSharedUtilitiesProtoCloudKitEncryptedGroupTitleChange setPadding:](self, "setPadding:", 0);
  v3.receiver = self;
  v3.super_class = (Class)IMSharedUtilitiesProtoCloudKitEncryptedGroupTitleChange;
  -[IMSharedUtilitiesProtoCloudKitEncryptedGroupTitleChange dealloc](&v3, sel_dealloc);
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

- (BOOL)hasGroupTitle
{
  return self->_groupTitle != 0;
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
  v3.super_class = (Class)IMSharedUtilitiesProtoCloudKitEncryptedGroupTitleChange;
  return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@ %@"), -[IMSharedUtilitiesProtoCloudKitEncryptedGroupTitleChange description](&v3, sel_description), -[IMSharedUtilitiesProtoCloudKitEncryptedGroupTitleChange dictionaryRepresentation](self, "dictionaryRepresentation"));
}

- (id)dictionaryRepresentation
{
  void *v3;
  NSString *groupTitle;
  NSString *otherHandle;
  NSData *padding;

  v3 = (void *)objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  if ((*(_BYTE *)&self->_has & 1) != 0)
    objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", self->_version), CFSTR("version"));
  groupTitle = self->_groupTitle;
  if (groupTitle)
    objc_msgSend(v3, "setObject:forKey:", groupTitle, CFSTR("group_title"));
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
  return IMSharedUtilitiesProtoCloudKitEncryptedGroupTitleChangeReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  if ((*(_BYTE *)&self->_has & 1) != 0)
    PBDataWriterWriteUint32Field();
  if (self->_groupTitle)
    PBDataWriterWriteStringField();
  if (self->_otherHandle)
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
  if (self->_groupTitle)
    objc_msgSend(a3, "setGroupTitle:");
  if (self->_otherHandle)
    objc_msgSend(a3, "setOtherHandle:");
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

  *(_QWORD *)(v6 + 8) = -[NSString copyWithZone:](self->_groupTitle, "copyWithZone:", a3);
  *(_QWORD *)(v6 + 16) = -[NSString copyWithZone:](self->_otherHandle, "copyWithZone:", a3);

  *(_QWORD *)(v6 + 24) = -[NSData copyWithZone:](self->_padding, "copyWithZone:", a3);
  return (id)v6;
}

- (BOOL)isEqual:(id)a3
{
  int v5;
  NSString *groupTitle;
  NSString *otherHandle;
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
    groupTitle = self->_groupTitle;
    if (!((unint64_t)groupTitle | *((_QWORD *)a3 + 1))
      || (v5 = -[NSString isEqual:](groupTitle, "isEqual:")) != 0)
    {
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
  v4 = -[NSString hash](self->_groupTitle, "hash") ^ v3;
  v5 = -[NSString hash](self->_otherHandle, "hash");
  return v4 ^ v5 ^ -[NSData hash](self->_padding, "hash");
}

- (void)mergeFrom:(id)a3
{
  if ((*((_BYTE *)a3 + 36) & 1) != 0)
  {
    self->_version = *((_DWORD *)a3 + 8);
    *(_BYTE *)&self->_has |= 1u;
  }
  if (*((_QWORD *)a3 + 1))
    -[IMSharedUtilitiesProtoCloudKitEncryptedGroupTitleChange setGroupTitle:](self, "setGroupTitle:");
  if (*((_QWORD *)a3 + 2))
    -[IMSharedUtilitiesProtoCloudKitEncryptedGroupTitleChange setOtherHandle:](self, "setOtherHandle:");
  if (*((_QWORD *)a3 + 3))
    -[IMSharedUtilitiesProtoCloudKitEncryptedGroupTitleChange setPadding:](self, "setPadding:");
}

- (unsigned)version
{
  return self->_version;
}

- (NSString)groupTitle
{
  return self->_groupTitle;
}

- (void)setGroupTitle:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 8);
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
