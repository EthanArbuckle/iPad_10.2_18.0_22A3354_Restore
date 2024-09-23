@implementation NPKProtoCacheSharingMessageFromMailboxAddressRequest

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v8;

  v3 = (void *)MEMORY[0x24BDD17C8];
  v8.receiver = self;
  v8.super_class = (Class)NPKProtoCacheSharingMessageFromMailboxAddressRequest;
  -[NPKProtoCacheSharingMessageFromMailboxAddressRequest description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[NPKProtoCacheSharingMessageFromMailboxAddressRequest dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;
  NSString *mailboxAddress;
  NSData *sharingMessageData;

  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  mailboxAddress = self->_mailboxAddress;
  if (mailboxAddress)
    objc_msgSend(v3, "setObject:forKey:", mailboxAddress, CFSTR("mailboxAddress"));
  sharingMessageData = self->_sharingMessageData;
  if (sharingMessageData)
    objc_msgSend(v4, "setObject:forKey:", sharingMessageData, CFSTR("sharingMessageData"));
  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return NPKProtoCacheSharingMessageFromMailboxAddressRequestReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  if (!self->_mailboxAddress)
    -[NPKProtoCacheSharingMessageFromMailboxAddressRequest writeTo:].cold.1();
  v5 = v4;
  PBDataWriterWriteStringField();
  if (!self->_sharingMessageData)
    -[NPKProtoCacheSharingMessageFromMailboxAddressRequest writeTo:].cold.2();
  PBDataWriterWriteDataField();

}

- (void)copyTo:(id)a3
{
  NSString *mailboxAddress;
  id v5;

  mailboxAddress = self->_mailboxAddress;
  v5 = a3;
  objc_msgSend(v5, "setMailboxAddress:", mailboxAddress);
  objc_msgSend(v5, "setSharingMessageData:", self->_sharingMessageData);

}

- (id)copyWithZone:(_NSZone *)a3
{
  _QWORD *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;

  v5 = (_QWORD *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = -[NSString copyWithZone:](self->_mailboxAddress, "copyWithZone:", a3);
  v7 = (void *)v5[1];
  v5[1] = v6;

  v8 = -[NSData copyWithZone:](self->_sharingMessageData, "copyWithZone:", a3);
  v9 = (void *)v5[2];
  v5[2] = v8;

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  _QWORD *v4;
  NSString *mailboxAddress;
  NSData *sharingMessageData;
  char v7;

  v4 = a3;
  if (objc_msgSend(v4, "isMemberOfClass:", objc_opt_class())
    && ((mailboxAddress = self->_mailboxAddress, !((unint64_t)mailboxAddress | v4[1]))
     || -[NSString isEqual:](mailboxAddress, "isEqual:")))
  {
    sharingMessageData = self->_sharingMessageData;
    if ((unint64_t)sharingMessageData | v4[2])
      v7 = -[NSData isEqual:](sharingMessageData, "isEqual:");
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

  v3 = -[NSString hash](self->_mailboxAddress, "hash");
  return -[NSData hash](self->_sharingMessageData, "hash") ^ v3;
}

- (void)mergeFrom:(id)a3
{
  _QWORD *v4;
  _QWORD *v5;

  v4 = a3;
  v5 = v4;
  if (v4[1])
  {
    -[NPKProtoCacheSharingMessageFromMailboxAddressRequest setMailboxAddress:](self, "setMailboxAddress:");
    v4 = v5;
  }
  if (v4[2])
  {
    -[NPKProtoCacheSharingMessageFromMailboxAddressRequest setSharingMessageData:](self, "setSharingMessageData:");
    v4 = v5;
  }

}

- (NSString)mailboxAddress
{
  return self->_mailboxAddress;
}

- (void)setMailboxAddress:(id)a3
{
  objc_storeStrong((id *)&self->_mailboxAddress, a3);
}

- (NSData)sharingMessageData
{
  return self->_sharingMessageData;
}

- (void)setSharingMessageData:(id)a3
{
  objc_storeStrong((id *)&self->_sharingMessageData, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sharingMessageData, 0);
  objc_storeStrong((id *)&self->_mailboxAddress, 0);
}

- (void)writeTo:.cold.1()
{
  __assert_rtn("-[NPKProtoCacheSharingMessageFromMailboxAddressRequest writeTo:]", "NPKProtoCacheSharingMessageFromMailboxAddressRequest.m", 83, "nil != self->_mailboxAddress");
}

- (void)writeTo:.cold.2()
{
  __assert_rtn("-[NPKProtoCacheSharingMessageFromMailboxAddressRequest writeTo:]", "NPKProtoCacheSharingMessageFromMailboxAddressRequest.m", 88, "nil != self->_sharingMessageData");
}

@end
