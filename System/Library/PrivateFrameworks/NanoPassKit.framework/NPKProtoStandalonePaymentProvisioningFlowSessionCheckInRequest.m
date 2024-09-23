@implementation NPKProtoStandalonePaymentProvisioningFlowSessionCheckInRequest

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v8;

  v3 = (void *)MEMORY[0x24BDD17C8];
  v8.receiver = self;
  v8.super_class = (Class)NPKProtoStandalonePaymentProvisioningFlowSessionCheckInRequest;
  -[NPKProtoStandalonePaymentProvisioningFlowSessionCheckInRequest description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[NPKProtoStandalonePaymentProvisioningFlowSessionCheckInRequest dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  NPKProtoStandaloneResponseHeader *requestHeader;
  void *v5;

  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  requestHeader = self->_requestHeader;
  if (requestHeader)
  {
    -[NPKProtoStandaloneResponseHeader dictionaryRepresentation](requestHeader, "dictionaryRepresentation");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v5, CFSTR("RequestHeader"));

  }
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return NPKProtoStandalonePaymentProvisioningFlowSessionCheckInRequestReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  if (!self->_requestHeader)
    -[NPKProtoStandalonePaymentProvisioningFlowSessionCheckInRequest writeTo:].cold.1();
  v5 = v4;
  PBDataWriterWriteSubmessage();

}

- (void)copyTo:(id)a3
{
  objc_msgSend(a3, "setRequestHeader:", self->_requestHeader);
}

- (id)copyWithZone:(_NSZone *)a3
{
  _QWORD *v5;
  id v6;
  void *v7;

  v5 = (_QWORD *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = -[NPKProtoStandaloneResponseHeader copyWithZone:](self->_requestHeader, "copyWithZone:", a3);
  v7 = (void *)v5[1];
  v5[1] = v6;

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  _QWORD *v4;
  NPKProtoStandaloneResponseHeader *requestHeader;
  char v6;

  v4 = a3;
  if (objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
  {
    requestHeader = self->_requestHeader;
    if ((unint64_t)requestHeader | v4[1])
      v6 = -[NPKProtoStandaloneResponseHeader isEqual:](requestHeader, "isEqual:");
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
  return -[NPKProtoStandaloneResponseHeader hash](self->_requestHeader, "hash");
}

- (void)mergeFrom:(id)a3
{
  _QWORD *v4;
  NPKProtoStandaloneResponseHeader *requestHeader;
  uint64_t v6;
  _QWORD *v7;

  v4 = a3;
  requestHeader = self->_requestHeader;
  v6 = v4[1];
  if (requestHeader)
  {
    if (v6)
    {
      v7 = v4;
      -[NPKProtoStandaloneResponseHeader mergeFrom:](requestHeader, "mergeFrom:");
LABEL_6:
      v4 = v7;
    }
  }
  else if (v6)
  {
    v7 = v4;
    -[NPKProtoStandalonePaymentProvisioningFlowSessionCheckInRequest setRequestHeader:](self, "setRequestHeader:");
    goto LABEL_6;
  }

}

- (NPKProtoStandaloneResponseHeader)requestHeader
{
  return self->_requestHeader;
}

- (void)setRequestHeader:(id)a3
{
  objc_storeStrong((id *)&self->_requestHeader, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_requestHeader, 0);
}

- (void)writeTo:.cold.1()
{
  __assert_rtn("-[NPKProtoStandalonePaymentProvisioningFlowSessionCheckInRequest writeTo:]", "NPKProtoStandalonePaymentProvisioningFlowSessionCheckInRequest.m", 86, "self->_requestHeader != nil");
}

@end
