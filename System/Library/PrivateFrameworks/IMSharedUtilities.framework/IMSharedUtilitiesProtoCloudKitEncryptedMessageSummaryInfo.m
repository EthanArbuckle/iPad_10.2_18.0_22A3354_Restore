@implementation IMSharedUtilitiesProtoCloudKitEncryptedMessageSummaryInfo

- (void)dealloc
{
  objc_super v3;

  -[IMSharedUtilitiesProtoCloudKitEncryptedMessageSummaryInfo setMessageSummaryInfo:](self, "setMessageSummaryInfo:", 0);
  -[IMSharedUtilitiesProtoCloudKitEncryptedMessageSummaryInfo setPadding:](self, "setPadding:", 0);
  v3.receiver = self;
  v3.super_class = (Class)IMSharedUtilitiesProtoCloudKitEncryptedMessageSummaryInfo;
  -[IMSharedUtilitiesProtoCloudKitEncryptedMessageSummaryInfo dealloc](&v3, sel_dealloc);
}

- (BOOL)hasMessageSummaryInfo
{
  return self->_messageSummaryInfo != 0;
}

- (BOOL)hasPadding
{
  return self->_padding != 0;
}

- (id)description
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)IMSharedUtilitiesProtoCloudKitEncryptedMessageSummaryInfo;
  return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@ %@"), -[IMSharedUtilitiesProtoCloudKitEncryptedMessageSummaryInfo description](&v3, sel_description), -[IMSharedUtilitiesProtoCloudKitEncryptedMessageSummaryInfo dictionaryRepresentation](self, "dictionaryRepresentation"));
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;
  NSData *messageSummaryInfo;
  NSData *padding;

  v3 = (void *)objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v4 = v3;
  messageSummaryInfo = self->_messageSummaryInfo;
  if (messageSummaryInfo)
    objc_msgSend(v3, "setObject:forKey:", messageSummaryInfo, CFSTR("message_summary_info"));
  padding = self->_padding;
  if (padding)
    objc_msgSend(v4, "setObject:forKey:", padding, CFSTR("padding"));
  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return IMSharedUtilitiesProtoCloudKitEncryptedMessageSummaryInfoReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  if (self->_messageSummaryInfo)
    PBDataWriterWriteDataField();
  if (self->_padding)
    PBDataWriterWriteDataField();
}

- (void)copyTo:(id)a3
{
  if (self->_messageSummaryInfo)
    objc_msgSend(a3, "setMessageSummaryInfo:");
  if (self->_padding)
    objc_msgSend(a3, "setPadding:");
}

- (id)copyWithZone:(_NSZone *)a3
{
  id *v5;

  v5 = (id *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");

  v5[1] = (id)-[NSData copyWithZone:](self->_messageSummaryInfo, "copyWithZone:", a3);
  v5[2] = (id)-[NSData copyWithZone:](self->_padding, "copyWithZone:", a3);
  return v5;
}

- (BOOL)isEqual:(id)a3
{
  int v5;
  NSData *messageSummaryInfo;
  NSData *padding;

  v5 = objc_msgSend(a3, "isMemberOfClass:", objc_opt_class());
  if (v5)
  {
    messageSummaryInfo = self->_messageSummaryInfo;
    if (!((unint64_t)messageSummaryInfo | *((_QWORD *)a3 + 1))
      || (v5 = -[NSData isEqual:](messageSummaryInfo, "isEqual:")) != 0)
    {
      padding = self->_padding;
      if ((unint64_t)padding | *((_QWORD *)a3 + 2))
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

  v3 = -[NSData hash](self->_messageSummaryInfo, "hash");
  return -[NSData hash](self->_padding, "hash") ^ v3;
}

- (void)mergeFrom:(id)a3
{
  if (*((_QWORD *)a3 + 1))
    -[IMSharedUtilitiesProtoCloudKitEncryptedMessageSummaryInfo setMessageSummaryInfo:](self, "setMessageSummaryInfo:");
  if (*((_QWORD *)a3 + 2))
    -[IMSharedUtilitiesProtoCloudKitEncryptedMessageSummaryInfo setPadding:](self, "setPadding:");
}

- (NSData)messageSummaryInfo
{
  return self->_messageSummaryInfo;
}

- (void)setMessageSummaryInfo:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 8);
}

- (NSData)padding
{
  return self->_padding;
}

- (void)setPadding:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 16);
}

@end
