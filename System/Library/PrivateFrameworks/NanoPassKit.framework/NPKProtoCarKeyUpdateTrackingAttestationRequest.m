@implementation NPKProtoCarKeyUpdateTrackingAttestationRequest

- (BOOL)hasAttestation
{
  return self->_attestation != 0;
}

- (BOOL)hasCredentialData
{
  return self->_credentialData != 0;
}

- (BOOL)hasContainerData
{
  return self->_containerData != 0;
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
  v8.super_class = (Class)NPKProtoCarKeyUpdateTrackingAttestationRequest;
  -[NPKProtoCarKeyUpdateTrackingAttestationRequest description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[NPKProtoCarKeyUpdateTrackingAttestationRequest dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;
  NSData *attestation;
  NSData *credentialData;
  NSData *containerData;

  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  attestation = self->_attestation;
  if (attestation)
    objc_msgSend(v3, "setObject:forKey:", attestation, CFSTR("attestation"));
  credentialData = self->_credentialData;
  if (credentialData)
    objc_msgSend(v4, "setObject:forKey:", credentialData, CFSTR("credentialData"));
  containerData = self->_containerData;
  if (containerData)
    objc_msgSend(v4, "setObject:forKey:", containerData, CFSTR("containerData"));
  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return NPKProtoCarKeyUpdateTrackingAttestationRequestReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = v4;
  if (self->_attestation)
  {
    PBDataWriterWriteDataField();
    v4 = v5;
  }
  if (self->_credentialData)
  {
    PBDataWriterWriteDataField();
    v4 = v5;
  }
  if (self->_containerData)
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
  if (self->_attestation)
  {
    objc_msgSend(v4, "setAttestation:");
    v4 = v5;
  }
  if (self->_credentialData)
  {
    objc_msgSend(v5, "setCredentialData:");
    v4 = v5;
  }
  if (self->_containerData)
  {
    objc_msgSend(v5, "setContainerData:");
    v4 = v5;
  }

}

- (id)copyWithZone:(_NSZone *)a3
{
  _QWORD *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;

  v5 = (_QWORD *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = -[NSData copyWithZone:](self->_attestation, "copyWithZone:", a3);
  v7 = (void *)v5[1];
  v5[1] = v6;

  v8 = -[NSData copyWithZone:](self->_credentialData, "copyWithZone:", a3);
  v9 = (void *)v5[3];
  v5[3] = v8;

  v10 = -[NSData copyWithZone:](self->_containerData, "copyWithZone:", a3);
  v11 = (void *)v5[2];
  v5[2] = v10;

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  _QWORD *v4;
  NSData *attestation;
  NSData *credentialData;
  NSData *containerData;
  char v8;

  v4 = a3;
  if (objc_msgSend(v4, "isMemberOfClass:", objc_opt_class())
    && ((attestation = self->_attestation, !((unint64_t)attestation | v4[1]))
     || -[NSData isEqual:](attestation, "isEqual:"))
    && ((credentialData = self->_credentialData, !((unint64_t)credentialData | v4[3]))
     || -[NSData isEqual:](credentialData, "isEqual:")))
  {
    containerData = self->_containerData;
    if ((unint64_t)containerData | v4[2])
      v8 = -[NSData isEqual:](containerData, "isEqual:");
    else
      v8 = 1;
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (unint64_t)hash
{
  uint64_t v3;
  uint64_t v4;

  v3 = -[NSData hash](self->_attestation, "hash");
  v4 = -[NSData hash](self->_credentialData, "hash") ^ v3;
  return v4 ^ -[NSData hash](self->_containerData, "hash");
}

- (void)mergeFrom:(id)a3
{
  _QWORD *v4;

  v4 = a3;
  if (v4[1])
    -[NPKProtoCarKeyUpdateTrackingAttestationRequest setAttestation:](self, "setAttestation:");
  if (v4[3])
    -[NPKProtoCarKeyUpdateTrackingAttestationRequest setCredentialData:](self, "setCredentialData:");
  if (v4[2])
    -[NPKProtoCarKeyUpdateTrackingAttestationRequest setContainerData:](self, "setContainerData:");

}

- (NSData)attestation
{
  return self->_attestation;
}

- (void)setAttestation:(id)a3
{
  objc_storeStrong((id *)&self->_attestation, a3);
}

- (NSData)credentialData
{
  return self->_credentialData;
}

- (void)setCredentialData:(id)a3
{
  objc_storeStrong((id *)&self->_credentialData, a3);
}

- (NSData)containerData
{
  return self->_containerData;
}

- (void)setContainerData:(id)a3
{
  objc_storeStrong((id *)&self->_containerData, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_credentialData, 0);
  objc_storeStrong((id *)&self->_containerData, 0);
  objc_storeStrong((id *)&self->_attestation, 0);
}

@end
