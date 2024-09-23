@implementation NPKProtoStandalonePaymentProvisioningFlowHandleIssuerVerificationChannelRequest

- (BOOL)hasSelectedVerificationChannelIdentifier
{
  return self->_selectedVerificationChannelIdentifier != 0;
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
  v8.super_class = (Class)NPKProtoStandalonePaymentProvisioningFlowHandleIssuerVerificationChannelRequest;
  -[NPKProtoStandalonePaymentProvisioningFlowHandleIssuerVerificationChannelRequest description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[NPKProtoStandalonePaymentProvisioningFlowHandleIssuerVerificationChannelRequest dictionaryRepresentation](self, "dictionaryRepresentation");
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
  NSString *selectedVerificationChannelIdentifier;

  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  requestHeader = self->_requestHeader;
  if (requestHeader)
  {
    -[NPKProtoStandaloneRequestHeader dictionaryRepresentation](requestHeader, "dictionaryRepresentation");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v5, CFSTR("requestHeader"));

  }
  selectedVerificationChannelIdentifier = self->_selectedVerificationChannelIdentifier;
  if (selectedVerificationChannelIdentifier)
    objc_msgSend(v3, "setObject:forKey:", selectedVerificationChannelIdentifier, CFSTR("selectedVerificationChannelIdentifier"));
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return NPKProtoStandalonePaymentProvisioningFlowHandleIssuerVerificationChannelRequestReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  if (!self->_requestHeader)
    -[NPKProtoStandalonePaymentProvisioningFlowHandleIssuerVerificationChannelRequest writeTo:].cold.1();
  v5 = v4;
  PBDataWriterWriteSubmessage();
  if (self->_selectedVerificationChannelIdentifier)
    PBDataWriterWriteStringField();

}

- (void)copyTo:(id)a3
{
  id v4;

  v4 = a3;
  objc_msgSend(v4, "setRequestHeader:", self->_requestHeader);
  if (self->_selectedVerificationChannelIdentifier)
    objc_msgSend(v4, "setSelectedVerificationChannelIdentifier:");

}

- (id)copyWithZone:(_NSZone *)a3
{
  _QWORD *v5;
  id v6;
  void *v7;
  uint64_t v8;
  void *v9;

  v5 = (_QWORD *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = -[NPKProtoStandaloneRequestHeader copyWithZone:](self->_requestHeader, "copyWithZone:", a3);
  v7 = (void *)v5[1];
  v5[1] = v6;

  v8 = -[NSString copyWithZone:](self->_selectedVerificationChannelIdentifier, "copyWithZone:", a3);
  v9 = (void *)v5[2];
  v5[2] = v8;

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  _QWORD *v4;
  NPKProtoStandaloneRequestHeader *requestHeader;
  NSString *selectedVerificationChannelIdentifier;
  char v7;

  v4 = a3;
  if (objc_msgSend(v4, "isMemberOfClass:", objc_opt_class())
    && ((requestHeader = self->_requestHeader, !((unint64_t)requestHeader | v4[1]))
     || -[NPKProtoStandaloneRequestHeader isEqual:](requestHeader, "isEqual:")))
  {
    selectedVerificationChannelIdentifier = self->_selectedVerificationChannelIdentifier;
    if ((unint64_t)selectedVerificationChannelIdentifier | v4[2])
      v7 = -[NSString isEqual:](selectedVerificationChannelIdentifier, "isEqual:");
    else
      v7 = 1;
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (unint64_t)hash
{
  unint64_t v3;

  v3 = -[NPKProtoStandaloneRequestHeader hash](self->_requestHeader, "hash");
  return -[NSString hash](self->_selectedVerificationChannelIdentifier, "hash") ^ v3;
}

- (void)mergeFrom:(id)a3
{
  _QWORD *v4;
  NPKProtoStandaloneRequestHeader *requestHeader;
  uint64_t v6;
  _QWORD *v7;

  v4 = a3;
  requestHeader = self->_requestHeader;
  v6 = v4[1];
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
    -[NPKProtoStandalonePaymentProvisioningFlowHandleIssuerVerificationChannelRequest setRequestHeader:](self, "setRequestHeader:");
  }
  v4 = v7;
LABEL_7:
  if (v4[2])
  {
    -[NPKProtoStandalonePaymentProvisioningFlowHandleIssuerVerificationChannelRequest setSelectedVerificationChannelIdentifier:](self, "setSelectedVerificationChannelIdentifier:");
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

- (NSString)selectedVerificationChannelIdentifier
{
  return self->_selectedVerificationChannelIdentifier;
}

- (void)setSelectedVerificationChannelIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_selectedVerificationChannelIdentifier, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_selectedVerificationChannelIdentifier, 0);
  objc_storeStrong((id *)&self->_requestHeader, 0);
}

- (void)writeTo:.cold.1()
{
  __assert_rtn("-[NPKProtoStandalonePaymentProvisioningFlowHandleIssuerVerificationChannelRequest writeTo:]", "NPKProtoStandalonePaymentProvisioningFlowHandleIssuerVerificationChannelRequest.m", 101, "self->_requestHeader != nil");
}

@end
