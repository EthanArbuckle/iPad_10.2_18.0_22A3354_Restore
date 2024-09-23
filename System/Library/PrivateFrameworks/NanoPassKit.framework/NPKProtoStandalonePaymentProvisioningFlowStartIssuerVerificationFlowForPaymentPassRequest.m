@implementation NPKProtoStandalonePaymentProvisioningFlowStartIssuerVerificationFlowForPaymentPassRequest

- (BOOL)hasSerialNumber
{
  return self->_serialNumber != 0;
}

- (BOOL)hasPassTypeIdentifier
{
  return self->_passTypeIdentifier != 0;
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
  v8.super_class = (Class)NPKProtoStandalonePaymentProvisioningFlowStartIssuerVerificationFlowForPaymentPassRequest;
  -[NPKProtoStandalonePaymentProvisioningFlowStartIssuerVerificationFlowForPaymentPassRequest description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[NPKProtoStandalonePaymentProvisioningFlowStartIssuerVerificationFlowForPaymentPassRequest dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  NPKProtoStandaloneRequestHeader *requestHeader;
  void *v5;
  NSString *serialNumber;
  NSString *passTypeIdentifier;

  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  requestHeader = self->_requestHeader;
  if (requestHeader)
  {
    -[NPKProtoStandaloneRequestHeader dictionaryRepresentation](requestHeader, "dictionaryRepresentation");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v5, CFSTR("requestHeader"));

  }
  serialNumber = self->_serialNumber;
  if (serialNumber)
    objc_msgSend(v3, "setObject:forKey:", serialNumber, CFSTR("serialNumber"));
  passTypeIdentifier = self->_passTypeIdentifier;
  if (passTypeIdentifier)
    objc_msgSend(v3, "setObject:forKey:", passTypeIdentifier, CFSTR("passTypeIdentifier"));
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return NPKProtoStandalonePaymentProvisioningFlowStartIssuerVerificationFlowForPaymentPassRequestReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  if (!self->_requestHeader)
    -[NPKProtoStandalonePaymentProvisioningFlowStartIssuerVerificationFlowForPaymentPassRequest writeTo:].cold.1();
  v5 = v4;
  PBDataWriterWriteSubmessage();
  if (self->_serialNumber)
    PBDataWriterWriteStringField();
  if (self->_passTypeIdentifier)
    PBDataWriterWriteStringField();

}

- (void)copyTo:(id)a3
{
  id v4;

  v4 = a3;
  objc_msgSend(v4, "setRequestHeader:", self->_requestHeader);
  if (self->_serialNumber)
    objc_msgSend(v4, "setSerialNumber:");
  if (self->_passTypeIdentifier)
    objc_msgSend(v4, "setPassTypeIdentifier:");

}

- (id)copyWithZone:(_NSZone *)a3
{
  _QWORD *v5;
  id v6;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;

  v5 = (_QWORD *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = -[NPKProtoStandaloneRequestHeader copyWithZone:](self->_requestHeader, "copyWithZone:", a3);
  v7 = (void *)v5[2];
  v5[2] = v6;

  v8 = -[NSString copyWithZone:](self->_serialNumber, "copyWithZone:", a3);
  v9 = (void *)v5[3];
  v5[3] = v8;

  v10 = -[NSString copyWithZone:](self->_passTypeIdentifier, "copyWithZone:", a3);
  v11 = (void *)v5[1];
  v5[1] = v10;

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  _QWORD *v4;
  NPKProtoStandaloneRequestHeader *requestHeader;
  NSString *serialNumber;
  NSString *passTypeIdentifier;
  char v8;

  v4 = a3;
  if (objc_msgSend(v4, "isMemberOfClass:", objc_opt_class())
    && ((requestHeader = self->_requestHeader, !((unint64_t)requestHeader | v4[2]))
     || -[NPKProtoStandaloneRequestHeader isEqual:](requestHeader, "isEqual:"))
    && ((serialNumber = self->_serialNumber, !((unint64_t)serialNumber | v4[3]))
     || -[NSString isEqual:](serialNumber, "isEqual:")))
  {
    passTypeIdentifier = self->_passTypeIdentifier;
    if ((unint64_t)passTypeIdentifier | v4[1])
      v8 = -[NSString isEqual:](passTypeIdentifier, "isEqual:");
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
  unint64_t v3;
  NSUInteger v4;

  v3 = -[NPKProtoStandaloneRequestHeader hash](self->_requestHeader, "hash");
  v4 = -[NSString hash](self->_serialNumber, "hash") ^ v3;
  return v4 ^ -[NSString hash](self->_passTypeIdentifier, "hash");
}

- (void)mergeFrom:(id)a3
{
  _QWORD *v4;
  NPKProtoStandaloneRequestHeader *requestHeader;
  uint64_t v6;
  _QWORD *v7;

  v4 = a3;
  requestHeader = self->_requestHeader;
  v6 = v4[2];
  v7 = v4;
  if (requestHeader)
  {
    if (!v6)
      goto LABEL_7;
    -[NPKProtoStandaloneRequestHeader mergeFrom:](requestHeader, "mergeFrom:");
  }
  else
  {
    if (!v6)
      goto LABEL_7;
    -[NPKProtoStandalonePaymentProvisioningFlowStartIssuerVerificationFlowForPaymentPassRequest setRequestHeader:](self, "setRequestHeader:");
  }
  v4 = v7;
LABEL_7:
  if (v4[3])
  {
    -[NPKProtoStandalonePaymentProvisioningFlowStartIssuerVerificationFlowForPaymentPassRequest setSerialNumber:](self, "setSerialNumber:");
    v4 = v7;
  }
  if (v4[1])
  {
    -[NPKProtoStandalonePaymentProvisioningFlowStartIssuerVerificationFlowForPaymentPassRequest setPassTypeIdentifier:](self, "setPassTypeIdentifier:");
    v4 = v7;
  }

}

- (NPKProtoStandaloneRequestHeader)requestHeader
{
  return self->_requestHeader;
}

- (void)setRequestHeader:(id)a3
{
  objc_storeStrong((id *)&self->_requestHeader, a3);
}

- (NSString)serialNumber
{
  return self->_serialNumber;
}

- (void)setSerialNumber:(id)a3
{
  objc_storeStrong((id *)&self->_serialNumber, a3);
}

- (NSString)passTypeIdentifier
{
  return self->_passTypeIdentifier;
}

- (void)setPassTypeIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_passTypeIdentifier, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_serialNumber, 0);
  objc_storeStrong((id *)&self->_requestHeader, 0);
  objc_storeStrong((id *)&self->_passTypeIdentifier, 0);
}

- (void)writeTo:.cold.1()
{
  __assert_rtn("-[NPKProtoStandalonePaymentProvisioningFlowStartIssuerVerificationFlowForPaymentPassRequest writeTo:]", "NPKProtoStandalonePaymentProvisioningFlowStartIssuerVerificationFlowForPaymentPassRequest.m", 116, "self->_requestHeader != nil");
}

@end
