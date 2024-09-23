@implementation NPKProtoPeerPaymentWebServiceContextDidChangeRequest

- (BOOL)hasPeerPaymentWebServiceContextData
{
  return self->_peerPaymentWebServiceContextData != 0;
}

- (BOOL)hasPeerPaymentAccountData
{
  return self->_peerPaymentAccountData != 0;
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
  v8.super_class = (Class)NPKProtoPeerPaymentWebServiceContextDidChangeRequest;
  -[NPKProtoPeerPaymentWebServiceContextDidChangeRequest description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[NPKProtoPeerPaymentWebServiceContextDidChangeRequest dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;
  NSData *peerPaymentWebServiceContextData;
  NSData *peerPaymentAccountData;

  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  peerPaymentWebServiceContextData = self->_peerPaymentWebServiceContextData;
  if (peerPaymentWebServiceContextData)
    objc_msgSend(v3, "setObject:forKey:", peerPaymentWebServiceContextData, CFSTR("peerPaymentWebServiceContextData"));
  peerPaymentAccountData = self->_peerPaymentAccountData;
  if (peerPaymentAccountData)
    objc_msgSend(v4, "setObject:forKey:", peerPaymentAccountData, CFSTR("peerPaymentAccountData"));
  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return NPKProtoPeerPaymentWebServiceContextDidChangeRequestReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = v4;
  if (self->_peerPaymentWebServiceContextData)
  {
    PBDataWriterWriteDataField();
    v4 = v5;
  }
  if (self->_peerPaymentAccountData)
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
  if (self->_peerPaymentWebServiceContextData)
  {
    objc_msgSend(v4, "setPeerPaymentWebServiceContextData:");
    v4 = v5;
  }
  if (self->_peerPaymentAccountData)
  {
    objc_msgSend(v5, "setPeerPaymentAccountData:");
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

  v5 = (_QWORD *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = -[NSData copyWithZone:](self->_peerPaymentWebServiceContextData, "copyWithZone:", a3);
  v7 = (void *)v5[2];
  v5[2] = v6;

  v8 = -[NSData copyWithZone:](self->_peerPaymentAccountData, "copyWithZone:", a3);
  v9 = (void *)v5[1];
  v5[1] = v8;

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  _QWORD *v4;
  NSData *peerPaymentWebServiceContextData;
  NSData *peerPaymentAccountData;
  char v7;

  v4 = a3;
  if (objc_msgSend(v4, "isMemberOfClass:", objc_opt_class())
    && ((peerPaymentWebServiceContextData = self->_peerPaymentWebServiceContextData,
         !((unint64_t)peerPaymentWebServiceContextData | v4[2]))
     || -[NSData isEqual:](peerPaymentWebServiceContextData, "isEqual:")))
  {
    peerPaymentAccountData = self->_peerPaymentAccountData;
    if ((unint64_t)peerPaymentAccountData | v4[1])
      v7 = -[NSData isEqual:](peerPaymentAccountData, "isEqual:");
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
  uint64_t v3;

  v3 = -[NSData hash](self->_peerPaymentWebServiceContextData, "hash");
  return -[NSData hash](self->_peerPaymentAccountData, "hash") ^ v3;
}

- (void)mergeFrom:(id)a3
{
  _QWORD *v4;
  _QWORD *v5;

  v4 = a3;
  v5 = v4;
  if (v4[2])
  {
    -[NPKProtoPeerPaymentWebServiceContextDidChangeRequest setPeerPaymentWebServiceContextData:](self, "setPeerPaymentWebServiceContextData:");
    v4 = v5;
  }
  if (v4[1])
  {
    -[NPKProtoPeerPaymentWebServiceContextDidChangeRequest setPeerPaymentAccountData:](self, "setPeerPaymentAccountData:");
    v4 = v5;
  }

}

- (NSData)peerPaymentWebServiceContextData
{
  return self->_peerPaymentWebServiceContextData;
}

- (void)setPeerPaymentWebServiceContextData:(id)a3
{
  objc_storeStrong((id *)&self->_peerPaymentWebServiceContextData, a3);
}

- (NSData)peerPaymentAccountData
{
  return self->_peerPaymentAccountData;
}

- (void)setPeerPaymentAccountData:(id)a3
{
  objc_storeStrong((id *)&self->_peerPaymentAccountData, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_peerPaymentWebServiceContextData, 0);
  objc_storeStrong((id *)&self->_peerPaymentAccountData, 0);
}

@end
