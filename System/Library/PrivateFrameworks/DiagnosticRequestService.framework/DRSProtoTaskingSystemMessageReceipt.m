@implementation DRSProtoTaskingSystemMessageReceipt

- (BOOL)hasTaskingDeviceMetadata
{
  return self->_taskingDeviceMetadata != 0;
}

- (BOOL)hasUuid
{
  return self->_uuid != 0;
}

- (BOOL)hasMessageType
{
  return self->_messageType != 0;
}

- (BOOL)hasChannelType
{
  return self->_channelType != 0;
}

- (BOOL)hasChannelEnvironment
{
  return self->_channelEnvironment != 0;
}

- (void)setReceiptDelay:(float)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_receiptDelay = a3;
}

- (void)setHasReceiptDelay:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (BOOL)hasReceiptDelay
{
  return *(_BYTE *)&self->_has & 1;
}

- (NSString)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v8;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v8.receiver = self;
  v8.super_class = (Class)DRSProtoTaskingSystemMessageReceipt;
  -[DRSProtoTaskingSystemMessageReceipt description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[DRSProtoTaskingSystemMessageReceipt dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  double v4;
  DRSProtoTaskingDeviceMetadata *taskingDeviceMetadata;
  void *v6;
  NSString *uuid;
  NSString *messageType;
  NSString *channelType;
  NSString *channelEnvironment;
  void *v11;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  taskingDeviceMetadata = self->_taskingDeviceMetadata;
  if (taskingDeviceMetadata)
  {
    -[DRSProtoTaskingDeviceMetadata dictionaryRepresentation](taskingDeviceMetadata, "dictionaryRepresentation");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v6, CFSTR("tasking_device_metadata"));

  }
  uuid = self->_uuid;
  if (uuid)
    objc_msgSend(v3, "setObject:forKey:", uuid, CFSTR("uuid"));
  messageType = self->_messageType;
  if (messageType)
    objc_msgSend(v3, "setObject:forKey:", messageType, CFSTR("message_type"));
  channelType = self->_channelType;
  if (channelType)
    objc_msgSend(v3, "setObject:forKey:", channelType, CFSTR("channel_type"));
  channelEnvironment = self->_channelEnvironment;
  if (channelEnvironment)
    objc_msgSend(v3, "setObject:forKey:", channelEnvironment, CFSTR("channel_environment"));
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    *(float *)&v4 = self->_receiptDelay;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v4);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v11, CFSTR("receipt_delay"));

  }
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return DRSProtoTaskingSystemMessageReceiptReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = v4;
  if (self->_taskingDeviceMetadata)
  {
    PBDataWriterWriteSubmessage();
    v4 = v5;
  }
  if (self->_uuid)
  {
    PBDataWriterWriteStringField();
    v4 = v5;
  }
  if (self->_messageType)
  {
    PBDataWriterWriteStringField();
    v4 = v5;
  }
  if (self->_channelType)
  {
    PBDataWriterWriteStringField();
    v4 = v5;
  }
  if (self->_channelEnvironment)
  {
    PBDataWriterWriteStringField();
    v4 = v5;
  }
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    PBDataWriterWriteFloatField();
    v4 = v5;
  }

}

- (void)copyTo:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = v4;
  if (self->_taskingDeviceMetadata)
  {
    objc_msgSend(v4, "setTaskingDeviceMetadata:");
    v4 = v5;
  }
  if (self->_uuid)
  {
    objc_msgSend(v5, "setUuid:");
    v4 = v5;
  }
  if (self->_messageType)
  {
    objc_msgSend(v5, "setMessageType:");
    v4 = v5;
  }
  if (self->_channelType)
  {
    objc_msgSend(v5, "setChannelType:");
    v4 = v5;
  }
  if (self->_channelEnvironment)
  {
    objc_msgSend(v5, "setChannelEnvironment:");
    v4 = v5;
  }
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    *((_DWORD *)v4 + 8) = LODWORD(self->_receiptDelay);
    *((_BYTE *)v4 + 56) |= 1u;
  }

}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5;
  id v6;
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
  v6 = -[DRSProtoTaskingDeviceMetadata copyWithZone:](self->_taskingDeviceMetadata, "copyWithZone:", a3);
  v7 = *(void **)(v5 + 40);
  *(_QWORD *)(v5 + 40) = v6;

  v8 = -[NSString copyWithZone:](self->_uuid, "copyWithZone:", a3);
  v9 = *(void **)(v5 + 48);
  *(_QWORD *)(v5 + 48) = v8;

  v10 = -[NSString copyWithZone:](self->_messageType, "copyWithZone:", a3);
  v11 = *(void **)(v5 + 24);
  *(_QWORD *)(v5 + 24) = v10;

  v12 = -[NSString copyWithZone:](self->_channelType, "copyWithZone:", a3);
  v13 = *(void **)(v5 + 16);
  *(_QWORD *)(v5 + 16) = v12;

  v14 = -[NSString copyWithZone:](self->_channelEnvironment, "copyWithZone:", a3);
  v15 = *(void **)(v5 + 8);
  *(_QWORD *)(v5 + 8) = v14;

  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    *(float *)(v5 + 32) = self->_receiptDelay;
    *(_BYTE *)(v5 + 56) |= 1u;
  }
  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  DRSProtoTaskingDeviceMetadata *taskingDeviceMetadata;
  NSString *uuid;
  NSString *messageType;
  NSString *channelType;
  NSString *channelEnvironment;
  BOOL v10;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_16;
  taskingDeviceMetadata = self->_taskingDeviceMetadata;
  if ((unint64_t)taskingDeviceMetadata | *((_QWORD *)v4 + 5))
  {
    if (!-[DRSProtoTaskingDeviceMetadata isEqual:](taskingDeviceMetadata, "isEqual:"))
      goto LABEL_16;
  }
  uuid = self->_uuid;
  if ((unint64_t)uuid | *((_QWORD *)v4 + 6))
  {
    if (!-[NSString isEqual:](uuid, "isEqual:"))
      goto LABEL_16;
  }
  messageType = self->_messageType;
  if ((unint64_t)messageType | *((_QWORD *)v4 + 3))
  {
    if (!-[NSString isEqual:](messageType, "isEqual:"))
      goto LABEL_16;
  }
  channelType = self->_channelType;
  if ((unint64_t)channelType | *((_QWORD *)v4 + 2))
  {
    if (!-[NSString isEqual:](channelType, "isEqual:"))
      goto LABEL_16;
  }
  channelEnvironment = self->_channelEnvironment;
  if ((unint64_t)channelEnvironment | *((_QWORD *)v4 + 1))
  {
    if (!-[NSString isEqual:](channelEnvironment, "isEqual:"))
      goto LABEL_16;
  }
  v10 = (*((_BYTE *)v4 + 56) & 1) == 0;
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 56) & 1) != 0 && self->_receiptDelay == *((float *)v4 + 8))
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
  unint64_t v3;
  NSUInteger v4;
  NSUInteger v5;
  NSUInteger v6;
  NSUInteger v7;
  unint64_t v8;
  float receiptDelay;
  float v10;
  float v11;
  float v12;

  v3 = -[DRSProtoTaskingDeviceMetadata hash](self->_taskingDeviceMetadata, "hash");
  v4 = -[NSString hash](self->_uuid, "hash");
  v5 = -[NSString hash](self->_messageType, "hash");
  v6 = -[NSString hash](self->_channelType, "hash");
  v7 = -[NSString hash](self->_channelEnvironment, "hash");
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    receiptDelay = self->_receiptDelay;
    v10 = -receiptDelay;
    if (receiptDelay >= 0.0)
      v10 = self->_receiptDelay;
    v11 = floorf(v10 + 0.5);
    v12 = (float)(v10 - v11) * 1.8447e19;
    v8 = 2654435761u * (unint64_t)fmodf(v11, 1.8447e19);
    if (v12 >= 0.0)
    {
      if (v12 > 0.0)
        v8 += (unint64_t)v12;
    }
    else
    {
      v8 -= (unint64_t)fabsf(v12);
    }
  }
  else
  {
    v8 = 0;
  }
  return v4 ^ v3 ^ v5 ^ v6 ^ v7 ^ v8;
}

- (void)mergeFrom:(id)a3
{
  id v4;
  DRSProtoTaskingDeviceMetadata *taskingDeviceMetadata;
  uint64_t v6;
  id v7;

  v4 = a3;
  taskingDeviceMetadata = self->_taskingDeviceMetadata;
  v6 = *((_QWORD *)v4 + 5);
  v7 = v4;
  if (taskingDeviceMetadata)
  {
    if (!v6)
      goto LABEL_7;
    -[DRSProtoTaskingDeviceMetadata mergeFrom:](taskingDeviceMetadata, "mergeFrom:");
  }
  else
  {
    if (!v6)
      goto LABEL_7;
    -[DRSProtoTaskingSystemMessageReceipt setTaskingDeviceMetadata:](self, "setTaskingDeviceMetadata:");
  }
  v4 = v7;
LABEL_7:
  if (*((_QWORD *)v4 + 6))
  {
    -[DRSProtoTaskingSystemMessageReceipt setUuid:](self, "setUuid:");
    v4 = v7;
  }
  if (*((_QWORD *)v4 + 3))
  {
    -[DRSProtoTaskingSystemMessageReceipt setMessageType:](self, "setMessageType:");
    v4 = v7;
  }
  if (*((_QWORD *)v4 + 2))
  {
    -[DRSProtoTaskingSystemMessageReceipt setChannelType:](self, "setChannelType:");
    v4 = v7;
  }
  if (*((_QWORD *)v4 + 1))
  {
    -[DRSProtoTaskingSystemMessageReceipt setChannelEnvironment:](self, "setChannelEnvironment:");
    v4 = v7;
  }
  if ((*((_BYTE *)v4 + 56) & 1) != 0)
  {
    self->_receiptDelay = *((float *)v4 + 8);
    *(_BYTE *)&self->_has |= 1u;
  }

}

- (DRSProtoTaskingDeviceMetadata)taskingDeviceMetadata
{
  return self->_taskingDeviceMetadata;
}

- (void)setTaskingDeviceMetadata:(id)a3
{
  objc_storeStrong((id *)&self->_taskingDeviceMetadata, a3);
}

- (NSString)uuid
{
  return self->_uuid;
}

- (void)setUuid:(id)a3
{
  objc_storeStrong((id *)&self->_uuid, a3);
}

- (NSString)messageType
{
  return self->_messageType;
}

- (void)setMessageType:(id)a3
{
  objc_storeStrong((id *)&self->_messageType, a3);
}

- (NSString)channelType
{
  return self->_channelType;
}

- (void)setChannelType:(id)a3
{
  objc_storeStrong((id *)&self->_channelType, a3);
}

- (NSString)channelEnvironment
{
  return self->_channelEnvironment;
}

- (void)setChannelEnvironment:(id)a3
{
  objc_storeStrong((id *)&self->_channelEnvironment, a3);
}

- (float)receiptDelay
{
  return self->_receiptDelay;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_uuid, 0);
  objc_storeStrong((id *)&self->_taskingDeviceMetadata, 0);
  objc_storeStrong((id *)&self->_messageType, 0);
  objc_storeStrong((id *)&self->_channelType, 0);
  objc_storeStrong((id *)&self->_channelEnvironment, 0);
}

@end
