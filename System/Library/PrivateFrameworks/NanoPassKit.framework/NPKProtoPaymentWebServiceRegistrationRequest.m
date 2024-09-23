@implementation NPKProtoPaymentWebServiceRegistrationRequest

- (BOOL)hasBrokerURLString
{
  return self->_brokerURLString != 0;
}

- (BOOL)hasReason
{
  return self->_reason != 0;
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
  v8.super_class = (Class)NPKProtoPaymentWebServiceRegistrationRequest;
  -[NPKProtoPaymentWebServiceRegistrationRequest description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[NPKProtoPaymentWebServiceRegistrationRequest dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;
  NSString *brokerURLString;
  NSString *reason;

  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  brokerURLString = self->_brokerURLString;
  if (brokerURLString)
    objc_msgSend(v3, "setObject:forKey:", brokerURLString, CFSTR("brokerURLString"));
  reason = self->_reason;
  if (reason)
    objc_msgSend(v4, "setObject:forKey:", reason, CFSTR("reason"));
  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return NPKProtoPaymentWebServiceRegistrationRequestReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = v4;
  if (self->_brokerURLString)
  {
    PBDataWriterWriteStringField();
    v4 = v5;
  }
  if (self->_reason)
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
  if (self->_brokerURLString)
  {
    objc_msgSend(v4, "setBrokerURLString:");
    v4 = v5;
  }
  if (self->_reason)
  {
    objc_msgSend(v5, "setReason:");
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
  v6 = -[NSString copyWithZone:](self->_brokerURLString, "copyWithZone:", a3);
  v7 = (void *)v5[1];
  v5[1] = v6;

  v8 = -[NSString copyWithZone:](self->_reason, "copyWithZone:", a3);
  v9 = (void *)v5[2];
  v5[2] = v8;

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  _QWORD *v4;
  NSString *brokerURLString;
  NSString *reason;
  char v7;

  v4 = a3;
  if (objc_msgSend(v4, "isMemberOfClass:", objc_opt_class())
    && ((brokerURLString = self->_brokerURLString, !((unint64_t)brokerURLString | v4[1]))
     || -[NSString isEqual:](brokerURLString, "isEqual:")))
  {
    reason = self->_reason;
    if ((unint64_t)reason | v4[2])
      v7 = -[NSString isEqual:](reason, "isEqual:");
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
  NSUInteger v3;

  v3 = -[NSString hash](self->_brokerURLString, "hash");
  return -[NSString hash](self->_reason, "hash") ^ v3;
}

- (void)mergeFrom:(id)a3
{
  _QWORD *v4;
  _QWORD *v5;

  v4 = a3;
  v5 = v4;
  if (v4[1])
  {
    -[NPKProtoPaymentWebServiceRegistrationRequest setBrokerURLString:](self, "setBrokerURLString:");
    v4 = v5;
  }
  if (v4[2])
  {
    -[NPKProtoPaymentWebServiceRegistrationRequest setReason:](self, "setReason:");
    v4 = v5;
  }

}

- (NSString)brokerURLString
{
  return self->_brokerURLString;
}

- (void)setBrokerURLString:(id)a3
{
  objc_storeStrong((id *)&self->_brokerURLString, a3);
}

- (NSString)reason
{
  return self->_reason;
}

- (void)setReason:(id)a3
{
  objc_storeStrong((id *)&self->_reason, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_reason, 0);
  objc_storeStrong((id *)&self->_brokerURLString, 0);
}

@end
