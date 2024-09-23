@implementation NPKProtoStandalonePaymentProvisioningFlowHandleDigitalIssuanceAmountRequest

- (BOOL)hasAmount
{
  return self->_amount != 0;
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
  v8.super_class = (Class)NPKProtoStandalonePaymentProvisioningFlowHandleDigitalIssuanceAmountRequest;
  -[NPKProtoStandalonePaymentProvisioningFlowHandleDigitalIssuanceAmountRequest description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[NPKProtoStandalonePaymentProvisioningFlowHandleDigitalIssuanceAmountRequest dictionaryRepresentation](self, "dictionaryRepresentation");
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
  NSString *amount;

  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  requestHeader = self->_requestHeader;
  if (requestHeader)
  {
    -[NPKProtoStandaloneRequestHeader dictionaryRepresentation](requestHeader, "dictionaryRepresentation");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v5, CFSTR("requestHeader"));

  }
  amount = self->_amount;
  if (amount)
    objc_msgSend(v3, "setObject:forKey:", amount, CFSTR("amount"));
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return NPKProtoStandalonePaymentProvisioningFlowHandleDigitalIssuanceAmountRequestReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  if (!self->_requestHeader)
    -[NPKProtoStandalonePaymentProvisioningFlowHandleDigitalIssuanceAmountRequest writeTo:].cold.1();
  v5 = v4;
  PBDataWriterWriteSubmessage();
  if (self->_amount)
    PBDataWriterWriteStringField();

}

- (void)copyTo:(id)a3
{
  id v4;

  v4 = a3;
  objc_msgSend(v4, "setRequestHeader:", self->_requestHeader);
  if (self->_amount)
    objc_msgSend(v4, "setAmount:");

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
  v7 = (void *)v5[2];
  v5[2] = v6;

  v8 = -[NSString copyWithZone:](self->_amount, "copyWithZone:", a3);
  v9 = (void *)v5[1];
  v5[1] = v8;

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  _QWORD *v4;
  NPKProtoStandaloneRequestHeader *requestHeader;
  NSString *amount;
  char v7;

  v4 = a3;
  if (objc_msgSend(v4, "isMemberOfClass:", objc_opt_class())
    && ((requestHeader = self->_requestHeader, !((unint64_t)requestHeader | v4[2]))
     || -[NPKProtoStandaloneRequestHeader isEqual:](requestHeader, "isEqual:")))
  {
    amount = self->_amount;
    if ((unint64_t)amount | v4[1])
      v7 = -[NSString isEqual:](amount, "isEqual:");
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
  return -[NSString hash](self->_amount, "hash") ^ v3;
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
    -[NPKProtoStandalonePaymentProvisioningFlowHandleDigitalIssuanceAmountRequest setRequestHeader:](self, "setRequestHeader:");
  }
  v4 = v7;
LABEL_7:
  if (v4[1])
  {
    -[NPKProtoStandalonePaymentProvisioningFlowHandleDigitalIssuanceAmountRequest setAmount:](self, "setAmount:");
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

- (NSString)amount
{
  return self->_amount;
}

- (void)setAmount:(id)a3
{
  objc_storeStrong((id *)&self->_amount, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_requestHeader, 0);
  objc_storeStrong((id *)&self->_amount, 0);
}

- (void)writeTo:.cold.1()
{
  __assert_rtn("-[NPKProtoStandalonePaymentProvisioningFlowHandleDigitalIssuanceAmountRequest writeTo:]", "NPKProtoStandalonePaymentProvisioningFlowHandleDigitalIssuanceAmountRequest.m", 101, "self->_requestHeader != nil");
}

@end
