@implementation DRSProtoRapidPayload

- (BOOL)hasDeviceMetadata
{
  return self->_deviceMetadata != 0;
}

- (BOOL)hasPayloadMetadata
{
  return self->_payloadMetadata != 0;
}

- (BOOL)hasPayloadDescription
{
  return self->_payloadDescription != 0;
}

- (void)setUploadAttempts:(unsigned int)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_uploadAttempts = a3;
}

- (void)setHasUploadAttempts:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (BOOL)hasUploadAttempts
{
  return *(_BYTE *)&self->_has & 1;
}

- (BOOL)hasPayload
{
  return self->_payload != 0;
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
  v8.super_class = (Class)DRSProtoRapidPayload;
  -[DRSProtoRapidPayload description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[DRSProtoRapidPayload dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  DRSProtoClientDeviceMetadata *deviceMetadata;
  void *v5;
  DRSProtoRequestDescription *payloadMetadata;
  void *v7;
  DRSProtoFileDescription *payloadDescription;
  void *v9;
  void *v10;
  NSData *payload;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  deviceMetadata = self->_deviceMetadata;
  if (deviceMetadata)
  {
    -[DRSProtoClientDeviceMetadata dictionaryRepresentation](deviceMetadata, "dictionaryRepresentation");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v5, CFSTR("device_metadata"));

  }
  payloadMetadata = self->_payloadMetadata;
  if (payloadMetadata)
  {
    -[DRSProtoRequestDescription dictionaryRepresentation](payloadMetadata, "dictionaryRepresentation");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v7, CFSTR("payload_metadata"));

  }
  payloadDescription = self->_payloadDescription;
  if (payloadDescription)
  {
    -[DRSProtoFileDescription dictionaryRepresentation](payloadDescription, "dictionaryRepresentation");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v9, CFSTR("payload_description"));

  }
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", self->_uploadAttempts);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v10, CFSTR("upload_attempts"));

  }
  payload = self->_payload;
  if (payload)
    objc_msgSend(v3, "setObject:forKey:", payload, CFSTR("payload"));
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return DRSProtoRapidPayloadReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = v4;
  if (self->_deviceMetadata)
  {
    PBDataWriterWriteSubmessage();
    v4 = v5;
  }
  if (self->_payloadMetadata)
  {
    PBDataWriterWriteSubmessage();
    v4 = v5;
  }
  if (self->_payloadDescription)
  {
    PBDataWriterWriteSubmessage();
    v4 = v5;
  }
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    PBDataWriterWriteUint32Field();
    v4 = v5;
  }
  if (self->_payload)
  {
    PBDataWriterWriteDataField();
    v4 = v5;
  }

}

- (void)copyTo:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = v4;
  if (self->_deviceMetadata)
  {
    objc_msgSend(v4, "setDeviceMetadata:");
    v4 = v5;
  }
  if (self->_payloadMetadata)
  {
    objc_msgSend(v5, "setPayloadMetadata:");
    v4 = v5;
  }
  if (self->_payloadDescription)
  {
    objc_msgSend(v5, "setPayloadDescription:");
    v4 = v5;
  }
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    *((_DWORD *)v4 + 10) = self->_uploadAttempts;
    *((_BYTE *)v4 + 44) |= 1u;
  }
  if (self->_payload)
  {
    objc_msgSend(v5, "setPayload:");
    v4 = v5;
  }

}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5;
  id v6;
  void *v7;
  id v8;
  void *v9;
  id v10;
  void *v11;
  uint64_t v12;
  void *v13;

  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = -[DRSProtoClientDeviceMetadata copyWithZone:](self->_deviceMetadata, "copyWithZone:", a3);
  v7 = *(void **)(v5 + 8);
  *(_QWORD *)(v5 + 8) = v6;

  v8 = -[DRSProtoRequestDescription copyWithZone:](self->_payloadMetadata, "copyWithZone:", a3);
  v9 = *(void **)(v5 + 32);
  *(_QWORD *)(v5 + 32) = v8;

  v10 = -[DRSProtoFileDescription copyWithZone:](self->_payloadDescription, "copyWithZone:", a3);
  v11 = *(void **)(v5 + 24);
  *(_QWORD *)(v5 + 24) = v10;

  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    *(_DWORD *)(v5 + 40) = self->_uploadAttempts;
    *(_BYTE *)(v5 + 44) |= 1u;
  }
  v12 = -[NSData copyWithZone:](self->_payload, "copyWithZone:", a3);
  v13 = *(void **)(v5 + 16);
  *(_QWORD *)(v5 + 16) = v12;

  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  DRSProtoClientDeviceMetadata *deviceMetadata;
  DRSProtoRequestDescription *payloadMetadata;
  DRSProtoFileDescription *payloadDescription;
  NSData *payload;
  char v9;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_15;
  deviceMetadata = self->_deviceMetadata;
  if ((unint64_t)deviceMetadata | *((_QWORD *)v4 + 1))
  {
    if (!-[DRSProtoClientDeviceMetadata isEqual:](deviceMetadata, "isEqual:"))
      goto LABEL_15;
  }
  payloadMetadata = self->_payloadMetadata;
  if ((unint64_t)payloadMetadata | *((_QWORD *)v4 + 4))
  {
    if (!-[DRSProtoRequestDescription isEqual:](payloadMetadata, "isEqual:"))
      goto LABEL_15;
  }
  payloadDescription = self->_payloadDescription;
  if ((unint64_t)payloadDescription | *((_QWORD *)v4 + 3))
  {
    if (!-[DRSProtoFileDescription isEqual:](payloadDescription, "isEqual:"))
      goto LABEL_15;
  }
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 44) & 1) == 0 || self->_uploadAttempts != *((_DWORD *)v4 + 10))
      goto LABEL_15;
  }
  else if ((*((_BYTE *)v4 + 44) & 1) != 0)
  {
LABEL_15:
    v9 = 0;
    goto LABEL_16;
  }
  payload = self->_payload;
  if ((unint64_t)payload | *((_QWORD *)v4 + 2))
    v9 = -[NSData isEqual:](payload, "isEqual:");
  else
    v9 = 1;
LABEL_16:

  return v9;
}

- (unint64_t)hash
{
  unint64_t v3;
  unint64_t v4;
  unint64_t v5;
  uint64_t v6;

  v3 = -[DRSProtoClientDeviceMetadata hash](self->_deviceMetadata, "hash");
  v4 = -[DRSProtoRequestDescription hash](self->_payloadMetadata, "hash");
  v5 = -[DRSProtoFileDescription hash](self->_payloadDescription, "hash");
  if ((*(_BYTE *)&self->_has & 1) != 0)
    v6 = 2654435761 * self->_uploadAttempts;
  else
    v6 = 0;
  return v4 ^ v3 ^ v5 ^ v6 ^ -[NSData hash](self->_payload, "hash");
}

- (void)mergeFrom:(id)a3
{
  id v4;
  DRSProtoClientDeviceMetadata *deviceMetadata;
  uint64_t v6;
  DRSProtoRequestDescription *payloadMetadata;
  uint64_t v8;
  DRSProtoFileDescription *payloadDescription;
  uint64_t v10;
  id v11;

  v4 = a3;
  deviceMetadata = self->_deviceMetadata;
  v6 = *((_QWORD *)v4 + 1);
  v11 = v4;
  if (deviceMetadata)
  {
    if (!v6)
      goto LABEL_7;
    -[DRSProtoClientDeviceMetadata mergeFrom:](deviceMetadata, "mergeFrom:");
  }
  else
  {
    if (!v6)
      goto LABEL_7;
    -[DRSProtoRapidPayload setDeviceMetadata:](self, "setDeviceMetadata:");
  }
  v4 = v11;
LABEL_7:
  payloadMetadata = self->_payloadMetadata;
  v8 = *((_QWORD *)v4 + 4);
  if (payloadMetadata)
  {
    if (!v8)
      goto LABEL_13;
    -[DRSProtoRequestDescription mergeFrom:](payloadMetadata, "mergeFrom:");
  }
  else
  {
    if (!v8)
      goto LABEL_13;
    -[DRSProtoRapidPayload setPayloadMetadata:](self, "setPayloadMetadata:");
  }
  v4 = v11;
LABEL_13:
  payloadDescription = self->_payloadDescription;
  v10 = *((_QWORD *)v4 + 3);
  if (payloadDescription)
  {
    if (!v10)
      goto LABEL_19;
    -[DRSProtoFileDescription mergeFrom:](payloadDescription, "mergeFrom:");
  }
  else
  {
    if (!v10)
      goto LABEL_19;
    -[DRSProtoRapidPayload setPayloadDescription:](self, "setPayloadDescription:");
  }
  v4 = v11;
LABEL_19:
  if ((*((_BYTE *)v4 + 44) & 1) != 0)
  {
    self->_uploadAttempts = *((_DWORD *)v4 + 10);
    *(_BYTE *)&self->_has |= 1u;
  }
  if (*((_QWORD *)v4 + 2))
  {
    -[DRSProtoRapidPayload setPayload:](self, "setPayload:");
    v4 = v11;
  }

}

- (DRSProtoClientDeviceMetadata)deviceMetadata
{
  return self->_deviceMetadata;
}

- (void)setDeviceMetadata:(id)a3
{
  objc_storeStrong((id *)&self->_deviceMetadata, a3);
}

- (DRSProtoRequestDescription)payloadMetadata
{
  return self->_payloadMetadata;
}

- (void)setPayloadMetadata:(id)a3
{
  objc_storeStrong((id *)&self->_payloadMetadata, a3);
}

- (DRSProtoFileDescription)payloadDescription
{
  return self->_payloadDescription;
}

- (void)setPayloadDescription:(id)a3
{
  objc_storeStrong((id *)&self->_payloadDescription, a3);
}

- (unsigned)uploadAttempts
{
  return self->_uploadAttempts;
}

- (NSData)payload
{
  return self->_payload;
}

- (void)setPayload:(id)a3
{
  objc_storeStrong((id *)&self->_payload, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_payloadMetadata, 0);
  objc_storeStrong((id *)&self->_payloadDescription, 0);
  objc_storeStrong((id *)&self->_payload, 0);
  objc_storeStrong((id *)&self->_deviceMetadata, 0);
}

@end
