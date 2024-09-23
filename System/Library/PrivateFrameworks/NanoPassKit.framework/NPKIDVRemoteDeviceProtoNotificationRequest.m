@implementation NPKIDVRemoteDeviceProtoNotificationRequest

- (id)notificationTypeAsString:(int)a3
{
  if ((a3 + 1) < 0xA)
    return off_24CFE7F00[a3 + 1];
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (int)StringAsNotificationType:(id)a3
{
  id v3;
  int v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("Unknown")) & 1) != 0)
  {
    v4 = -1;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("ActionRequired")) & 1) != 0)
  {
    v4 = 0;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("VerificationCodeRequired")) & 1) != 0)
  {
    v4 = 1;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("ProvisioningRejected")) & 1) != 0)
  {
    v4 = 2;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("UnableToAddCredential")) & 1) != 0)
  {
    v4 = 3;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("FollowVerificationInstructionRequired")) & 1) != 0)
  {
    v4 = 4;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("TryAgainVerificationCodeRequired")) & 1) != 0)
  {
    v4 = 5;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("VerificationETA")) & 1) != 0)
  {
    v4 = 6;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("LivenessStepUpRequired")) & 1) != 0)
  {
    v4 = 7;
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("ProofingExpired")))
  {
    v4 = 8;
  }
  else
  {
    v4 = -1;
  }

  return v4;
}

- (id)documentTypeAsString:(int)a3
{
  if ((a3 + 1) < 3)
    return off_24CFE7F50[a3 + 1];
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (int)StringAsDocumentType:(id)a3
{
  id v3;
  int v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("Unknown")) & 1) != 0)
  {
    v4 = -1;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("DriverLicense")) & 1) != 0)
  {
    v4 = 0;
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("StateID")))
  {
    v4 = 1;
  }
  else
  {
    v4 = -1;
  }

  return v4;
}

- (BOOL)hasIssuerName
{
  return self->_issuerName != 0;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v8;

  v3 = (void *)MEMORY[0x24BDD17C8];
  v8.receiver = self;
  v8.super_class = (Class)NPKIDVRemoteDeviceProtoNotificationRequest;
  -[NPKIDVRemoteDeviceProtoNotificationRequest description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[NPKIDVRemoteDeviceProtoNotificationRequest dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  unsigned int v4;
  __CFString *v5;
  unsigned int v6;
  __CFString *v7;
  NSString *issuerName;

  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = self->_notificationType + 1;
  if (v4 >= 0xA)
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("(unknown: %i)"), self->_notificationType);
    v5 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v5 = off_24CFE7F00[v4];
  }
  objc_msgSend(v3, "setObject:forKey:", v5, CFSTR("notificationType"));

  v6 = self->_documentType + 1;
  if (v6 >= 3)
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("(unknown: %i)"), self->_documentType);
    v7 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v7 = off_24CFE7F50[v6];
  }
  objc_msgSend(v3, "setObject:forKey:", v7, CFSTR("DocumentType"));

  issuerName = self->_issuerName;
  if (issuerName)
    objc_msgSend(v3, "setObject:forKey:", issuerName, CFSTR("issuerName"));
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return NPKIDVRemoteDeviceProtoNotificationRequestReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4;

  v4 = a3;
  PBDataWriterWriteInt32Field();
  PBDataWriterWriteInt32Field();
  if (self->_issuerName)
    PBDataWriterWriteStringField();

}

- (void)copyTo:(id)a3
{
  NSString *issuerName;

  *((_DWORD *)a3 + 6) = self->_notificationType;
  *((_DWORD *)a3 + 2) = self->_documentType;
  issuerName = self->_issuerName;
  if (issuerName)
    objc_msgSend(a3, "setIssuerName:", issuerName);
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5;
  uint64_t v6;
  void *v7;

  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  *(_DWORD *)(v5 + 24) = self->_notificationType;
  *(_DWORD *)(v5 + 8) = self->_documentType;
  v6 = -[NSString copyWithZone:](self->_issuerName, "copyWithZone:", a3);
  v7 = *(void **)(v5 + 16);
  *(_QWORD *)(v5 + 16) = v6;

  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  _QWORD *v4;
  NSString *issuerName;
  char v6;

  v4 = a3;
  if (objc_msgSend(v4, "isMemberOfClass:", objc_opt_class())
    && self->_notificationType == *((_DWORD *)v4 + 6)
    && self->_documentType == *((_DWORD *)v4 + 2))
  {
    issuerName = self->_issuerName;
    if ((unint64_t)issuerName | v4[2])
      v6 = -[NSString isEqual:](issuerName, "isEqual:");
    else
      v6 = 1;
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (unint64_t)hash
{
  uint64_t v2;

  v2 = (2654435761 * self->_documentType) ^ (2654435761 * self->_notificationType);
  return v2 ^ -[NSString hash](self->_issuerName, "hash");
}

- (void)mergeFrom:(id)a3
{
  self->_notificationType = *((_DWORD *)a3 + 6);
  self->_documentType = *((_DWORD *)a3 + 2);
  if (*((_QWORD *)a3 + 2))
    -[NPKIDVRemoteDeviceProtoNotificationRequest setIssuerName:](self, "setIssuerName:");
}

- (int)notificationType
{
  return self->_notificationType;
}

- (void)setNotificationType:(int)a3
{
  self->_notificationType = a3;
}

- (int)documentType
{
  return self->_documentType;
}

- (void)setDocumentType:(int)a3
{
  self->_documentType = a3;
}

- (NSString)issuerName
{
  return self->_issuerName;
}

- (void)setIssuerName:(id)a3
{
  objc_storeStrong((id *)&self->_issuerName, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_issuerName, 0);
}

@end
