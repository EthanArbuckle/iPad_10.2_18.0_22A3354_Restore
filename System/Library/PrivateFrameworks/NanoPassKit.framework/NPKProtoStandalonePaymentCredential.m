@implementation NPKProtoStandalonePaymentCredential

- (BOOL)hasSanitizedPrimaryAccountNumber
{
  return self->_sanitizedPrimaryAccountNumber != 0;
}

- (BOOL)hasExpiration
{
  return self->_expiration != 0;
}

- (BOOL)hasLongDescription
{
  return self->_longDescription != 0;
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
  v8.super_class = (Class)NPKProtoStandalonePaymentCredential;
  -[NPKProtoStandalonePaymentCredential description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[NPKProtoStandalonePaymentCredential dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;
  NSString *sanitizedPrimaryAccountNumber;
  NSString *expiration;
  NSString *longDescription;

  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  sanitizedPrimaryAccountNumber = self->_sanitizedPrimaryAccountNumber;
  if (sanitizedPrimaryAccountNumber)
    objc_msgSend(v3, "setObject:forKey:", sanitizedPrimaryAccountNumber, CFSTR("sanitizedPrimaryAccountNumber"));
  expiration = self->_expiration;
  if (expiration)
    objc_msgSend(v4, "setObject:forKey:", expiration, CFSTR("expiration"));
  longDescription = self->_longDescription;
  if (longDescription)
    objc_msgSend(v4, "setObject:forKey:", longDescription, CFSTR("longDescription"));
  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return NPKProtoStandalonePaymentCredentialReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = v4;
  if (self->_sanitizedPrimaryAccountNumber)
  {
    PBDataWriterWriteStringField();
    v4 = v5;
  }
  if (self->_expiration)
  {
    PBDataWriterWriteStringField();
    v4 = v5;
  }
  if (self->_longDescription)
  {
    PBDataWriterWriteStringField();
    v4 = v5;
  }

}

- (void)copyTo:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = v4;
  if (self->_sanitizedPrimaryAccountNumber)
  {
    objc_msgSend(v4, "setSanitizedPrimaryAccountNumber:");
    v4 = v5;
  }
  if (self->_expiration)
  {
    objc_msgSend(v5, "setExpiration:");
    v4 = v5;
  }
  if (self->_longDescription)
  {
    objc_msgSend(v5, "setLongDescription:");
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
  v6 = -[NSString copyWithZone:](self->_sanitizedPrimaryAccountNumber, "copyWithZone:", a3);
  v7 = (void *)v5[3];
  v5[3] = v6;

  v8 = -[NSString copyWithZone:](self->_expiration, "copyWithZone:", a3);
  v9 = (void *)v5[1];
  v5[1] = v8;

  v10 = -[NSString copyWithZone:](self->_longDescription, "copyWithZone:", a3);
  v11 = (void *)v5[2];
  v5[2] = v10;

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  _QWORD *v4;
  NSString *sanitizedPrimaryAccountNumber;
  NSString *expiration;
  NSString *longDescription;
  char v8;

  v4 = a3;
  if (objc_msgSend(v4, "isMemberOfClass:", objc_opt_class())
    && ((sanitizedPrimaryAccountNumber = self->_sanitizedPrimaryAccountNumber,
         !((unint64_t)sanitizedPrimaryAccountNumber | v4[3]))
     || -[NSString isEqual:](sanitizedPrimaryAccountNumber, "isEqual:"))
    && ((expiration = self->_expiration, !((unint64_t)expiration | v4[1]))
     || -[NSString isEqual:](expiration, "isEqual:")))
  {
    longDescription = self->_longDescription;
    if ((unint64_t)longDescription | v4[2])
      v8 = -[NSString isEqual:](longDescription, "isEqual:");
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
  NSUInteger v4;

  v3 = -[NSString hash](self->_sanitizedPrimaryAccountNumber, "hash");
  v4 = -[NSString hash](self->_expiration, "hash") ^ v3;
  return v4 ^ -[NSString hash](self->_longDescription, "hash");
}

- (void)mergeFrom:(id)a3
{
  _QWORD *v4;

  v4 = a3;
  if (v4[3])
    -[NPKProtoStandalonePaymentCredential setSanitizedPrimaryAccountNumber:](self, "setSanitizedPrimaryAccountNumber:");
  if (v4[1])
    -[NPKProtoStandalonePaymentCredential setExpiration:](self, "setExpiration:");
  if (v4[2])
    -[NPKProtoStandalonePaymentCredential setLongDescription:](self, "setLongDescription:");

}

- (NSString)sanitizedPrimaryAccountNumber
{
  return self->_sanitizedPrimaryAccountNumber;
}

- (void)setSanitizedPrimaryAccountNumber:(id)a3
{
  objc_storeStrong((id *)&self->_sanitizedPrimaryAccountNumber, a3);
}

- (NSString)expiration
{
  return self->_expiration;
}

- (void)setExpiration:(id)a3
{
  objc_storeStrong((id *)&self->_expiration, a3);
}

- (NSString)longDescription
{
  return self->_longDescription;
}

- (void)setLongDescription:(id)a3
{
  objc_storeStrong((id *)&self->_longDescription, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sanitizedPrimaryAccountNumber, 0);
  objc_storeStrong((id *)&self->_longDescription, 0);
  objc_storeStrong((id *)&self->_expiration, 0);
}

@end
