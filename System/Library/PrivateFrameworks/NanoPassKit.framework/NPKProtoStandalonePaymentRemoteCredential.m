@implementation NPKProtoStandalonePaymentRemoteCredential

- (BOOL)hasIdentifier
{
  return self->_identifier != 0;
}

- (BOOL)hasPassURL
{
  return self->_passURL != 0;
}

- (BOOL)hasSummaryMetadataDescription
{
  return self->_summaryMetadataDescription != 0;
}

- (BOOL)hasStatusDescription
{
  return self->_statusDescription != 0;
}

- (BOOL)hasPaymentPass
{
  return self->_paymentPass != 0;
}

- (void)setRank:(unsigned int)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_rank = a3;
}

- (void)setHasRank:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (BOOL)hasRank
{
  return *(_BYTE *)&self->_has & 1;
}

- (BOOL)hasProductIdentifier
{
  return self->_productIdentifier != 0;
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
  v8.super_class = (Class)NPKProtoStandalonePaymentRemoteCredential;
  -[NPKProtoStandalonePaymentRemoteCredential description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[NPKProtoStandalonePaymentRemoteCredential dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  NPKProtoStandalonePaymentCredential *paymentCredential;
  void *v5;
  NSString *identifier;
  NSString *passURL;
  NSString *summaryMetadataDescription;
  NSString *statusDescription;
  NPKProtoStandalonePaymentPass *paymentPass;
  void *v11;
  void *v12;
  NSString *productIdentifier;

  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  paymentCredential = self->_paymentCredential;
  if (paymentCredential)
  {
    -[NPKProtoStandalonePaymentCredential dictionaryRepresentation](paymentCredential, "dictionaryRepresentation");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v5, CFSTR("paymentCredential"));

  }
  identifier = self->_identifier;
  if (identifier)
    objc_msgSend(v3, "setObject:forKey:", identifier, CFSTR("identifier"));
  passURL = self->_passURL;
  if (passURL)
    objc_msgSend(v3, "setObject:forKey:", passURL, CFSTR("passURL"));
  summaryMetadataDescription = self->_summaryMetadataDescription;
  if (summaryMetadataDescription)
    objc_msgSend(v3, "setObject:forKey:", summaryMetadataDescription, CFSTR("summaryMetadataDescription"));
  statusDescription = self->_statusDescription;
  if (statusDescription)
    objc_msgSend(v3, "setObject:forKey:", statusDescription, CFSTR("statusDescription"));
  paymentPass = self->_paymentPass;
  if (paymentPass)
  {
    -[NPKProtoStandalonePaymentPass dictionaryRepresentation](paymentPass, "dictionaryRepresentation");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v11, CFSTR("paymentPass"));

  }
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", self->_rank);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v12, CFSTR("rank"));

  }
  productIdentifier = self->_productIdentifier;
  if (productIdentifier)
    objc_msgSend(v3, "setObject:forKey:", productIdentifier, CFSTR("productIdentifier"));
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return NPKProtoStandalonePaymentRemoteCredentialReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  if (!self->_paymentCredential)
    -[NPKProtoStandalonePaymentRemoteCredential writeTo:].cold.1();
  v6 = v4;
  PBDataWriterWriteSubmessage();
  if (self->_identifier)
    PBDataWriterWriteStringField();
  if (self->_passURL)
    PBDataWriterWriteStringField();
  v5 = v6;
  if (self->_summaryMetadataDescription)
  {
    PBDataWriterWriteStringField();
    v5 = v6;
  }
  if (self->_statusDescription)
  {
    PBDataWriterWriteStringField();
    v5 = v6;
  }
  if (self->_paymentPass)
  {
    PBDataWriterWriteSubmessage();
    v5 = v6;
  }
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    PBDataWriterWriteUint32Field();
    v5 = v6;
  }
  if (self->_productIdentifier)
  {
    PBDataWriterWriteStringField();
    v5 = v6;
  }

}

- (void)copyTo:(id)a3
{
  _DWORD *v4;
  id v5;

  v5 = a3;
  objc_msgSend(v5, "setPaymentCredential:", self->_paymentCredential);
  if (self->_identifier)
    objc_msgSend(v5, "setIdentifier:");
  if (self->_passURL)
    objc_msgSend(v5, "setPassURL:");
  v4 = v5;
  if (self->_summaryMetadataDescription)
  {
    objc_msgSend(v5, "setSummaryMetadataDescription:");
    v4 = v5;
  }
  if (self->_statusDescription)
  {
    objc_msgSend(v5, "setStatusDescription:");
    v4 = v5;
  }
  if (self->_paymentPass)
  {
    objc_msgSend(v5, "setPaymentPass:");
    v4 = v5;
  }
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    v4[12] = self->_rank;
    *((_BYTE *)v4 + 72) |= 1u;
  }
  if (self->_productIdentifier)
  {
    objc_msgSend(v5, "setProductIdentifier:");
    v4 = v5;
  }

}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5;
  id v6;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  void *v15;
  id v16;
  void *v17;
  uint64_t v18;
  void *v19;

  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = -[NPKProtoStandalonePaymentCredential copyWithZone:](self->_paymentCredential, "copyWithZone:", a3);
  v7 = *(void **)(v5 + 24);
  *(_QWORD *)(v5 + 24) = v6;

  v8 = -[NSString copyWithZone:](self->_identifier, "copyWithZone:", a3);
  v9 = *(void **)(v5 + 8);
  *(_QWORD *)(v5 + 8) = v8;

  v10 = -[NSString copyWithZone:](self->_passURL, "copyWithZone:", a3);
  v11 = *(void **)(v5 + 16);
  *(_QWORD *)(v5 + 16) = v10;

  v12 = -[NSString copyWithZone:](self->_summaryMetadataDescription, "copyWithZone:", a3);
  v13 = *(void **)(v5 + 64);
  *(_QWORD *)(v5 + 64) = v12;

  v14 = -[NSString copyWithZone:](self->_statusDescription, "copyWithZone:", a3);
  v15 = *(void **)(v5 + 56);
  *(_QWORD *)(v5 + 56) = v14;

  v16 = -[NPKProtoStandalonePaymentPass copyWithZone:](self->_paymentPass, "copyWithZone:", a3);
  v17 = *(void **)(v5 + 32);
  *(_QWORD *)(v5 + 32) = v16;

  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    *(_DWORD *)(v5 + 48) = self->_rank;
    *(_BYTE *)(v5 + 72) |= 1u;
  }
  v18 = -[NSString copyWithZone:](self->_productIdentifier, "copyWithZone:", a3);
  v19 = *(void **)(v5 + 40);
  *(_QWORD *)(v5 + 40) = v18;

  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  NPKProtoStandalonePaymentCredential *paymentCredential;
  NSString *identifier;
  NSString *passURL;
  NSString *summaryMetadataDescription;
  NSString *statusDescription;
  NPKProtoStandalonePaymentPass *paymentPass;
  NSString *productIdentifier;
  char v12;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_21;
  paymentCredential = self->_paymentCredential;
  if ((unint64_t)paymentCredential | *((_QWORD *)v4 + 3))
  {
    if (!-[NPKProtoStandalonePaymentCredential isEqual:](paymentCredential, "isEqual:"))
      goto LABEL_21;
  }
  identifier = self->_identifier;
  if ((unint64_t)identifier | *((_QWORD *)v4 + 1))
  {
    if (!-[NSString isEqual:](identifier, "isEqual:"))
      goto LABEL_21;
  }
  passURL = self->_passURL;
  if ((unint64_t)passURL | *((_QWORD *)v4 + 2))
  {
    if (!-[NSString isEqual:](passURL, "isEqual:"))
      goto LABEL_21;
  }
  summaryMetadataDescription = self->_summaryMetadataDescription;
  if ((unint64_t)summaryMetadataDescription | *((_QWORD *)v4 + 8))
  {
    if (!-[NSString isEqual:](summaryMetadataDescription, "isEqual:"))
      goto LABEL_21;
  }
  statusDescription = self->_statusDescription;
  if ((unint64_t)statusDescription | *((_QWORD *)v4 + 7))
  {
    if (!-[NSString isEqual:](statusDescription, "isEqual:"))
      goto LABEL_21;
  }
  paymentPass = self->_paymentPass;
  if ((unint64_t)paymentPass | *((_QWORD *)v4 + 4))
  {
    if (!-[NPKProtoStandalonePaymentPass isEqual:](paymentPass, "isEqual:"))
      goto LABEL_21;
  }
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 72) & 1) == 0 || self->_rank != *((_DWORD *)v4 + 12))
      goto LABEL_21;
  }
  else if ((*((_BYTE *)v4 + 72) & 1) != 0)
  {
LABEL_21:
    v12 = 0;
    goto LABEL_22;
  }
  productIdentifier = self->_productIdentifier;
  if ((unint64_t)productIdentifier | *((_QWORD *)v4 + 5))
    v12 = -[NSString isEqual:](productIdentifier, "isEqual:");
  else
    v12 = 1;
LABEL_22:

  return v12;
}

- (unint64_t)hash
{
  unint64_t v3;
  NSUInteger v4;
  NSUInteger v5;
  NSUInteger v6;
  NSUInteger v7;
  unint64_t v8;
  uint64_t v9;

  v3 = -[NPKProtoStandalonePaymentCredential hash](self->_paymentCredential, "hash");
  v4 = -[NSString hash](self->_identifier, "hash");
  v5 = -[NSString hash](self->_passURL, "hash");
  v6 = -[NSString hash](self->_summaryMetadataDescription, "hash");
  v7 = -[NSString hash](self->_statusDescription, "hash");
  v8 = -[NPKProtoStandalonePaymentPass hash](self->_paymentPass, "hash");
  if ((*(_BYTE *)&self->_has & 1) != 0)
    v9 = 2654435761 * self->_rank;
  else
    v9 = 0;
  return v4 ^ v3 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9 ^ -[NSString hash](self->_productIdentifier, "hash");
}

- (void)mergeFrom:(id)a3
{
  id v4;
  NPKProtoStandalonePaymentCredential *paymentCredential;
  uint64_t v6;
  NPKProtoStandalonePaymentPass *paymentPass;
  uint64_t v8;
  id v9;

  v4 = a3;
  paymentCredential = self->_paymentCredential;
  v6 = *((_QWORD *)v4 + 3);
  v9 = v4;
  if (paymentCredential)
  {
    if (!v6)
      goto LABEL_7;
    -[NPKProtoStandalonePaymentCredential mergeFrom:](paymentCredential, "mergeFrom:");
  }
  else
  {
    if (!v6)
      goto LABEL_7;
    -[NPKProtoStandalonePaymentRemoteCredential setPaymentCredential:](self, "setPaymentCredential:");
  }
  v4 = v9;
LABEL_7:
  if (*((_QWORD *)v4 + 1))
  {
    -[NPKProtoStandalonePaymentRemoteCredential setIdentifier:](self, "setIdentifier:");
    v4 = v9;
  }
  if (*((_QWORD *)v4 + 2))
  {
    -[NPKProtoStandalonePaymentRemoteCredential setPassURL:](self, "setPassURL:");
    v4 = v9;
  }
  if (*((_QWORD *)v4 + 8))
  {
    -[NPKProtoStandalonePaymentRemoteCredential setSummaryMetadataDescription:](self, "setSummaryMetadataDescription:");
    v4 = v9;
  }
  if (*((_QWORD *)v4 + 7))
  {
    -[NPKProtoStandalonePaymentRemoteCredential setStatusDescription:](self, "setStatusDescription:");
    v4 = v9;
  }
  paymentPass = self->_paymentPass;
  v8 = *((_QWORD *)v4 + 4);
  if (paymentPass)
  {
    if (!v8)
      goto LABEL_21;
    -[NPKProtoStandalonePaymentPass mergeFrom:](paymentPass, "mergeFrom:");
  }
  else
  {
    if (!v8)
      goto LABEL_21;
    -[NPKProtoStandalonePaymentRemoteCredential setPaymentPass:](self, "setPaymentPass:");
  }
  v4 = v9;
LABEL_21:
  if ((*((_BYTE *)v4 + 72) & 1) != 0)
  {
    self->_rank = *((_DWORD *)v4 + 12);
    *(_BYTE *)&self->_has |= 1u;
  }
  if (*((_QWORD *)v4 + 5))
  {
    -[NPKProtoStandalonePaymentRemoteCredential setProductIdentifier:](self, "setProductIdentifier:");
    v4 = v9;
  }

}

- (NPKProtoStandalonePaymentCredential)paymentCredential
{
  return self->_paymentCredential;
}

- (void)setPaymentCredential:(id)a3
{
  objc_storeStrong((id *)&self->_paymentCredential, a3);
}

- (NSString)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_identifier, a3);
}

- (NSString)passURL
{
  return self->_passURL;
}

- (void)setPassURL:(id)a3
{
  objc_storeStrong((id *)&self->_passURL, a3);
}

- (NSString)summaryMetadataDescription
{
  return self->_summaryMetadataDescription;
}

- (void)setSummaryMetadataDescription:(id)a3
{
  objc_storeStrong((id *)&self->_summaryMetadataDescription, a3);
}

- (NSString)statusDescription
{
  return self->_statusDescription;
}

- (void)setStatusDescription:(id)a3
{
  objc_storeStrong((id *)&self->_statusDescription, a3);
}

- (NPKProtoStandalonePaymentPass)paymentPass
{
  return self->_paymentPass;
}

- (void)setPaymentPass:(id)a3
{
  objc_storeStrong((id *)&self->_paymentPass, a3);
}

- (unsigned)rank
{
  return self->_rank;
}

- (NSString)productIdentifier
{
  return self->_productIdentifier;
}

- (void)setProductIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_productIdentifier, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_summaryMetadataDescription, 0);
  objc_storeStrong((id *)&self->_statusDescription, 0);
  objc_storeStrong((id *)&self->_productIdentifier, 0);
  objc_storeStrong((id *)&self->_paymentPass, 0);
  objc_storeStrong((id *)&self->_paymentCredential, 0);
  objc_storeStrong((id *)&self->_passURL, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

- (void)writeTo:.cold.1()
{
  __assert_rtn("-[NPKProtoStandalonePaymentRemoteCredential writeTo:]", "NPKProtoStandalonePaymentRemoteCredential.m", 213, "self->_paymentCredential != nil");
}

@end
