@implementation NWPBEndpoint

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v8;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v8.receiver = self;
  v8.super_class = (Class)NWPBEndpoint;
  -[NWPBEndpoint description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[NWPBEndpoint dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  NWPBAddressEndpoint *address;
  void *v5;
  NWPBHostEndpoint *host;
  void *v7;
  NWPBServiceEndpoint *service;
  void *v9;
  NWPBInterface *interface;
  void *v11;
  NSData *txtRecord;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  address = self->_address;
  if (address)
  {
    -[NWPBAddressEndpoint dictionaryRepresentation](address, "dictionaryRepresentation");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v5, CFSTR("address"));

  }
  host = self->_host;
  if (host)
  {
    -[NWPBHostEndpoint dictionaryRepresentation](host, "dictionaryRepresentation");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v7, CFSTR("host"));

  }
  service = self->_service;
  if (service)
  {
    -[NWPBServiceEndpoint dictionaryRepresentation](service, "dictionaryRepresentation");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v9, CFSTR("service"));

  }
  interface = self->_interface;
  if (interface)
  {
    -[NWPBInterface dictionaryRepresentation](interface, "dictionaryRepresentation");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v11, CFSTR("interface"));

  }
  txtRecord = self->_txtRecord;
  if (txtRecord)
    objc_msgSend(v3, "setObject:forKey:", txtRecord, CFSTR("txtRecord"));
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return NWPBEndpointReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = v4;
  if (self->_address)
  {
    PBDataWriterWriteSubmessage();
    v4 = v5;
  }
  if (self->_host)
  {
    PBDataWriterWriteSubmessage();
    v4 = v5;
  }
  if (self->_service)
  {
    PBDataWriterWriteSubmessage();
    v4 = v5;
  }
  if (self->_interface)
  {
    PBDataWriterWriteSubmessage();
    v4 = v5;
  }
  if (self->_txtRecord)
  {
    PBDataWriterWriteDataField();
    v4 = v5;
  }

}

- (id)copyWithZone:(_NSZone *)a3
{
  _QWORD *v5;
  id v6;
  void *v7;
  id v8;
  void *v9;
  id v10;
  void *v11;
  id v12;
  void *v13;
  uint64_t v14;
  void *v15;

  v5 = (_QWORD *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = -[NWPBAddressEndpoint copyWithZone:](self->_address, "copyWithZone:", a3);
  v7 = (void *)v5[1];
  v5[1] = v6;

  v8 = -[NWPBHostEndpoint copyWithZone:](self->_host, "copyWithZone:", a3);
  v9 = (void *)v5[2];
  v5[2] = v8;

  v10 = -[NWPBServiceEndpoint copyWithZone:](self->_service, "copyWithZone:", a3);
  v11 = (void *)v5[4];
  v5[4] = v10;

  v12 = -[NWPBInterface copyWithZone:](self->_interface, "copyWithZone:", a3);
  v13 = (void *)v5[3];
  v5[3] = v12;

  v14 = -[NSData copyWithZone:](self->_txtRecord, "copyWithZone:", a3);
  v15 = (void *)v5[5];
  v5[5] = v14;

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  _QWORD *v4;
  NWPBAddressEndpoint *address;
  NWPBHostEndpoint *host;
  NWPBServiceEndpoint *service;
  NWPBInterface *interface;
  NSData *txtRecord;
  char v10;

  v4 = a3;
  if (objc_msgSend(v4, "isMemberOfClass:", objc_opt_class())
    && ((address = self->_address, !((unint64_t)address | v4[1]))
     || -[NWPBAddressEndpoint isEqual:](address, "isEqual:"))
    && ((host = self->_host, !((unint64_t)host | v4[2])) || -[NWPBHostEndpoint isEqual:](host, "isEqual:"))
    && ((service = self->_service, !((unint64_t)service | v4[4]))
     || -[NWPBServiceEndpoint isEqual:](service, "isEqual:"))
    && ((interface = self->_interface, !((unint64_t)interface | v4[3]))
     || -[NWPBInterface isEqual:](interface, "isEqual:")))
  {
    txtRecord = self->_txtRecord;
    if ((unint64_t)txtRecord | v4[5])
      v10 = -[NSData isEqual:](txtRecord, "isEqual:");
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
  unint64_t v3;
  unint64_t v4;
  unint64_t v5;
  unint64_t v6;

  v3 = -[NWPBAddressEndpoint hash](self->_address, "hash");
  v4 = -[NWPBHostEndpoint hash](self->_host, "hash") ^ v3;
  v5 = -[NWPBServiceEndpoint hash](self->_service, "hash");
  v6 = v4 ^ v5 ^ -[NWPBInterface hash](self->_interface, "hash");
  return v6 ^ -[NSData hash](self->_txtRecord, "hash");
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_txtRecord, 0);
  objc_storeStrong((id *)&self->_service, 0);
  objc_storeStrong((id *)&self->_interface, 0);
  objc_storeStrong((id *)&self->_host, 0);
  objc_storeStrong((id *)&self->_address, 0);
}

@end
