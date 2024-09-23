@implementation NPKProtoStandalonePaymentProvisioningFlowChooseFlowRequest

- (BOOL)hasChosenFlowPickerItemIdentifier
{
  return self->_chosenFlowPickerItemIdentifier != 0;
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
  v8.super_class = (Class)NPKProtoStandalonePaymentProvisioningFlowChooseFlowRequest;
  -[NPKProtoStandalonePaymentProvisioningFlowChooseFlowRequest description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[NPKProtoStandalonePaymentProvisioningFlowChooseFlowRequest dictionaryRepresentation](self, "dictionaryRepresentation");
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
  NSString *chosenFlowPickerItemIdentifier;

  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  requestHeader = self->_requestHeader;
  if (requestHeader)
  {
    -[NPKProtoStandaloneRequestHeader dictionaryRepresentation](requestHeader, "dictionaryRepresentation");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v5, CFSTR("requestHeader"));

  }
  chosenFlowPickerItemIdentifier = self->_chosenFlowPickerItemIdentifier;
  if (chosenFlowPickerItemIdentifier)
    objc_msgSend(v3, "setObject:forKey:", chosenFlowPickerItemIdentifier, CFSTR("chosenFlowPickerItemIdentifier"));
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return NPKProtoStandalonePaymentProvisioningFlowChooseFlowRequestReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  if (!self->_requestHeader)
    -[NPKProtoStandalonePaymentProvisioningFlowChooseFlowRequest writeTo:].cold.1();
  v5 = v4;
  PBDataWriterWriteSubmessage();
  if (self->_chosenFlowPickerItemIdentifier)
    PBDataWriterWriteStringField();

}

- (void)copyTo:(id)a3
{
  id v4;

  v4 = a3;
  objc_msgSend(v4, "setRequestHeader:", self->_requestHeader);
  if (self->_chosenFlowPickerItemIdentifier)
    objc_msgSend(v4, "setChosenFlowPickerItemIdentifier:");

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

  v8 = -[NSString copyWithZone:](self->_chosenFlowPickerItemIdentifier, "copyWithZone:", a3);
  v9 = (void *)v5[1];
  v5[1] = v8;

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  _QWORD *v4;
  NPKProtoStandaloneRequestHeader *requestHeader;
  NSString *chosenFlowPickerItemIdentifier;
  char v7;

  v4 = a3;
  if (objc_msgSend(v4, "isMemberOfClass:", objc_opt_class())
    && ((requestHeader = self->_requestHeader, !((unint64_t)requestHeader | v4[2]))
     || -[NPKProtoStandaloneRequestHeader isEqual:](requestHeader, "isEqual:")))
  {
    chosenFlowPickerItemIdentifier = self->_chosenFlowPickerItemIdentifier;
    if ((unint64_t)chosenFlowPickerItemIdentifier | v4[1])
      v7 = -[NSString isEqual:](chosenFlowPickerItemIdentifier, "isEqual:");
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
  return -[NSString hash](self->_chosenFlowPickerItemIdentifier, "hash") ^ v3;
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
    -[NPKProtoStandalonePaymentProvisioningFlowChooseFlowRequest setRequestHeader:](self, "setRequestHeader:");
  }
  v4 = v7;
LABEL_7:
  if (v4[1])
  {
    -[NPKProtoStandalonePaymentProvisioningFlowChooseFlowRequest setChosenFlowPickerItemIdentifier:](self, "setChosenFlowPickerItemIdentifier:");
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

- (NSString)chosenFlowPickerItemIdentifier
{
  return self->_chosenFlowPickerItemIdentifier;
}

- (void)setChosenFlowPickerItemIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_chosenFlowPickerItemIdentifier, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_requestHeader, 0);
  objc_storeStrong((id *)&self->_chosenFlowPickerItemIdentifier, 0);
}

- (void)writeTo:.cold.1()
{
  __assert_rtn("-[NPKProtoStandalonePaymentProvisioningFlowChooseFlowRequest writeTo:]", "NPKProtoStandalonePaymentProvisioningFlowChooseFlowRequest.m", 101, "self->_requestHeader != nil");
}

@end
