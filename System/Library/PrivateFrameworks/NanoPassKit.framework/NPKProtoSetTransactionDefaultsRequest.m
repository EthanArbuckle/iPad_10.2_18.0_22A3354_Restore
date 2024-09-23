@implementation NPKProtoSetTransactionDefaultsRequest

- (BOOL)hasDefaultShippingAddress
{
  return self->_defaultShippingAddress != 0;
}

- (BOOL)hasDefaultBillingAddresses
{
  return self->_defaultBillingAddresses != 0;
}

- (BOOL)hasDefaultContactEmail
{
  return self->_defaultContactEmail != 0;
}

- (BOOL)hasDefaultContactPhone
{
  return self->_defaultContactPhone != 0;
}

- (BOOL)hasDefaultContactName
{
  return self->_defaultContactName != 0;
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
  v8.super_class = (Class)NPKProtoSetTransactionDefaultsRequest;
  -[NPKProtoSetTransactionDefaultsRequest description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[NPKProtoSetTransactionDefaultsRequest dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;
  NSData *defaultShippingAddress;
  NSData *defaultBillingAddresses;
  NSData *defaultContactEmail;
  NSData *defaultContactPhone;
  NSData *defaultContactName;

  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  defaultShippingAddress = self->_defaultShippingAddress;
  if (defaultShippingAddress)
    objc_msgSend(v3, "setObject:forKey:", defaultShippingAddress, CFSTR("defaultShippingAddress"));
  defaultBillingAddresses = self->_defaultBillingAddresses;
  if (defaultBillingAddresses)
    objc_msgSend(v4, "setObject:forKey:", defaultBillingAddresses, CFSTR("defaultBillingAddresses"));
  defaultContactEmail = self->_defaultContactEmail;
  if (defaultContactEmail)
    objc_msgSend(v4, "setObject:forKey:", defaultContactEmail, CFSTR("defaultContactEmail"));
  defaultContactPhone = self->_defaultContactPhone;
  if (defaultContactPhone)
    objc_msgSend(v4, "setObject:forKey:", defaultContactPhone, CFSTR("defaultContactPhone"));
  defaultContactName = self->_defaultContactName;
  if (defaultContactName)
    objc_msgSend(v4, "setObject:forKey:", defaultContactName, CFSTR("defaultContactName"));
  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return NPKProtoSetTransactionDefaultsRequestReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = v4;
  if (self->_defaultShippingAddress)
  {
    PBDataWriterWriteDataField();
    v4 = v5;
  }
  if (self->_defaultBillingAddresses)
  {
    PBDataWriterWriteDataField();
    v4 = v5;
  }
  if (self->_defaultContactEmail)
  {
    PBDataWriterWriteDataField();
    v4 = v5;
  }
  if (self->_defaultContactPhone)
  {
    PBDataWriterWriteDataField();
    v4 = v5;
  }
  if (self->_defaultContactName)
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
  if (self->_defaultShippingAddress)
  {
    objc_msgSend(v4, "setDefaultShippingAddress:");
    v4 = v5;
  }
  if (self->_defaultBillingAddresses)
  {
    objc_msgSend(v5, "setDefaultBillingAddresses:");
    v4 = v5;
  }
  if (self->_defaultContactEmail)
  {
    objc_msgSend(v5, "setDefaultContactEmail:");
    v4 = v5;
  }
  if (self->_defaultContactPhone)
  {
    objc_msgSend(v5, "setDefaultContactPhone:");
    v4 = v5;
  }
  if (self->_defaultContactName)
  {
    objc_msgSend(v5, "setDefaultContactName:");
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
  uint64_t v12;
  void *v13;
  uint64_t v14;
  void *v15;

  v5 = (_QWORD *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = -[NSData copyWithZone:](self->_defaultShippingAddress, "copyWithZone:", a3);
  v7 = (void *)v5[5];
  v5[5] = v6;

  v8 = -[NSData copyWithZone:](self->_defaultBillingAddresses, "copyWithZone:", a3);
  v9 = (void *)v5[1];
  v5[1] = v8;

  v10 = -[NSData copyWithZone:](self->_defaultContactEmail, "copyWithZone:", a3);
  v11 = (void *)v5[2];
  v5[2] = v10;

  v12 = -[NSData copyWithZone:](self->_defaultContactPhone, "copyWithZone:", a3);
  v13 = (void *)v5[4];
  v5[4] = v12;

  v14 = -[NSData copyWithZone:](self->_defaultContactName, "copyWithZone:", a3);
  v15 = (void *)v5[3];
  v5[3] = v14;

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  _QWORD *v4;
  NSData *defaultShippingAddress;
  NSData *defaultBillingAddresses;
  NSData *defaultContactEmail;
  NSData *defaultContactPhone;
  NSData *defaultContactName;
  char v10;

  v4 = a3;
  if (objc_msgSend(v4, "isMemberOfClass:", objc_opt_class())
    && ((defaultShippingAddress = self->_defaultShippingAddress, !((unint64_t)defaultShippingAddress | v4[5]))
     || -[NSData isEqual:](defaultShippingAddress, "isEqual:"))
    && ((defaultBillingAddresses = self->_defaultBillingAddresses, !((unint64_t)defaultBillingAddresses | v4[1]))
     || -[NSData isEqual:](defaultBillingAddresses, "isEqual:"))
    && ((defaultContactEmail = self->_defaultContactEmail, !((unint64_t)defaultContactEmail | v4[2]))
     || -[NSData isEqual:](defaultContactEmail, "isEqual:"))
    && ((defaultContactPhone = self->_defaultContactPhone, !((unint64_t)defaultContactPhone | v4[4]))
     || -[NSData isEqual:](defaultContactPhone, "isEqual:")))
  {
    defaultContactName = self->_defaultContactName;
    if ((unint64_t)defaultContactName | v4[3])
      v10 = -[NSData isEqual:](defaultContactName, "isEqual:");
    else
      v10 = 1;
  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (unint64_t)hash
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  v3 = -[NSData hash](self->_defaultShippingAddress, "hash");
  v4 = -[NSData hash](self->_defaultBillingAddresses, "hash") ^ v3;
  v5 = -[NSData hash](self->_defaultContactEmail, "hash");
  v6 = v4 ^ v5 ^ -[NSData hash](self->_defaultContactPhone, "hash");
  return v6 ^ -[NSData hash](self->_defaultContactName, "hash");
}

- (void)mergeFrom:(id)a3
{
  _QWORD *v4;

  v4 = a3;
  if (v4[5])
    -[NPKProtoSetTransactionDefaultsRequest setDefaultShippingAddress:](self, "setDefaultShippingAddress:");
  if (v4[1])
    -[NPKProtoSetTransactionDefaultsRequest setDefaultBillingAddresses:](self, "setDefaultBillingAddresses:");
  if (v4[2])
    -[NPKProtoSetTransactionDefaultsRequest setDefaultContactEmail:](self, "setDefaultContactEmail:");
  if (v4[4])
    -[NPKProtoSetTransactionDefaultsRequest setDefaultContactPhone:](self, "setDefaultContactPhone:");
  if (v4[3])
    -[NPKProtoSetTransactionDefaultsRequest setDefaultContactName:](self, "setDefaultContactName:");

}

- (NSData)defaultShippingAddress
{
  return self->_defaultShippingAddress;
}

- (void)setDefaultShippingAddress:(id)a3
{
  objc_storeStrong((id *)&self->_defaultShippingAddress, a3);
}

- (NSData)defaultBillingAddresses
{
  return self->_defaultBillingAddresses;
}

- (void)setDefaultBillingAddresses:(id)a3
{
  objc_storeStrong((id *)&self->_defaultBillingAddresses, a3);
}

- (NSData)defaultContactEmail
{
  return self->_defaultContactEmail;
}

- (void)setDefaultContactEmail:(id)a3
{
  objc_storeStrong((id *)&self->_defaultContactEmail, a3);
}

- (NSData)defaultContactPhone
{
  return self->_defaultContactPhone;
}

- (void)setDefaultContactPhone:(id)a3
{
  objc_storeStrong((id *)&self->_defaultContactPhone, a3);
}

- (NSData)defaultContactName
{
  return self->_defaultContactName;
}

- (void)setDefaultContactName:(id)a3
{
  objc_storeStrong((id *)&self->_defaultContactName, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_defaultShippingAddress, 0);
  objc_storeStrong((id *)&self->_defaultContactPhone, 0);
  objc_storeStrong((id *)&self->_defaultContactName, 0);
  objc_storeStrong((id *)&self->_defaultContactEmail, 0);
  objc_storeStrong((id *)&self->_defaultBillingAddresses, 0);
}

@end
