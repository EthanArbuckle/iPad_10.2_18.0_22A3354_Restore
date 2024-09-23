@implementation NRPBMigrationDeviceInfo

- (BOOL)hasID
{
  return self->_iD != 0;
}

- (BOOL)hasName
{
  return self->_name != 0;
}

- (BOOL)hasAdvertisedName
{
  return self->_advertisedName != 0;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v8;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v8.receiver = self;
  v8.super_class = (Class)NRPBMigrationDeviceInfo;
  -[NRPBMigrationDeviceInfo description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[NRPBMigrationDeviceInfo dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;
  NSData *iD;
  NSString *name;
  NSString *advertisedName;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  iD = self->_iD;
  if (iD)
    objc_msgSend(v3, "setObject:forKey:", iD, CFSTR("ID"));
  name = self->_name;
  if (name)
    objc_msgSend(v4, "setObject:forKey:", name, CFSTR("name"));
  advertisedName = self->_advertisedName;
  if (advertisedName)
    objc_msgSend(v4, "setObject:forKey:", advertisedName, CFSTR("advertisedName"));
  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return NRPBMigrationDeviceInfoReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = v4;
  if (self->_iD)
  {
    PBDataWriterWriteDataField();
    v4 = v5;
  }
  if (self->_name)
  {
    PBDataWriterWriteStringField();
    v4 = v5;
  }
  if (self->_advertisedName)
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
  if (self->_iD)
  {
    objc_msgSend(v4, "setID:");
    v4 = v5;
  }
  if (self->_name)
  {
    objc_msgSend(v5, "setName:");
    v4 = v5;
  }
  if (self->_advertisedName)
  {
    objc_msgSend(v5, "setAdvertisedName:");
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
  v6 = -[NSData copyWithZone:](self->_iD, "copyWithZone:", a3);
  v7 = (void *)v5[2];
  v5[2] = v6;

  v8 = -[NSString copyWithZone:](self->_name, "copyWithZone:", a3);
  v9 = (void *)v5[3];
  v5[3] = v8;

  v10 = -[NSString copyWithZone:](self->_advertisedName, "copyWithZone:", a3);
  v11 = (void *)v5[1];
  v5[1] = v10;

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  _QWORD *v4;
  NSData *iD;
  NSString *name;
  NSString *advertisedName;
  char v8;

  v4 = a3;
  if (objc_msgSend(v4, "isMemberOfClass:", objc_opt_class())
    && ((iD = self->_iD, !((unint64_t)iD | v4[2])) || -[NSData isEqual:](iD, "isEqual:"))
    && ((name = self->_name, !((unint64_t)name | v4[3])) || -[NSString isEqual:](name, "isEqual:")))
  {
    advertisedName = self->_advertisedName;
    if ((unint64_t)advertisedName | v4[1])
      v8 = -[NSString isEqual:](advertisedName, "isEqual:");
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
  uint64_t v3;
  NSUInteger v4;

  v3 = -[NSData hash](self->_iD, "hash");
  v4 = -[NSString hash](self->_name, "hash") ^ v3;
  return v4 ^ -[NSString hash](self->_advertisedName, "hash");
}

- (void)mergeFrom:(id)a3
{
  _QWORD *v4;

  v4 = a3;
  if (v4[2])
    -[NRPBMigrationDeviceInfo setID:](self, "setID:");
  if (v4[3])
    -[NRPBMigrationDeviceInfo setName:](self, "setName:");
  if (v4[1])
    -[NRPBMigrationDeviceInfo setAdvertisedName:](self, "setAdvertisedName:");

}

- (NSData)iD
{
  return self->_iD;
}

- (void)setID:(id)a3
{
  objc_storeStrong((id *)&self->_iD, a3);
}

- (NSString)name
{
  return self->_name;
}

- (void)setName:(id)a3
{
  objc_storeStrong((id *)&self->_name, a3);
}

- (NSString)advertisedName
{
  return self->_advertisedName;
}

- (void)setAdvertisedName:(id)a3
{
  objc_storeStrong((id *)&self->_advertisedName, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->_iD, 0);
  objc_storeStrong((id *)&self->_advertisedName, 0);
}

@end
