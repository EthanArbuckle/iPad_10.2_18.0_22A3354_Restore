@implementation NPKIDVRemoteDeviceProtoProvisionCredentialRequest

- (id)credentialTypeAsString:(int)a3
{
  __CFString *v3;

  if (!a3)
    return CFSTR("Unknown");
  if (a3 == 1)
  {
    v3 = CFSTR("Identity");
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3);
    v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  return v3;
}

- (int)StringAsCredentialType:(id)a3
{
  id v3;
  int v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("Unknown")) & 1) != 0)
    v4 = 0;
  else
    v4 = objc_msgSend(v3, "isEqualToString:", CFSTR("Identity"));

  return v4;
}

- (BOOL)hasMetadataData
{
  return self->_metadataData != 0;
}

- (BOOL)hasCredentialIdentifier
{
  return self->_credentialIdentifier != 0;
}

- (BOOL)hasAttestationsData
{
  return self->_attestationsData != 0;
}

- (BOOL)hasSupplementalData
{
  return self->_supplementalData != 0;
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
  v8.super_class = (Class)NPKIDVRemoteDeviceProtoProvisionCredentialRequest;
  -[NPKIDVRemoteDeviceProtoProvisionCredentialRequest description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[NPKIDVRemoteDeviceProtoProvisionCredentialRequest dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  int credentialType;
  __CFString *v5;
  NSData *metadataData;
  NSString *credentialIdentifier;
  NSData *attestationsData;
  NSData *supplementalData;

  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  credentialType = self->_credentialType;
  if (credentialType)
  {
    if (credentialType == 1)
    {
      v5 = CFSTR("Identity");
    }
    else
    {
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("(unknown: %i)"), self->_credentialType);
      v5 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
  }
  else
  {
    v5 = CFSTR("Unknown");
  }
  objc_msgSend(v3, "setObject:forKey:", v5, CFSTR("credentialType"));

  metadataData = self->_metadataData;
  if (metadataData)
    objc_msgSend(v3, "setObject:forKey:", metadataData, CFSTR("metadataData"));
  credentialIdentifier = self->_credentialIdentifier;
  if (credentialIdentifier)
    objc_msgSend(v3, "setObject:forKey:", credentialIdentifier, CFSTR("credentialIdentifier"));
  attestationsData = self->_attestationsData;
  if (attestationsData)
    objc_msgSend(v3, "setObject:forKey:", attestationsData, CFSTR("attestationsData"));
  supplementalData = self->_supplementalData;
  if (supplementalData)
    objc_msgSend(v3, "setObject:forKey:", supplementalData, CFSTR("supplementalData"));
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return NPKIDVRemoteDeviceProtoProvisionCredentialRequestReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  void *v4;
  id v5;

  v5 = a3;
  PBDataWriterWriteInt32Field();
  if (self->_metadataData)
    PBDataWriterWriteDataField();
  if (self->_credentialIdentifier)
    PBDataWriterWriteStringField();
  v4 = v5;
  if (self->_attestationsData)
  {
    PBDataWriterWriteDataField();
    v4 = v5;
  }
  if (self->_supplementalData)
  {
    PBDataWriterWriteDataField();
    v4 = v5;
  }

}

- (void)copyTo:(id)a3
{
  _DWORD *v4;
  _DWORD *v5;

  v4 = a3;
  v4[6] = self->_credentialType;
  v5 = v4;
  if (self->_metadataData)
  {
    objc_msgSend(v4, "setMetadataData:");
    v4 = v5;
  }
  if (self->_credentialIdentifier)
  {
    objc_msgSend(v5, "setCredentialIdentifier:");
    v4 = v5;
  }
  if (self->_attestationsData)
  {
    objc_msgSend(v5, "setAttestationsData:");
    v4 = v5;
  }
  if (self->_supplementalData)
  {
    objc_msgSend(v5, "setSupplementalData:");
    v4 = v5;
  }

}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  void *v13;

  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  *(_DWORD *)(v5 + 24) = self->_credentialType;
  v6 = -[NSData copyWithZone:](self->_metadataData, "copyWithZone:", a3);
  v7 = *(void **)(v5 + 32);
  *(_QWORD *)(v5 + 32) = v6;

  v8 = -[NSString copyWithZone:](self->_credentialIdentifier, "copyWithZone:", a3);
  v9 = *(void **)(v5 + 16);
  *(_QWORD *)(v5 + 16) = v8;

  v10 = -[NSData copyWithZone:](self->_attestationsData, "copyWithZone:", a3);
  v11 = *(void **)(v5 + 8);
  *(_QWORD *)(v5 + 8) = v10;

  v12 = -[NSData copyWithZone:](self->_supplementalData, "copyWithZone:", a3);
  v13 = *(void **)(v5 + 40);
  *(_QWORD *)(v5 + 40) = v12;

  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  _QWORD *v4;
  NSData *metadataData;
  NSString *credentialIdentifier;
  NSData *attestationsData;
  NSData *supplementalData;
  char v9;

  v4 = a3;
  if (objc_msgSend(v4, "isMemberOfClass:", objc_opt_class())
    && self->_credentialType == *((_DWORD *)v4 + 6)
    && ((metadataData = self->_metadataData, !((unint64_t)metadataData | v4[4]))
     || -[NSData isEqual:](metadataData, "isEqual:"))
    && ((credentialIdentifier = self->_credentialIdentifier, !((unint64_t)credentialIdentifier | v4[2]))
     || -[NSString isEqual:](credentialIdentifier, "isEqual:"))
    && ((attestationsData = self->_attestationsData, !((unint64_t)attestationsData | v4[1]))
     || -[NSData isEqual:](attestationsData, "isEqual:")))
  {
    supplementalData = self->_supplementalData;
    if ((unint64_t)supplementalData | v4[5])
      v9 = -[NSData isEqual:](supplementalData, "isEqual:");
    else
      v9 = 1;
  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (unint64_t)hash
{
  uint64_t v3;
  uint64_t v4;
  NSUInteger v5;
  uint64_t v6;

  v3 = 2654435761 * self->_credentialType;
  v4 = -[NSData hash](self->_metadataData, "hash");
  v5 = v4 ^ -[NSString hash](self->_credentialIdentifier, "hash");
  v6 = v5 ^ -[NSData hash](self->_attestationsData, "hash");
  return v6 ^ -[NSData hash](self->_supplementalData, "hash") ^ v3;
}

- (void)mergeFrom:(id)a3
{
  _DWORD *v4;
  _QWORD *v5;

  v4 = a3;
  self->_credentialType = v4[6];
  v5 = v4;
  if (*((_QWORD *)v4 + 4))
    -[NPKIDVRemoteDeviceProtoProvisionCredentialRequest setMetadataData:](self, "setMetadataData:");
  if (v5[2])
    -[NPKIDVRemoteDeviceProtoProvisionCredentialRequest setCredentialIdentifier:](self, "setCredentialIdentifier:");
  if (v5[1])
    -[NPKIDVRemoteDeviceProtoProvisionCredentialRequest setAttestationsData:](self, "setAttestationsData:");
  if (v5[5])
    -[NPKIDVRemoteDeviceProtoProvisionCredentialRequest setSupplementalData:](self, "setSupplementalData:");

}

- (int)credentialType
{
  return self->_credentialType;
}

- (void)setCredentialType:(int)a3
{
  self->_credentialType = a3;
}

- (NSData)metadataData
{
  return self->_metadataData;
}

- (void)setMetadataData:(id)a3
{
  objc_storeStrong((id *)&self->_metadataData, a3);
}

- (NSString)credentialIdentifier
{
  return self->_credentialIdentifier;
}

- (void)setCredentialIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_credentialIdentifier, a3);
}

- (NSData)attestationsData
{
  return self->_attestationsData;
}

- (void)setAttestationsData:(id)a3
{
  objc_storeStrong((id *)&self->_attestationsData, a3);
}

- (NSData)supplementalData
{
  return self->_supplementalData;
}

- (void)setSupplementalData:(id)a3
{
  objc_storeStrong((id *)&self->_supplementalData, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_supplementalData, 0);
  objc_storeStrong((id *)&self->_metadataData, 0);
  objc_storeStrong((id *)&self->_credentialIdentifier, 0);
  objc_storeStrong((id *)&self->_attestationsData, 0);
}

@end
