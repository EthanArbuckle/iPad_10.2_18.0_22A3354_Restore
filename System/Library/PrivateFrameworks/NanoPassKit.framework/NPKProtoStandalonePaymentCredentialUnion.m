@implementation NPKProtoStandalonePaymentCredentialUnion

- (BOOL)hasFlowIdentifier
{
  return self->_flowIdentifier != 0;
}

- (BOOL)hasRemoteCredential
{
  return self->_remoteCredential != 0;
}

- (BOOL)hasCreditAccountCredential
{
  return self->_creditAccountCredential != 0;
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
  v8.super_class = (Class)NPKProtoStandalonePaymentCredentialUnion;
  -[NPKProtoStandalonePaymentCredentialUnion description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[NPKProtoStandalonePaymentCredentialUnion dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;
  NSString *flowIdentifier;
  NPKProtoStandalonePaymentRemoteCredential *remoteCredential;
  void *v7;
  NPKProtoStandaloneCreditAccountCredential *creditAccountCredential;
  void *v9;

  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  flowIdentifier = self->_flowIdentifier;
  if (flowIdentifier)
    objc_msgSend(v3, "setObject:forKey:", flowIdentifier, CFSTR("flowIdentifier"));
  remoteCredential = self->_remoteCredential;
  if (remoteCredential)
  {
    -[NPKProtoStandalonePaymentRemoteCredential dictionaryRepresentation](remoteCredential, "dictionaryRepresentation");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v7, CFSTR("remoteCredential"));

  }
  creditAccountCredential = self->_creditAccountCredential;
  if (creditAccountCredential)
  {
    -[NPKProtoStandaloneCreditAccountCredential dictionaryRepresentation](creditAccountCredential, "dictionaryRepresentation");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v9, CFSTR("creditAccountCredential"));

  }
  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return NPKProtoStandalonePaymentCredentialUnionReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = v4;
  if (self->_flowIdentifier)
  {
    PBDataWriterWriteStringField();
    v4 = v5;
  }
  if (self->_remoteCredential)
  {
    PBDataWriterWriteSubmessage();
    v4 = v5;
  }
  if (self->_creditAccountCredential)
  {
    PBDataWriterWriteSubmessage();
    v4 = v5;
  }

}

- (void)copyTo:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = v4;
  if (self->_flowIdentifier)
  {
    objc_msgSend(v4, "setFlowIdentifier:");
    v4 = v5;
  }
  if (self->_remoteCredential)
  {
    objc_msgSend(v5, "setRemoteCredential:");
    v4 = v5;
  }
  if (self->_creditAccountCredential)
  {
    objc_msgSend(v5, "setCreditAccountCredential:");
    v4 = v5;
  }

}

- (id)copyWithZone:(_NSZone *)a3
{
  _QWORD *v5;
  uint64_t v6;
  void *v7;
  id v8;
  void *v9;
  id v10;
  void *v11;

  v5 = (_QWORD *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = -[NSString copyWithZone:](self->_flowIdentifier, "copyWithZone:", a3);
  v7 = (void *)v5[2];
  v5[2] = v6;

  v8 = -[NPKProtoStandalonePaymentRemoteCredential copyWithZone:](self->_remoteCredential, "copyWithZone:", a3);
  v9 = (void *)v5[3];
  v5[3] = v8;

  v10 = -[NPKProtoStandaloneCreditAccountCredential copyWithZone:](self->_creditAccountCredential, "copyWithZone:", a3);
  v11 = (void *)v5[1];
  v5[1] = v10;

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  _QWORD *v4;
  NSString *flowIdentifier;
  NPKProtoStandalonePaymentRemoteCredential *remoteCredential;
  NPKProtoStandaloneCreditAccountCredential *creditAccountCredential;
  char v8;

  v4 = a3;
  if (objc_msgSend(v4, "isMemberOfClass:", objc_opt_class())
    && ((flowIdentifier = self->_flowIdentifier, !((unint64_t)flowIdentifier | v4[2]))
     || -[NSString isEqual:](flowIdentifier, "isEqual:"))
    && ((remoteCredential = self->_remoteCredential, !((unint64_t)remoteCredential | v4[3]))
     || -[NPKProtoStandalonePaymentRemoteCredential isEqual:](remoteCredential, "isEqual:")))
  {
    creditAccountCredential = self->_creditAccountCredential;
    if ((unint64_t)creditAccountCredential | v4[1])
      v8 = -[NPKProtoStandaloneCreditAccountCredential isEqual:](creditAccountCredential, "isEqual:");
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
  NSUInteger v3;
  unint64_t v4;

  v3 = -[NSString hash](self->_flowIdentifier, "hash");
  v4 = -[NPKProtoStandalonePaymentRemoteCredential hash](self->_remoteCredential, "hash") ^ v3;
  return v4 ^ -[NPKProtoStandaloneCreditAccountCredential hash](self->_creditAccountCredential, "hash");
}

- (void)mergeFrom:(id)a3
{
  _QWORD *v4;
  NPKProtoStandalonePaymentRemoteCredential *remoteCredential;
  uint64_t v6;
  NPKProtoStandaloneCreditAccountCredential *creditAccountCredential;
  uint64_t v8;
  _QWORD *v9;

  v4 = a3;
  v9 = v4;
  if (v4[2])
  {
    -[NPKProtoStandalonePaymentCredentialUnion setFlowIdentifier:](self, "setFlowIdentifier:");
    v4 = v9;
  }
  remoteCredential = self->_remoteCredential;
  v6 = v4[3];
  if (remoteCredential)
  {
    if (!v6)
      goto LABEL_9;
    -[NPKProtoStandalonePaymentRemoteCredential mergeFrom:](remoteCredential, "mergeFrom:");
  }
  else
  {
    if (!v6)
      goto LABEL_9;
    -[NPKProtoStandalonePaymentCredentialUnion setRemoteCredential:](self, "setRemoteCredential:");
  }
  v4 = v9;
LABEL_9:
  creditAccountCredential = self->_creditAccountCredential;
  v8 = v4[1];
  if (creditAccountCredential)
  {
    if (v8)
    {
      -[NPKProtoStandaloneCreditAccountCredential mergeFrom:](creditAccountCredential, "mergeFrom:");
LABEL_14:
      v4 = v9;
    }
  }
  else if (v8)
  {
    -[NPKProtoStandalonePaymentCredentialUnion setCreditAccountCredential:](self, "setCreditAccountCredential:");
    goto LABEL_14;
  }

}

- (NSString)flowIdentifier
{
  return self->_flowIdentifier;
}

- (void)setFlowIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_flowIdentifier, a3);
}

- (NPKProtoStandalonePaymentRemoteCredential)remoteCredential
{
  return self->_remoteCredential;
}

- (void)setRemoteCredential:(id)a3
{
  objc_storeStrong((id *)&self->_remoteCredential, a3);
}

- (NPKProtoStandaloneCreditAccountCredential)creditAccountCredential
{
  return self->_creditAccountCredential;
}

- (void)setCreditAccountCredential:(id)a3
{
  objc_storeStrong((id *)&self->_creditAccountCredential, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_remoteCredential, 0);
  objc_storeStrong((id *)&self->_flowIdentifier, 0);
  objc_storeStrong((id *)&self->_creditAccountCredential, 0);
}

@end
